# skalman

## Setup:

#### Setup the Raspbian RPI (wifi hotspot, video streaming):

- Install the latest verison of Raspian:
- - Download Raspbian with desktop: https://www.raspberrypi.org/downloads/raspbian/
- - Write the downloaded image to the micro-SD card: https://www.raspberrypi.org/documentation/installation/installing-images/
- - Insert micro-SD into the RPI, power it up and follow the instructions (need HDMI cable and usb mouse & keyboard)

- Enable SSH, the camera and I2C:
- - Menu > Preferences > Raspberry Pi Config > Interfaces
- - Click "Enabled" for Camera, SSH and I2C
- - Restart the RPI

- Setup the RPI as a wifi hotspot:
- - https://frillip.com/using-your-raspberry-pi-3-as-a-wifi-access-point-with-hostapd

- A problem you might run into is that you can't install anything using pip on the RPI. The solution is, strangely, to set the date and time properly:  
- - $ sudo date -s "Jul 7 18:31" (where you replace "Jul 7 18:31" with your current date and time)

*****

#### Setup the Ubuntu RPI (for reading the LiDAR, communicating with the laptop and communicating with the OpenCR):

- Install Ubuntu Mate:  
- - http://emanual.robotis.com/docs/en/platform/turtlebot3/rpi3_software_setup/#install-linux-on-turtlebot3-burger-raspberry-pi-3 (Download the file, burn the image onto the micro-SD card using e.g. Etcher, insert micro-SD into RPI, power it up and follow the instructions (need HDMI cable and usb mouse & keyboard)) (Choose a username and password of your liking, you'll use it to SSH into the RPI)

- Install ROS:
- - $ sudo apt-get update
- - $ sudo apt-get upgrade
- - $ wget https://raw.githubusercontent.com/ROBOTIS-GIT/robotis_tools/master/install_ros_kinetic.sh && chmod 755 ./install_ros_kinetic.sh && bash ./install_ros_kinetic.sh

- Setup and test the LiDAR:
- - $ sudo apt-get install ros-kinetic-hls-lfcd-lds-driver
- - Make sure that your username is in the dialout group in /etc/group (otherwise you won't have permission to open /dev/ttyUSB0):
- - - $ sudo nano /etc/group
- - - In my case (my username is 'pi'), I hade to change the line "dialout:x:20:" to "dialout:x:20:pi"
- - - Restart the computer ($ sudo reboot)
- - $ roslaunch hls_lfcd_lds_driver hlds_laser.launch (the LiDAR should now start turning and publish messages to /scan, check this with the command $ rostopic echo /scan)

- Install the needed packages for communicating with the OpenCR etc:
- - $ sudo apt-get install ros-kinetic-joy ros-kinetic-teleop-twist-joy ros-kinetic-teleop-twist-keyboard ros-kinetic-laser-proc ros-kinetic-rgbd-launch ros-kinetic-depthimage-to-laserscan ros-kinetic-rosserial-arduino ros-kinetic-rosserial-python ros-kinetic-rosserial-server ros-kinetic-rosserial-client ros-kinetic-rosserial-msgs ros-kinetic-amcl ros-kinetic-map-server ros-kinetic-move-base ros-kinetic-urdf ros-kinetic-xacro ros-kinetic-compressed-image-transport ros-kinetic-rqt-image-view ros-kinetic-gmapping ros-kinetic-navigation
- - $ cd ~/catkin_ws/src
- - $ git clone https://github.com/ROBOTIS-GIT/turtlebot3_msgs.git
- - $ git clone https://github.com/ROBOTIS-GIT/turtlebot3.git
- - $ cd ~/catkin_ws
- - $ catkin_make

- Allow access to the OpenCR USB port without acquiring root permission:
- - rosrun turtlebot3_bringup create_udev_rules

- Enable SSH:
- - $ sudo apt-get install raspi-config rpi-update
- - $ sudo raspi-config
- - Select "Interfacing Options"
- - Select "SSH", select "Yes"
- - Reboot to confirm the changes

- Make it connect to the WiFi network of the Raspian RPI on boot:  
- - Press on the WiFi symbol and select "Edit Connections"
- - Select the RPI network and click Edit
- - Below "General", make sure that "Automatically connect to this network when it is available" is selected
- - Edit any other networks you previously have connected to and make sure that "Automatically connect to this network when it is available" is NOT selected

- Get its IP address:
- - Make sure it is connected to the Raspbian RPI wifi
- - $ ifconfig
- - The IP address is found as "inet addr" below "wlan0". In my case I got: 172.24.1.57

*****

#### Setup the laptop:

- Install ROS:
- - TODO! TODO! TODO! TODO! TODO! TODO! TODO! TODO! TODO! TODO! TODO! TODO! TODO! TODO! TODO!

- Create a catkin workspace in skalman/laptop:
- - $ cd ~/skalman/laptop
- - $ mkdir catkin_ws
- - $ cd catkin_ws
- - $ mkdir src
- - $ catkin_make
- - $ sudo nano ~/.bashrc
- - Add the below line to the bottom of this file (Ctrl+Shift+v to paste the line, Ctrl+x - y - Enter to save the file)
```
source ~/skalman/laptop/catkin_ws/devel/setup.bash
```  
- - $ source ~/.bashrc

- Install all dependent packages for TurtleBot3 control:
- - $ sudo apt-get install ros-kinetic-joy ros-kinetic-teleop-twist-joy ros-kinetic-teleop-twist-keyboard ros-kinetic-laser-proc ros-kinetic-rgbd-launch ros-kinetic-depthimage-to-laserscan ros-kinetic-rosserial-arduino ros-kinetic-rosserial-python ros-kinetic-rosserial-server ros-kinetic-rosserial-client ros-kinetic-rosserial-msgs ros-kinetic-amcl ros-kinetic-map-server ros-kinetic-move-base ros-kinetic-urdf ros-kinetic-xacro ros-kinetic-compressed-image-transport ros-kinetic-rqt-image-view ros-kinetic-gmapping ros-kinetic-navigation
- - $ cd ~/skalman/laptop/catkin_ws/src/
- - $ git clone https://github.com/ROBOTIS-GIT/turtlebot3_msgs.git
- - $ git clone https://github.com/ROBOTIS-GIT/turtlebot3.git
- - $ cd ~/skalman/laptop/catkin_ws 
- - $ catkin_make

- Get its IP address:
- - Make sure it is connected to the Raspbian RPI wifi
- - $ ifconfig
- - The IP address is found as "inet addr" below "wlan0". In my case I got: 172.24.1.72

*****

#### Setup the ROS IP addresses:

- In my case, the laptop has IP address 172.24.1.72 and the Ubuntu RPI has IP address 172.24.1.57

- On the laptop (master):
- - $ sudo nano ~/.bashrc
- - Add the following two lines to the bottom of the file: "export ROS_MASTER_URI=http://172.24.1.72:11311" and "export ROS_HOSTNAME=172.24.1.72"
- - $ source ~/.bashrc

- On the Ubuntu RPI (slave):
- - $ sudo nano ~/.bashrc
- - Add the following two lines to the bottom of the file: "export ROS_MASTER_URI=http://172.24.1.72:11311" and "export ROS_HOSTNAME=172.24.1.57"
- - $ source ~/.bashrc


## Usage:

- Power on the Raspbian RPI and wait for a few seconds (for the wifi hotspot to start)
- Connect the laptop to the Raspbian RPI wifi
- Connect the battery and power on the OpenCR (this will power on the Ubuntu RPI)

- SSH into the Ubuntu RPI:
- - [laptop] $ ssh pi@172.24.1.57

- SSH into the Raspbian RPI:
- - [laptop] $ ssh pi@172.24.1.1

- [laptop] $ roscore

- - (ALT 1) Launch publishers for all sensors (INCLUDING THE LIDAR) and subscribers for steering commands:
- - - [Ubuntu RPI] $ roslaunch turtlebot3_bringup turtlebot3_robot.launch
- - (ALT 2) Launch publishers for all sensors except the LIDAR and subscribers for steering commands:
- - - [Ubuntu RPI] $ roslaunch turtlebot3_bringup turtlebot3_core.launch

- Launch keyboard teleoperation:
- - [laptop] $ roslaunch turtlebot3_teleop turtlebot3_teleop_key.launch

- Start video streaming on the Raspbian RPI:
- - [Raspbian RPI] $ sh start_video_stream.sh

- Launch the webpage:
- - (Make sure that the laptop is connected to the Raspian RPI wifi)
- - (Make sure that)
- - [laptop] python ~/skalman/laptop/webpage/app.py
