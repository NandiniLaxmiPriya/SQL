create database coffeeshop;
use coffeeshop;
create table customers(cid varchar(45) primary key, cname varchar(45));
alter table customers add phone varchar(45);
desc customers;
create table Employees(eid varchar(45) primary key, ename varchar(45),phone varchar(45));
create table Orders(oid varchar(45) primary key, cid varchar(45), eid varchar(45), orderDate varchar(45), constraint fkf foreign key(cid) references customers(cid),foreign key(eid) references Employees(eid));
desc Orders;
insert into customers(cid,cname,phone) values("11","abc","999999999");
insert into customers(cid,cname,phone) values("12","defe","9455676856"),("13","hrf","995633959"),("14","frg","899877889");
insert into customers(cid,cname,phone) values("15","dave","9455676856");
select * from customers;

insert into Orders(oid,cid,eid,orderDate) values("o1","11","1","20-7-2018"),("o2","11","4","20-7-2018"),("o3","13","1","21-7-2018"),("o4","12","5","23-7-2018");
insert into Orders(oid,cid,eid,orderDate) values("o6","13","3","20-7-2018"),("o7","14","2","20-7-2018"),("o8","13","1","20-7-2018");
insert into Orders(oid,cid,eid,orderDate) values("o10","11","3","20-7-2018"),("o11","12","3","20-7-2018");
select * from Orders;

insert into Employees(eid,ename,phone) values("1","errr","988765655"),("2","ethggf","7656567678"),("3","eyuuy","786765559"),("4","effgg","8766677676");
insert into Employees(eid,ename,phone) values("5","dave","988765655");
select * from Employees;



/*Q1*/

select customers.cid,customers.cname,count(Orders.oid) as NumberOfOrders from customers left join Orders on customers.cid=Orders.cid group by customers.cid;


/*Q2*/
select count(cid) as EmpDaveServed from Orders where eid in (select eid from Employees where ename="dave");


/*Q3*/
select count(cid) as CountOn20th from Orders where orderDate="20-7-2018";

/*Q4*/
select count(cid) as CountOn20th,cid from Orders where orderDate="20-7-2018" group by cid;

/*Q5*/
select eid, count(eid) from Orders where orderDate="20-7-2018" group by eid having count(eid) = (select max(y.mycount) as EmpDay from (select count(eid) mycount from Orders where orderDate="20-7-2018" group by eid) y);
/*trial and errror*/
select max(y.mycount) as EmpDay from (select count(eid) mycount from Orders where orderDate="20-7-2018" group by eid) y;
select eid, count(eid) from Orders where orderDate="20-07-2018" group by eid limit 1;
