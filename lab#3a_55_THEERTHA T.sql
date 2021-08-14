create database STORE;
use STORE;
create table Product(PtdId int primary key,PName varchar(50),Price int,Quantity int);
call Insertproduct(100,'clothing',500,20);
call Insertproduct(200,'vehicle',55500,0);
call Insertproduct(300,'books',0,220);
call Insertproduct(400,'furniture',1000,-4);
select *from Product;