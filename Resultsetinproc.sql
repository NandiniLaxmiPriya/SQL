DELIMITER $$
create procedure showdata(in id varchar(9))
begin
select * from Employee where pid=id;
end$$
DELIMITER ;

call showdata("P189");