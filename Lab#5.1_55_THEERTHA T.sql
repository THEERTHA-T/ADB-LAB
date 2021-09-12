Create database Trigger_1;
use Trigger_1;

create table Product(PdtId int primary key,Pname varchar(50),Price int,Qtyinstock int);
create table Sale(saleId int,Deliveraddress varchar(70));
create table Saleitem(saleId int,PdtId int,Qty int,primary key(saleId,PdtId),foreign key(PdtId) references Product(PdtId) on delete cascade on update cascade);

insert into Product values(100,'ABC',1000,22);
insert into Product values(200,'MNO',2500,35);
insert into Product values(300,'XYZ',500,20);
insert into Product values(400,'RST',75000,10);

select *from Product;

insert into Sale values(111,'AAA');
insert into Sale values(222,'BBB');
insert into Sale values(333,'CCC');

select *from Sale;

insert into Saleitem values(1,200,2);
insert into Saleitem values(2,400,5);
insert into Saleitem values(3,100,1);

select *from Saleitem;
select *from Product;





