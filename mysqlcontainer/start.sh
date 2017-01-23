#!/bin/bash

# Start maria
/usr/bin/mysqld_safe --basedir=/usr &

# Wait until DB is up
until mysqladmin ping >/dev/null 2>&1; do
  echo -n "."; sleep 0.2
done

# Init DB and first user
mysql mysql < init.sql

# put db in forground to hang process
fg