DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Insertproduct`(PtdId int,PName varchar(50),Price int,Quantity int)
BEGIN
IF Price>0 and Quantity>=0 THEN
insert into Product values(PtdId,PName,Price,Quantity);
ELSE
select "Insertion Unsuccesfull";
END IF;
END$$
DELIMITER ;