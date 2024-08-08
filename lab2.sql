create table part1(pno int,pname char(20),colour char(20),primary key(pno));
create table copy_part1(pno int,pname char(20),colour char(20),primary key(pno));
create table shipment (ShipmentID int, pno int, QuantityShipped int, primary key(ShipmentID), foreign key(pno) references part1(pno));   

insert into part1 values(10,'nuts','black');
insert into part1 values(20,'bolts','grey');
insert into part1 values(30,'screw','green');

insert into shipment values(1,10,100);
insert into shipment values (2,20,200);
insert into shipment values(3,30,300);

set serveroutput on
declare
cursor curr is select *from part1;
cursor shipments_cursor is select shipmentid, pno, quantityshipped
from shipments;
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

FOR shipment IN shipments_cursor
    LOOP
        update shipment
        set quantityshipped = quantityshipped * 1.05
        where shipmentid = shipment.shipmentid;
    end loop;
    DBMS_OUTPUT.PUT_LINE('Update complete.');
end;
/
