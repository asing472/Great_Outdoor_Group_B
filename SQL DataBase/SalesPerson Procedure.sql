Create DATABASE GreatOutdoor
Go

USE GreatOutdoor
Go

CREATE SCHEMA Users
GO

CREATE TABLE Users.SalesPersons
(
 SalesPersonID              varchar(255)            Constraint Pk_SalesPerson Primary key,
 SalesPerson_Name           VARCHAR(30)             NOT NULL,
 Email                      VARCHAR(50)             NOT NULL,
 Password                   VARCHAR(20)             NOT NULL,
 SalesPerson_Mobile         VARCHAR(50)             NOT NULL,
 Creation_DateTime          datetime,
 Last_Modified_DateTime     datetime,
 )
 Go

 --Created Table WITH VARCHAR OF SALESPERSON

Select*from GreatOutdoor.Users.SalesPersons

-- Created By Ayush Agrawal on 01/10/2019
-- Procedure For Adding SalesPerson

alter procedure Users.AddSalesPerson(@salesPersonID varchar(255), @salesPersonName varchar(30),@Email varchAR(50),
@password varchar(20), @salesPersonMobile varchar(50), @CreationDateTime datetime /*@LastModifiedDateTime datetime*/)
AS 
BEGIN
begin try
	if @salesPersonName is null OR @salesPersonName =''
		throw 500000,'SalesPerson Name Is Must',1 
	if @salesPersonMobile is null OR @salesPersonMobile =''
		throw 500000,'SalesPerson mobile Is Must',2 
	if @Email is null OR @Email =''
		throw 500000,'SalesPerson Email Is Must',3
    if @password is null OR @password =''
		throw 500000,'password Is Must',4
    else
    insert into Greatoutdoor.Users.SalesPersons
	 values(@salesPersonID, @salesPersonName,@Email,@password,@salesPersonMobile,@CreationDateTime,/*@LastModifiedDateTime*/null)
end try
begin Catch
         throw 500000,'SalesPerson Not Added',5;
end catch	
END

--Exec Users.AddSalesPerson '20','Ayush', 'ayush087@gmail.com','Ayush087','9893103651','1-oct-2019'


--Procedure to Update SalesPerson
-- Created By Ayush Agrawal on 01/10/2019
--It Takes salesperson Object as Input

Create procedure Users.UpdateSalesPerson(@salesPersonID varchar(30), @salesPersonName varchar(30),@Email varchAR(50),
@password varchar(20), @salesPersonMobile varchar(50), @CreationDateTime datetime, @LastModifiedDateTime datetime)
AS 
BEGIN
begin try
    if @salesPersonName is null OR @salesPersonName =''
		throw 500000,'SalesPerson Name Is Must',1 
	if @salesPersonMobile is null OR @salesPersonMobile =''
		throw 500000,'SalesPerson mobile Is Must',2 
	if @Email is null OR @Email =''
		throw 500000,'SalesPerson Email Is Must',3
    if @password is null OR @password =''
		throw 500000,'password Is Must',4
    else
    update GreatOutdoor.Users.SalesPersons set SalesPerson_Name= @salesPersonName,Email=@Email,password= @password, SalesPerson_Mobile =@salespersonMobile,Last_Modified_DateTime =@LastModifiedDateTime
where SalesPersonID= @salesPersonID
end try
begin Catch
    throw 500000,'SalesPerson Not Updated',3
end catch	
END

--Exec Users.UpdateSalesPerson '20','Ayush', 'ayush087@gmail.com','Kaushik087','9893103651','1-oct-2019', '2-oct-2019'
--Select*from GreatOutdoor.Users.SalesPersons


--Procedure to Delete SalesPerson
-- Created By Ayush Agrawal on 01/10/2019
-- Takes SalesPerson ID as input
Create procedure Users.DeleteSalesPerson(@salesPersonID varchar(50) )
AS 
BEGIN
begin try
      Delete GreatOutdoor.Users.SalesPersons where SalesPersonID= @salesPersonID
end try
begin Catch
      throw 500000,'SalesPerson Not Deleted',4
end catch	
END


--Update SalesPerson Password of SalesPerson
-- Created By Ayush Agrawal on 01/10/2019
--Take SalesPerson Object as Input

CREATE procedure Users.UpdateSalesPersonPassword(@salesPersonID varchar(30), @salesPersonName varchar(30),@Email varchAR(30),
@password varchar(20), @salesPersonMobile varchar(50), @CreationDateTime datetime, @LastModifiedDateTime datetime)
AS 
BEGIN
begin try
        update GreatOutdoor.Users.SalesPersons set password= @password,Last_Modified_DateTime =@LastModifiedDateTime
        where SalesPersonID= @salesPersonID
end try
begin Catch
       throw 500000,'SalesPerson Not Updated',5
end catch	
END


--EXEC Users.UpdateSalesPersonPassword '20','Ayush', 'ayush087@gmail.com','kaushik087','9893103651','1-oct-2019','2-oct-2019'
--Select*from GreatOutdoor.Users.SalesPersons


--Get SalesPerson By salesPersonID
-- Created By Ayush Agrawal on 01/10/2019
-- Takes salesPerson ID as input
CREATE procedure Users.GetSalesPersonBySalesPersonID(@salesPersonID varchar(30))
AS
BEGIN
begin try
select * from GreatOutdoor.Users.SalesPersons where SalesPersonID=@salesPersonID
end try
begin catch
     throw 500021,'SalesPersonID does not Exist',6
end catch
END

--EXEC Users.GetSalesPersonBySalesPersonID 20


-- Procedure For selecting SalesPerson by Email
-- Created By Ayush Agrawal on 01/10/2019
--Takes Email As Input

CREATE procedure Users.GetSalesPersonByEmail(@Email varchar(30))
AS
BEGIN
begin try
     select * from GreatOutdoor.Users.SalesPersons where Email=@Email
end try
begin catch
        throw 500021,'SalesPerson Email does not Exist',7
end catch
END

--Exec Users.GetSalesPersonByEmail 'ayush087@gmail.com'


--Procedure for Select SalesPerson By EmailId and Password
-- Created By Ayush Agrawal on 01/10/2019
--Takes Email and Password as Input
CREATE procedure Users.GetSalesPersonByEmailAndPassword(@Email varchar(30), @password varchar(30))
AS
BEGIN
begin try
        select * from GreatOutdoor.Users.SalesPersons where Email=@Email and Password = @password
end try
begin catch
          throw 500021,'SalesPerson Email and Password Invalid',8
end catch
END


--EXEC Users.GetSalesPersonByEmailAndPassword 'ayush087@gmail.com','kaushik087'
--Get SalesPerson By Name
--Take Name as Input
CREATE  procedure Users.GetSalesPersonByName(@salesPersonName varchar(30))
AS
BEGIN
begin try
       select * from GreatOutdoor.Users.SalesPersons where SalesPerson_Name=@salesPersonName
end try
begin catch
       throw 500021,'SalesPersonID does not Exist',9
end catch
END

--Exec Users.GetSalesPersonByName 'Ayush'



--Get All SalesPerson 
-- Created By Ayush Agrawal on 01/10/2019
--Take SalesPersonID as Input
CREATE  procedure Users.GetAllSalesPerson(@salesPersonID varchar(30))
AS
BEGIN
begin try
        select * from GreatOutdoor.Users.SalesPersons end try
begin catch
         throw 500021,'SalesPersonID does not Exist',9
end catch
END


--Exec Users.GetAllSalesPerson '20'
