Use GreatOutdoors

Create Table OfflineOrder.OfflineReturns
(
 OfflineReturn_ID varchar(30) CONSTRAINT PK_OfflineReturn Primary key,
 Purpose varchar(30) NOT NULL,
 QuantityOfReturn int NOT NULL,
 OfflineOrder_ID varchar(30) NOT NULL CONSTRAINT FK1_OfflineOrders_OfflineOrderID REFERENCES OfflineOrder.OfflineOrders(OfflineOrderID),
 Product_ID varchar(30) NOT NULL, 
 ReturnAmount int NOT NULL,
 Unit_Price Decimal NOT NULL,
 CreationDateTime datetime,
 LastModifiedDateTime datetime,
   
)
GO
Create Procedure AddOfflineReturn(@offlineOrderid varchar(30), 
@returnamount int, @unitprice int, @productid varchar(30), 
@purpose varchar(30), @quantityofreturn int)
as
Begin
    
   
   if @offlineOrderid is null OR @offlineOrderid = ''
   throw 5001, 'Invalid offlineofflineOfflineOrder ID', 2
   
   if @productid is null OR @productid = ''
   throw 5001, 'Invalid Product ID', 3
   
    if @returnamount <1
   throw 5001, 'Invalid Return Amount', 4
   
   if @unitprice <1
   throw 5001, 'Invalid Unit Price', 5
   
   if @quantityofreturn <1
   throw 5001, 'Quantity Of Return is 0', 7
   
   if @purpose is null OR @purpose = ''
   throw 5001, 'Purpose Not Selected', 8

  Declare @offlinereturnID varchar(36) , @CreationDateTime DateTime , @LastModifiedDateTime DateTime 
set @offlinereturnID= Cast(newid() as varchar(36))
Set @CreationDateTime = SYSDATETIME()
Set @LastModifiedDateTime = SYSDATETIME()
   
   Insert into  OfflineOrder.OfflineReturns(OfflineReturn_ID, offlineOrder_ID, Product_ID, Purpose, 
   QuantityOfReturn, LastModifiedDateTime, CreationDateTime, Unit_Price, ReturnAmount)
   values(@offlinereturnID, @offlineOrderid, @productid, @purpose, @quantityofreturn,
   @LastModifiedDateTime,@CreationDateTime, @unitprice, @returnamount)
end

--created procedure

--Exec Users.AddOfflineReturns '20','30', 20,20,'55','r3', 'defective', 1,'1-oct-2019'
Go

Create Procedure GetOfflineReturnByOfflineReturnID(@Offlinereturnid VARCHAR(30))
AS
BEGIN
   begin try
   select * from OfflineOrder.OfflineReturns where OfflineReturn_ID = @Offlinereturnid
   end try
   begin catch
      PRINT @@ERROR;
	  throw 5000, 'Invalid Values fatched',2
	  return 0
   end catch
end
Go
--created procedure

Create Procedure GetOfflineReturnsByPurpose(@purpose VARCHAR(50))
AS
BEGIN
   begin try
   select * from OfflineOrder.OfflineReturns where Purpose = @purpose
   end try
   begin catch
      PRINT @@ERROR;
	  throw 5000, 'Invalid Values fatched',3
	  return 0
   end catch
end
Go
--created procedure


   
Create Procedure DeleteOfflineReturn(@Offlinereturnid VARCHAR(30))
AS
BEGIN
   begin try
   Delete from OfflineOrder.OfflineReturns where OfflineReturn_ID = @Offlinereturnid
   end try
   begin catch
      PRINT @@ERROR;
	  throw 5000, 'Invalid Values fatched',5
	  return 0
   end catch
end
Go
--created procedure

Create Procedure UpdateOfflineReturn(@Offlinereturnid VARCHAR(30), @purpose varchar(50), @quantityofreturn int)
AS
BEGIN
   begin try
   Update OfflineOrder.OfflineReturns set QuantityOfReturn =@quantityofreturn,Purpose=@purpose  Where   OfflineReturn_ID = @Offlinereturnid
   end try
   begin catch
      PRINT @@ERROR;
	  throw 5000, 'Invalid Values fatched',6
	  return 0
   end catch
end
Go
--created procedure

Create Procedure GetAllOfflineReturns(@Offlinereturnid varchar(30))
AS
BEGIN
   begin try
   select * from OfflineOrder.OfflineReturns 
   end try
   begin catch
      PRINT @@ERROR;
	  throw 5000, 'Invalid Values fatched',7
	  return 0
   end catch
end
Go
--created procedure