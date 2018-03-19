# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "turtlebot3_patrol: 7 messages, 0 services")

set(MSG_I_FLAGS "-Iturtlebot3_patrol:/home/fregu856/skalman/laptop/catkin_ws/devel/share/turtlebot3_patrol/msg;-Istd_msgs:/opt/ros/kinetic/share/std_msgs/cmake/../msg;-Iactionlib_msgs:/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/kinetic/share/geometry_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(turtlebot3_patrol_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/fregu856/skalman/laptop/catkin_ws/devel/share/turtlebot3_patrol/msg/turtlebot3Goal.msg" NAME_WE)
add_custom_target(_turtlebot3_patrol_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "turtlebot3_patrol" "/home/fregu856/skalman/laptop/catkin_ws/devel/share/turtlebot3_patrol/msg/turtlebot3Goal.msg" "geometry_msgs/Vector3"
)

get_filename_component(_filename "/home/fregu856/skalman/laptop/catkin_ws/devel/share/turtlebot3_patrol/msg/turtlebot3ActionGoal.msg" NAME_WE)
add_custom_target(_turtlebot3_patrol_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "turtlebot3_patrol" "/home/fregu856/skalman/laptop/catkin_ws/devel/share/turtlebot3_patrol/msg/turtlebot3ActionGoal.msg" "actionlib_msgs/GoalID:turtlebot3_patrol/turtlebot3Goal:std_msgs/Header:geometry_msgs/Vector3"
)

get_filename_component(_filename "/home/fregu856/skalman/laptop/catkin_ws/devel/share/turtlebot3_patrol/msg/turtlebot3Feedback.msg" NAME_WE)
add_custom_target(_turtlebot3_patrol_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "turtlebot3_patrol" "/home/fregu856/skalman/laptop/catkin_ws/devel/share/turtlebot3_patrol/msg/turtlebot3Feedback.msg" ""
)

get_filename_component(_filename "/home/fregu856/skalman/laptop/catkin_ws/devel/share/turtlebot3_patrol/msg/turtlebot3ActionFeedback.msg" NAME_WE)
add_custom_target(_turtlebot3_patrol_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "turtlebot3_patrol" "/home/fregu856/skalman/laptop/catkin_ws/devel/share/turtlebot3_patrol/msg/turtlebot3ActionFeedback.msg" "actionlib_msgs/GoalID:turtlebot3_patrol/turtlebot3Feedback:std_msgs/Header:actionlib_msgs/GoalStatus"
)

get_filename_component(_filename "/home/fregu856/skalman/laptop/catkin_ws/devel/share/turtlebot3_patrol/msg/turtlebot3Action.msg" NAME_WE)
add_custom_target(_turtlebot3_patrol_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "turtlebot3_patrol" "/home/fregu856/skalman/laptop/catkin_ws/devel/share/turtlebot3_patrol/msg/turtlebot3Action.msg" "turtlebot3_patrol/turtlebot3Goal:std_msgs/Header:turtlebot3_patrol/turtlebot3ActionGoal:geometry_msgs/Vector3:turtlebot3_patrol/turtlebot3ActionResult:turtlebot3_patrol/turtlebot3Result:turtlebot3_patrol/turtlebot3ActionFeedback:actionlib_msgs/GoalID:turtlebot3_patrol/turtlebot3Feedback:actionlib_msgs/GoalStatus"
)

get_filename_component(_filename "/home/fregu856/skalman/laptop/catkin_ws/devel/share/turtlebot3_patrol/msg/turtlebot3Result.msg" NAME_WE)
add_custom_target(_turtlebot3_patrol_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "turtlebot3_patrol" "/home/fregu856/skalman/laptop/catkin_ws/devel/share/turtlebot3_patrol/msg/turtlebot3Result.msg" ""
)

get_filename_component(_filename "/home/fregu856/skalman/laptop/catkin_ws/devel/share/turtlebot3_patrol/msg/turtlebot3ActionResult.msg" NAME_WE)
add_custom_target(_turtlebot3_patrol_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "turtlebot3_patrol" "/home/fregu856/skalman/laptop/catkin_ws/devel/share/turtlebot3_patrol/msg/turtlebot3ActionResult.msg" "actionlib_msgs/GoalID:turtlebot3_patrol/turtlebot3Result:std_msgs/Header:actionlib_msgs/GoalStatus"
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(turtlebot3_patrol
  "/home/fregu856/skalman/laptop/catkin_ws/devel/share/turtlebot3_patrol/msg/turtlebot3Goal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/turtlebot3_patrol
)
_generate_msg_cpp(turtlebot3_patrol
  "/home/fregu856/skalman/laptop/catkin_ws/devel/share/turtlebot3_patrol/msg/turtlebot3ActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/fregu856/skalman/laptop/catkin_ws/devel/share/turtlebot3_patrol/msg/turtlebot3Goal.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/turtlebot3_patrol
)
_generate_msg_cpp(turtlebot3_patrol
  "/home/fregu856/skalman/laptop/catkin_ws/devel/share/turtlebot3_patrol/msg/turtlebot3Feedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/turtlebot3_patrol
)
_generate_msg_cpp(turtlebot3_patrol
  "/home/fregu856/skalman/laptop/catkin_ws/devel/share/turtlebot3_patrol/msg/turtlebot3ActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/fregu856/skalman/laptop/catkin_ws/devel/share/turtlebot3_patrol/msg/turtlebot3Result.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/turtlebot3_patrol
)
_generate_msg_cpp(turtlebot3_patrol
  "/home/fregu856/skalman/laptop/catkin_ws/devel/share/turtlebot3_patrol/msg/turtlebot3Action.msg"
  "${MSG_I_FLAGS}"
  "/home/fregu856/skalman/laptop/catkin_ws/devel/share/turtlebot3_patrol/msg/turtlebot3Goal.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/home/fregu856/skalman/laptop/catkin_ws/devel/share/turtlebot3_patrol/msg/turtlebot3ActionGoal.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/home/fregu856/skalman/laptop/catkin_ws/devel/share/turtlebot3_patrol/msg/turtlebot3ActionResult.msg;/home/fregu856/skalman/laptop/catkin_ws/devel/share/turtlebot3_patrol/msg/turtlebot3Result.msg;/home/fregu856/skalman/laptop/catkin_ws/devel/share/turtlebot3_patrol/msg/turtlebot3ActionFeedback.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/fregu856/skalman/laptop/catkin_ws/devel/share/turtlebot3_patrol/msg/turtlebot3Feedback.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/turtlebot3_patrol
)
_generate_msg_cpp(turtlebot3_patrol
  "/home/fregu856/skalman/laptop/catkin_ws/devel/share/turtlebot3_patrol/msg/turtlebot3Result.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/turtlebot3_patrol
)
_generate_msg_cpp(turtlebot3_patrol
  "/home/fregu856/skalman/laptop/catkin_ws/devel/share/turtlebot3_patrol/msg/turtlebot3ActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/fregu856/skalman/laptop/catkin_ws/devel/share/turtlebot3_patrol/msg/turtlebot3Feedback.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/turtlebot3_patrol
)

### Generating Services

### Generating Module File
_generate_module_cpp(turtlebot3_patrol
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/turtlebot3_patrol
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(turtlebot3_patrol_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(turtlebot3_patrol_generate_messages turtlebot3_patrol_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/fregu856/skalman/laptop/catkin_ws/devel/share/turtlebot3_patrol/msg/turtlebot3Goal.msg" NAME_WE)
add_dependencies(turtlebot3_patrol_generate_messages_cpp _turtlebot3_patrol_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/fregu856/skalman/laptop/catkin_ws/devel/share/turtlebot3_patrol/msg/turtlebot3ActionGoal.msg" NAME_WE)
add_dependencies(turtlebot3_patrol_generate_messages_cpp _turtlebot3_patrol_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/fregu856/skalman/laptop/catkin_ws/devel/share/turtlebot3_patrol/msg/turtlebot3Feedback.msg" NAME_WE)
add_dependencies(turtlebot3_patrol_generate_messages_cpp _turtlebot3_patrol_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/fregu856/skalman/laptop/catkin_ws/devel/share/turtlebot3_patrol/msg/turtlebot3ActionFeedback.msg" NAME_WE)
add_dependencies(turtlebot3_patrol_generate_messages_cpp _turtlebot3_patrol_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/fregu856/skalman/laptop/catkin_ws/devel/share/turtlebot3_patrol/msg/turtlebot3Action.msg" NAME_WE)
add_dependencies(turtlebot3_patrol_generate_messages_cpp _turtlebot3_patrol_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/fregu856/skalman/laptop/catkin_ws/devel/share/turtlebot3_patrol/msg/turtlebot3Result.msg" NAME_WE)
add_dependencies(turtlebot3_patrol_generate_messages_cpp _turtlebot3_patrol_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/fregu856/skalman/laptop/catkin_ws/devel/share/turtlebot3_patrol/msg/turtlebot3ActionResult.msg" NAME_WE)
add_dependencies(turtlebot3_patrol_generate_messages_cpp _turtlebot3_patrol_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(turtlebot3_patrol_gencpp)
add_dependencies(turtlebot3_patrol_gencpp turtlebot3_patrol_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS turtlebot3_patrol_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(turtlebot3_patrol
  "/home/fregu856/skalman/laptop/catkin_ws/devel/share/turtlebot3_patrol/msg/turtlebot3Goal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/turtlebot3_patrol
)
_generate_msg_eus(turtlebot3_patrol
  "/home/fregu856/skalman/laptop/catkin_ws/devel/share/turtlebot3_patrol/msg/turtlebot3ActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/fregu856/skalman/laptop/catkin_ws/devel/share/turtlebot3_patrol/msg/turtlebot3Goal.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/turtlebot3_patrol
)
_generate_msg_eus(turtlebot3_patrol
  "/home/fregu856/skalman/laptop/catkin_ws/devel/share/turtlebot3_patrol/msg/turtlebot3Feedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/turtlebot3_patrol
)
_generate_msg_eus(turtlebot3_patrol
  "/home/fregu856/skalman/laptop/catkin_ws/devel/share/turtlebot3_patrol/msg/turtlebot3ActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/fregu856/skalman/laptop/catkin_ws/devel/share/turtlebot3_patrol/msg/turtlebot3Result.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/turtlebot3_patrol
)
_generate_msg_eus(turtlebot3_patrol
  "/home/fregu856/skalman/laptop/catkin_ws/devel/share/turtlebot3_patrol/msg/turtlebot3Action.msg"
  "${MSG_I_FLAGS}"
  "/home/fregu856/skalman/laptop/catkin_ws/devel/share/turtlebot3_patrol/msg/turtlebot3Goal.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/home/fregu856/skalman/laptop/catkin_ws/devel/share/turtlebot3_patrol/msg/turtlebot3ActionGoal.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/home/fregu856/skalman/laptop/catkin_ws/devel/share/turtlebot3_patrol/msg/turtlebot3ActionResult.msg;/home/fregu856/skalman/laptop/catkin_ws/devel/share/turtlebot3_patrol/msg/turtlebot3Result.msg;/home/fregu856/skalman/laptop/catkin_ws/devel/share/turtlebot3_patrol/msg/turtlebot3ActionFeedback.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/fregu856/skalman/laptop/catkin_ws/devel/share/turtlebot3_patrol/msg/turtlebot3Feedback.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/turtlebot3_patrol
)
_generate_msg_eus(turtlebot3_patrol
  "/home/fregu856/skalman/laptop/catkin_ws/devel/share/turtlebot3_patrol/msg/turtlebot3Result.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/turtlebot3_patrol
)
_generate_msg_eus(turtlebot3_patrol
  "/home/fregu856/skalman/laptop/catkin_ws/devel/share/turtlebot3_patrol/msg/turtlebot3ActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/fregu856/skalman/laptop/catkin_ws/devel/share/turtlebot3_patrol/msg/turtlebot3Feedback.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/turtlebot3_patrol
)

### Generating Services

### Generating Module File
_generate_module_eus(turtlebot3_patrol
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/turtlebot3_patrol
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(turtlebot3_patrol_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(turtlebot3_patrol_generate_messages turtlebot3_patrol_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/fregu856/skalman/laptop/catkin_ws/devel/share/turtlebot3_patrol/msg/turtlebot3Goal.msg" NAME_WE)
add_dependencies(turtlebot3_patrol_generate_messages_eus _turtlebot3_patrol_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/fregu856/skalman/laptop/catkin_ws/devel/share/turtlebot3_patrol/msg/turtlebot3ActionGoal.msg" NAME_WE)
add_dependencies(turtlebot3_patrol_generate_messages_eus _turtlebot3_patrol_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/fregu856/skalman/laptop/catkin_ws/devel/share/turtlebot3_patrol/msg/turtlebot3Feedback.msg" NAME_WE)
add_dependencies(turtlebot3_patrol_generate_messages_eus _turtlebot3_patrol_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/fregu856/skalman/laptop/catkin_ws/devel/share/turtlebot3_patrol/msg/turtlebot3ActionFeedback.msg" NAME_WE)
add_dependencies(turtlebot3_patrol_generate_messages_eus _turtlebot3_patrol_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/fregu856/skalman/laptop/catkin_ws/devel/share/turtlebot3_patrol/msg/turtlebot3Action.msg" NAME_WE)
add_dependencies(turtlebot3_patrol_generate_messages_eus _turtlebot3_patrol_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/fregu856/skalman/laptop/catkin_ws/devel/share/turtlebot3_patrol/msg/turtlebot3Result.msg" NAME_WE)
add_dependencies(turtlebot3_patrol_generate_messages_eus _turtlebot3_patrol_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/fregu856/skalman/laptop/catkin_ws/devel/share/turtlebot3_patrol/msg/turtlebot3ActionResult.msg" NAME_WE)
add_dependencies(turtlebot3_patrol_generate_messages_eus _turtlebot3_patrol_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(turtlebot3_patrol_geneus)
add_dependencies(turtlebot3_patrol_geneus turtlebot3_patrol_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS turtlebot3_patrol_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(turtlebot3_patrol
  "/home/fregu856/skalman/laptop/catkin_ws/devel/share/turtlebot3_patrol/msg/turtlebot3Goal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/turtlebot3_patrol
)
_generate_msg_lisp(turtlebot3_patrol
  "/home/fregu856/skalman/laptop/catkin_ws/devel/share/turtlebot3_patrol/msg/turtlebot3ActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/fregu856/skalman/laptop/catkin_ws/devel/share/turtlebot3_patrol/msg/turtlebot3Goal.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/turtlebot3_patrol
)
_generate_msg_lisp(turtlebot3_patrol
  "/home/fregu856/skalman/laptop/catkin_ws/devel/share/turtlebot3_patrol/msg/turtlebot3Feedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/turtlebot3_patrol
)
_generate_msg_lisp(turtlebot3_patrol
  "/home/fregu856/skalman/laptop/catkin_ws/devel/share/turtlebot3_patrol/msg/turtlebot3ActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/fregu856/skalman/laptop/catkin_ws/devel/share/turtlebot3_patrol/msg/turtlebot3Result.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/turtlebot3_patrol
)
_generate_msg_lisp(turtlebot3_patrol
  "/home/fregu856/skalman/laptop/catkin_ws/devel/share/turtlebot3_patrol/msg/turtlebot3Action.msg"
  "${MSG_I_FLAGS}"
  "/home/fregu856/skalman/laptop/catkin_ws/devel/share/turtlebot3_patrol/msg/turtlebot3Goal.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/home/fregu856/skalman/laptop/catkin_ws/devel/share/turtlebot3_patrol/msg/turtlebot3ActionGoal.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/home/fregu856/skalman/laptop/catkin_ws/devel/share/turtlebot3_patrol/msg/turtlebot3ActionResult.msg;/home/fregu856/skalman/laptop/catkin_ws/devel/share/turtlebot3_patrol/msg/turtlebot3Result.msg;/home/fregu856/skalman/laptop/catkin_ws/devel/share/turtlebot3_patrol/msg/turtlebot3ActionFeedback.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/fregu856/skalman/laptop/catkin_ws/devel/share/turtlebot3_patrol/msg/turtlebot3Feedback.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/turtlebot3_patrol
)
_generate_msg_lisp(turtlebot3_patrol
  "/home/fregu856/skalman/laptop/catkin_ws/devel/share/turtlebot3_patrol/msg/turtlebot3Result.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/turtlebot3_patrol
)
_generate_msg_lisp(turtlebot3_patrol
  "/home/fregu856/skalman/laptop/catkin_ws/devel/share/turtlebot3_patrol/msg/turtlebot3ActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/fregu856/skalman/laptop/catkin_ws/devel/share/turtlebot3_patrol/msg/turtlebot3Feedback.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/turtlebot3_patrol
)

### Generating Services

### Generating Module File
_generate_module_lisp(turtlebot3_patrol
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/turtlebot3_patrol
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(turtlebot3_patrol_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(turtlebot3_patrol_generate_messages turtlebot3_patrol_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/fregu856/skalman/laptop/catkin_ws/devel/share/turtlebot3_patrol/msg/turtlebot3Goal.msg" NAME_WE)
add_dependencies(turtlebot3_patrol_generate_messages_lisp _turtlebot3_patrol_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/fregu856/skalman/laptop/catkin_ws/devel/share/turtlebot3_patrol/msg/turtlebot3ActionGoal.msg" NAME_WE)
add_dependencies(turtlebot3_patrol_generate_messages_lisp _turtlebot3_patrol_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/fregu856/skalman/laptop/catkin_ws/devel/share/turtlebot3_patrol/msg/turtlebot3Feedback.msg" NAME_WE)
add_dependencies(turtlebot3_patrol_generate_messages_lisp _turtlebot3_patrol_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/fregu856/skalman/laptop/catkin_ws/devel/share/turtlebot3_patrol/msg/turtlebot3ActionFeedback.msg" NAME_WE)
add_dependencies(turtlebot3_patrol_generate_messages_lisp _turtlebot3_patrol_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/fregu856/skalman/laptop/catkin_ws/devel/share/turtlebot3_patrol/msg/turtlebot3Action.msg" NAME_WE)
add_dependencies(turtlebot3_patrol_generate_messages_lisp _turtlebot3_patrol_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/fregu856/skalman/laptop/catkin_ws/devel/share/turtlebot3_patrol/msg/turtlebot3Result.msg" NAME_WE)
add_dependencies(turtlebot3_patrol_generate_messages_lisp _turtlebot3_patrol_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/fregu856/skalman/laptop/catkin_ws/devel/share/turtlebot3_patrol/msg/turtlebot3ActionResult.msg" NAME_WE)
add_dependencies(turtlebot3_patrol_generate_messages_lisp _turtlebot3_patrol_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(turtlebot3_patrol_genlisp)
add_dependencies(turtlebot3_patrol_genlisp turtlebot3_patrol_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS turtlebot3_patrol_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(turtlebot3_patrol
  "/home/fregu856/skalman/laptop/catkin_ws/devel/share/turtlebot3_patrol/msg/turtlebot3Goal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/turtlebot3_patrol
)
_generate_msg_nodejs(turtlebot3_patrol
  "/home/fregu856/skalman/laptop/catkin_ws/devel/share/turtlebot3_patrol/msg/turtlebot3ActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/fregu856/skalman/laptop/catkin_ws/devel/share/turtlebot3_patrol/msg/turtlebot3Goal.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/turtlebot3_patrol
)
_generate_msg_nodejs(turtlebot3_patrol
  "/home/fregu856/skalman/laptop/catkin_ws/devel/share/turtlebot3_patrol/msg/turtlebot3Feedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/turtlebot3_patrol
)
_generate_msg_nodejs(turtlebot3_patrol
  "/home/fregu856/skalman/laptop/catkin_ws/devel/share/turtlebot3_patrol/msg/turtlebot3ActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/fregu856/skalman/laptop/catkin_ws/devel/share/turtlebot3_patrol/msg/turtlebot3Result.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/turtlebot3_patrol
)
_generate_msg_nodejs(turtlebot3_patrol
  "/home/fregu856/skalman/laptop/catkin_ws/devel/share/turtlebot3_patrol/msg/turtlebot3Action.msg"
  "${MSG_I_FLAGS}"
  "/home/fregu856/skalman/laptop/catkin_ws/devel/share/turtlebot3_patrol/msg/turtlebot3Goal.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/home/fregu856/skalman/laptop/catkin_ws/devel/share/turtlebot3_patrol/msg/turtlebot3ActionGoal.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/home/fregu856/skalman/laptop/catkin_ws/devel/share/turtlebot3_patrol/msg/turtlebot3ActionResult.msg;/home/fregu856/skalman/laptop/catkin_ws/devel/share/turtlebot3_patrol/msg/turtlebot3Result.msg;/home/fregu856/skalman/laptop/catkin_ws/devel/share/turtlebot3_patrol/msg/turtlebot3ActionFeedback.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/fregu856/skalman/laptop/catkin_ws/devel/share/turtlebot3_patrol/msg/turtlebot3Feedback.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/turtlebot3_patrol
)
_generate_msg_nodejs(turtlebot3_patrol
  "/home/fregu856/skalman/laptop/catkin_ws/devel/share/turtlebot3_patrol/msg/turtlebot3Result.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/turtlebot3_patrol
)
_generate_msg_nodejs(turtlebot3_patrol
  "/home/fregu856/skalman/laptop/catkin_ws/devel/share/turtlebot3_patrol/msg/turtlebot3ActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/fregu856/skalman/laptop/catkin_ws/devel/share/turtlebot3_patrol/msg/turtlebot3Feedback.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/turtlebot3_patrol
)

### Generating Services

### Generating Module File
_generate_module_nodejs(turtlebot3_patrol
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/turtlebot3_patrol
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(turtlebot3_patrol_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(turtlebot3_patrol_generate_messages turtlebot3_patrol_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/fregu856/skalman/laptop/catkin_ws/devel/share/turtlebot3_patrol/msg/turtlebot3Goal.msg" NAME_WE)
add_dependencies(turtlebot3_patrol_generate_messages_nodejs _turtlebot3_patrol_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/fregu856/skalman/laptop/catkin_ws/devel/share/turtlebot3_patrol/msg/turtlebot3ActionGoal.msg" NAME_WE)
add_dependencies(turtlebot3_patrol_generate_messages_nodejs _turtlebot3_patrol_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/fregu856/skalman/laptop/catkin_ws/devel/share/turtlebot3_patrol/msg/turtlebot3Feedback.msg" NAME_WE)
add_dependencies(turtlebot3_patrol_generate_messages_nodejs _turtlebot3_patrol_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/fregu856/skalman/laptop/catkin_ws/devel/share/turtlebot3_patrol/msg/turtlebot3ActionFeedback.msg" NAME_WE)
add_dependencies(turtlebot3_patrol_generate_messages_nodejs _turtlebot3_patrol_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/fregu856/skalman/laptop/catkin_ws/devel/share/turtlebot3_patrol/msg/turtlebot3Action.msg" NAME_WE)
add_dependencies(turtlebot3_patrol_generate_messages_nodejs _turtlebot3_patrol_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/fregu856/skalman/laptop/catkin_ws/devel/share/turtlebot3_patrol/msg/turtlebot3Result.msg" NAME_WE)
add_dependencies(turtlebot3_patrol_generate_messages_nodejs _turtlebot3_patrol_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/fregu856/skalman/laptop/catkin_ws/devel/share/turtlebot3_patrol/msg/turtlebot3ActionResult.msg" NAME_WE)
add_dependencies(turtlebot3_patrol_generate_messages_nodejs _turtlebot3_patrol_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(turtlebot3_patrol_gennodejs)
add_dependencies(turtlebot3_patrol_gennodejs turtlebot3_patrol_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS turtlebot3_patrol_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(turtlebot3_patrol
  "/home/fregu856/skalman/laptop/catkin_ws/devel/share/turtlebot3_patrol/msg/turtlebot3Goal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/turtlebot3_patrol
)
_generate_msg_py(turtlebot3_patrol
  "/home/fregu856/skalman/laptop/catkin_ws/devel/share/turtlebot3_patrol/msg/turtlebot3ActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/fregu856/skalman/laptop/catkin_ws/devel/share/turtlebot3_patrol/msg/turtlebot3Goal.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/turtlebot3_patrol
)
_generate_msg_py(turtlebot3_patrol
  "/home/fregu856/skalman/laptop/catkin_ws/devel/share/turtlebot3_patrol/msg/turtlebot3Feedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/turtlebot3_patrol
)
_generate_msg_py(turtlebot3_patrol
  "/home/fregu856/skalman/laptop/catkin_ws/devel/share/turtlebot3_patrol/msg/turtlebot3ActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/fregu856/skalman/laptop/catkin_ws/devel/share/turtlebot3_patrol/msg/turtlebot3Result.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/turtlebot3_patrol
)
_generate_msg_py(turtlebot3_patrol
  "/home/fregu856/skalman/laptop/catkin_ws/devel/share/turtlebot3_patrol/msg/turtlebot3Action.msg"
  "${MSG_I_FLAGS}"
  "/home/fregu856/skalman/laptop/catkin_ws/devel/share/turtlebot3_patrol/msg/turtlebot3Goal.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/home/fregu856/skalman/laptop/catkin_ws/devel/share/turtlebot3_patrol/msg/turtlebot3ActionGoal.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/home/fregu856/skalman/laptop/catkin_ws/devel/share/turtlebot3_patrol/msg/turtlebot3ActionResult.msg;/home/fregu856/skalman/laptop/catkin_ws/devel/share/turtlebot3_patrol/msg/turtlebot3Result.msg;/home/fregu856/skalman/laptop/catkin_ws/devel/share/turtlebot3_patrol/msg/turtlebot3ActionFeedback.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/fregu856/skalman/laptop/catkin_ws/devel/share/turtlebot3_patrol/msg/turtlebot3Feedback.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/turtlebot3_patrol
)
_generate_msg_py(turtlebot3_patrol
  "/home/fregu856/skalman/laptop/catkin_ws/devel/share/turtlebot3_patrol/msg/turtlebot3Result.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/turtlebot3_patrol
)
_generate_msg_py(turtlebot3_patrol
  "/home/fregu856/skalman/laptop/catkin_ws/devel/share/turtlebot3_patrol/msg/turtlebot3ActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/fregu856/skalman/laptop/catkin_ws/devel/share/turtlebot3_patrol/msg/turtlebot3Feedback.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/turtlebot3_patrol
)

### Generating Services

### Generating Module File
_generate_module_py(turtlebot3_patrol
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/turtlebot3_patrol
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(turtlebot3_patrol_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(turtlebot3_patrol_generate_messages turtlebot3_patrol_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/fregu856/skalman/laptop/catkin_ws/devel/share/turtlebot3_patrol/msg/turtlebot3Goal.msg" NAME_WE)
add_dependencies(turtlebot3_patrol_generate_messages_py _turtlebot3_patrol_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/fregu856/skalman/laptop/catkin_ws/devel/share/turtlebot3_patrol/msg/turtlebot3ActionGoal.msg" NAME_WE)
add_dependencies(turtlebot3_patrol_generate_messages_py _turtlebot3_patrol_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/fregu856/skalman/laptop/catkin_ws/devel/share/turtlebot3_patrol/msg/turtlebot3Feedback.msg" NAME_WE)
add_dependencies(turtlebot3_patrol_generate_messages_py _turtlebot3_patrol_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/fregu856/skalman/laptop/catkin_ws/devel/share/turtlebot3_patrol/msg/turtlebot3ActionFeedback.msg" NAME_WE)
add_dependencies(turtlebot3_patrol_generate_messages_py _turtlebot3_patrol_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/fregu856/skalman/laptop/catkin_ws/devel/share/turtlebot3_patrol/msg/turtlebot3Action.msg" NAME_WE)
add_dependencies(turtlebot3_patrol_generate_messages_py _turtlebot3_patrol_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/fregu856/skalman/laptop/catkin_ws/devel/share/turtlebot3_patrol/msg/turtlebot3Result.msg" NAME_WE)
add_dependencies(turtlebot3_patrol_generate_messages_py _turtlebot3_patrol_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/fregu856/skalman/laptop/catkin_ws/devel/share/turtlebot3_patrol/msg/turtlebot3ActionResult.msg" NAME_WE)
add_dependencies(turtlebot3_patrol_generate_messages_py _turtlebot3_patrol_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(turtlebot3_patrol_genpy)
add_dependencies(turtlebot3_patrol_genpy turtlebot3_patrol_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS turtlebot3_patrol_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/turtlebot3_patrol)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/turtlebot3_patrol
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(turtlebot3_patrol_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET actionlib_msgs_generate_messages_cpp)
  add_dependencies(turtlebot3_patrol_generate_messages_cpp actionlib_msgs_generate_messages_cpp)
endif()
if(TARGET geometry_msgs_generate_messages_cpp)
  add_dependencies(turtlebot3_patrol_generate_messages_cpp geometry_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/turtlebot3_patrol)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/turtlebot3_patrol
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(turtlebot3_patrol_generate_messages_eus std_msgs_generate_messages_eus)
endif()
if(TARGET actionlib_msgs_generate_messages_eus)
  add_dependencies(turtlebot3_patrol_generate_messages_eus actionlib_msgs_generate_messages_eus)
endif()
if(TARGET geometry_msgs_generate_messages_eus)
  add_dependencies(turtlebot3_patrol_generate_messages_eus geometry_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/turtlebot3_patrol)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/turtlebot3_patrol
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(turtlebot3_patrol_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()
if(TARGET actionlib_msgs_generate_messages_lisp)
  add_dependencies(turtlebot3_patrol_generate_messages_lisp actionlib_msgs_generate_messages_lisp)
endif()
if(TARGET geometry_msgs_generate_messages_lisp)
  add_dependencies(turtlebot3_patrol_generate_messages_lisp geometry_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/turtlebot3_patrol)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/turtlebot3_patrol
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(turtlebot3_patrol_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()
if(TARGET actionlib_msgs_generate_messages_nodejs)
  add_dependencies(turtlebot3_patrol_generate_messages_nodejs actionlib_msgs_generate_messages_nodejs)
endif()
if(TARGET geometry_msgs_generate_messages_nodejs)
  add_dependencies(turtlebot3_patrol_generate_messages_nodejs geometry_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/turtlebot3_patrol)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/turtlebot3_patrol\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/turtlebot3_patrol
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(turtlebot3_patrol_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET actionlib_msgs_generate_messages_py)
  add_dependencies(turtlebot3_patrol_generate_messages_py actionlib_msgs_generate_messages_py)
endif()
if(TARGET geometry_msgs_generate_messages_py)
  add_dependencies(turtlebot3_patrol_generate_messages_py geometry_msgs_generate_messages_py)
endif()
