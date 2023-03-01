#!/usr/bin/env bash

set -eou pipefail

service postgresql start >/dev/null

su - postgres -c "psql <<OMG
 CREATE USER myuser WITH PASSWORD 'mypassword';
 CREATE DATABASE mydb OWNER myuser;
OMG" >/dev/null

export DATABASE_URL='postgres://myuser:mypassword@localhost:5432/mydb'
diesel migration run >/dev/null
diesel print-schema
