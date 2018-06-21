These are configuration files for conky.

---DESCRIPTION OF FILES---
Each *.conf file is a configuration file. 
There are two main subsets of files,
the configuration files for a dualscreen system, and the configuration files
for a singlescreen system. The configuration files for dualscreen systems end
in *_dualscreen.conf, and the configuration files for singlescreen systems end
do not end in *_dualscreen.conf.
Both the trees for singlescren and dualscreen have two configuration files,
one for the left tree, and one for the right tree; indicated by the _left
or the _right.

---HOW TO START CONKY---
In order to start conky, execute the shell script appropriate for your system.
Singlescreened users should use "conky.sh" and dualscreened users should use
"conky_dualscreen.sh"

---NOTE ABOUT MONITOR RESOLUTION---
This configuration is meant for a 1920x1080 monitor. Singlescreened users with
different resolutions shouldn't experience issues, but if you use a dualscreen
configurations with monitors of resolutions other than 1920x1080 you may need
to adjust the spacings in the conf files via the gap_x and gap_y variables. 

---NOTE ABOUT NETWORKS---
A note about networks: I only tested this with two computers. If you have
trouble with the vpn, ethernet, or wireless SSID rows, replace occurances of
tun0, enp5s0, and wlp58s0 with the proper connection codes found with `ip addr`
of vpn connections, ethernet, and wifi (respectively).

---DEPENDANCIES---
curl
lm-sensors
wget

---CONFIGURATION GUIDE---
color0 is the color of the text
color1 is the color of the brackets 
color2 is the color of the "tree branches"
