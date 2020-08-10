#!/bin/sh

# Ce fichier vous permet de modifier l'URL du service backend au démarrage du container en spécifiant les variable suirvantes:
# * BACK_HOSTNAME: ip ou hostname 
# * BACK_PORT: Port sur lequel est exposé le container

set -euo pipefail

: ${BACK_HOSTNAME:=localhost}
: ${BACK_PORT:=9966}

sed -i 's@BACKEND_HOSTNAME@'"$BACK_HOSTNAME"'@' /usr/share/nginx/html/petclinic/*.*
sed -i 's@BACKEND_PORT@'"$BACK_PORT"'@' /usr/share/nginx/html/petclinic/*.*

echo "Starting Nginx ..."
exec "$@"

