#!/bin/sh

set -e
source /app/app.env
/app/migrate -path /app/migration -database "$DB_SOURCE" -verbose up

echo "run db migration"
exec "$@"