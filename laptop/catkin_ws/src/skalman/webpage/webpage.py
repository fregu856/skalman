#!/usr/bin/env python

import rospy
from std_msgs.msg import String
from geometry_msgs.msg import Twist

from sensor_msgs.msg import Image
from sensor_msgs.msg import CameraInfo
from std_msgs.msg import Header
from cv_bridge import CvBridge

import numpy as np
import cv2
import requests
from flask import Flask, render_template, Response
from flask_socketio import SocketIO, emit
import time
from threading import Thread
import socket

# initialize the web server:
app = Flask(__name__)
socketio = SocketIO(app, async_mode = "threading")
# (without "async_mode = "threading", sending stuff to the client (via socketio) doesn't work!)

class Webpage:
    def __init__(self):
        self.mode = "Manual"

        # initialize the throttle direction ("Forward", "Backward", or
        # "No_throttle") and the steering direction ("Right", "Left", or
        # "No_steering"):
        self.throttle_direction = "No_throttle"
        self.steering_direction = "No_steering"

        # initialize the control signals:
        self.v = 0 # (linear velocity)
        self.omega = 0 # (angular velocity)

        # set upper/lower limits on the control signals:
        self.v_max = 0.125
        self.omega_max = 1

        self.latest_video_frame = []
        self.latest_video_frame_small = []

        # start a thread constantly reading frames from the RPI video stream:
        thread_video = Thread(target = self.video_thread)
        thread_video.start()

        # start a thread that starts and runs the local web app:
        thread_web_app = Thread(target = self.web_app_thread)
        thread_web_app.start()

        # start a thread constantly sending sensor/status data to the web page:
        thread_web_comm = Thread(target = self.web_comm_thread)
        thread_web_comm.start()

        # initialize this code as a ROS node named webpage_node:
        rospy.init_node("webpage_node", anonymous=True)

        # create a publisher that publishes messages of type Twist on the topic \cmd_vel_check:
        self.pub = rospy.Publisher("/cmd_vel_check", Twist, queue_size=10)

        # create publisher to publish frames from the video stream (needed for aprilTag detection):
        self.image_pub = rospy.Publisher("/skalman_camera/image_raw", Image, queue_size = 1)

        # create publisher to publish camera info (calibration params, needed for aprilTag detection):
        self.camera_info_pub = rospy.Publisher("/skalman_camera/camera_info", CameraInfo, queue_size = 1)

        # initialize cv_bridge for conversion between openCV and ROS images (needed for aprilTag detection):
        self.cv_bridge = CvBridge()

        # camera info and calibration parameters (needed for aprilTag detection):
        camera_info_msg = CameraInfo()
        camera_info_msg.height = 360
        camera_info_msg.width = 640
        camera_info_msg.distortion_model = "plumb_bob"
        camera_info_msg.D = [1.6541397736403166e-01, -3.1762679367786140e-01, 0.0, 0.0, -1.4358526468495059e-01] # ([k1, k2, t1, t2, k3])
        camera_info_msg.K = [4.8488441935486514e+02, 0, 320, 0, 4.8488441935486514e+02, 180, 0, 0, 1]  # ([fx, 0, cx, 0, fy, cy, 0, 0, 1])
        camera_info_msg.R = [1.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 1.0]
        self.camera_info_msg = camera_info_msg

    def video_thread(self):
        # connect to the RPI video stream:
        cap = cv2.VideoCapture("tcp://172.24.1.1:8080")
        # (tcp://<RPI IP address>:<same port number as in start_video_stream.sh>)

        while True:
            # (this loop will run with the same frequency as the specified camera
            # framerate, which currently is 20 Hz)

            # capture frame-by-frame:
            ret, frame = cap.read()
            self.latest_video_frame = frame

            # get a smaller version of the frame:
            self.latest_video_frame_small = cv2.resize(frame, (640, 360))

            ####

            header = Header()
            header.stamp = rospy.Time.now()
            header.frame_id = "skalman_camera"

            # convert the latest frame from openCV format to ROS format:
            img_ROS_msg = self.cv_bridge.cv2_to_imgmsg(self.latest_video_frame_small, "bgr8")

            img_ROS_msg.header = header
            self.camera_info_msg.header = header

            # publish the frame in ROS format:
            self.image_pub.publish(img_ROS_msg)

            # publish the camera info:
            self.camera_info_pub.publish(self.camera_info_msg)

            # display the resulting frame
            # cv2.imshow("test", self.latest_video_frame)
            # if cv2.waitKey(1) & 0xFF == ord('q'):
            #     break

    def web_app_thread(self):
        # start the local web app:
        socketio.run(app, "172.24.1.72")

    def web_comm_thread(self):
        while True:
            # send all data for display on the web page:
            socketio.emit("new_data",
                               {"throttle_direction": self.throttle_direction,
                               "steering_direction": self.steering_direction,
                               "throttle": self.v,
                               "steering_angle": self.omega,
                               "mode": self.mode})

            # delay for 0.1 sec (for ~ 10 Hz loop frequency):
            time.sleep(0.1)

    # define a member function which computes new values for self.v and
    # self.omega based on the current values of self.v, self.omega,
    # self.throttle_direction and self.steering_direction:
    def get_control_signals(self):
        # compute self.omega:
        if self.steering_direction == "Right":
            if self.omega < - 0.001: # (if currently rotating to the left:)
                self.omega = 0
            else: # (if currently rotating to the right or not at all:)
                self.omega = self.omega + 0.2
        elif self.steering_direction == "Left":
            if self.omega > 0.001: # (if currently rotating to the right:)
                self.omega = 0
            else: # (if currently rotating to the left or not at all:)
                self.omega = self.omega - 0.2
        elif self.steering_direction == "No_steering":
            self.omega = 0

        # limit self.omega to [-self.omega_max, self.omega_max]:
        if self.omega > self.omega_max:
            self.omega = self.omega_max
        elif self.omega < -self.omega_max:
            self.omega = -self.omega_max

        # compute self.v:
        if self.throttle_direction == "Forward":
            if self.v < -0.001:
                self.v = 0
            else:
                self.v = self.v + 0.025
        elif self.throttle_direction == "Backward":
            if self.v > 0.001:
                self.v = 0
            else:
                self.v = self.v - 0.025
        elif self.throttle_direction == "No_throttle":
            self.v = 0

        # limit self.v to [-self.v_max, self.v_max]:
        if self.v > self.v_max:
            self.v = self.v_max
        elif self.v < -self.v_max:
            self.v = -self.v_max

        # pack self.v and self.omega in the format expected by the robot:
        control_signals = Twist()
        control_signals.linear.x = -self.v
        control_signals.angular.z = -self.omega

        return control_signals

    # define a member function which computes new control signals and sends
    # these to the robot with a frequency of 10 Hz:
    def run(self):
        # specify the desired loop frequency in Hz:
        rate = rospy.Rate(10)

        while not rospy.is_shutdown(): # (while the ROS node is still active:)
            # compute new control signals:
            control_signals = self.get_control_signals()

            # publish the control signals (on the specified topic, i.e., on \cmd_vel_check):
            self.pub.publish(control_signals)

            # sleep to get a loop frequency of 10 Hz:
            rate.sleep()

# create an instance of the Webpage class (this will run its __init__ function):
webpage = Webpage()

def gen_normal():
    while True:
        if len(webpage.latest_video_frame_small) > 0: # if we have started receiving actual frames:
            frame = webpage.latest_video_frame_small

            # convert the latest read video frame to memory buffer format:
            ret, frame_buffer = cv2.imencode(".jpg", frame)

            # get the raw data bytes of 'frame_buffer' (convert to binary):
            frame_bytes = frame_buffer.tobytes()

            # yield ('return') the frame: (yield: returns a value and saves the current
            # state of the generator function. The next time this generator function
            # is called, execution will resume on the next line of code in the function
            # (i.e., it will in this example start a new cycle of the while loop
            # and yield a new frame))
            #
            # what we yield looks like this, but in binary (binary data is a must for multipart):
            # --frame
            # Content-Type: image/jpeg
            #
            # <frame data>
            #
            yield (b'--frame\nContent-Type: image/jpeg\n\n' + frame_bytes + b'\n')

            # delay for 0.05 sec (for ~ 20 Hz loop frequency, we don't get new
            # frames from the camera more frequently than this):
            time.sleep(0.05)

@app.route("/camera_normal")
def camera_normal():
    # returns a Respone object with a 'gen_normal()' generator function as its data
    # generating iterator. We send a MIME multipart message of subtype Mixed-replace,
    # which means that the browser will read data parts (generated by gen_obj_normal)
    # one by one and immediately replace the previous one and display it. We never
    # close the connection to the client, pretending like we haven't finished sending
    # all the data, and constantly keeps sending new data parts generated by gen_obj_normal.
    #
    # what over time will be sent to the client is the following:
    # Content-Type: multipart/x-mixed-replace; boundary=frame
    #
    # --frame
    # Content-Type: image/jpeg
    #
    #<jpg data>
    #
    # --frame
    # Content-Type: image/jpeg
    #
    #<jpg data>
    #
    # etc, etc
    #
    # where each '--frame' enclosed section represents a jpg image taken from the
    # camera that the browser will read and display one by one, replacing the
    # previous one, thus generating a video stream
    gen_obj_normal = gen_normal()
    return Response(gen_obj_normal, mimetype = "multipart/x-mixed-replace; boundary=frame")

@app.route("/")
@app.route("/index")
def index():
    try:
        return render_template("index.html")
    except Exception as e:
        return render_template("500.html", error = str(e))

@app.route("/phone")
def phone():
    try:
        return render_template("phone.html")
    except Exception as e:
        return render_template("500.html", error = str(e))

# handle data which is sent from the web page when the user is switching mode (manual or auto):
@socketio.on("mode_event")
def handle_mode_event(sent_dict):
    print("Recieved message: " + str(sent_dict["data"]))

    # get the sent mode:
    webpage.mode = sent_dict["data"]

# handle data which is sent from the web page when the user is manually controlling
# the throttle using WASD (actually, just W and S), and send it to the RPI:
@socketio.on("throttle_arrow_event")
def handle_throttle_arrow_event(sent_dict):
    print("Recieved message: " + str(sent_dict["data"]))

    # get the sent throttle direction:
    webpage.throttle_direction = sent_dict["data"]

# handle data which is sent from the web page when the user is manually controlling
# the steering using WASD (actually, just A and D), and send it to the RPI:
@socketio.on("steering_arrow_event")
def handle_steering_arrow_event(sent_dict):
    print("Recieved message: " + str(sent_dict["data"]))

    # get the sent steering direction:
    webpage.steering_direction = sent_dict["data"]

@app.errorhandler(404)
def page_not_found(e):
    try:
        return render_template("404.html")
    except Exception as e:
        return render_template("500.html", error = str(e))

if __name__ == '__main__':
    # run the member function run defined above:
    webpage.run()





























# #!/usr/bin/env python
#
# import rospy
# from std_msgs.msg import String
# from geometry_msgs.msg import Twist
#
# import numpy as np
# import cv2
# import requests
# from flask import Flask, render_template, Response
# from flask_socketio import SocketIO, emit
# import time
# from threading import Thread
# import socket
#
# throttle_direction = "No_throttle"
# steering_direction = "No_steering"
# mode = "Manual"
# steering_angle = 0
# throttle = 0
#
# latest_video_frame = []
#
# # initialize the web server:
# app = Flask(__name__)
# socketio = SocketIO(app, async_mode = "threading")
# # (without "async_mode = "threading", sending stuff to the client (via socketio) doesn't work!)
#
# def video_thread():
#     global latest_video_frame, latest_video_frame_small
#
#     # connect to the RPI video stream:
#     cap = cv2.VideoCapture("tcp://172.24.1.1:8080")
#     # (tcp://<RPI IP address>:<same port number as in start_video_stream.sh>)
#
#     counter = 0
#     while True:
#         # (this loop will run with the same frequency as the specified camera
#         # framerate, which currently is 20 Hz)
#
#         # capture frame-by-frame:
#         ret, frame = cap.read()
#         latest_video_frame = frame
#
#         # get a smaller version of the frame:
#         latest_video_frame_small = cv2.resize(frame, (640, 360))
#
#         # display the resulting frame
#         # cv2.imshow("test", latest_video_frame_small_right)
#         # if cv2.waitKey(1) & 0xFF == ord('q'):
#         #     break
#
# def web_app_thread():
#     # start the local web app:
#     socketio.run(app, "172.24.1.72")
#
# def web_comm_thread():
#     while True:
#         # send all data for display on the web page:
#         socketio.emit("new_data", {"throttle_direction": throttle_direction,
#                     "steering_direction": steering_direction, "throttle": throttle,
#                     "steering_angle": steering_angle, "mode": mode})
#
#         # delay for 0.1 sec (for ~ 10 Hz loop frequency):
#         time.sleep(0.1)
#
# def gen_normal():
#     while True:
#         if len(latest_video_frame_small) > 0: # if we have started receiving actual frames:
#             frame = latest_video_frame_small
#
#             # convert the latest read video frame to memory buffer format:
#             ret, frame_buffer = cv2.imencode(".jpg", frame)
#
#             # get the raw data bytes of 'frame_buffer' (convert to binary):
#             frame_bytes = frame_buffer.tobytes()
#
#             # yield ('return') the frame: (yield: returns a value and saves the current
#             # state of the generator function. The next time this generator function
#             # is called, execution will resume on the next line of code in the function
#             # (i.e., it will in this example start a new cycle of the while loop
#             # and yield a new frame))
#             #
#             # what we yield looks like this, but in binary (binary data is a must for multipart):
#             # --frame
#             # Content-Type: image/jpeg
#             #
#             # <frame data>
#             #
#             yield (b'--frame\nContent-Type: image/jpeg\n\n' + frame_bytes + b'\n')
#
#             # delay for 0.05 sec (for ~ 20 Hz loop frequency, we don't get new
#             # frames from the camera more frequently than this):
#             time.sleep(0.05)
#
# @app.route("/camera_normal")
# def camera_normal():
#     # returns a Respone object with a 'gen_normal()' generator function as its data
#     # generating iterator. We send a MIME multipart message of subtype Mixed-replace,
#     # which means that the browser will read data parts (generated by gen_obj_normal)
#     # one by one and immediately replace the previous one and display it. We never
#     # close the connection to the client, pretending like we haven't finished sending
#     # all the data, and constantly keeps sending new data parts generated by gen_obj_normal.
#     #
#     # what over time will be sent to the client is the following:
#     # Content-Type: multipart/x-mixed-replace; boundary=frame
#     #
#     # --frame
#     # Content-Type: image/jpeg
#     #
#     #<jpg data>
#     #
#     # --frame
#     # Content-Type: image/jpeg
#     #
#     #<jpg data>
#     #
#     # etc, etc
#     #
#     # where each '--frame' enclosed section represents a jpg image taken from the
#     # camera that the browser will read and display one by one, replacing the
#     # previous one, thus generating a video stream
#     gen_obj_normal = gen_normal()
#     return Response(gen_obj_normal, mimetype = "multipart/x-mixed-replace; boundary=frame")
#
# @app.route("/")
# @app.route("/index")
# def index():
#     try:
#         return render_template("index.html")
#     except Exception as e:
#         return render_template("500.html", error = str(e))
#
# @app.route("/phone")
# def phone():
#     try:
#         return render_template("phone.html")
#     except Exception as e:
#         return render_template("500.html", error = str(e))
#
# # handle data which is sent from the web page when the user is switching mode (manual or auto):
# @socketio.on("mode_event")
# def handle_mode_event(sent_dict):
#     global mode
#     print("Recieved message: " + str(sent_dict["data"]))
#
#     # get the sent mode:
#     mode = sent_dict["data"]
#
#     # send the mode to the RPI:
#     #send_to_RPI(mode)
#
# # handle data which is sent from the web page when the user is manually controlling
# # the throttle using WASD (actually, just W and S), and send it to the RPI:
# @socketio.on("throttle_arrow_event")
# def handle_throttle_arrow_event(sent_dict):
#     global throttle_direction
#     print("Recieved message: " + str(sent_dict["data"]))
#
#     # get the sent throttle direction:
#     throttle_direction = sent_dict["data"]
#
#     # send the throttle direction to the RPI:
#     #send_to_RPI(throttle_direction)
#
# # handle data which is sent from the web page when the user is manually controlling
# # the steering using WASD (actually, just A and D), and send it to the RPI:
# @socketio.on("steering_arrow_event")
# def handle_steering_arrow_event(sent_dict):
#     global steering_direction
#     print("Recieved message: " + str(sent_dict["data"]))
#
#     # get the sent steering direction:
#     steering_direction = sent_dict["data"]
#
#     # send the steering direction to the RPI:
#     #send_to_RPI(steering_direction)
#
# @app.errorhandler(404)
# def page_not_found(e):
#     try:
#         return render_template("404.html")
#     except Exception as e:
#         return render_template("500.html", error = str(e))
#
# class Manual_controller:
#     def __init__(self):
#         # create a publisher that publishes messages of type Twist on the
#         # topic cmd_vel_mux/input/navi:
#         self.pub = rospy.Publisher("/cmd_vel", Twist,
#                     queue_size=10)
#
#         # initialize the throttle direction ("Forward", "Backward", or
#         # "No_throttle") and the steering direction ("Right", "Left", or
#         # "No_steering"):
#         self.throttle_direction = "No_throttle"
#         self.steering_direction = "No_steering"
#
#         # initialize the control signals:
#         self.v = 0 # (linear velocity)
#         self.omega = 0 # (angular velocity)
#
#         # set upper/lower limits on the control signals:
#         self.v_max = 0.65
#         self.omega_max = 1.5
#
#     # define a member function which computes new values for self.v and
#     # self.omega based on the current values of self.v, self.omega,
#     # self.throttle_direction and self.steering_direction:
#     def get_control_signals(self):
#         # compute self.omega:
#         if self.steering_direction == "Right":
#             if self.omega < - 0.001: # (if currently rotating to the left:)
#                 self.omega = 0
#             else: # (if currently rotating to the right or not at all:)
#                 self.omega = self.omega + 0.3
#         elif self.steering_direction == "Left":
#             if self.omega > 0.001: # (if currently rotating to the right:)
#                 self.omega = 0
#             else: # (if currently rotating to the left or not at all:)
#                 self.omega = self.omega - 0.3
#         elif self.steering_direction == "No_steering":
#             self.omega = 0
#
#         # limit self.omega to [-self.omega_max, self.omega_max]:
#         if self.omega > self.omega_max:
#             self.omega = self.omega_max
#         elif self.omega < -self.omega_max:
#             self.omega = -self.omega_max
#
#         # compute self.v:
#         if self.throttle_direction == "Forward":
#             if self.v < -0.001:
#                 self.v = 0
#             else:
#                 self.v = self.v + 0.05
#         elif self.throttle_direction == "Backward":
#             if self.v > 0.001:
#                 self.v = 0
#             else:
#                 self.v = self.v - 0.05
#         elif self.throttle_direction == "No_throttle":
#             self.v = 0
#
#         # limit self.v to [-self.v_max, self.v_max]:
#         if self.v > self.v_max:
#             self.v = self.v_max
#         elif self.v < -self.v_max:
#             self.v = -self.v_max
#
#         self.v = 0
#         self.omega = 0.2
#
#         # pack self.v and self.omega in the format expected by the robot:
#         control_signals = Twist()
#         control_signals.linear.x = self.v
#         control_signals.angular.z = -self.omega
#
#         return control_signals
#
#     # define a member function which computes new control signals and sends
#     # these to the robot with a frequency of 10 Hz:
#     def run(self):
#         # specify the desired loop frequency in Hz:
#         rate = rospy.Rate(10)
#
#         while not rospy.is_shutdown(): # (while the ROS node is still active:)
#             # compute new control signals:
#             control_signals = self.get_control_signals()
#
#             # publish the control signals (on the specified topic, i.e., on \cmd_vel):
#             self.pub.publish(control_signals)
#
#             # sleep to get a loop frequency of 10 Hz:
#             rate.sleep()
#
# class Webpage:
#     def __init__(self):
#
#
# if __name__ == '__main__':
#     # start a thread constantly reading frames from the RPI video stream:
#     thread_video = Thread(target = video_thread)
#     thread_video.start()
#
#     # start a thread that starts and runs the local web app:
#     thread_web_app = Thread(target = web_app_thread)
#     thread_web_app.start()
#
#     # start a thread constantly sending sensor/status data to the web page:
#     thread_web_comm = Thread(target = web_comm_thread)
#     thread_web_comm.start()
#
#     # initialize this code as a ROS node named webpage_node:
#     rospy.init_node("webpage_node", anonymous=True)
#
#     # create an instance of the Manual_controller class (this will run
#     # its __init__ function):
#     manual_controller = Manual_controller()
#
#     # run the member fuction run defined above:
#     manual_controller.run()
