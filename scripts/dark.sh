#!/bin/bash

gsettings set org.gnome.desktop.interface gtk-theme Materia-dark-compact
gsettings set org.gnome.desktop.interface cursor-theme Bibata-Modern-Ice
gsettings set org.gnome.desktop.interface color-scheme prefer-dark
hyprctl setcursor Bibata-Modern-Ice 20
