-- Database: testdb
-- DROP DATABASE IF EXISTS testdb;

CREATE DATABASE testdb
    WITH
    OWNER = testdb
    ENCODING = 'UTF8'
    LC_COLLATE = 'en_US.UTF-8'
    LC_CTYPE = 'en_US.UTF-8'
    CONNECTION LIMIT = -1;

GRANT TEMPORARY, CONNECT ON DATABASE testdb TO PUBLIC;
GRANT ALL ON DATABASE testdb TO testdb;
GRANT ALL ON DATABASE testdb TO postgres;