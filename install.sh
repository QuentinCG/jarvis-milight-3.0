#!/usr/bin/env bash

# Install Python (python 2.7 and 3.x)
[[ -z $(which python) ]] && sudo apt-get install python
[[ -z $(which python2.7) ]] && sudo apt-get install python2.7
[[ -z $(which python3) ]] && sudo apt-get install python3

# Copy latest version of MilightWifiBridge python script
wget -P plugins/jarvis-milight-3.0/MilightWifiBridge/MilightWifiBridge.py https://raw.githubusercontent.com/QuentinCG/Milight-Wifi-Bridge-3.0-Python-Library/master/MilightWifiBridge/MilightWifiBridge.py
