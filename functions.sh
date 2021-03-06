#!/usr/bin/env bash

# $1: zone id
# $2 (return value): zone name
jv_pg_m3_zone_id_to_zone_name()
{
  case "$1" in
    0) eval "$2='$var_jv_pg_m3_all_zone_name'";;
    1) eval "$2='$var_jv_pg_m3_zone_1_name'";;
    2) eval "$2='$var_jv_pg_m3_zone_2_name'";;
    3) eval "$2='$var_jv_pg_m3_zone_3_name'";;
    4) eval "$2='$var_jv_pg_m3_zone_4_name'";;
    *) jv_error "Error: Zone ID '$1' does not exist, don't use it in command file!";;
  esac
}

jv_pg_m3_getMacAddress()
{
  # Send request to milight module
  local dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
  local result=`python3 $dir/MilightWifiBridge/MilightWifiBridge.py --ip $var_jv_pg_m3_ip --port $var_jv_pg_m3_port --timeout $var_jv_pg_m3_request_timeout_in_sec --getMacAddress`

  # Show the result to user
  if [[ $result =~ ^[0-9a-fA-F]{2}:[0-9a-fA-F]{2}:[0-9a-fA-F]{2}:[0-9a-fA-F]{2}:[0-9a-fA-F]{2}:[0-9a-fA-F]{2}$ ]]; then
    say "$(jv_pg_m3_lang mac_address_is $result)"
  else
    say "$(jv_pg_m3_lang invalid_mac_address)"
  fi
}


# $1: zone id
# $2 (bool, optional): Silent ("True" for no Jarvis response, "False" or no value for Jarvis response)
#
# return (int): 0 if success, 1 if failed
jv_pg_m3_turnOnAndWhite()
{
  # Send request to milight module
  local dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
  local result=`python3 $dir/MilightWifiBridge/MilightWifiBridge.py --ip $var_jv_pg_m3_ip --port $var_jv_pg_m3_port --timeout $var_jv_pg_m3_request_timeout_in_sec --zone $1 --turnOn --setWhiteMode`

  # Show the result to user (if requested)
  if [[ $result == "" ]]; then
    if [[ ! $2 =~ "True" ]]; then
      say "$(jv_pg_m3_lang turn_on_success $1)"
    fi
    return 0
  else
    if [[ ! $2 =~ "True" ]]; then
      say "$(jv_pg_m3_lang turn_on_failed $1)"
    fi
  fi

  return 1
}

# $1: zone id
# $2 (bool, optional): Silent ("True" for no Jarvis response, "False" or no value for Jarvis response)
#
# return (int): 0 if success, 1 if failed
jv_pg_m3_turnOff()
{
  # Send request to milight module
  local dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
  local result=`python3 $dir/MilightWifiBridge/MilightWifiBridge.py --ip $var_jv_pg_m3_ip --port $var_jv_pg_m3_port --timeout $var_jv_pg_m3_request_timeout_in_sec --zone $1 --setWhiteMode --turnOff`

  # Show the result to user (if requested)
  if [[ $result == "" ]]; then
    if [[ ! $2 =~ "True" ]]; then
      say "$(jv_pg_m3_lang turn_off_success $1)"
    fi
    return 0
  else
    if [[ ! $2 =~ "True" ]]; then
      say "$(jv_pg_m3_lang turn_off_failed $1)"
    fi
  fi

  return 1
}

# $1 (bool, optional): Silent ("True" for no Jarvis response, "False" or no value for Jarvis response)
#
# return (int): 0 if success, 1 if failed
jv_pg_m3_turnOnWifiBridgeLamp()
{
  # Send request to milight module
  local dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
  local result=`python3 $dir/MilightWifiBridge/MilightWifiBridge.py --ip $var_jv_pg_m3_ip --port $var_jv_pg_m3_port --timeout $var_jv_pg_m3_request_timeout_in_sec --turnOnWifiBridgeLamp`

  # Show the result to user (if requested)
  if [[ $result == "" ]]; then
    if [[ ! $1 =~ "True" ]]; then
      say "$(jv_pg_m3_lang turn_on_wifi_bridge_lamp_success)"
    fi
    return 0
  else
    if [[ ! $1 =~ "True" ]]; then
      say "$(jv_pg_m3_lang turn_on_wifi_bridge_lamp_failed)"
    fi
  fi

  return 1
}

# $1 (bool, optional): Silent ("True" for no Jarvis response, "False" or no value for Jarvis response)
#
# return (int): 0 if success, 1 if failed
jv_pg_m3_turnOffWifiBridgeLamp()
{
  # Send request to milight module
  local dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
  local result=`python3 $dir/MilightWifiBridge/MilightWifiBridge.py --ip $var_jv_pg_m3_ip --port $var_jv_pg_m3_port --timeout $var_jv_pg_m3_request_timeout_in_sec --turnOffWifiBridgeLamp`

  # Show the result to user (if requested)
  if [[ $result == "" ]]; then
    if [[ ! $1 =~ "True" ]]; then
      say "$(jv_pg_m3_lang turn_off_wifi_bridge_lamp_success)"
    fi
    return 0
  else
    if [[ ! $1 =~ "True" ]]; then
      say "$(jv_pg_m3_lang turn_off_wifi_bridge_lamp_failed)"
    fi
  fi

  return 1
}

# $1: zone id
# $2 (bool, optional): Silent ("True" for no Jarvis response, "False" or no value for Jarvis response)
#
# return (int): 0 if success, 1 if failed
jv_pg_m3_turnOnAndNight()
{
  # Send request to milight module
  local dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
  local result=`python3 $dir/MilightWifiBridge/MilightWifiBridge.py --ip $var_jv_pg_m3_ip --port $var_jv_pg_m3_port --timeout $var_jv_pg_m3_request_timeout_in_sec --zone $1 --turnOn --setNightMode`

  # Show the result to user (if requested)
  if [[ $result == "" ]]; then
    if [[ ! $2 =~ "True" ]]; then
      say "$(jv_pg_m3_lang turn_on_night_mode_success $1)"
    fi
    return 0
  else
    if [[ ! $2 =~ "True" ]]; then
      say "$(jv_pg_m3_lang turn_on_night_mode_failed $1)"
    fi
  fi

  return 1
}

# $1: zone id
# $2: disco mode (1 to 9)
# $3 (bool, optional): Silent ("True" for no Jarvis response, "False" or no value for Jarvis response)
#
# return (int): 0 if success, 1 if failed
jv_pg_m3_turnOnAndDiscoMode()
{
  # Send request to milight module
  local dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
  local result=`python3 $dir/MilightWifiBridge/MilightWifiBridge.py --ip $var_jv_pg_m3_ip --port $var_jv_pg_m3_port --timeout $var_jv_pg_m3_request_timeout_in_sec --zone $1 --turnOn --setDiscoMode $2`

  # Show the result to user (if requested)
  if [[ $result == "" ]]; then
    if [[ ! $3 =~ "True" ]]; then
      say "$(jv_pg_m3_lang turn_on_disco_mode_success $1 $2)"
    fi
    return 0
  else
    if [[ ! $3 =~ "True" ]]; then
      say "$(jv_pg_m3_lang turn_on_disco_mode_failed $1 $2)"
    fi
  fi

  return 1
}

# $1: zone id
# $2 (bool, optional): Silent ("True" for no Jarvis response, "False" or no value for Jarvis response)
#
# return (int): 0 if success, 1 if failed
jv_pg_m3_speedUpDiscoMode()
{
  # Send request to milight module
  local dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
  local result=`python3 $dir/MilightWifiBridge/MilightWifiBridge.py --ip $var_jv_pg_m3_ip --port $var_jv_pg_m3_port --timeout $var_jv_pg_m3_request_timeout_in_sec --zone $1 --speedUpDiscoMode --speedUpDiscoMode --speedUpDiscoMode`

  # Show the result to user (if requested)
  if [[ $result == "" ]]; then
    if [[ ! $2 =~ "True" ]]; then
      say "$(jv_pg_m3_lang speed_up_disco_mode_success $1)"
    fi
    return 0
  else
    if [[ ! $2 =~ "True" ]]; then
      say "$(jv_pg_m3_lang speed_up_disco_mode_failed $1)"
    fi
  fi

  return 1
}

# $1: zone id
# $2 (bool, optional): Silent ("True" for no Jarvis response, "False" or no value for Jarvis response)
#
# return (int): 0 if success, 1 if failed
jv_pg_m3_slowDownDiscoMode()
{
  # Send request to milight module
  local dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
  local result=`python3 $dir/MilightWifiBridge/MilightWifiBridge.py --ip $var_jv_pg_m3_ip --port $var_jv_pg_m3_port --timeout $var_jv_pg_m3_request_timeout_in_sec --zone $1 --slowDownDiscoMode --slowDownDiscoMode --slowDownDiscoMode`

  # Show the result to user (if requested)
  if [[ $result == "" ]]; then
    if [[ ! $2 =~ "True" ]]; then
      say "$(jv_pg_m3_lang slow_down_disco_mode_success $1)"
    fi
    return 0
  else
    if [[ ! $2 =~ "True" ]]; then
      say "$(jv_pg_m3_lang slow_down_disco_mode_failed $1)"
    fi
  fi

  return 1
}

# $1: zone id
# $2: color value (0 to 255)
# $3: color name (no space)
# $4 (bool, optional): Silent ("True" for no Jarvis response, "False" or no value for Jarvis response)
#
# return (int): 0 if success, 1 if failed
jv_pg_m3_turnOnAndColorMode()
{
  # Send request to milight module
  local dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
  local result=`python3 $dir/MilightWifiBridge/MilightWifiBridge.py --ip $var_jv_pg_m3_ip --port $var_jv_pg_m3_port --timeout $var_jv_pg_m3_request_timeout_in_sec --zone $1 --turnOn --setColor $2`

  # Show the result to user (if requested)
  if [[ $result == "" ]]; then
    if [[ ! $4 =~ "True" ]]; then
      say "$(jv_pg_m3_lang set_color_success $1 $3)"
    fi
    return 0
  else
    if [[ ! $4 =~ "True" ]]; then
      say "$(jv_pg_m3_lang set_color_failed $1 $3)"
    fi
  fi

  return 1
}
