create database assignment;
show databases;
use assignment;
show tables;
create table Employee(Eid int, Ename varchar(5), pid varchar(8));
select * from Employee;
insert into Employee(Eid,Ename,pid) values(115,"JKG","P5189");
delete from Employee where Eid=114 and Ename="JKG";
update Employee set pid="P189" where Eid=115;
create table Projects(Pid int primary key,Pname varchar(15));
insert into Projects(Pid,Pname) values("P189","Rest"),("P546","Spring"),("P547","Maven"),("P567","Swift"),("P789","Angular"),("P799","Script"),("P805","Mssql"),("P855","Perl"),("P895","Python"),("P902","Ruby"),("P928","R");
alter table Projects modify Pid varchar(8);
desc Projects;
select count(*) from Projects;
delete from Projects where Pid IS NULL and Pname IS NULL;

/*assignment*/
select * from Projects where Pid not in (select pid from Employee where pid is not null);
select pid from Employee where Ename="ABC";
select * from Employee where pid in (select pid from Employee where Ename="ABC");
/*assignment*/
select Employee.Eid,Employee.Ename,Employee.pid,Projects.Pname from Employee inner join Projects on Employee.pid=Projects.Pid;

select Employee.Eid,Employee.Ename,Employee.pid,Projects.Pname from Employee left join Projects on Employee.pid=Projects.Pid;
select Projects.Pname,Projects.Pid,Employee.Eid,Employee.Ename from Projects left join Employee on Employee.pid=Projects.Pid;

select Projects.pid,Projects.Pname,Employee.Eid,Employee.Ename from Employee right join Projects on Employee.pid=Projects.Pid;

select Projects.pid,Projects.Pname,Employee.Eid,Employee.Ename from Employee cross join Projects on Employee.pid=Projects.Pid;


/*assignment*/
select count(Employee.Eid),Employee.pid,Projects.Pname from Employee left join Projects on Employee.pid=Projects.Pid group by Employee.pid order by count(Employee.Eid);

select A.Eid,A.pid,A.Ename from Employee A, Employee B where A.Eid<>B.Eid and A.Ename=B.Ename;

select Pid,Pname from Projects where pid in (select A.pid from Employee A, Employee B where A.Eid<>B.Eid and A.Ename=B.Ename);

/*
'106', NULL, 'UJM'
'105', 'P189', 'UJM'
'114', 'P567', 'RGJ'
'113', 'P789', 'SDF'
'110', 'P189', 'SDF'
'107', 'P567', 'RGJ'

*/

select Employee.Ename,Projects.Pname from Employee left join Projects on Employee.pid=Projects.Pid order by Employee.Ename,Projects.Pname;
/*assignment*/

select * from Employee where pid = any(select pid from Employee where Ename="ABC");

create table delme(Ename varchar(5),Pname varchar(15));
insert into delme(Ename,Pname) select Employee.Ename,Projects.Pname from Employee left join Projects on Employee.pid=Projects.Pid order by Employee.Ename,Projects.Pname;
select * from delme;

select count(Ename),pid from Employee group by pid order by count(Ename);