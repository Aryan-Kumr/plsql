set serveroutput on
begin
update employee1
set salary=(1.15*salary) where deptno=10;
dbms_output.put_line('number of rows updated are'||sql%rowcount);
end;
/
