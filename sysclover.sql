---alter session set "_ORACLE_SCRIPT"=true;

--------------------------------------------------------------------------------
-------------------------- Creacion de tablespace ------------------------------
CREATE TABLESPACE tbl_eventosclover
DATAFILE 'c:\eventosclover\tbl_eventosclover.dbf' SIZE 200m;

--------------------------------------------------------------------------------
-------------------------- Creacion de usuarios --------------------------------
CREATE USER eventosclover IDENTIFIED by adminclover
DEFAULT TABLESPACE tbl_eventosclover
TEMPORARY TABLESPACE temp;

CREATE USER cloverassistant IDENTIFIED by asisclover
DEFAULT TABLESPACE tbl_eventosclover
TEMPORARY TABLESPACE temp;

CREATE USER cloveremp01 IDENTIFIED by emp01clover
DEFAULT TABLESPACE tbl_eventosclover
TEMPORARY TABLESPACE temp;

--------------------------------------------------------------------------------
-------------------------- Grants ----------------------------------------------
GRANT CONNECT,RESOURCE TO eventosclover;
GRANT CONNECT,RESOURCE TO cloverassistant;
GRANT CONNECT,RESOURCE TO cloveremp01;

--------------------------------------------------------------------------------
-------------------------- Creacion de roles -----------------------------------
CREATE ROLE assistant;
CREATE ROLE employee;

--------------------------------------------------------------------------------
-------------------------- Grants  --------------------------------------------
GRANT assistant TO cloverassistant;
GRANT CREATE VIEW TO cloverassistant;

GRANT employee TO cloveremp01;
GRANT CREATE VIEW TO cloveremp01;
