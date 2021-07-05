set colsep ,
set headsep on
set pagesize 0
set trimspool on
set feedback off 
set linesize 3000
alter session set nls_date_format='dd.mm.yyyy hh24:mi:ss';

spool &1/&2
select 'COLUMN_1'||','||'COLUMN_2'||','||'COLUMN_3' from dual;
SELECT *
FROM ansible.test_an_2
WHERE ROWNUM <= 100
order by ROWNUM;

spool off
quit
