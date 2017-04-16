#!/usr/bin/env bash

# Install Python (python 3.x)
[[ -z $(which python) ]] && sudo apt-get install python
[[ -z $(which python3) ]] && sudo apt-get install python3

# Copy latest version of MilightWifiBridge python script
wget -P MilightWifiBridge/ https://raw.githubusercontent.com/QuentinCG/Milight-Wifi-Bridge-3.0-Python-Library/master/MilightWifiBridge/MilightWifiBridge.py
