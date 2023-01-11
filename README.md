# Project Amazon RDS (PostgreSQL, MySQL, MariaDB, Oracle, Amazon Aurora (MySQL), Amazon Aurora (PostgreSQL))

Проверка работы загрузки данных через проект Github (#CurrencyChartFX-Java-19-Maven)

---------------------------------------------------------------------------------
- PostgreSQL

1) Создание базы данных (https://us-east-1.console.aws.amazon.com/rds/home?region=us-east-1#databases:)
 RDS -> Create database:
 - Choose a database creation method:
   -> Standard create
 - Engine options:
   -> Engine type -> PostgreSQL
   -> Engine Version -> PostgreSQL 14.5-R1
 - Templates:
   -> Free tier
 - Availability and durability:
     (default)
 - Settings:
   -> DB instance identifier -> postgresqldb
   -> Credentials Settings:
     -> Master username -> postgres
     -> Master password -> !Aa112233
     -> Confirm master password -> !Aa112233
 - Instance configuration:
     (default)
 - Storage:
     (default)
 - Connectivity:
   -> Compute resource -> Don’t connect to an EC2 compute resource
   -> Network type -> IPv4
   -> Virtual private cloud (VPC) -> Default VPC
   -> DB Subnet group -> default
   -> Public access -> Yes
   -> VPC security group (firewall) -> Choose existing
 - Database authentication:
   -> Database authentication options -> Password authentication
 - Monitoring:
   -> Performance Insights -> Turn on Performance Insights (OFF) !!!! (7 дней бесплатно, но далее платно)
 - Additional configuration:
   -> Database options:
     -> Initial database name -> testdb (!!! если нужно сразу создать отдельную базу данных)
   - Backup:
     -> Enable automated backups (OFF) !!!! (Для теста мне не нужно)
 - Create database

2) Добавляем маршрут для подключения
 RDS -> Databases
  -> выбираем postgresqldb
  -> выбираем Security - VPC security groups -> default (sg-****************)
  -> Inbound rules -> Edit inbound rules
  -> Add rule:
     -> Type -> PostgreSQL
     -> Source -> 0.0.0.0/0
  -> Save rules

3) Подключение (DBeaver):
   - Хост: postgresqldb.c5bnmatchwcd.us-east-1.rds.amazonaws.com
   - Порт: 5432
   - База данных: postgres
   - Пользователь: postgres
   - Пароль: !Aa112233

4) Добавление объектов
   - под пользователем postgres:
     - .\sql\PostgeeSQL\1_CREATE_USER.sql
   - под пользователем testdb база данных postgres:
     - .\sql\PostgeeSQL\2_CREATE_DATABASE.sql
   - под пользователем testdb база данных testdb:
     - .\sql\PostgeeSQL\3_CREATE_SCHEMAS.sql
     - .\sql\PostgeeSQL\4_CREATE TABLE AND VIEW.sql
     - .\sql\PostgeeSQL\5_CREATE PROCEDURE.sql

---------------------------------------------------------------------------------
- MySQL

1) Создание базы данных (https://us-east-1.console.aws.amazon.com/rds/home?region=us-east-1#databases:)
 RDS -> Create database:
 - Choose a database creation method:
   -> Standard create
 - Engine options:
   -> Engine type -> MySQL
   -> Edition -> MySQL Community
   -> Engine Version -> MySQL 8.0.31
 - Templates:
   -> Free tier
 - Availability and durability:
     (default)
 - Settings:
   -> DB instance identifier -> mysqldb
   -> Credentials Settings:
     -> Master username -> admin
     -> Master password -> !Aa112233
     -> Confirm master password -> !Aa112233
 - Instance configuration:
     (default)
 - Storage:
     (default)
 - Connectivity:
   -> Compute resource -> Don’t connect to an EC2 compute resource
   -> Network type -> IPv4
   -> Virtual private cloud (VPC) -> Default VPC
   -> DB Subnet group -> default
   -> Public access -> Yes
   -> VPC security group (firewall) -> Choose existing
 - Database authentication:
   -> Database authentication options -> Password authentication
 - Monitoring:
   -> Performance Insights -> Turn on Performance Insights (OFF) !!!! (7 дней бесплатно, но далее платно)
 - Additional configuration:
   -> Database options:
     -> Initial database name -> testdb (!!! если нужно сразу создать отдельную базу данных)
   - Backup:
     -> Enable automated backups (OFF) !!!! (Для теста мне не нужно)
 - Create database

2) Добавляем маршрут для подключения
 RDS -> Databases
  -> выбираем mysqldb
  -> выбираем Security - VPC security groups -> default (sg-****************)
  -> Inbound rules -> Edit inbound rules
  -> Add rule:
     -> Type -> MySQL/Aurora
     -> Source -> 0.0.0.0/0
  -> Save rules

3) Подключение (DBeaver):
   - Хост: mysqldb.c5bnmatchwcd.us-east-1.rds.amazonaws.com
   - Порт: 3306
   - База данных:
   - Пользователь: admin
   - Пароль: !Aa112233

4) Добавление объектов
   - под пользователем admin:
     - .\sql\MySQL\1_CREATE_USER_AND_DATABASE.sql
   - под пользователем test_user, база данных testdb:
     - .\sql\MySQL\2_CREATE TABLE AND VIEW.sql
     - .\sql\MySQL\3_CREATE PROCEDURE.sql

---------------------------------------------------------------------------------
- MariaDB

1) Создание базы данных (https://us-east-1.console.aws.amazon.com/rds/home?region=us-east-1#databases:)
 RDS -> Create database:
 - Choose a database creation method:
   -> Standard create
 - Engine options:
   -> Engine type -> MariaDB
   -> Engine Version -> MariaDB 10.6.11
 - Templates:
   -> Free tier
 - Availability and durability:
     (default)
 - Settings:
   -> DB instance identifier -> mariadb
   -> Credentials Settings:
     -> Master username -> admin
     -> Master password -> !Aa112233
     -> Confirm master password -> !Aa112233
 - Instance configuration:
     (default)
 - Storage:
     (default)
 - Connectivity:
   -> Compute resource -> Don’t connect to an EC2 compute resource
   -> Network type -> IPv4
   -> Virtual private cloud (VPC) -> Default VPC
   -> DB Subnet group -> default
   -> Public access -> Yes
   -> VPC security group (firewall) -> Choose existing
   -> Additional configuration -> Database port -> 3307   !!!!
 - Database authentication:
   -> Database authentication options -> Password authentication
 - Monitoring:
   -> Performance Insights -> Turn on Performance Insights (OFF) !!!! (7 дней бесплатно, но далее платно)
 - Additional configuration:
   -> Database options:
     -> Initial database name -> testdb (!!! если нужно сразу создать отдельную базу данных)
   - Backup:
     -> Enable automated backups (OFF) !!!! (Для теста мне не нужно)
 - Create database

2) Добавляем маршрут для подключения
 RDS -> Databases
  -> выбираем mariadb
  -> выбираем Security - VPC security groups -> default (sg-****************)
  -> Inbound rules -> Edit inbound rules
  -> Add rule:
     -> Type -> Custom IP
     -> Port -> 3307
     -> Source -> 0.0.0.0/0
  -> Save rules

3) Подключение (DBeaver):
   - Хост: mariadb.c5bnmatchwcd.us-east-1.rds.amazonaws.com
   - Порт: 3307
   - База данных:
   - Пользователь: admin
   - Пароль: !Aa112233

4) Добавление объектов
   - под пользователем admin:
     - .\sql\MariaDB\1_CREATE_USER_AND_DATABASE.sql
   - под пользователем test_user, база данных testdb:
     - .\sql\MariaDB\2_CREATE TABLE AND VIEW.sql
     - .\sql\MariaDB\3_CREATE PROCEDURE.sql

---------------------------------------------------------------------------------
- Oracle

1) Создание базы данных (https://us-east-1.console.aws.amazon.com/rds/home?region=us-east-1#databases:)
 RDS -> Create database:
 - Choose a database creation method:
   -> Standard create
 - Engine options:
   -> Engine type -> Oracle
   -> Edition -> (default)
 - Templates:
   -> Dev/Test
 - Settings:
   -> DB instance identifier -> oracledb
   -> Credentials Settings:
     -> Master username -> admin
     -> Master password -> !Aa112233
     -> Confirm master password -> !Aa112233
 - Instance configuration:
     (default)
 - Storage:
     (default)
 - Connectivity:
   -> Compute resource -> Don’t connect to an EC2 compute resource
   -> Network type -> IPv4
   -> Virtual private cloud (VPC) -> Default VPC
   -> DB Subnet group -> default
   -> Public access -> Yes
   -> VPC security group (firewall) -> Choose existing
 - Database authentication:
   -> Database authentication options -> Password authentication
 - Monitoring:
   -> Performance Insights -> Turn on Performance Insights (OFF) !!!! (7 дней бесплатно, но далее платно)
 - Additional configuration:
   -> Database options:
     -> Initial database name -> testdb (!!! если нужно сразу создать отдельную базу данных)
   - Backup:
     -> Enable automated backups (OFF) !!!! (Для теста мне не нужно)
 - Create database

2) Добавляем маршрут для подключения
 RDS -> Databases
  -> выбираем oracledb
  -> выбираем Security - VPC security groups -> default (sg-****************)
  -> Inbound rules -> Edit inbound rules
  -> Add rule:
     -> Type -> Oracle-RDS
     -> Source -> 0.0.0.0/0
  -> Save rules

3) Подключение (DBeaver):
   - Хост: oracledb.c5bnmatchwcd.us-east-1.rds.amazonaws.com
   - Порт: 1521
   - База данных: ORCL
   - Пользователь: admin
   - Пароль: !Aa112233

4) Добавление объектов
   - под пользователем admin:
     - .\sql\Oracle\1_CREATE_DATABASE_AND_USER.sql
   - под пользователем test_user:
     - .\sql\Oracle\2_CREATE TABLE AND VIEW.sql
     - .\sql\Oracle\3_CREATE PROCEDURE.sql

---------------------------------------------------------------------------------
- Amazon Aurora (MySQL)

1) Создание базы данных (https://us-east-1.console.aws.amazon.com/rds/home?region=us-east-1#databases:)
 RDS -> Create database:
 - Choose a database creation method:
   -> Standard create
 - Engine options:
   -> Engine type -> Amazon Aurora
   -> Edition -> Amazon Aurora MySQL-Compatible Edition
   -> Engine Version -> Aurora MySQL 3.02.2 (combatible with MySQL 8.0.23)
 - Templates:
   -> Dev/Test
 - Availability and durability:
     (default)
 - Settings:
   -> DB instance identifier -> auroramysqldb
   -> Credentials Settings:
     -> Master username -> admin
     -> Master password -> !Aa112233
     -> Confirm master password -> !Aa112233
 - Instance configuration:
     (default)
 - Storage:
     (default)
 - Connectivity:
   -> Compute resource -> Don’t connect to an EC2 compute resource
   -> Network type -> IPv4
   -> Virtual private cloud (VPC) -> Default VPC
   -> DB Subnet group -> default
   -> Public access -> Yes
   -> VPC security group (firewall) -> Choose existing
   -> Additional configuration -> Database port -> 3308   !!!!
 - Database authentication:
   -> Database authentication options -> Password authentication
 - Monitoring:
   -> Performance Insights -> Turn on Performance Insights (OFF) !!!! (7 дней бесплатно, но далее платно)
 - Additional configuration:
   -> Database options:
     -> Initial database name -> testdb (!!! если нужно сразу создать отдельную базу данных)
   - Backup:
     -> Enable automated backups (OFF) !!!! (Для теста мне не нужно)
 - Create database

2) Добавляем маршрут для подключения
 RDS -> Databases
  -> выбираем auroramysqldb
  -> выбираем Security - VPC security groups -> default (sg-****************)
  -> Inbound rules -> Edit inbound rules
  -> Add rule:
     -> Type -> Custom IP
     -> Port -> 3308
     -> Source -> 0.0.0.0/0
  -> Save rules

3) Подключение (DBeaver):
   - Хост: auroramysqldb-instance-1.c5bnmatchwcd.us-east-1.rds.amazonaws.com
   - Порт: 3308
   - База данных:
   - Пользователь: admin
   - Пароль: !Aa112233

4) Добавление объектов
   - под пользователем admin:
     - .\sql\MySQL\1_CREATE_USER_AND_DATABASE.sql
   - под пользователем test_user, база данных testdb:
     - .\sql\MySQL\2_CREATE TABLE AND VIEW.sql
     - .\sql\MySQL\3_CREATE PROCEDURE.sql

---------------------------------------------------------------------------------
- Amazon Aurora (PostgreSQL)

1) Создание базы данных (https://us-east-1.console.aws.amazon.com/rds/home?region=us-east-1#databases:)
 RDS -> Create database:
 - Choose a database creation method:
   -> Standard create
 - Engine options:
   -> Engine type -> Amazon Aurora
   -> Edition -> Amazon Aurora PostgreSQL-Compatible Edition
   -> Engine Version -> Aurora PostgreSQL (Combatible with PostgreSQL 14.5)
 - Templates:
   -> Free tier
 - Availability and durability:
     (default)
 - Settings:
   -> DB instance identifier -> aurorapostgresqldb
   -> Credentials Settings:
     -> Master username -> postgres
     -> Master password -> !Aa112233
     -> Confirm master password -> !Aa112233
 - Instance configuration:
     (default)
 - Storage:
     (default)
 - Connectivity:
   -> Compute resource -> Don’t connect to an EC2 compute resource
   -> Network type -> IPv4
   -> Virtual private cloud (VPC) -> Default VPC
   -> DB Subnet group -> default
   -> Public access -> Yes
   -> VPC security group (firewall) -> Choose existing
   -> Additional configuration -> Database port -> 5433   !!!!
 - Database authentication:
   -> Database authentication options -> Password authentication
 - Monitoring:
   -> Performance Insights -> Turn on Performance Insights (OFF) !!!! (7 дней бесплатно, но далее платно)
 - Additional configuration:
   -> Database options:
     -> Initial database name -> testdb (!!! если нужно сразу создать отдельную базу данных)
   - Backup:
     -> Enable automated backups (OFF) !!!! (Для теста мне не нужно)
 - Create database

2) Добавляем маршрут для подключения
 RDS -> Databases
  -> выбираем aurorapostgresqldb
  -> выбираем Security - VPC security groups -> default (sg-****************)
  -> Inbound rules -> Edit inbound rules
  -> Add rule:
     -> Type -> Custom IP
     -> Port -> 5433
     -> Source -> 0.0.0.0/0
  -> Save rules

3) Подключение (DBeaver):
   - Хост: aurorapostgresqldb-instance-1.c5bnmatchwcd.us-east-1.rds.amazonaws.com
   - Порт: 5433
   - База данных: postgres
   - Пользователь: postgres
   - Пароль: !Aa112233

4) Добавление объектов
   - под пользователем postgres:
     - .\sql\PostgeeSQL\1_CREATE_USER.sql
   - под пользователем testdb база данных postgres:
     - .\sql\PostgeeSQL\2_CREATE_DATABASE.sql
   - под пользователем testdb база данных testdb:
     - .\sql\PostgeeSQL\3_CREATE_SCHEMAS.sql
     - .\sql\PostgeeSQL\4_CREATE TABLE AND VIEW.sql
     - .\sql\PostgeeSQL\5_CREATE PROCEDURE.sql