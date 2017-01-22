#!/bin/bash
/usr/bin/mysqld_safe --basedir=/usr &
mysql mysql < init.sql
fg