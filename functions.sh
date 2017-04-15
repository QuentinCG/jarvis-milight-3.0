#!/usr/bin/env bash

jv_pg_m3_getMacAddress()
{
  result="$(python3 plugins/jarvis-milight-3.0/MilightWifiBridge/MilightWifiBridge.py --ip $var_jv_pg_m3_ip --port $var_jv_pg_m3_port --timeout $var_jv_pg_m3_request_timeout_in_sec --getMacAddress)"

  if [[ $result =~ ^[0-9a-fA-F]{2}:[0-9a-fA-F]{2}:[0-9a-fA-F]{2}:[0-9a-fA-F]{2}:[0-9a-fA-F]{2}:[0-9a-fA-F]{2}$ ]]; then
    say "$(jv_pg_m3_lang mac_address_is $result)"
  else
    say "$(jv_pg_m3_lang invalid_mac_address)"
  fi
}

# $1: zone
jv_pg_m3_lightOnWhite()
{
  result="$(python3 plugins/jarvis-milight-3.0/MilightWifiBridge/MilightWifiBridge.py --ip $var_jv_pg_m3_ip --port $var_jv_pg_m3_port --timeout $var_jv_pg_m3_request_timeout_in_sec --zone $1 --turnOn --setWhiteMode)"

  if [[ $result == "" ]]; then
    say "$(jv_pg_m3_lang light_on_success $1)"
  else
    say "$(jv_pg_m3_lang light_on_failed $1 $result)"
  fi
}
