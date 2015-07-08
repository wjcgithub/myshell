#!/bin/bash
#mysql.sh

mysql="/usr/local/mysql/bin/mysql -uroot -pbrave"

db_sql="show databases"

tabshow_sql="show tables from test"

create_sql="create table test.user(
  id int unsigned auto_increment primary key,
  username varchar(50),
  password varchar(50)  
)"

insert_sql="insert into test.user(username, password)
values('u1','p1'),('u2','p2')"

select_sql="select * from test.user"

$mysql -e "$select_sql"
