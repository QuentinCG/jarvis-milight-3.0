#!/usr/bin/env bash

jv_pg_m3_lang()
{
  case "$1" in
    mac_address_is) echo "L'adresse mac du module milight est $2";;
    invalid_mac_address) echo "Impossible de récupérer l'adresse mac du module milight...";;
    turn_on_success) zone_name=""; jv_pg_m3_zone_id_to_zone_name $2 zone_name; echo "Zone $zone_name allumée";;
    turn_on_failed) zone_name=""; jv_pg_m3_zone_id_to_zone_name $2 zone_name; echo "Echec de l'allumage des lumières de la zone $zone_name";;
    turn_off_success) zone_name=""; jv_pg_m3_zone_id_to_zone_name $2 zone_name; echo "Zone $zone_name éteinte";;
    turn_off_failed) zone_name=""; jv_pg_m3_zone_id_to_zone_name $2 zone_name; echo "Echec de l'extinction des lumières de la zone $zone_name";;
    turn_on_wifi_bridge_lamp_success) echo "Lampe du module allumée";;
    turn_on_wifi_bridge_lamp_failed) echo "Echec de l'allumage de la lampe du module";;
    turn_off_wifi_bridge_lamp_success) echo "Lampe du module éteinte";;
    turn_off_wifi_bridge_lamp_failed) echo "Echec de l'extinction de la lampe du module";;
    *) jv_error "Erreur: Clef de traduction '$1' non reconnue. Merci de contacter le concepteur de ce plugin.";;
  esac
}
