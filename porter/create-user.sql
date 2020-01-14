CREATE USER bamtri_mes
  IDENTIFIED BY bamtri_mes
  DEFAULT TABLESPACE BAMTRI_MES_P01
  TEMPORARY TABLESPACE BAMTRI_MES_T01
  PROFILE DEFAULT
  ACCOUNT UNLOCK;

-- 2 Roles for BAMTRI_MES
GRANT CONNECT TO bamtri_mes;
GRANT DBA TO bamtri_mes;
ALTER USER bamtri_mes DEFAULT ROLE ALL;

-- 5 System Privileges for BAMTRI_MES
GRANT SELECT ANY DICTIONARY TO bamtri_mes;
GRANT SELECT ANY SEQUENCE TO bamtri_mes;
GRANT SELECT ANY TABLE TO bamtri_mes;
GRANT SELECT ANY TRANSACTION TO bamtri_mes;
GRANT UNLIMITED TABLESPACE TO bamtri_mes;

