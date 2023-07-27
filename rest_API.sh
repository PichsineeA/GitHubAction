#!/bin/bash

# cookie=$(curl -sSL -D - http://localhost:8088/login -o /dev/null | grep Set-Cookie | cut -d : -f 2 | sed 's/ //')

# bearer=$(curl --header 'Content-Type: application/json' --header "Cookie: $cookie" -XPOST  http://localhost:8088/api/v1/security/login --data '{ "username": "admin", "password": "admin", "provider": "db"}' | jq -r '.access_token')

# csrf_token=$(curl --header "Authorization: Bearer $bearer" --header "Cookie: $cookie" http://localhost:8088/api/v1/security/csrf_token/ | jq -r '.result')

# echo ${cookie}
# echo "================================================================================"
# echo ${bearer}
# echo "================================================================================"
# echo ${csrf_token}
# echo "================================================================================"

# curl -X 'GET' \
#     'http://localhost:8088/api/v1/dashboard/export/?q=!(7%2C8%2C9)' \
#     -H 'accept: */*' \
#     -H 'Accept-Encoding: gzip, deflate, br' \
#     -H 'Content-Type: multipart/form-data' \
#     -H "X-CSRFToken: $csrf_token" \
#     -H "Authorization: Bearer $bearer" \
#     -H "Cookie: $cookie" >export.zip
curl -X 'POST' \
            'https://superset-sit.dev.kea.ifdsfs.com/api/v1/security/login' \
            --header 'Content-Type: application/json' \
            --data-raw '{
              "password": "@26ismyAge",
              "provider": "db",
              "refresh": true,
              "username": "anatda.planoi@sscinc.com"
            }'
# curl --location 'https://simple-books-api.glitch.me/status'
# curl --location 'https://simple-books-api.glitch.me/books'
# curl --location 'https://simple-books-api.glitch.me/api-clients' \
# --header 'Content-Type: application/json' \
# --data-raw '{
#    "clientName": "Postman",
#    "clientEmail": "pichs@example.com"
# }'
