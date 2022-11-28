DELIMITER //
create	procedure listUsers() 
begin 
select * from users;
 end //
DELIMITER ;

DELIMITER //
create	procedure updateUsers(in idu int,in `nameu` nvarchar(255) , in emailu varchar(255), in countryu varchar(255)) 
begin 
update users
set name=nameu,email=emailu,country=countryu
where id=idu;
 end //
DELIMITER ;

DELIMITER //
create	procedure deleteUsers(in idd int) 
begin 
delete from users where id=idd;
 end //
DELIMITER ;
