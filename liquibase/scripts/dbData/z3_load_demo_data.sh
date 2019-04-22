#!/bin/bash

gunzip ${LIQUIBASE_HOME}/wqp_core_all.tar.gz

pg_restore --dbname=postgresql://postgres:${POSTGRES_PASSWORD}@${WQP_DATABASE_ADDRESS}:5432/${WQP_DATABASE_NAME} -v -c --if-exists -F t ${LIQUIBASE_HOME}/wqp_core_all.tar

psql -v ON_ERROR_STOP=1 --dbname=postgresql://postgres:${POSTGRES_PASSWORD}@${WQP_DATABASE_ADDRESS}:5432/${WQP_DATABASE_NAME} -c "vacuum full;"