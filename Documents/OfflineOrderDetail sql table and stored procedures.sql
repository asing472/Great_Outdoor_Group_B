Use GreatOutdoors
GO

--Offline OfflineOrder Detail table creation
CREATE TABLE OfflineOrder.OfflineOrderDetails(
OfflineOrderDetailID varchar(30) NOT NULL CONSTRAINT PK_OfflineOrderDetailID Primary key,
ProductID varchar(30) NOT NULL,
ProductName varchar(30),
Quantity float,
UnitPrice float,
TotalPrice float,
CreationDateTime DATETIME NOT NULL,
LastModifiedDateTime DATETIME NOT NULL,
OfflineOrderID varchar(30) NOT NULL CONSTRAINT FK_OfflineOrders_OfflineOrderID REFERENCES OfflineOrder.OfflineOrders(OfflineOrderID))

GO
Create Procedure AddOfflineOrderDetail(@offlineOrderID varchar(30),@productID varchar(30),@productName varchar(30), @Quantity float, @unitPrice float,@totalPrice float)

as 
begin

if @productID is null OR @productID = ''
   throw 50001, 'Invalid product ID', 1

if @ProductName is null OR @productName = ''
   throw 50002, 'Invalid Product Name', 2

if @Quantity < 1
   throw 50003, 'Total Order Amount cannot be negative', 3

if @unitPrice< 1
   throw 50004, 'Total Quantity cannot be negative', 4

if @totalPrice< 1
   throw 50005, 'Total Quantity cannot be negative', 5

if @offlineOrderID is null OR @offlineOrderID = ''
   throw 50006, 'Invalid OfflineOrder ID', 6

Declare @offlineOrderDetailID varchar(36) , @CreationDateTime DateTime , @LastModifiedDateTime DateTime 
set @offlineOrderDetailID = Cast(newid() as varchar(36))
Set @CreationDateTime = SYSDATETIME()
Set @LastModifiedDateTime = SYSDATETIME()
Set @totalPrice = @Quantity * @unitPrice


Insert into  OfflineOrder.OfflineOrderDetails(OfflineOrderDetailID, ProductID, OfflineOrderID, TotalPrice,UnitPrice,
				Quantity,CreationDateTime,LastModifiedDateTime) 
  
   values(@offlineOrderDetailID, @productID, @offlineOrderID, @totalPrice,@unitPrice,
				@Quantity,@CreationDateTime,@LastModifiedDateTime)

end

Go

Create Procedure DeleteOfflineOrderDetail(@OfflineOrderdetailid VARCHAR(30))
AS
BEGIN
   begin try
		Delete from OfflineOrder.OfflineOrderDetails where OfflineOrderDetailID = @OfflineOrderdetailid
   end try
   begin catch
		PRINT @@ERROR;
	    throw 50000, 'Invalid Values fatched',5
	    return 0
   end catch
end

Go
--created Update Procedure

Create Procedure UpdateOfflineOrderDetail(@OfflineOrderDetailid VARCHAR(30), @totalprice float, @Quantity float)
AS
BEGIN
   begin try
   Declare @lastmodifiedDate DateTime
   set    @lastmodifiedDate= SYSDATETIME()
   Update OfflineOrder.OfflineOrderDetails set Quantity =@Quantity, TotalPrice = @totalprice, LastModifiedDateTime =@lastmodifiedDate
     Where   OfflineOrderDetailID = @OfflineOrderdetailid
   end try
   begin catch
      PRINT @@ERROR;
	  throw 50000, 'Invalid Values fatched',1
	  return 0
   end catch
end
Go

Create Procedure GetOfflineOrderDetailByOfflineOrderDetailID(@OfflinerOrderdetailid VARCHAR(30))
AS
BEGIN
   begin try
   select * from OfflineOrder.OfflineOrderDetails where OfflineOrderDetailID = @OfflinerOrderdetailid
   end try
   begin catch
      PRINT @@ERROR;
	  throw 5000, 'Invalid Values fatched',2
	  return 0
   end catch
end
Go
Create Procedure GetOfflineOrderDetailByOfflineOrderID(@OfflinerOrderid VARCHAR(30))
AS
BEGIN
   begin try
   select * from OfflineOrder.OfflineOrderDetails where OfflineOrderID = @OfflinerOrderid
   end try
   begin catch
      PRINT @@ERROR;
	  throw 5000, 'Invalid Values fatched',2
	  return 0
   end catch
end
Go

