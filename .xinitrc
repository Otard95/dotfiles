#!/bin/bash

# Execs
# Start complimentary servises like picom and nitrogen
# for window opasity and backgrounds respectivly
# TODO: Move to own file when debian package gets updated to 4.20
picom -b
nitrogen --restore &
