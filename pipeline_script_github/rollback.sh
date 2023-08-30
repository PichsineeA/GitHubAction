#!/bin/bash
pwd
cd pipeline_script_github/backup
pwd
ls
# cookie=$(curl -sSL -D - http://localhost:8088/login -o /dev/null | grep Set-Cookie | cut -d : -f 2 | sed 's/ //')

# bearer=$(curl --header 'Content-Type: application/json' --header "Cookie: $cookie" -XPOST  http://localhost:8088/api/v1/security/login --data '{ "username": "admin", "password": "admin", "provider": "db"}' | jq -r '.access_token')

# csrf_token=$(curl --header "Authorization: Bearer $bearer" --header "Cookie: $cookie" http://localhost:8088/api/v1/security/csrf_token/ | jq -r '.result')

# echo ${cookie}
# echo "================================================================================"
# echo ${bearer}
# echo "================================================================================"
# echo ${csrf_token}
# echo "================================================================================"
# dashboard=assets_export_20230829T045823.zip

# curl -X 'POST' \
#     'http://localhost:8088/api/v1/assets/import/' \
#     -H 'accept: application/json' \
#     -H 'Content-Type: multipart/form-data' \
#     -H "X-CSRFToken: $csrf_token" \
#     -H "Authorization: Bearer $bearer" \
#     -H 'Origin: http://localhost:8088' \
#     -H "Cookie: $cookie" \
#     -F "bundle=@${dashboard}" \
#     -F "overwrite=true"
