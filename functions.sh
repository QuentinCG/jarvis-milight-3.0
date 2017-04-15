#!/usr/bin/env bash

# $1: zone id
# return: zone name
jv_pg_m3_zone_id_to_zone_name()
{
  case "$1" in
    0) return $var_jv_pg_m3_all_zone_name;;
    1) return $var_jv_pg_m3_zone_1_name;;
    2) return $var_jv_pg_m3_zone_2_name;;
    3) return $var_jv_pg_m3_zone_3_name;;
    4) return $var_jv_pg_m3_zone_4_name;;
    *) jv_error "Error: Zone ID '$1' does not exist, don't use it in command file!";;
  esac
}

jv_pg_m3_getMacAddress()
{
  result="$(python3 plugins/jarvis-milight-3.0/MilightWifiBridge/MilightWifiBridge.py --ip $var_jv_pg_m3_ip --port $var_jv_pg_m3_port --timeout $var_jv_pg_m3_request_timeout_in_sec --getMacAddress)"

  if [[ $result =~ ^[0-9a-fA-F]{2}:[0-9a-fA-F]{2}:[0-9a-fA-F]{2}:[0-9a-fA-F]{2}:[0-9a-fA-F]{2}:[0-9a-fA-F]{2}$ ]]; then
    say "$(jv_pg_m3_lang mac_address_is $result)"
  else
    say "$(jv_pg_m3_lang invalid_mac_address)"
  fi
}

# $1: zone id
jv_pg_m3_lightOnWhite()
{
  result="$(python3 plugins/jarvis-milight-3.0/MilightWifiBridge/MilightWifiBridge.py --ip $var_jv_pg_m3_ip --port $var_jv_pg_m3_port --timeout $var_jv_pg_m3_request_timeout_in_sec --zone $1 --turnOn --setWhiteMode)"

  if [[ $result == "" ]]; then
    say "$(jv_pg_m3_lang light_on_success $(jv_pg_m3_zone_id_to_zone_name $1))"
  else
    say "$(jv_pg_m3_lang light_on_failed $(jv_pg_m3_zone_id_to_zone_name $1) $result)"
  fi
}
