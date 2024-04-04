-- 8access.sql
col machine format a30
col program format a40
col owner format a20
col object format a20
set lines 200
select a.inst_id, a.owner, b.logon_time, b.status, a.sid, b.serial#, b.username, b.status,b.machine, b.program,a.object
from   gv$access a, gv$session b where a.sid=b.sid and
       lower(object) = lower('&OBJECT_BEING_ACCESSED')
order by b.logon_time asc
/

-- access.sql
col machine format a30
col program format a40
col owner format a20
col object format a20
set lines 200
select a.inst_id, a.owner, b.logon_time, b.status, a.sid, b.serial#, b.username, b.status,b.machine, b.program,a.object, sql_id, prev_sql_id
from   gv$access a, gv$session b where a.sid=b.sid and
       lower(object) = lower('&OBJECT_BEING_ACCESSED')
order by b.logon_time asc
/
