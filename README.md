# Rugged ATV Data Acquisition System (RADAS)

### **Collaborators:** 

 - [Aalto University](https://www.aalto.fi/en): Joel Ventola, Otto Peltonen

# Overview

The Rugged ATV Data Acquisition System, or RADAS, is a versatile, rugged sensor rack for ATVs.  

### **Sensors**
 - 32-channel 360° LIDAR: [Hesai XT32M2X](https://www.hesaitech.com/product/xt16-32-32m/)
 - 128-channel dome LIDAR: [Hesai JT128](https://www.hesaitech.com/product/jt128/)
 - 3 x RGB-cameras: [Basler a2A1920-51gcBAS](https://www.baslerweb.com/en/shop/a2a1920-51gcbas/)
 - NIR-camera: [Basler ace acA1300-60gmNIR](https://www.baslerweb.com/en/shop/aca1300-60gmnir/)
 - IMU: [VectorNav VN-100](https://www.vectornav.com/store/products/imu-ahrs/p/vn-100-rugged-imuahrs)
 - RTK-GPS: [Ardusimple simpleRTK 4 Heading](https://www.ardusimple.com/product/simplertk-4-heading/)

# Guide
Contains a lot of information on many tools used during development. Does not reflect the final deployed system.

### **Prerequisites**

- From [Ubuntu 24.04 Noble Numbat](https://releases.ubuntu.com/noble/)
- From [Docker version 29.5.2, build 79eb04c](https://github.com/docker/docker-install)

### **Pylonviewer quickstart outside of docker**

 1. Run pylonviewer from root:

 ```shell
 sudo /opt/pylon/bin/pylonviewer
 ```

 2. Run pylonviewer GigE configurator:

 `tools -> GigE configurator`

 Choose 
 `Optimize complete system`
 and then run `Configure`
 
> **Note:** if pylonviewer doesn't find the camera automatically you can use `f12` or `camera -> Add Remote GigE Camera` to add your camera manually.

 3. Reboot the system and relaunch pylonviewer to save the configuration settings. You're now able to see your attached cameras

### **Docker**

 1. Switch to firmware subfolder:

 ```shell
 cd ./firmware/
 ```

 2. Build the docker container:

 ```shell
 docker compose up --build -d
 ```

 3. Connect with a shell:

 ```shell
 docker compose exec ros2_dev /bin/bash
 ```

 4. If you want to use GUI apps inside the docker container run this before step 3.

 ```shell
 xhost +local:docker
 ```
