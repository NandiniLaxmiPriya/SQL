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

/*Qs1 Find all the projects which are not currently taken up by any employee*/
select * from Projects where Pid not in (select pid from Employee where pid is not null);

/* Qs2 Find all the other employees who are working in the same project with  ‘ABC’*/
select * from Employee where pid in (select pid from Employee where Ename="ABC");

/* Qs3 Find all the project names and No of employees working on each project */
select count(Employee.Eid),Employee.pid,Projects.Pname from Employee left join Projects on Employee.pid=Projects.Pid group by Employee.pid order by count(Employee.Eid);

/* Qs4 Find all the projects which have 2 or more employees with same name */
select Pid,Pname from Projects where pid in (select A.pid from Employee A, Employee B where A.Eid<>B.Eid and A.Ename=B.Ename);

/*Qs5 List out the names of both employees and projects in alphabetical order into the single result. */
select Employee.Ename,Projects.Pname from Employee left join Projects on Employee.pid=Projects.Pid order by Employee.Ename,Projects.Pname;