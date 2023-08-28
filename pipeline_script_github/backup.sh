#!/bin/bash

# ${ENV_NAME}
# ${ENV_HOST}
# ${ENV_PASS}
# ${ENV_USER}

cookie=$(curl -sSL -D - ${ENV_HOST}/login -o /dev/null | grep Set-Cookie | cut -d : -f 2 | sed 's/ //')

bearer=$(curl --header 'Content-Type: application/json' --header "Cookie: $cookie" -XPOST  ${ENV_HOST}/api/v1/security/login --data '{ "username": "admin", "password": "admin", "provider": "db"}' | jq -r '.access_token')

csrf_token=$(curl --header "Authorization: Bearer $bearer" --header "Cookie: $cookie" ${ENV_HOST}/api/v1/security/csrf_token/ | jq -r '.result')

echo ${cookie}
echo "================================================================================"
echo ${bearer}
echo "================================================================================"
echo ${csrf_token}

curl -X 'GET' \
    ''${ENV_HOST}'/api/v1/assets/export/' \
    -H 'accept: */*' \
    -H 'Accept-Encoding: gzip, deflate, br' \
    -H 'Content-Type: multipart/form-data' \
    -H "X-CSRFToken: $csrf_token" \
    -H "Authorization: Bearer $bearer" \
    -H "Cookie: $cookie" >${ENV_NAME}_backup_assets.zip
