-- Created By Prafull on 01/10/2019
-- Procedure For Adding Address
CREATE procedure GreatOutdoor.AddAddress(@addressID varchar(30), @addressLine1 varchar(30),@addressLine2 varchAR(50),
@landmark varchar(20), @city varchar(20),@state varchar(20), @pinCode varchar(20),@retailerID varchar(20), @CreationDateTime datetime, @LastModifiedDateTime datetime)
AS 
BEGIN
begin try
if @addressID =''
throw 500010,'Address ID Is Must',1
if @addressLine1 =''
throw 500010,'Address ID Is Must',1
if @landmark =''
throw 500010,'Address ID Is Must',1
if @city =''
throw 500010,'Address ID Is Must',1
insert into GreatOutdoor.Addresses values(@addressID, @addressLine1,@addressLine2,@landmark	,@city,@state,@pinCode,@retailerID,@CreationDateTime,@LastModifiedDateTime)
end try
begin Catch
throw 500000,'Address Not Added',1
end catch	
END

-- Procedure to Update Address
-- It takes Address Object As input
CREATE procedure GreatOutdoor.UpdateAddress(@addressID varchar(30), @addressLine1 varchar(30),@addressLine2 varchAR(50),
@landmark varchar(20), @city varchar(20),@state varchar(20), @pinCode varchar(20),@retailerID varchar(20), @CreationDateTime datetime, @LastModifiedDateTime datetime)
AS 
BEGIN
begin try
if @addressID =''
begin
throw 500010,'Address ID Is Must',1
end
else
update GreatOutdoor.Addresses set AddressLine1=@addressLine1,AddressLine2=@addressLine2,LandMark=@landmark,City=@city,State =@state,PinCode=@pinCode,LastModifiedDateTime=@LastModifiedDateTime where AddressID = @addressID
end try
begin Catch
throw 500000,'Address Not Added',1
end catch	
END


--Create Procedure for selecting address based on RetailerID
--Input is retailerID
CREATE procedure GreatOutdoor.GetAddressesByRetailerID(@retailerID varchar(30))
AS
BEGIN
begin try
Select *From GreatOutdoor.Addresses where RetailerID = @retailerID
end try
begin catch
throw 500010,'Invalid Retailer ID',1
end catch
END

--Create Procedure for selecting address based on RetailerID
--Input is retailerID
CREATE procedure GreatOutdoor.GetAddressesByAddressID(@addressID varchar(30))
AS
BEGIN
begin try
Select *From GreatOutdoor.Addresses where AddressID = @addressID
end try
begin catch
throw 500010,'Address Id Does Not Exist',1
end catch
END

--Create Procedure for selecting address based on RetailerID
--Input is retailerID
CREATE procedure GreatOutdoor.DeleteAddress(@addressID varchar(30))
AS
BEGIN
begin try
Delete From GreatOutdoor.Addresses where AddressID = @addressID
end try
begin catch
throw 500010,'Address Not Deleted',1
end catch
END




