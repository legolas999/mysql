#!/bin/bash
HOSTNAME='192.168.154.137'
PORT='3306'
USERNAME='lisi'
PASSWORD='Com.123456'

DBNAME='test_db'
TABLENAME='tb1'

#create database
create_db_sql="create database if not exists ${DBNAME}"
mysql -h${HOSTNAME} -P${PORT} -u${USERNAME} -p${PASSWORD} -e "${create_db_sql}"

#create table
create_table_sql="create table if not exists ${TABLENAME} (name varchar(20),id int default 0)"
mysql -h${HOSTNAME} -P${PORT} -u${USERNAME} -p${PASSWORD} ${DBNAME} -e "${create_table_sql}"

#insert data to table
insert_sql="insert into ${TABLENAME} values ('tom',1)"
mysql -h${HOSTNAME} -P${PORT} -u${USERNAME} -p${PASSWORD}  ${DBNAME} -e "${insert_sql}"

#select data
select_sql="select * from ${TABLENAME}"
mysql -h${HOSTNAME} -P${PORT} -u${USERNAME} -p${PASSWORD}  ${DBNAME} -e "${select_sql}"

#update data
update_sql="update ${TABLENAME} set id=3"
mysql -h${HOSTNAME} -P${PORT} -u${USERNAME} -p${PASSWORD}  ${DBNAME} -e "${update_sql}"
mysql -h${HOSTNAME} -P${PORT} -u${USERNAME} -p${PASSWORD}  ${DBNAME} -e "${select_sql}"

#delete data
delete_sql="delete from ${TABLENAME}"
mysql -h${HOSTNAME} -P${PORT} -u${USERNAME} -p${PASSWORD}  ${DBNAME} -e "${delete_sql}"
mysql -h${HOSTNAME} -P${PORT} -u${USERNAME} -p${PASSWORD}  ${DBNAME} -e "${select_sql}"
