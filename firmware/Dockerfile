FROM osrf/ros:jazzy-desktop

# Install build tools and dependencies
RUN apt-get update && apt-get install -y \
    python3-colcon-common-extensions \
    python3-pip \
    python3-rosdep \
    python3-venv \
    python3-git \
    git \
    wget \
    libasio-dev \
    build-essential \
    cmake \
    libusb-1.0-0-dev \
    libudev-dev \
    ros-jazzy-diagnostic-updater \
    ros-jazzy-pcl-ros \
    ros-jazzy-nmea-msgs \
    ros-jazzy-rtcm-msgs \
    ros-jazzy-camera-info-manager \
    && rm -rf /var/lib/apt/lists/*

# Install Pylon SDK
RUN wget -q "https://downloads-bsl.baslerweb.com/software/pylon%2026.04/pylon-26.04.1_linux-x86_64_debs.tar.gz" -O /tmp/pylon.tar.gz && \
    mkdir -p /tmp/pylon && \
    tar -xzf /tmp/pylon.tar.gz -C /tmp/pylon && \
    apt-get update && \
    dpkg -i /tmp/pylon/*.deb || apt-get install -f -y && \
    rm -rf /tmp/pylon /tmp/pylon.tar.gz && \
    rm -rf /var/lib/apt/lists/*

# Set up the workspace
WORKDIR /ros2_ws
RUN mkdir -p src

# 1. Clone Hesai, Pylon, and Ublox
RUN git clone --recursive https://github.com/HesaiTechnology/HesaiLidar_ROS_2.0.git src/hesai_ros_driver && \
    git clone https://github.com/basler/pylon-ros-camera.git src/pylon-ros2-camera && \
    git clone -b ros2 https://github.com/KumarRobotics/ublox.git src/ublox_ros2 && \
    git clone https://github.com/dawonn/vectornav.git -b ros2

# 2. Install dependencies using rosdep
RUN apt-get update && \
    rosdep update && \
    rosdep install --from-paths src --ignore-src -r -y && \
    rm -rf /var/lib/apt/lists/*

# 3. Build the workspace
RUN . /opt/ros/jazzy/setup.sh && \
    colcon build --symlink-install --event-handlers console_direct+

# Source the ROS 2 setup and the workspace in every new shell
RUN echo "source /opt/ros/jazzy/setup.bash" >> ~/.bashrc && \
    echo "source /ros2_ws/install/setup.bash" >> ~/.bashrc

CMD ["bash"]
