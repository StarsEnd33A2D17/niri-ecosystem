#!/bin/bash

NIRI_PATH=./niri/

mv $NIRI_PATH/target/release/niri /usr/local/bin/
cp $NIRI_PATH/resources/niri-session /usr/local/bin/
cp $NIRI_PATH/resources/niri.desktop /usr/local/share/wayland-sessions/
cp $NIRI_PATH/resources/niri-portals.conf /usr/local/share/xdg-desktop-portal/
#cp $NIRI_PATH/resources/niri.service /etc/systemd/user/
cp $NIRI_PATH/resources/niri-shutdown.target /etc/systemd/user/
