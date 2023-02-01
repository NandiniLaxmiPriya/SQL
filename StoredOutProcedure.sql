
use assignment;
show tables;
select * from Employee;
DELIMITER $$
create procedure retrieve(in id varchar(10), out countval int)
begin
select count(pid) into countval from Employee where pid = id;
end $$
DELIMITER ;
/*call retrieve("P189",@VAL);
select @VAL;*/