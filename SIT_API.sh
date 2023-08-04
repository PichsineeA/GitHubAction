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
  'https://superset.dev.kea.ifdsfs.com/api/v1/assets/export/' \
  -H 'accept: application/zip' \
  -H 'Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJmcmVzaCI6dHJ1ZSwiaWF0IjoxNjkxMTMwNjg5LCJqdGkiOiI3M2IzMmJmYi05ZjExLTRkZGYtOWRhZS01MjQyODRhYzg2OTMiLCJ0eXBlIjoiYWNjZXNzIiwic3ViIjoxLCJuYmYiOjE2OTExMzA2ODksImV4cCI6MTY5MTEzMTU4OX0.9HdyHNvjq1Bv_F8kg8tlUemfMNVLFd26pfD1lgLFqOg'
