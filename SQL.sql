use prac;
show databases;
create table Employee(EID int primary key,Ename varchar(5),Pid varchar(8));
desc Employee;
insert into Employee(EID,Ename,Pid) values(100,"ABC","P189");
insert into Employee(EID,Ename,Pid) values(101,"MNP","P789");
select * from Employee;
insert into Employee(EID,Ename,Pid) values(102,"DEF","P567");
show databases;
use prac;
show tables;
truncate table Employee;
DELIMITER $$
create procedure `Iemp`
( 
EID int,
Ename varchar(5),
Pid varchar(8)
)
BEGIN
insert into Employee(EID,Ename,Pid) values(EID,Ename,Pid);

END$$
DELIMITER ;
call Iemp(11001,"ABC","P189");
call Iemp(11002,"MNP","P789");

call Iemp(11003,"DEF","P567");
call Iemp(11004,"GHJy","P567");

select * from Employee;

create view bolo as select Ename,Pid from Employee;
select * from bolo;

create table haha(id int, nam varchar(5));
alter table haha add sum int;
insert into haha(id,nam,sum) values(1,"hmm",5),(2,"mm",null),(3,"hmmk",null),(4,"hjm",6);
select * from haha;

select nam,id+ifnull(sum,1) from haha;

select nam,
case
	when sum>4 then "sum greater than 4"
    when sum=4 then "sum equal to 4"
    else "sum less than 4"
end as "res"
from haha;


create table bulk(id int not null,bname varchar(5),age int,check(age>18),unique(bname));

insert into bulk(id,bname,age) values(4,"klm",20),(3,"jij",21),(9,"derf",20);


select id,bname,age,
case
	when age>20 then "AGe greater than 20"
	when age=20 then "Age equal to 20"
    else "Age less than 20"
end as "Condition"
from bulk;


create table fruit(fid int primary key,frname varchar(9));
create table human(hid int primary key,hname varchar(5),fid int, constraint ref foreign key(fid) references fruit(fid));

insert into fruit(fid,frname)values(1,"apple"),(2,"mango"),(3,"banana"),(4,"orange");
insert into human(hid,hname,fid) values(14,"llly",2),(13,"yeek",3);
select * from human;
select * from fruit;
select * from employeee;
select sysdate();