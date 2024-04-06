--Practice--
Exception handling
declare <exception-action> handler <exception> <statements>
exception action can be either continue/ exit
exception are of 3 types
• SQLEXCEPTION
• error code
• NOT FOUND

delimiter //
create procedure inserdept(did int, edname varchar(20),edloc varchar(20))
begin
	declare exit handler for SQLEXCEPTION select 'error occured';
	insert into dept values(did,edname,edloc);
	select did,edname,edloc,'duplicate entry';
end//
delimieter ;



delimiter //
create procedure inserdept(did int, edname varchar(20),edloc varchar(20))
begin
   declare continue handler for SQLEXCEPTION select 'error occured';
   insert into dept values(did,edname,edloc);
   select did,edname,edloc,'duplicate entry';
end//
delimiter ;
mysql> call inserdept(60,'x','y');

 drop procedure inserdept;
 
 delimiter //
mysql> create procedure inserdept(did int, edname varchar(20),edloc varchar(20))
    -> begin
    ->   declare exit handler for SQLEXCEPTION select 'error occured';
    ->   insert into dept values(did,edname,edloc);
    ->   select did,edname,edloc,'duplicate entry';
    -> end//

call inserdept(60,'x','y');

delimiter //
CREATE PROCEDURE insertdept(did int,edname varcahr(20),edloc varchar(20))
begin
	DECLARE exit handler for SQLEXCEPTION select 'error occured';
end//
delimiter ;