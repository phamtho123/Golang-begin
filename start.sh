#!/bin/sh

set -e

/app/migrate -path /app/migration -database "$DB_SOURCE" -verbose up

echo "run db migration"
exec "$@"