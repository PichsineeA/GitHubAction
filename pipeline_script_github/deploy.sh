#!/bin/bash

cookie=$(curl -sSL -D - ${ENV_HOST}/login -o /dev/null | grep Set-Cookie | cut -d : -f 2 | sed 's/ //')

bearer=$(curl --header 'Content-Type: application/json' --header "Cookie: $cookie" -XPOST  ${ENV_HOST}/api/v1/security/login --data '{ "username": "${ENV_USER}", "password": "${ENV_PASS}", "provider": "db"}' | jq -r '.access_token')

csrf_token=$(curl --header "Authorization: Bearer $bearer" --header "Cookie: $cookie" ${ENV_HOST}/api/v1/security/csrf_token/ | jq -r '.result')

echo ${cookie}
echo "================================================================================"
echo ${bearer}
echo "================================================================================"
echo ${csrf_token}

dashboard=exportDatabaseDeleteDS.zip #dashboard_export_20230630T021218.zip

curl -X 'POST' \
    '${ENV_HOST}/api/v1/database/import/' \
    -H 'accept: application/json' \
    -H 'Content-Type: multipart/form-data' \
    -H "X-CSRFToken: $csrf_token" \
    -H "Authorization: Bearer $bearer" \
    -H 'Origin: http://localhost:8088' \
    -H "Cookie: $cookie" \
    -F "formData=@${dashboard}" \
    -F "overwrite=true" \
    -F "passwords="{}""
