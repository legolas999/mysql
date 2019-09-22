#!/bin/bash
HOSTNAME="localhost"
PORT="3306"
USERNAME="root"
PASSWORD="Com.123456"

DBNAME="test1"
TABLENAME="tb01"

# create database
mysql -h ${HOSTNAME} -P ${PORT} -u${USERNAME} -p${PASSWORD} -e "drop database if exists ${DBNAME}"
create_db_sql="create database if not exists ${DBNAME}"
mysql -h ${HOSTNAME} -P ${PORT} -u${USERNAME} -p${PASSWORD} -e "${create_db_sql}"

#create table
create_table_sql="create table if not exists ${TABLENAME} (stuid int not null primary key,stuname
 varchar(20) not null,stusex char(1) not null,cardid varchar(20) not null,birthday datetime,
 entertime datetime,address varchar(100) default null)"
mysql -h ${HOSTNAME} -P ${PORT} -u${USERNAME} -p${PASSWORD} ${DBNAME} -e "${create_table_sql}"

#insert data to table
i=1
while [ $i -le 20000 ]
do
insert_sql="insert into ${TABLENAME} values($i,'zhangsan','1','1234567890123456','1999-10-10',
'2016-9-3','zhongguo hebeisheng baodingshi')"
mysql -h ${HOSTNAME} -P ${PORT} -u${USERNAME} -p${PASSWORD} ${DBNAME} -e "${insert_sql}"

let i=i+1
done

#select data
select_sql="select count(*) from ${TABLENAME}"
mysql -h ${HOSTNAME} -P ${PORT} -u${USERNAME} -p${PASSWORD} ${DBNAME} -e "${select_sql}"

