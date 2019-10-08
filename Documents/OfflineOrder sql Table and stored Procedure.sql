--Developed by Abhishek

--CREATE DATABASE GreatOutdoors
--Go
Use GreatOutdoors
Go
CREATE SCHEMA OfflineOrder 
Go
-- Creating table for OfflineOrder class




CREATE TABLE OfflineOrder.OfflineOrders
(
OfflineOrderID varchar(30)  NOT NULL CONSTRAINT PK_OfflineOrderID Primary key,
RetailerID varchar(30) NOT NULL,
SalesPersonID varchar(30) NOT NULL,
TotalOfflineOrderAmount float NOT NULL,
TotalQuantity float NOT NULL,
OfflineOrderNumber int NOT NULL,
CreationDateTime DATETIME NOT NULL,
LastModifiedDateTime DATETIME NOT NULL)

GO

--Creating Procedures for Adding Offline Order
Create Procedure AddOfflineOrder(@retailerID varchar(30),@salesPersonID varchar(30), @totalOrderAmount float, @totalQuantity float)

as 
begin

if @retailerID is null OR @retailerID = ''
   throw 50001, 'Invalid Retailer ID', 2

if @salesPersonID is null OR @salesPersonID = ''
   throw 50002, 'Invalid SalesPerson ID', 3

if @totalOrderAmount < 1
   throw 50003, 'Total Order Amount cannot be negative', 4

if @totalQuantity < 1
   throw 50004, 'Total Quantity cannot be negative', 5

Declare @offlineOrderID varchar(36) , @CreationDateTime DateTime , @LastModifiedDateTime DateTime 
set @offlineOrderID = Cast(newid() as varchar(36))
Set @CreationDateTime = SYSDATETIME()
Set @LastModifiedDateTime = SYSDATETIME()


Insert into  OfflineOrder.OfflineOrders(OfflineOrderID, RetailerID, SalesPersonID, TotalOfflineOrderAmount,
				TotalQuantity,CreationDateTime,LastModifiedDateTime) 
  
   values(@offlineOrderID, @retailerID, @salesPersonID, @totalOrderAmount,
				@totalQuantity,@CreationDateTime,@LastModifiedDateTime)

end
GO


Create Procedure DeleteOfflineOrder(@OfflineOrderid VARCHAR(30))
AS
BEGIN
   begin try
		Delete from OfflineOrder.OfflineOrders where OfflineOrderID = @OfflineOrderid
   end try
   begin catch
		PRINT @@ERROR;
	    throw 5000, 'Invalid Values fatched',5
	    return 0
   end catch
end

Go
--created Update Procedure

Create Procedure UpdateOfflineOrder(@OfflineOrderid VARCHAR(30), @totalOrderAmount float, @totalQuantity float)
AS
BEGIN
   begin try
   Update OfflineOrder.OfflineOrders set TotalOfflineOrderAmount =@totalOrderAmount,TotalQuantity = @totalQuantity  Where   OfflineOrderID = @OfflineOrderid
   end try
   begin catch
      PRINT @@ERROR;
	  throw 5000, 'Invalid Values fatched',6
	  return 0
   end catch
end
Go
--created procedure

Create Procedure GetOfflineOrderByOfflineOrderID(@OfflinerOrderid VARCHAR(30))
AS
BEGIN
   begin try
   select * from OfflineOrder.OfflineOrders where OfflineOrderID = @OfflinerOrderid
   end try
   begin catch
      PRINT @@ERROR;
	  throw 5000, 'Invalid Values fatched',2
	  return 0
   end catch
end
Go

Create Procedure GetOfflineOrderBySalesPersonID(@salespersonid VARCHAR(30))
AS
BEGIN
   begin try
   select * from OfflineOrder.OfflineOrders where SalesPersonID = @salespersonid
   end try
   begin catch
      PRINT @@ERROR;
	  throw 5000, 'Invalid Values fatched',2
	  return 0
   end catch
end
Go

Create Procedure GetOfflineOrderByRetailerID(@retailerid VARCHAR(30))
AS
BEGIN
   begin try
   select * from OfflineOrder.OfflineOrders where RetailerID = @retailerid
   end try
   begin catch
      PRINT @@ERROR;
	  throw 5000, 'Invalid Values fatched',2
	  return 0
   end catch
end
Go
 


