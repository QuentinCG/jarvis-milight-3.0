#!/usr/bin/env bash

jv_pg_m3_lang()
{
  case "$1" in
    mac_address_is) echo "L'adresse mac du module milight est $2";;
    invalid_mac_address) echo "Impossible de récupérer l'adresse mac...";;
    *) jv_error "Erreur: Clef de traduction '$1' non reconnue. Merci de contacter le concepteur de ce plugin.";;
  esac
}
