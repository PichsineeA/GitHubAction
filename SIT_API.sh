#!/bin/bash

# cookie=$(curl -sSL -D - https://superset-sit.dev.kea.ifdsfs.com/login -o /dev/null | grep Set-Cookie | cut -d : -f 2 | sed 's/ //')

# bearer=$(curl --header 'Content-Type: application/json' --header "Cookie: $cookie" -XPOST  https://superset.dev.kea.ifdsfs.com/api/v1/security/login --data '{ "username": "admin", "password": "admin", "provider": "db"}' | jq -r '.access_token')

# csrf_token=$(curl --header "Authorization: Bearer $bearer" --header "Cookie: $cookie" https://superset.dev.kea.ifdsfs.com/api/v1/security/csrf_token/ | jq -r '.result')

# echo ${cookie}
# echo "================================================================================"
# echo ${bearer}
# echo "================================================================================"
# echo ${csrf_token}
# echo "================================================================================"
# curl -X 'GET' \
#   'https://superset.dev.kea.ifdsfs.com/api/v1/assets/export/' \
#   -H 'accept: application/zip' \
#   -H 'Authorization: Bearer $bearer'
# curl -X 'GET' \
#     'https://superset.dev.kea.ifdsfs.com/api/v1/assets/export/' \
#     -H 'accept: */*' \
#     -H 'Accept-Encoding: gzip, deflate, br' \
#     -H 'Content-Type: multipart/form-data' \
#     -H "X-CSRFToken: $csrf_token" \
#     -H "Authorization: Bearer $bearer" \
#     -H "Cookie: $cookie" >assets.zip
#unzip
#unzip export.zip

# bearer=$(curl --location 'https://superset.dev.kea.ifdsfs.com/api/v1/security/login' \
# --header 'Content-Type: application/json' \
# --data '{
#   "password": "admin",
#   "provider": "db",
#   "username": "admin"
# }')
curl -X 'GET' \
  'https://superset.dev.kea.ifdsfs.com/api/v1/security/csrf_token/' \
  -H 'accept: application/json' \
  -H 'Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJmcmVzaCI6dHJ1ZSwiaWF0IjoxNjkxMTI5NzIxLCJqdGkiOiIwM2M5ODhhNC1kMzc0LTQ4NzYtODhlYy00OTgwZGEwOTk3ZjYiLCJ0eXBlIjoiYWNjZXNzIiwic3ViIjoxLCJuYmYiOjE2OTExMjk3MjEsImV4cCI6MTY5MTEzMDYyMX0.Mkl_sv8bkPkshvuAS2CuVhWjhnGu945fGtn9I-rrdGg'
