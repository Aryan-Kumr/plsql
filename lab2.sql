create table part1(pno int,pname char(20),colour char(20),primary key(pno));
create table copy_part1(pno int,pname char(20),colour char(20),primary key(pno));
insert into part1 values(10,'nuts','black');
insert into part1 values(20,'bolts','grey');
insert into part1 values(30,'screw','green');
set serveroutput on
declare
cursor curr is select *from part1;
counter int;
rows part1%rowtype;
begin
open curr;
loop
fetch curr into rows ;
exit when curr%notfound;
insert into copy_part1 values(rows.pno,rows.pname,rows.colour);
end loop;
counter := curr%rowcount;
close curr;
dbms_output.put_line(counter||' rows inserted into the table copy_part1 ');
end;
/
