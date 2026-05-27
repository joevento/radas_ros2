#!/bin/bash
set -e

source /opt/ros/jazzy/setup.bash
source /underlay_ws/install/setup.bash

cd /ros2_ws
rosdep install --from-paths src --ignore-src -r -y
colcon build --symlink-install

source /ros2_ws/install/setup.bash

exec "$@"