set linesize 255;
set pagesize 50000;
set feedback off;
set tab off;

ttitle left 'List of NLS Properties' skip 1 line;
column propname format a32 heading 'Name';
column propval  format a32 heading 'Value';
column dscp     format a80 heading 'Description' truncate;

select property_name as propname,
       property_value as propval,
       description as dscp
  from database_properties
 where lower(property_name) like 'nls_%';
-- lower(property_name) in ('nls_characterset', 'nls_language', 'nls_territory');
