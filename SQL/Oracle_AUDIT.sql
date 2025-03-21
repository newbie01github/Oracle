-- CHECK for OBJECT Privilege 
select username, timestamp, action_name, sys_privilege, priv_used
  from dba_audit_trail
order by timestamp asc  
/
