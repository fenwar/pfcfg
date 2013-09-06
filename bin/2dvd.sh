#!/bin/bash
# Encode for DVD

mencoder $1 -o $1.out.mpg -of mpeg -mpegopts format=dvd:tsaf \
-oac copy \
-ovc lavc -lavcopts vcodec=mpeg2video:vrc_buf_size=1835:vrc_maxrate=8000:\
vbitrate=6000:keyint=15:vstrict=0:aspect=16/9

