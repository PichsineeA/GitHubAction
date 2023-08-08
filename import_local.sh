#!/bin/bash

cookie=$(curl -sSL -D - http://localhost:8088/login -o /dev/null | grep Set-Cookie | cut -d : -f 2 | sed 's/ //')

bearer=$(curl --header 'Content-Type: application/json' --header "Cookie: $cookie" -XPOST  http://localhost:8088/api/v1/security/login --data '{ "username": "admin", "password": "123456", "provider": "db"}' | jq -r '.access_token')

csrf_token=$(curl --header "Authorization: Bearer $bearer" --header "Cookie: $cookie" http://localhost:8088/api/v1/security/csrf_token/ | jq -r '.result')

echo ${cookie}
echo "================================================================================"
echo ${bearer}
echo "================================================================================"
echo ${csrf_token}
echo "================================================================================"
dashboard=exportDatabase.zip #dashboard_export_20230630T021218.zip

# curl -X 'POST' \
#     'http://localhost:8088/api/v1/database/import/' \
#     -H 'accept: application/json' \
#     -H 'Content-Type: multipart/form-data' \
#     -H "X-CSRFToken: $csrf_token" \
#     -H "Authorization: Bearer $bearer" \
#     -H 'Origin: http://localhost:8088' \
#     -H "Cookie: $cookie" \
#     -F "formData=@${dashboard}" \
#     -F "overwrite=true"

curl --location 'http://localhost:8088/api/v1/database/import/' \
--header 'X-CSRFToken: ImI1NDgwY2JkNTllYThkOWFmZTlhN2UwZjBkMjViMzFiYzlmODE5NDAi.ZNGizg.U8Xo91mvw76VvIv6W4U-dYYBbMo' \
--header 'Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJmcmVzaCI6dHJ1ZSwiaWF0IjoxNjkxNDYwMjg3LCJqdGkiOiI3ZDU4NDMyYy0wZGQzLTQ3NTItYmE3ZC05ZmFkZjBlZTM3ZmYiLCJ0eXBlIjoiYWNjZXNzIiwic3ViIjoxLCJuYmYiOjE2OTE0NjAyODcsImV4cCI6MTY5MTQ2MTE4N30.lnQrtN1_dotnMdWSayMftd5m-9RYQ7Yz1Nr9C7Fl4GY' \
--header 'Cookie: session=eyJfZnJlc2giOmZhbHNlLCJjc3JmX3Rva2VuIjoiYjU0ODBjYmQ1OWVhOGQ5YWZlOWE3ZTBmMGQyNWIzMWJjOWY4MTk0MCJ9.ZNGj4Q.djJo8T-9Ep1BWV5J1ZfdDBM5X0s' \
--form 'formData=@"exportDatabase.zip"' \
--form 'overwrite="true"' \
--form 'passwords="{}"'
