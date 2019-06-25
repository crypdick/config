# config

# Install packages

`zsh i3 i3-wm i3lock i3blocks conky nitrogen compton guake docker lightdm git vlc scrot ranger pcmanfm nautilus clementine gnome-system-monitor slack gsimplecal fonts-font-awesome mousepad  unattended-upgrades`

# i3-gaps

https://github.com/pasiegel/i3-gaps-install-ubuntu


# Disable nautilus Desktop opening:

`gsettings set org.gnome.desktop.background show-desktop-icons false`

## OMZsh, powerline fonts

https://github.com/eyenx/omzsh

https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md

https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md

https://github.com/powerline/fonts

## if fontawesome is not working

wget "https://use.fontawesome.com/releases/v5.0.13/fontawesome-free-5.0.13.zip"

unzip fontawesome-free-5.0.13.zip

sudo cp fontawesome-free-5.0.13/use-on-desktop/* /usr/local/share/fonts/


fc-cache -f -v

#the next command help see the name to use-on-desktop

#here Font Awesome 5 Free

fc-list | grep -i "awe"

# Import dotfiles

Use this guide to migrate:

https://www.atlassian.com/git/tutorials/dotfiles

## SpaceVim

install vim-gtk

https://github.com/SpaceVim/SpaceVim

edit `~/.SpaceVim.d/init.toml`, change theme to desert


# vim

set vimwiki to autocommit: https://dmoerner.wordpress.com/2017/08/14/vimwiki-and-git-autocommit/


## guake

toggle to mod+Enter and autostart. Change to Desert theme. Disable popup notification, hide tray icon.

Ctrl-C to copy, Ctrl-V to paste, Ctrl-T new tab, Ctrl+Shift+T close tab, switch tabs Alt-left or right, move tabs with Ctrl+Alt_left or right. Rename Ctrl-R.

Change to Powerline font.

## firefox

Log in. Should auto-install Vimium.

## i3-gaps

Make sure to install dependencies first
https://github.com/Airblader/i3/wiki/Compiling-&-Installing

## albert

https://software.opensuse.org/download.html?project=home:manuelschneid3r&package=albert

Enable Apps, calculator plugin

## Anaconda

https://www.anaconda.com/download/#linux

## Pycharm

https://www.jetbrains.com/pycharm/download/#section=linux


Theme: Dracula. +fontsize. Change default to Anaconda.


## voice2code


### docker

https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-16-04

### pyaudio 
https://gist.github.com/diegopacheco/d5d4507988eff995da297344751b095e


### silvius-crypdick

xdotool

https://github.com/crypdick/silvius-crypdick

## mpw

https://gitlab.com/MasterPassword/MasterPassword

## nitrogen

open it, set a wp

## CUDA, tf

https://medium.com/@zhanwenchen/install-cuda-and-cudnn-for-tensorflow-gpu-on-ubuntu-79306e4ac04e

pip install tensorflow-gpu

## break reminders

https://github.com/hovancik/stretchly/

## music

`youtube-dl  --extract-audio  --audio-format  best --embed-thumbnail --external-downloader aria2c --external-downloader-args '--max-connection-per-server=15' --yes-playlist  "https://www.youtube.com/watch?v=lNmrCMCvbFg&list=PLhb-iq93UfDnE3wY1769ahvlNmXr2zMp0"`

https://github.com/rg3/youtube-dl/issues/350#issuecomment-244847884
aria2c --max-concurrent-downloads=10 --max-connection-per-server=20 `youtube-dl -g https://www.youtube.com/playlist?list=PLsPUh22kYmNBkabv9M4fXo6HMLKnc7iR6`

## unattended upgrades

`dpkg-reconfigure --priority=low unattended-upgrades`

edit `/var/run/reboot-required`
