#!/usr/bin/env bash

jv_pg_m3_lang()
{
  case "$1" in
    mac_address_is) echo "L'adresse mac du module milight est $2";;
    invalid_mac_address) echo "Impossible de récupérer l'adresse mac du module milight...";;
    light_on_success) zone_name=""; jv_pg_m3_zone_id_to_zone_name $2 zone_name; echo "$zone_name allumée";;
    light_on_failed) zone_name=""; jv_pg_m3_zone_id_to_zone_name $2 zone_name; echo "Echec de l'allumage des lumières de la zone $zone_name";;
    *) jv_error "Erreur: Clef de traduction '$1' non reconnue. Merci de contacter le concepteur de ce plugin.";;
  esac
}
