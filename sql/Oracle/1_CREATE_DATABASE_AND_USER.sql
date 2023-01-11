-- Create the user
create user TEST_USER identified by "!Aa112233"
  default tablespace SYSTEM
  temporary tablespace TEMP;

-- Grant/Revoke role privileges
grant connect to TEST_USER;

-- Grant/Revoke object privileges
grant execute on SYS.DBMS_LOCK to TEST_USER;
grant select on SYS.V_$SESSION to TEST_USER;

-- Grant/Revoke system privileges
grant create table to TEST_USER;
grant create trigger to TEST_USER;
grant create procedure to TEST_USER;
grant create sequence to TEST_USER;
grant create view to TEST_USER;
grant create type to TEST_USER;

grant unlimited tablespace to TEST_USER;
grant create session to TEST_USER;
grant debug connect session to TEST_USER;
grant SELECT_CATALOG_ROLE to TEST_USER;
grant select any dictionary to TEST_USER;