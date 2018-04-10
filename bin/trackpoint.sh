#!/bin/sh
echo 140 | sudo tee /sys/devices/platform/i8042/serio1/serio2/speed 
echo 200 | sudo tee /sys/devices/platform/i8042/serio1/serio2/sensitivity 
echo 5 | sudo tee /sys/devices/platform/i8042/serio1/serio2/drift_time 
echo 7 | sudo tee /sys/devices/platform/i8042/serio1/serio2/inertia 
