SET SERVEROUTPUT ON
declare
a number;
b number;
c number;
n number;
i number;
begin
n:=8;
a:=0;
b:=1;
dbms_output.put_line(a);
dbms_output.put_line(b);
for i in 1..n-2
loop
c:=a+b;
dbms_output.put_line(c);
a:=b;
b:=c;
end loop;
end;
/
