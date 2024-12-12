#!/bin/sh

SN_TROLLEY="7MT017CE176L"
SN_EXTRA="7MT0183S0MGU"

VCP_INPUT="0x60"

INPUT_DP="0x0f"
INPUT_MDP="0x10"
INPUT_HDMI1="0x11"
INPUT_HDMI2="0x12"

ddcutil --sn=${SN_TROLLEY} setvcp ${VCP_INPUT} ${INPUT_MDP}
ddcutil --sn=${SN_EXTRA} setvcp ${VCP_INPUT} ${INPUT_HDMI2}

xrandr --output DP-1-0 --auto --right-of eDP-1
xrandr --output HDMI-1-0 --auto --right-of DP-1-0
