create database `aggregate`;
create user 'aggregate' identified by 'aggregate';
grant all on `aggregate`.* to 'aggregate' identified by 'aggregate';
flush privileges;
