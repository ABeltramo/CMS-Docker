#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
    CREATE USER cmsuser WITH SUPERUSER PASSWORD 'your_password_here';
    CREATE DATABASE cmsdb;
    GRANT ALL PRIVILEGES ON DATABASE cmsdb TO cmsuser;
    ALTER SCHEMA public OWNER TO cmsuser
    GRANT SELECT ON pg_largeobject TO cmsuser
EOSQL
