# Rugged ATV Data Acquisition System (RADAS)

### **Collaborators:** 

 - [Aalto University](https://www.aalto.fi/en): Joel Ventola, Otto Peltonen

# Overview

The Rugged ATV Data Acquisition System, or RADAS, is a versatile, rugged sensor rack for ATVs.  

### **Sensors**
 - 32-channel 360° LIDAR: [Hesai XT32M2X](https://www.hesaitech.com/product/xt16-32-32m/)
 - 128-channel dome LIDAR: [Hesai JT128](https://www.hesaitech.com/product/jt128/)
 - 3 x RGB-cameras
 - NIR-camera
 - IMU
 - RTK-GPS

# Guide
Contains a lot of information on many tools used during development. Does not reflect the final deployed system. 
#### **Pylonviewer quickstart**

 1. Run pylonviewer from root:

 `sudo /opt/pylon/bin/pylonviewer`

 2. Run pylonviewer GigE configurator:

 `tools -> GigE configurator`

 Choose 
 `Optimize complete system`
 and then run `Configure`


 3. Reboot the system and relaunch pylonviewer to save the configuration settings. You're now able to see your attached cameras

 4. If this does not work, try using "Add remote GigE camera" and entering the camera's IP-address. Although, this speaks of a different underlying issue. 
