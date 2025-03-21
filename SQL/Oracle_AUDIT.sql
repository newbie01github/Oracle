-- CHECK for OBJECT Privilege
set linesize 200
set pagesize 5000
col terminal format a30
select username, terminal, timestamp, action_name, sys_privilege, priv_used
from dba_audit_trail
order by timestamp asc
/
