# skalman

### Setup the Raspbian RPI (wifi hotspot, video streaming)

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

### Setup the Ubuntu RPI (for reading the LiDAR)

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
- - $ roslaunch hls_lfcd_lds_driver hlds_laser.launch (the LiDAR should now start turning and publish messages to /scan, check this with the command $ rostopic echo /scan) !!!!!!!!!!!!!!!!! FIXA, LAGGA TILL NAGOT !!!!!

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

*****

### Setup the laptop

- Install ROS:
