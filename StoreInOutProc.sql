DELIMITER $$
create procedure readsvaluer(inout flower varchar(100))
begin
set flower = concat("Hey",flower,"flower");
end $$
DELIMITER ;

/*select 'rose' into @flow;
call readvaluer(@flow);
select @flow;*/