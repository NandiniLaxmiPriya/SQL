select * from human;
desc human;
DELIMITER $$
create procedure ssetvalues(
IN humname varchar(5),
IN humid int
)
begin
update human set hname=humname where hid=humid;
end $$
DELIMITER ;
call ssetvalues("lot",11);