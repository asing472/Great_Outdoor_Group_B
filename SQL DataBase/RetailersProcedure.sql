-- Created By Prafull on 01/10/2019
-- Procedure For Adding Retailer

alter procedure GreatOutdoor.AddRetailer(@retailerID varchar(30), @retailerName varchar(30),@retailerEmail varchAR(50),
@password varchar(20), @retailerMobile varchar(50), @CreationDateTime datetime, @LastModifiedDateTime datetime)
AS 
BEGIN
	begin try
		if @retailerName =''
		throw 500010,'Retailer Name Is Must',1;
		if @retailerEmail =''
		throw 500013,'Retailer Email Is Must',1;
		if @retailerMobile =''
		throw 500014,'Retailer Mobile Is Must',1;
		if exists (select RetailerEmail from Retailers where RetailerEmail = @retailerEmail)
		throw 500011,'Email Already Exist',1;
		if exists (select RetailerMobile from Retailers where RetailerMobile = @retailerMobile)
		throw 500012,'Mobile No. Already Exist',1;
		insert into GreatOutdoor.Retailers values(@retailerID, @retailerName,@retailerEmail,@password,@retailerMobile,@CreationDateTime,@LastModifiedDateTime);
		end try
	begin Catch
		throw; ---500000,'Retailer Not Added',1
	end catch	
END


--Procedure to Update Retailer
--It Takes retailer Object as Input
alter procedure GreatOutdoor.UpdateRetailer(@retailerID varchar(30), @retailerName varchar(30),@retailerEmail varchAR(50),
@password varchar(20), @retailerMobile varchar(50), @CreationDateTime datetime, @LastModifiedDateTime datetime)
AS 
BEGIN
	begin try
		if exists (select RetailerEmail from Retailers where RetailerEmail = @retailerEmail)
		throw 500011,'Email Already Exist',1;
		if @retailerName =''
		throw 500010,'Retailer Name Is Must',1;
		if @retailerEmail =''
		throw 500013,'Retailer Email Is Must',1;
		if @retailerMobile =''
		throw 500014,'Retailer Mobile Is Must',1;
		if exists (select RetailerEmail from Retailers where RetailerEmail = @retailerEmail)
		throw 500011,'Email Already Exist',1;
		if exists (select RetailerMobile from Retailers where RetailerMobile = @retailerMobile)
		throw 500012,'Mobile No. Already Exist',1;
		update GreatOutdoor.Retailers set RetailerName= @retailerName,RetailerEmail=@retailerEmail,password= @password, RetailerMobile =@retailerMobile,LastModifiedDateTime =@LastModifiedDateTime
		where RetailerID= @retailerID
	end try
	begin Catch
		throw 500000,'Retailer Not Updated',1
	end catch	
END

--Procedure to Delete Retailer 
-- Takes Retailer ID as input
CREATE procedure GreatOutdoor.DeleteRetailer(@retailerID varchar(50) )
AS 
BEGIN
begin try
Delete from GreatOutdoor.Reailers where RetailerID= @retailerID
end try
begin Catch
throw 500000,'Retailer Not Deleted',1
end catch	
END

--Update Password of Retailer
--Take Reailer Object as Input
CREATE procedure GreatOutdoor.UpdatePassword(@retailerID varchar(30), @retailerName varchar(30),@retailerEmail varchAR(30),
@password varchar(20), @retailerMobile varchar(50), @CreationDateTime datetime, @LastModifiedDateTime datetime)
AS 
BEGIN
begin try
update GreatOutdoor.Retailers set password= @password,LastModifiedDateTime =@LastModifiedDateTime
where RetailerID= @retailerID
end try
begin Catch
throw 500000,'Retailer Not Updated',1
end catch	
END

--Get Retailer By retailerID
-- Takes retailer ID as input
CREATE procedure GreatOutdoor.GetReatilerByReatilerID(@retailerID varchar(30))
AS
BEGIN
begin try
select * from GreatOutdoor.Retailers where RetailerID=@retailerID
end try
begin catch
throw 500021,'RetailerID does not Exist',1
end catch
END

-- Procedure For selecting Reailer by Email
--Takes Email As Input
CREATE procedure GreatOutdoor.GetReatilerByEmail(@retailerEmail varchar(30))
AS
BEGIN
begin try
select * from GreatOutdoor.Retailers where RetailerEmail=@retailerEmail
end try
begin catch
throw 500021,'Retailer Email does not Exist',1
end catch
END

--Procedure for Select Retailer By EmailId and PassWord
--Takes Email and Password as Input
CREATE procedure GreatOutdoor.GetReatilerByEmailAndPassword(@retailerEmail varchar(30), @password varchar(30))
AS
BEGIN
begin try
select * from GreatOutdoor.Retailers where RetailerEmail=@retailerEmail and Password = @password
end try
begin catch
throw 500021,'Retailer Email and Password Invalid',1
end catch
END

--Get Reatiler By Name
--Take Name as Input
CREATE  procedure GreatOutdoor.GetReatilerByName(@retailerName varchar(30))
AS
BEGIN
begin try
select * from GreatOutdoor.Retailers where RetailerName=@retailerName
end try
begin catch
throw 500021,'RetailerID does not Exist',1
end catch
END

