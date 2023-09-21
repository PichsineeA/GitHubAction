#!/bin/bash

cookie=$(curl -sSL -D - ${ENV_HOST}/login -o /dev/null | grep Set-Cookie | cut -d : -f 2 | sed 's/ //')

bearer=$(curl --header 'Content-Type: application/json' --header "Cookie: $cookie" -XPOST  ${ENV_HOST}/api/v1/security/login --data '{ "username": "'${ENV_USER}'", "password": "'${ENV_PASS}'", "provider": "db"}' | jq -r '.access_token')

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
    -H "Cookie: $cookie" >pipeline_script_github/backup/${ENV_NAME}_get_assets.zip

# #remove old version assets
# rm -r Superset_assets

# unzip file
unzip "pipeline_script_github/backup/${ENV_NAME}_get_assets.zip"
if [[ $? == 0 ]] ; 
then
#remove old version assets
rm -r Superset_assets
#rename
find . -depth -type d -name 'assets_export*' -execdir mv {} Superset_assets \;
else
echo "Some failure."
fi ;
