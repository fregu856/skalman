#!/usr/bin/env python

import rospy
from geometry_msgs.msg import Twist

class Controller:
    def __init__(self):
        # initialize the control signals:
        self.v = 0 # (linear velocity)
        self.omega = 0 # (angular velocity)

        self.counter = 0

        # initialize this code as a ROS node named controller_node:
        rospy.init_node("controller_node", anonymous=True)

        # create subscriber to read control signals sent from the laptop:
        rospy.Subscriber("/cmd_vel_check", Twist, self.control_signals_callback)

        # create a publisher that publishes messages of type Twist on the topic \cmd_vel:
        self.pub = rospy.Publisher("/cmd_vel", Twist, queue_size=10)

    def control_signals_callback(self, msg_obj):
        self.v = msg_obj.linear.x
        self.omega = msg_obj.angular.z

        self.counter = 0

    def run(self):
        # specify the desired loop frequency in Hz:
        rate = rospy.Rate(10)

        while not rospy.is_shutdown(): # (while the ROS node is still active:)
            control_signals = Twist()

            # stop the robot if we haven't received a msg from the laptop in 0.5 sec:
            if self.counter < 5:
                control_signals.linear.x = self.v
                control_signals.angular.z = self.omega
            else:
                control_signals.linear.x = 0.0
                control_signals.angular.z = 0.0

            # publish the control signals (on the specified topic, i.e., on \cmd_vel):
            self.pub.publish(control_signals)

            # sleep to get a loop frequency of 10 Hz:
            rate.sleep()

            self.counter += 1

if __name__ == '__main__':
    # create an instance of the Controller class (this will run its __init__ function):
    controller = Controller()

    # run the member function run defined above:
    controller.run()
