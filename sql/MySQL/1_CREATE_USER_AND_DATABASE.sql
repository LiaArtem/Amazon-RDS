CREATE USER 'test_user'@'%' IDENTIFIED BY '!Aa112233';
CREATE DATABASE testdb;
GRANT ALL PRIVILEGES ON testdb.* TO 'test_user'@'%';