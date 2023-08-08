#!/bin/bash

cookie=$(curl -sSL -D - https://superset-sit.dev.kea.ifdsfs.com/login -o /dev/null | grep Set-Cookie | cut -d : -f 2 | sed 's/ //')

bearer=$(curl --header 'Content-Type: application/json' --header "Cookie: $cookie" -XPOST  https://superset-sit.dev.kea.ifdsfs.com/api/v1/security/login --data '{ "username": "admin", "password": "admin", "provider": "db"}' | jq -r '.access_token')

csrf_token=$(curl --header "Authorization: Bearer $bearer" --header "Cookie: $cookie" https://superset-sit.dev.kea.ifdsfs.com/api/v1/security/csrf_token/ | jq -r '.result')

echo ${cookie}
echo "================================================================================"
echo ${bearer}
echo "================================================================================"
echo ${csrf_token}
echo "================================================================================"
# curl -X 'GET' \
#   'https://superset.dev.kea.ifdsfs.com/api/v1/assets/export/' \
#   -H 'accept: application/zip' \
#   -H 'Authorization: Bearer $bearer'
curl -X 'GET' \
    'https://superset-sit.dev.kea.ifdsfs.com/api/v1/chart/export/?q=!(179)' \
    -H 'accept: */*' \
    -H 'Accept-Encoding: gzip, deflate, br' \
    -H 'Content-Type: multipart/form-data' \
    -H "X-CSRFToken: $csrf_token" \
    -H "Authorization: Bearer $bearer" \
    -H "Cookie: $cookie" >Chart_SIT.zip
#unzip
#unzip export.zip

# bearer=$(curl --location 'https://superset.dev.kea.ifdsfs.com/api/v1/security/login' \
# --header 'Content-Type: application/json' \
# --data '{
#   "password": "admin",
#   "provider": "db",
#   "username": "admin"
# }')
# curl -X 'GET' \
#   'https://superset.dev.kea.ifdsfs.com/api/v1/security/csrf_token/' \
#   -H 'accept: application/json' \
#   -H 'Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJmcmVzaCI6dHJ1ZSwiaWF0IjoxNjkxMTMxNTYxLCJqdGkiOiJhZGRhYzc3ZS02ZmM4LTRmYWItOGZlYy0zZTdkNTE1MjllZDUiLCJ0eXBlIjoiYWNjZXNzIiwic3ViIjoxLCJuYmYiOjE2OTExMzE1NjEsImV4cCI6MTY5MTEzMjQ2MX0.Du3krIqrHOQvPZ1MKKpXZaTMKYDPsMuE5LFwutsOxDM'
