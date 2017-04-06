#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
    ALTER SCHEMA public OWNER TO cmsuser
    GRANT SELECT ON pg_largeobject TO cmsuser
EOSQL
