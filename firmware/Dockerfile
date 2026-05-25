FROM osrf/ros:jazzy-desktop

# Install basic build tools
RUN apt-get update && apt-get install -y \
    python3-colcon-common-extensions \
    python3-pip \
    && rm -rf /var/lib/apt/lists/*

# Set up the workspace
WORKDIR /ros2_ws
RUN mkdir -p src

# Source the ROS 2 setup file automatically in every new shell
RUN echo "source /opt/ros/jazzy/setup.bash" >> ~/.bashrc

CMD ["bash"]
