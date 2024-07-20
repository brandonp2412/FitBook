#!/bin/sh

client_id=$(yq -r .clientId "$HOME"/.config/msstore.yml)
client_secret=$(yq -r .clientSecret "$HOME"/.config/msstore.yml)
tenant_id=$(yq -r .tenantId "$HOME"/.config/msstore.yml)
access_token=$(curl -X POST https://login.microsoftonline.com/$tenant_id/oauth2/token \
  -H "Content-Type: application/x-www-form-urlencoded; charset=utf-8" \
  -d "grant_type=client_credentials" \
  -d "client_id=$client_id" \
  -d "client_secret=$client_secret" \
  -d "resource=https://api.partner.microsoft.com" | jq -r .access_token)
app_id=$(yq -r .msix_config.msstore_appId pubspec.yaml)

curl "https://api.partner.microsoft.com/v1.0/ingestion/products" \
  -H "Authorization: Bearer $access_token"
