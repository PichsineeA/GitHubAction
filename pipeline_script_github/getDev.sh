curl -X 'POST' \
  'https://superset.dev.kea.ifdsfs.com/api/v1/security/login' \
  -H 'accept: application/json' \
  -H 'Content-Type: application/json' \
  -d '{
  "password": "admin",
  "provider": "db",
  "refresh": true,
  "username": "admin"
}'
