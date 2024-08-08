set serveroutput on 
declare
n number:=&n;
j number:=2;
counter number:=0;
begin
while(j<=n/2) loop
if mod(n, j)=0 then
dbms_output.put_line(n || ' is not a prime number');
counter:=1;
exit;
else
j:=j+1;
end if;
end loop;
if counter=0 then
dbms_output.put_line(n || ' is a prime number');
end if;
end;
/


