#!/bin/bash
# A bash script that starts two separate conky configurations
#
# this script starts the configs meant for a single-screened system
#   this means that the trees are placed on each side of the screen opposite of
#   each other

# starts conky scripts
conky -dc ~/src/PERSONALIZE/conky-tree/wallpaper05/conky_left.conf & conky -dc ~/src/PERSONALIZE/conky-tree/wallpaper05/conky_right.conf & conky -dc ~/src/PERSONALIZE/conky-tree/wallpaper05/conky_left.conf   -x 1920 & conky -dc ~/src/PERSONALIZE/conky-tree/wallpaper05/conky_right.conf  -x 1920
