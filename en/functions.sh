#!/usr/bin/env bash

jv_pg_m3_lang()
{
  case "$1" in
    mac_address_is) echo "The mac address of the milight module is $2";;
    invalid_mac_address) echo "Unable to retrieve the mac address from the milight module...";;
    turn_on_success) zone_name=""; jv_pg_m3_zone_id_to_zone_name $2 zone_name; echo "Zone $zone_name on";;
    turn_on_failed) zone_name=""; jv_pg_m3_zone_id_to_zone_name $2 zone_name; echo "Failed to switch lights of zone $zone_name on...";;
    turn_off_success) zone_name=""; jv_pg_m3_zone_id_to_zone_name $2 zone_name; echo "Zone $zone_name off";;
    turn_off_failed) zone_name=""; jv_pg_m3_zone_id_to_zone_name $2 zone_name; echo "Failed to switch lights of zone $zone_name off...";;
    turn_on_wifi_bridge_lamp_success) echo "Module light on";;
    turn_on_wifi_bridge_lamp_failed) echo "Failed to switch module lamp on...";;
    turn_off_wifi_bridge_lamp_success) echo "Module light off";;
    turn_off_wifi_bridge_lamp_failed) echo "Failed to switch module lamp off...";;
    turn_on_night_mode_success) jv_pg_m3_zone_id_to_zone_name $2 zone_name; echo "Night mode activated for zone $zone_name";;
    turn_on_night_mode_failed) jv_pg_m3_zone_id_to_zone_name $2 zone_name; echo "Failed to activate zone night mode $zone_name";;
    turn_on_disco_mode_success) jv_pg_m3_zone_id_to_zone_name $2 zone_name; echo "Disco mode $3 activated for zone $zone_name";;
    turn_on_disco_mode_failed) jv_pg_m3_zone_id_to_zone_name $2 zone_name; echo "Failed to activate disco mode $3 for zone $zone_name";;
    speed_up_disco_mode_success) jv_pg_m3_zone_id_to_zone_name $2 zone_name; echo "Increased disco mode speed for zone $zone_name";;
    speed_up_disco_mode_failed) jv_pg_m3_zone_id_to_zone_name $2 zone_name; echo "Failed to increase the speed of the disco mode for zone $zone_name";;
    slow_down_disco_mode_success) jv_pg_m3_zone_id_to_zone_name $2 zone_name; echo "Decreased disco mode speed for zone $zone_name";;
    slow_down_disco_mode_failed) jv_pg_m3_zone_id_to_zone_name $2 zone_name; echo "Failed to decrease the speed of the disco mode for zone $zone_name";;
    set_color_success) jv_pg_m3_zone_id_to_zone_name $2 zone_name; echo "Color $3 activated for zone $zone_name";;
    set_color_failed) jv_pg_m3_zone_id_to_zone_name $2 zone_name; echo "Failed to activate color $3 for zone $zone_name";;

    *) jv_error "Error: Translation key '$1' not recognized. Please contact the designer of this plugin.";;
  esac
}
