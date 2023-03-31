#!/bin/bash

# collate ENV's; anything starting with MINIO_<NAME>_[URL|ACCESS_KEY|SECRET_KEY]
for site in $(env | grep "^MINIO_" | grep URL | awk '{split($0,a,"_"); print a[2];}' | sort | uniq); do
  this_url_var="MINIO_"$site"_URL"
  this_access_id_var="MINIO_"$site"_ACCESS_KEY"
  this_secret_id_var="MINIO_"$site"_SECRET_KEY"
  mc alias set $site "${!this_url_var}" "${!this_access_id_var}" "${!this_secret_id_var}"
done

mc mirror --no-color --json --watch --monitoring-address ${MINIO_PROMETHEUS_LISTENER:-localhost:8081} ${MINIO_OPTIONS} SOURCE/${MINIO_SOURCE_BUCKET} TARGET/${MINIO_TARGET_BUCKET} 
