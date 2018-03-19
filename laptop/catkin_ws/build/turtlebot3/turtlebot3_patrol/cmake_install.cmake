# Install script for directory: /home/fregu856/skalman/laptop/catkin_ws/src/turtlebot3/turtlebot3_patrol

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/fregu856/skalman/laptop/catkin_ws/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/turtlebot3_patrol/action" TYPE FILE FILES "/home/fregu856/skalman/laptop/catkin_ws/src/turtlebot3/turtlebot3_patrol/action/turtlebot3.action")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/turtlebot3_patrol/msg" TYPE FILE FILES
    "/home/fregu856/skalman/laptop/catkin_ws/devel/share/turtlebot3_patrol/msg/turtlebot3Action.msg"
    "/home/fregu856/skalman/laptop/catkin_ws/devel/share/turtlebot3_patrol/msg/turtlebot3ActionGoal.msg"
    "/home/fregu856/skalman/laptop/catkin_ws/devel/share/turtlebot3_patrol/msg/turtlebot3ActionResult.msg"
    "/home/fregu856/skalman/laptop/catkin_ws/devel/share/turtlebot3_patrol/msg/turtlebot3ActionFeedback.msg"
    "/home/fregu856/skalman/laptop/catkin_ws/devel/share/turtlebot3_patrol/msg/turtlebot3Goal.msg"
    "/home/fregu856/skalman/laptop/catkin_ws/devel/share/turtlebot3_patrol/msg/turtlebot3Result.msg"
    "/home/fregu856/skalman/laptop/catkin_ws/devel/share/turtlebot3_patrol/msg/turtlebot3Feedback.msg"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/turtlebot3_patrol/cmake" TYPE FILE FILES "/home/fregu856/skalman/laptop/catkin_ws/build/turtlebot3/turtlebot3_patrol/catkin_generated/installspace/turtlebot3_patrol-msg-paths.cmake")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/home/fregu856/skalman/laptop/catkin_ws/devel/include/turtlebot3_patrol")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/roseus/ros" TYPE DIRECTORY FILES "/home/fregu856/skalman/laptop/catkin_ws/devel/share/roseus/ros/turtlebot3_patrol")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/common-lisp/ros" TYPE DIRECTORY FILES "/home/fregu856/skalman/laptop/catkin_ws/devel/share/common-lisp/ros/turtlebot3_patrol")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gennodejs/ros" TYPE DIRECTORY FILES "/home/fregu856/skalman/laptop/catkin_ws/devel/share/gennodejs/ros/turtlebot3_patrol")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  execute_process(COMMAND "/usr/bin/python" -m compileall "/home/fregu856/skalman/laptop/catkin_ws/devel/lib/python2.7/dist-packages/turtlebot3_patrol")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python2.7/dist-packages" TYPE DIRECTORY FILES "/home/fregu856/skalman/laptop/catkin_ws/devel/lib/python2.7/dist-packages/turtlebot3_patrol")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/fregu856/skalman/laptop/catkin_ws/build/turtlebot3/turtlebot3_patrol/catkin_generated/installspace/turtlebot3_patrol.pc")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/turtlebot3_patrol/cmake" TYPE FILE FILES "/home/fregu856/skalman/laptop/catkin_ws/build/turtlebot3/turtlebot3_patrol/catkin_generated/installspace/turtlebot3_patrol-msg-extras.cmake")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/turtlebot3_patrol/cmake" TYPE FILE FILES
    "/home/fregu856/skalman/laptop/catkin_ws/build/turtlebot3/turtlebot3_patrol/catkin_generated/installspace/turtlebot3_patrolConfig.cmake"
    "/home/fregu856/skalman/laptop/catkin_ws/build/turtlebot3/turtlebot3_patrol/catkin_generated/installspace/turtlebot3_patrolConfig-version.cmake"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/turtlebot3_patrol" TYPE FILE FILES "/home/fregu856/skalman/laptop/catkin_ws/src/turtlebot3/turtlebot3_patrol/package.xml")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/turtlebot3_patrol" TYPE PROGRAM FILES
    "/home/fregu856/skalman/laptop/catkin_ws/src/turtlebot3/turtlebot3_patrol/scripts/turtlebot3_client.py"
    "/home/fregu856/skalman/laptop/catkin_ws/src/turtlebot3/turtlebot3_patrol/scripts/turtlebot3_server.py"
    )
endif()

