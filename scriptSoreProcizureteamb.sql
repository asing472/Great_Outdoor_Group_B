USE [13th Aug CLoud PT Immersive]
GO
/****** Object:  StoredProcedure [TeamB].[AddAddress]    Script Date: 06-11-2019 10:34:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE procedure [TeamB].[AddAddress](@addressID uniqueidentifier, @addressLine1 varchar(30),@addressLine2 varchAR(50),
@landmark varchar(20), @city varchar(20),@state varchar(20), @pinCode varchar(20),@retailerID uniqueidentifier, @CreationDateTime datetime, @LastModifiedDateTime datetime)
AS 
  BEGIN
	begin try
		insert into TeamB.Addresses values(@addressID, @addressLine1,@addressLine2,@landmark,@city,@state,@pinCode,@retailerID,@CreationDateTime,@LastModifiedDateTime)
		select @@ROWCOUNT
	end try
	begin Catch
		throw 500000,'Address Not Added',1
	end catch	
  END
GO
/****** Object:  StoredProcedure [TeamB].[AddOfflineOrder]    Script Date: 06-11-2019 10:34:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [TeamB].[AddOfflineOrder]( @offlineOrderID uniqueidentifier,@retailerID uniqueidentifier,@salesPersonID uniqueidentifier, @totalOrderAmount money, @totalQuantity int)

as
begin

if @retailerID is null 
   throw 50001, 'Invalid Retailer ID', 2

if @salesPersonID is null 
   throw 50002, 'Invalid SalesPerson ID', 3

if @totalOrderAmount < 0
   throw 50003, 'Total Order Amount cannot be negative', 4

if @totalQuantity < 0
   throw 50004, 'Total Quantity cannot be negative', 5

Declare @CreationDateTime DateTime , @LastModifiedDateTime DateTime

Set @CreationDateTime = SYSDATETIME()
Set @LastModifiedDateTime = SYSDATETIME()


Insert into  TeamB.OfflineOrders(OfflineOrderID, RetailerID, SalesPersonID, TotalOrderAmount,
   TotalQuantity,CreationDateTime,LastModifiedDateTime)
 
   values(@offlineOrderID, @retailerID, @salesPersonID, @totalOrderAmount,
   @totalQuantity,@CreationDateTime,@LastModifiedDateTime)

end

GO
/****** Object:  StoredProcedure [TeamB].[AddOfflineOrderDetail]    Script Date: 06-11-2019 10:34:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [TeamB].[AddOfflineOrderDetail](@offlineOrderDetailID uniqueidentifier,@offlineOrderID uniqueidentifier,@productID uniqueidentifier,@productName varchar(30), @Quantity int, @unitPrice money,@totalPrice money)

as
begin

if @productID is null 
   throw 50001, 'Invalid product ID', 1

if @ProductName is null 
   throw 50002, 'Invalid Product Name', 2

if @Quantity < 1
   throw 50003, 'Total Order Amount cannot be negative', 3

if @unitPrice< 1
   throw 50004, 'Total Quantity cannot be negative', 4

if @totalPrice< 1
   throw 50005, 'Total Quantity cannot be negative', 5

if @offlineOrderID is null 
   throw 50006, 'Invalid OfflineOrder ID', 6

Declare  @CreationDateTime DateTime , @LastModifiedDateTime DateTime

Set @CreationDateTime = SYSDATETIME()
Set @LastModifiedDateTime = SYSDATETIME()
Set @totalPrice = @Quantity * @unitPrice


Insert into  TeamB.OfflineOrderDetails(OfflineOrderDetailID, ProductID,ProductName ,OfflineOrderID, TotalPrice,UnitPrice,
   Quantity,CreationDateTime,LastModifiedDateTime)
 
   values(@offlineOrderDetailID, @productID, @productName,@offlineOrderID, @totalPrice,@unitPrice,
   @Quantity,@CreationDateTime,@LastModifiedDateTime)

end


GO
/****** Object:  StoredProcedure [TeamB].[AddOnlineReturn]    Script Date: 06-11-2019 10:34:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 CREATE Procedure [TeamB].[AddOnlineReturn](@onlineReturnID uniqueidentifier,@orderID uniqueidentifier,@productID uniqueidentifier,
 @retailerID uniqueidentifier,@orderNumber int,@productNumber int, @totalAmount money, @productPrice money, 
@purpose varchar(40), @quantityOfReturn int,@lastModifiedDateTime datetime, @creationDateTime datetime)
as
Begin
   begin Try
    
   if @onlineReturnID is null 
   throw 50001, 'Invalid Online Return ID', 1
   if @orderNumber is null 
   throw 50001, 'Invalid Order Number', 2
   if @productNumber is null 
   throw 50001, 'Invalid Product Number', 3
   if @retailerID is null 
   throw 50001, 'Invalid Retailer ID', 4
  
   
   if @quantityOfReturn = 0
   throw 50001, 'Quantity Of Return is 0', 7
   if @purpose is null 
   throw 50001, 'Purpose Not Selected', 8
    if @orderID is null
   throw 50001, 'Invalid Order ID', 1
    if @productID is null 
   throw 50001, 'Invalid product ID', 1
     Insert into TeamB.OnlineReturns(OnlineReturnID, OrderID, ProductID, RetailerID, 
	 OrderNumber, ProductNumber,TotalAmount, ProductPrice, Purpose, 
   QuantityOfReturn, LastModifiedDateTime, CreationDateTime)
        values(@onlineReturnID,@orderID,@productID,@retailerID, @orderNumber, @productNumber,
		@totalAmount, @productPrice, @purpose, @quantityOfReturn, @lastModifiedDateTime, @creationDateTime)
		return @@ROWCOUNT
   end try
   begin catch 
      throw;
   end catch
end

GO
/****** Object:  StoredProcedure [TeamB].[AddOrder]    Script Date: 06-11-2019 10:34:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [TeamB].[AddOrder](@orderId uniqueidentifier, @retailerId uniqueidentifier, @dateOfOrder datetime, @totalQuantity int, @orderAmount money, @lastModifiedDate datetime)
as
 begin
	
	if @retailerID is null 
			   throw 50001, 'Invalid Retailer ID', 2

	if @orderAmount < 1
			   throw 50003, 'Total Order Amount cannot be negative', 4
	
	if @totalQuantity < 1
			   throw 50004, 'Total Quantity cannot be negative', 5

insert into TeamB.Orders(OrderID, RetailerID, DateOfOrder, TotalQuantity, OrderAmount, LastModifiedDateTime) values (@orderId, @retailerId, @dateOfOrder, @totalQuantity, @orderAmount, @lastModifiedDate)			
 return @@ROWCOUNT
end

GO
/****** Object:  StoredProcedure [TeamB].[AddOrderDetails]    Script Date: 06-11-2019 10:34:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [TeamB].[AddOrderDetails](@productName varchar(30), @orderId uniqueidentifier,@orderDetailID uniqueidentifier, @productId uniqueidentifier,  @productQuantityOrdered int, @productPrice money, @addressId uniqueidentifier, @totalAmount money, @dateOfOrder datetime, @lastModifiedDate datetime)
as
 begin
	if @productID is null 
	   throw 50001, 'Invalid product ID', 1

	if @productQuantityOrdered < 1
	   throw 50002, 'Total Order Amount cannot be negative', 3

	if @productPrice< 1
	   throw 50003, 'Total Quantity cannot be negative', 4

	if @totalAmount< 1
	   throw 50004, 'Total Quantity cannot be negative', 5

	if @orderDetailID is null 
	   throw 50005, 'Invalid OfflineOrder ID', 6

	if @addressId is null 
	   throw 50006, 'Invalid Address ID', 6

insert into TeamB.OrderDetails (ProductName,OrderID, OrderDetailID, ProductID, ProductQuantityOrdered, ProductPrice, AddressID, TotalAmount, DateOfOrder, LastModifiedDateTime ) values (@productName,@orderId, @orderDetailId, @productId, @productQuantityOrdered, @productPrice, @addressId, @totalAmount, @dateOfOrder, @lastModifiedDate)
	return @@ROWCOUNT
 end

GO
/****** Object:  StoredProcedure [TeamB].[AddProduct]    Script Date: 06-11-2019 10:34:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [TeamB].[AddProduct] (@ProductID uniqueidentifier,@ProductName varchar(15), @ProductCategory varchar(25),
 @ProductColor varchar(30), @ProductSize varchar(15), @ProductMaterial varchar(30),@ProductPrice money )

as
BEGIN

	begin try
		 declare @ProductNumber int
		set @ProductNumber= isnull((select max(ProductNumber) from TeamB.Product),0)+1
		insert into TeamB.Product values
		(@ProductID,@ProductName,@ProductNumber,@ProductCategory,@ProductColor,@ProductSize,@ProductMaterial,@ProductPrice,sysdatetime(),sysdatetime())

	end try

	begin catch 

		throw 500000, 'Product not added',1

	end catch

END
GO
/****** Object:  StoredProcedure [TeamB].[AddRetailer]    Script Date: 06-11-2019 10:34:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [TeamB].[AddRetailer](@retailerID uniqueidentifier, @retailerName varchar(30),@retailerEmail varchAR(50),
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
		insert into TeamB.Retailers values(@retailerID, @retailerName,@retailerEmail,@password,@retailerMobile,@CreationDateTime,@LastModifiedDateTime);
		select @@ROWCOUNT
	end try
	begin Catch
		throw; ---500000,'Retailer Not Added',1
	end catch	
  END
GO
/****** Object:  StoredProcedure [TeamB].[AddSalesPerson]    Script Date: 06-11-2019 10:34:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [TeamB].[AddSalesPerson](@salesPersonID uniqueidentifier, @salesPersonName varchar(30),@Email varchAR(50),
@password varchar(20), @salesPersonMobile varchar(50), @CreationDateTime datetime, @LastModifiedDateTime datetime )
AS 
  BEGIN
	begin try
		if @salesPersonName =''
		  throw 500010,'SalesPerson Name Is Must',1;
		if @Email =''
		  throw 500013,'SalesPerson Email Is Must',1;
		if @salesPersonMobile =''
		  throw 500014,'SalesPerson Mobile Is Must',1;
		if exists (select Email from SalesPersons where Email = @Email)
		  throw 500011,'Email Already Exist',1;
		if exists (select SalesPersonMobile from SalesPersons where SalesPersonMobile = @salesPersonMobile)
		  throw 500012,'Mobile No. Already Exist',1;
		insert into TeamB.SalesPersons values(@salesPersonID, @salesPersonName,@Email,@password,@salesPersonMobile,@CreationDateTime,@LastModifiedDateTime);
		select @@ROWCOUNT
	end try
	begin Catch
		throw; ---500000,'SalesPerson Not Added',1
	end catch	
  END
GO
/****** Object:  StoredProcedure [TeamB].[DeleteAddress]    Script Date: 06-11-2019 10:34:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [TeamB].[DeleteAddress](@addressID uniqueidentifier)
AS
  BEGIN
	begin try
		Delete From TeamB.Addresses where AddressID = @addressID
	end try
	begin catch
		throw 500010,'Address Not Deleted',1
	end catch
  END
GO
/****** Object:  StoredProcedure [TeamB].[DeleteOfflineOrder]    Script Date: 06-11-2019 10:34:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------------------------------------------------
--Creating Procedures for Delete Offline Order

CREATE Procedure [TeamB].[DeleteOfflineOrder](@offlineOrderid uniqueidentifier)
AS
BEGIN
   begin try
 Delete from TeamB.OfflineOrders where OfflineOrderID = @offlineOrderid
   end try
   begin catch
 PRINT @@ERROR;
    throw 50000, 'Invalid Values fetched',5
    return 0
   end catch
end


GO
/****** Object:  StoredProcedure [TeamB].[DeleteOfflineOrderDetail]    Script Date: 06-11-2019 10:34:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------------------------------------------------

--Created procedure for deleting offline order detail

CREATE Procedure [TeamB].[DeleteOfflineOrderDetail](@offlineOrderDetailID uniqueidentifier)
AS
BEGIN
   begin try
 Delete from TeamB.OfflineOrderDetails where OfflineOrderDetailID = @offlineOrderDetailID
   end try
   begin catch
 PRINT @@ERROR;
    throw 50000, 'Invalid Values fetched',5
    return 0
   end catch
end


GO
/****** Object:  StoredProcedure [TeamB].[DeleteOnlineReturn]    Script Date: 06-11-2019 10:34:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [TeamB].[DeleteOnlineReturn](@onlineReturnID uniqueidentifier)
AS
BEGIN
   begin try
   Delete from TeamB.OnlineReturns where OnlineReturnID = @onlineReturnID
   select @@ROWCOUNT
   end try
   begin catch
   PRINT @@ERROR;
	  throw 5000, 'Invalid Values fatched',5
   
   end catch
end

GO
/****** Object:  StoredProcedure [TeamB].[DeleteOrder]    Script Date: 06-11-2019 10:34:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [TeamB].[DeleteOrder](@orderId uniqueidentifier)
as
 begin
	begin try
		delete from TeamB.Orders where OrderID=@orderId
		delete from TeamB.OrderDetails where OrderID=@orderId
	end try
	begin catch
		PRINT @@ERROR;
	    throw 50000, 'Invalid Values',5
	    return 0
	end catch
 end
 return @@ROWCOUNT

GO
/****** Object:  StoredProcedure [TeamB].[DeleteOrderDetails]    Script Date: 06-11-2019 10:34:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--stored procedure to delete a orderdetail from orderdetails table

CREATE procedure [TeamB].[DeleteOrderDetails](@orderdetailid uniqueidentifier)
as
 begin
	begin try
		delete from TeamB.OrderDetails where OrderDetailID=@orderdetailid
	end try
	begin catch
		throw 500000,'Invalid Orderdetails Id',1
	end catch
 end
 return @@ROWCOUNT

GO
/****** Object:  StoredProcedure [TeamB].[DeleteProduct]    Script Date: 06-11-2019 10:34:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [TeamB].[DeleteProduct](@ProductID uniqueidentifier)
as 
BEGIN
begin try
	if exists(select ProductID from TeamB.Product where ProductID = @ProductID) 
		delete from TeamB.Product where ProductID = @ProductID
	else
		throw 500002, 'Product does not exist',1 
end try
begin catch
	throw 500003,'Unable to delete product, as product is already in use in some other table',1
end catch
END
GO
/****** Object:  StoredProcedure [TeamB].[DeleteRetailer]    Script Date: 06-11-2019 10:34:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [TeamB].[DeleteRetailer](@retailerID uniqueidentifier )
AS 
  BEGIN
	begin try 
		Delete from TeamB.Retailers where RetailerID= @retailerID
		
	end try
	begin Catch
		throw 500000,'Retailer Not Deleted',1
	end catch	
END
GO
/****** Object:  StoredProcedure [TeamB].[DeleteSalesPerson]    Script Date: 06-11-2019 10:34:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 Create procedure [TeamB].[DeleteSalesPerson](@salesPersonID uniqueidentifier )
AS 
  BEGIN
	begin try 
		Delete from TeamB.SalesPerson where SalesPersonID= @salesPersonID
		select @@ROWCOUNT
	end try
	begin Catch
		throw 500000,'SalesPerson Not Deleted',1
	end catch	
END

GO
/****** Object:  StoredProcedure [TeamB].[GetAddressesByAddressID]    Script Date: 06-11-2019 10:34:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [TeamB].[GetAddressesByAddressID](@addressID uniqueidentifier)
AS
  BEGIN
	begin try
		Select *From TeamB.Addresses where AddressID = @addressID
	end try
	begin catch
		throw 500010,'Address Id Does Not Exist',1
	end catch
  END
GO
/****** Object:  StoredProcedure [TeamB].[GetAddressesByRetailerID]    Script Date: 06-11-2019 10:34:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE procedure [TeamB].[GetAddressesByRetailerID](@retailerID uniqueidentifier)
AS
  BEGIN
	begin try
		Select *From TeamB.Addresses where RetailerID = @retailerID
	end try
	begin catch
		throw 500010,'Invalid Retailer ID',1
	end catch
  END
GO
/****** Object:  StoredProcedure [TeamB].[GetAdminbyEmail]    Script Date: 06-11-2019 10:34:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [TeamB].[GetAdminbyEmail](@Email varchar(30))
as 
 begin
	begin try
		SELECT* FROM TeamB.AdminTable where Email=@Email
	end try
	begin catch
		PRINT @@ERROR;
		throw 5001,'Invalid Values Fetched',6
		return 0
    end catch
 end

GO
/****** Object:  StoredProcedure [TeamB].[GetAdminbyEmailAndPassword]    Script Date: 06-11-2019 10:34:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [TeamB].[GetAdminbyEmailAndPassword](@Email varchar(30),@Password varchar(15))
as 
 begin
	begin try
		SELECT* FROM TeamB.Admin where Email=@Email and Password=@Password
	end try
	begin catch
		PRINT @@ERROR;
		throw 5001,'Invalid Values Fetched',6
		return 0
    end catch
 end
GO
/****** Object:  StoredProcedure [TeamB].[GetAllAddress]    Script Date: 06-11-2019 10:34:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [TeamB].[GetAllAddress]
AS 
  BEGIN
	begin try 
		Select * from TeamB.Addresses
	end try
	begin Catch
		throw 500000,'Address Does not exist',1
	end catch	
END

GO
/****** Object:  StoredProcedure [TeamB].[GetAllOfflineOrder]    Script Date: 06-11-2019 10:34:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [TeamB].[GetAllOfflineOrder]
AS
BEGIN
   begin try
   select * from TeamB.OfflineOrder 
   end try
   begin catch
      PRINT @@ERROR;
  throw 50000, 'Invalid Values fetched',2
  return 0
   end catch
end

GO
/****** Object:  StoredProcedure [TeamB].[GetAllOfflineOrderDetails]    Script Date: 06-11-2019 10:34:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [TeamB].[GetAllOfflineOrderDetails]
AS
BEGIN
   begin try
   select * from TeamB.OfflineOrderDetails 
   end try
   begin catch
      PRINT @@ERROR;
  throw 50000, 'Invalid Values fetched',2
  return 0
   end catch
end

GO
/****** Object:  StoredProcedure [TeamB].[GetAllOnlineReturns]    Script Date: 06-11-2019 10:34:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [TeamB].[GetAllOnlineReturns]
AS
BEGIN
   begin try
   select * from TeamB.OnlineReturns 
   end try
   begin catch
   PRINT @@ERROR;
	  throw 5000, 'Invalid Values fatched',7
	 
   end catch
end

GO
/****** Object:  StoredProcedure [TeamB].[GetAllOrders]    Script Date: 06-11-2019 10:34:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [TeamB].[GetAllOrders]
 as
 begin
 select * from TeamB.Orders
 end 

GO
/****** Object:  StoredProcedure [TeamB].[GetAllProducts]    Script Date: 06-11-2019 10:34:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [TeamB].[GetAllProducts]

as
BEGIN

	Select * from TeamB.Product

END
GO
/****** Object:  StoredProcedure [TeamB].[GetAllRetailer]    Script Date: 06-11-2019 10:34:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [TeamB].[GetAllRetailer]
AS 
  BEGIN
	begin try 
		Select * from TeamB.Retailers
	end try
	begin Catch
		throw 500000,'Retailer Does not exist',1
	end catch	
END
GO
/****** Object:  StoredProcedure [TeamB].[GetAllSalesPerson]    Script Date: 06-11-2019 10:34:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  procedure [TeamB].[GetAllSalesPerson]
AS
  BEGIN
	begin try
        	select * from TeamB.SalesPersons 
	end try
	begin catch
         	throw 500021,'SalesPerson does not Exist',9
	end catch
  END
GO
/****** Object:  StoredProcedure [TeamB].[GetOfflineOrderByOfflineOrderID]    Script Date: 06-11-2019 10:34:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------------------------------------------------
--Created procedure for getting offline order by orderid

CREATE Procedure [TeamB].[GetOfflineOrderByOfflineOrderID](@offlinerOrderid uniqueidentifier)
AS
BEGIN
   begin try
   select * from TeamB.OfflineOrders where OfflineOrderID = @offlinerOrderid
   end try
   begin catch
      PRINT @@ERROR;
  throw 50000, 'Invalid Values fetched',2
  return 0
   end catch
end

GO
/****** Object:  StoredProcedure [TeamB].[GetOfflineOrderByRetailerID]    Script Date: 06-11-2019 10:34:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------------------------------------------------
--Created procedure for getting offline order by retailerid

CREATE Procedure [TeamB].[GetOfflineOrderByRetailerID](@retailerID uniqueidentifier)
AS
BEGIN
   begin try
   select * from TeamB.OfflineOrders where RetailerID = @retailerID
   end try
   begin catch
      PRINT @@ERROR;
  throw 50000, 'Invalid Values fetched',2
  return 0
   end catch
end

GO
/****** Object:  StoredProcedure [TeamB].[GetOfflineOrderBySalesPersonID]    Script Date: 06-11-2019 10:34:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------------------------------------------------
--Created procedure for getting offline order by salespersonid

CREATE Procedure [TeamB].[GetOfflineOrderBySalesPersonID](@salesPersonID uniqueidentifier)
AS
BEGIN
   begin try
   select * from TeamB.OfflineOrders where SalesPersonID = @salesPersonID
   end try
   begin catch
      PRINT @@ERROR;
  throw 50000, 'Invalid Values fetched',2
  return 0
   end catch
end

GO
/****** Object:  StoredProcedure [TeamB].[GetOfflineOrderDetailByOfflineOrderDetailID]    Script Date: 06-11-2019 10:34:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------------------------------------------------
--Created procedure for getting offline order detail by offline order id

CREATE Procedure [TeamB].[GetOfflineOrderDetailByOfflineOrderDetailID](@offlinerOrderDetailID uniqueidentifier)
AS
BEGIN
   begin try
   select * from TeamB.OfflineOrderDetails where OfflineOrderDetailID = @offlinerOrderDetailID
   end try
   begin catch
      PRINT @@ERROR;
  throw 50000, 'Invalid Values fetched',2
  return 0
   end catch
end

GO
/****** Object:  StoredProcedure [TeamB].[GetOfflineOrderDetailByOfflineOrderID]    Script Date: 06-11-2019 10:34:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------------------------------------------------
--Created procedure for getting offline order detail by offline order id

CREATE Procedure [TeamB].[GetOfflineOrderDetailByOfflineOrderID](@offlinerOrderID uniqueidentifier)
AS
BEGIN
   begin try
   select * from TeamB.OfflineOrderDetails where OfflineOrderID = @offlinerOrderID
   end try
   begin catch
      PRINT @@ERROR;
  throw 50000, 'Invalid Values fetched',2
  return 0
   end catch
end

GO
/****** Object:  StoredProcedure [TeamB].[GetOnlineReturnByOnlineReturnID]    Script Date: 06-11-2019 10:34:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [TeamB].[GetOnlineReturnByOnlineReturnID](@onlineReturnID uniqueidentifier)
AS
BEGIN
   begin try
   select * from TeamB.OnlineReturns where OnlineReturnID = @onlineReturnID
   end try
   begin catch
   PRINT @@ERROR;
	  throw 5000, 'Invalid Values fatched',2
	  
   end catch
end

GO
/****** Object:  StoredProcedure [TeamB].[GetOnlineReturnByRetailerID]    Script Date: 06-11-2019 10:34:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [TeamB].[GetOnlineReturnByRetailerID](@retailerID uniqueidentifier)
AS
BEGIN
   begin try
   select * from TeamB.OnlineReturns where RetailerID = @retailerID
   end try
   begin catch
   PRINT @@ERROR;
	  throw 5000, 'Invalid Values fatched',4  
  
   end catch
end

GO
/****** Object:  StoredProcedure [TeamB].[GetOnlineReturnsByPurpose]    Script Date: 06-11-2019 10:34:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [TeamB].[GetOnlineReturnsByPurpose](@purpose VARCHAR(40))
AS
BEGIN
   begin try
   select * from TeamB.OnlineReturns where Purpose = @purpose
   end try
   begin catch
   PRINT @@ERROR;
	  throw 5000, 'Invalid Values fatched',3

   end catch
end

GO
/****** Object:  StoredProcedure [TeamB].[GetProductByProductID]    Script Date: 06-11-2019 10:34:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [TeamB].[GetProductByProductID](@ProductID uniqueidentifier)
as 
BEGIN
begin try
	if exists(select ProductID from TeamB.Product where ProductID = @ProductID) 
		select * from TeamB.Product where ProductID = @ProductID
	else
		throw 500002, 'Product does not exist',1 
end try
begin catch
	throw 500003, 'Unable to fetch product',1
end catch
END
GO
/****** Object:  StoredProcedure [TeamB].[GetProductByProductNumber]    Script Date: 06-11-2019 10:34:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [TeamB].[GetProductByProductNumber](@ProductNumber int)
as 
BEGIN
begin try
	if exists(select ProductNumber from TeamB.Product where ProductNumber = @ProductNumber) 
		select * from TeamB.Product where ProductNumber = @ProductNumber
	else
		throw 500002, 'Product does not exist',1 
end try
begin catch
	throw 500003, 'Unable to fetch product',1
end catch
END
GO
/****** Object:  StoredProcedure [TeamB].[GetProductsByProductCategory]    Script Date: 06-11-2019 10:34:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [TeamB].[GetProductsByProductCategory](@ProductCategory varchar(25))
as 
BEGIN
begin try
	select * from TeamB.Product where ProductCategory = @ProductCategory
end try
begin catch
	throw 500003, 'Unable to fetch products',1
end catch
END
GO
/****** Object:  StoredProcedure [TeamB].[GetProductsByProductName]    Script Date: 06-11-2019 10:34:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [TeamB].[GetProductsByProductName]( @ProductName varchar(15))
as 
BEGIN
begin try
	select * from TeamB.Product where ProductName = @ProductName
end try
begin catch
	throw 500003, 'Unable to fetch products',1
end catch
END
GO
/****** Object:  StoredProcedure [TeamB].[GetReatilerByEmail]    Script Date: 06-11-2019 10:34:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [TeamB].[GetReatilerByEmail](@retailerEmail varchar(30))
AS
  BEGIN
	begin try
		select * from TeamB.Retailers where RetailerEmail=@retailerEmail
	end try
	begin catch
		throw 500021,'Retailer Email does not Exist',1
	end catch
  END

GO
/****** Object:  StoredProcedure [TeamB].[GetReatilerByEmailAndPassword]    Script Date: 06-11-2019 10:34:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE procedure [TeamB].[GetReatilerByEmailAndPassword](@retailerEmail varchar(30), @password varchar(30))
AS
  BEGIN
	begin try
		select * from TeamB.Retailers where RetailerEmail=@retailerEmail and Password = @password
	end try
	begin catch
		throw 500021,'Retailer Email and Password Invalid',1
	end catch
  END
GO
/****** Object:  StoredProcedure [TeamB].[GetReatilerByName]    Script Date: 06-11-2019 10:34:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  procedure [TeamB].[GetReatilerByName](@retailerName varchar(30))
AS
  BEGIN
	begin try
		select * from TeamB.Retailers where RetailerName=@retailerName
	end try
	begin catch
		throw 500021,'RetailerID does not Exist',1
	end catch
  END

GO
/****** Object:  StoredProcedure [TeamB].[GetReatilerByReatilerID]    Script Date: 06-11-2019 10:34:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [TeamB].[GetReatilerByReatilerID](@retailerID uniqueidentifier)
AS
  BEGIN
	begin try
		select * from TeamB.Retailers where RetailerID=@retailerID
	end try
	begin catch
		throw 500021,'RetailerID does not Exist',1
	end catch
  END
GO
/****** Object:  StoredProcedure [TeamB].[GetSalesPersonByEmail]    Script Date: 06-11-2019 10:34:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE procedure [TeamB].[GetSalesPersonByEmail](@Email varchar(30))
AS
  BEGIN
	begin try
		select * from TeamB.SalesPersons where Email=@Email
	end try
	begin catch
		throw 500021,'SalesPerson Email does not Exist',1
	end catch
  END
GO
/****** Object:  StoredProcedure [TeamB].[GetSalesPersonByEmailAndPassword]    Script Date: 06-11-2019 10:34:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  Create procedure [TeamB].[GetSalesPersonByEmailAndPassword](@Email varchar(30), @password varchar(30))
AS
  BEGIN
	begin try
		select * from TeamB.SalesPersons where Email=@Email and Password = @password
	end try
	begin catch
		throw 500021,'SalesPerson Email and Password Invalid',1
	end catch
  END
GO
/****** Object:  StoredProcedure [TeamB].[GetSalesPersonByName]    Script Date: 06-11-2019 10:34:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE  procedure [TeamB].[GetSalesPersonByName](@salesPersonName varchar(30))
AS
  BEGIN
	begin try
		select * from TeamB.SalesPersons where SalesPersonName=@salesPersonName
	end try
	begin catch
		throw 500021,'SalesPersonID does not Exist',1
	end catch
  End
GO
/****** Object:  StoredProcedure [TeamB].[GetSalesPersonBySalesPersonID]    Script Date: 06-11-2019 10:34:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [TeamB].[GetSalesPersonBySalesPersonID](@salesPersonID uniqueidentifier)
AS
  BEGIN
	begin try
		select * from TeamB.SalesPersons where SalesPersonID=@salesPersonID
	end try
	begin catch
		throw 500021,'SalesPersonID does not Exist',1
	end catch
  END
GO
/****** Object:  StoredProcedure [TeamB].[UpdateAddress]    Script Date: 06-11-2019 10:34:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [TeamB].[UpdateAddress](@addressID uniqueidentifier, @addressLine1 varchar(30),@addressLine2 varchAR(50),
@landmark varchar(20), @city varchar(20),@state varchar(20), @pinCode varchar(20),@retailerID uniqueidentifier, @CreationDateTime datetime, @LastModifiedDateTime datetime)
AS 
  BEGIN
	begin try
		    update TeamB.Addresses set AddressLine1=@addressLine1,AddressLine2=@addressLine2,LandMark=@landmark,City=@city,State =@state,PinCode=@pinCode,RetailerID= @retailerID, LastModifiedDateTime=@LastModifiedDateTime where AddressID = @addressID
			select @@ROWCOUNT
	end try
	begin Catch
		throw 500000,'Address Not Updated',1
	end catch	
  END
GO
/****** Object:  StoredProcedure [TeamB].[UpdateAdmin]    Script Date: 06-11-2019 10:34:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [TeamB].[UpdateAdmin](@AdminID uniqueIdentifier, @AdminName varchar(30),@Email varchAR(30))​
AS ​
BEGIN​
	begin try​
		update TeamB.Admin set AdminName= @AdminName,Email=@Email,LastModifiedDateTime =getdate()
		where AdminID= @AdminID​
	end try​
	begin Catch​
		throw 500000,'Admin Not Updated',1​
	end catch ​
 END
GO
/****** Object:  StoredProcedure [TeamB].[UpdateAdminPassword]    Script Date: 06-11-2019 10:34:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [TeamB].[UpdateAdminPassword](@Email varchar(30),@NewPassword varchar(15))​
AS ​
 BEGIN​
	begin try​
		
		   update TeamB.Admin set Password=@NewPassword​,LastModifiedDateTime=getdate()
		   where Email=@Email
		
	end try​
	begin Catch​
		throw 500000,'Admin password Not Updated',1​
	end catch ​
 END
GO
/****** Object:  StoredProcedure [TeamB].[UpdateOfflineOrder]    Script Date: 06-11-2019 10:34:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [TeamB].[UpdateOfflineOrder](@offlineOrderid uniqueidentifier, @totalOrderAmount money, @totalQuantity int)
AS
BEGIN
   begin try
   Declare @LastModifiedDateTime DateTime
   Update TeamB.OfflineOrders set TotalOrderAmount =@totalOrderAmount,@LastModifiedDateTime = SYSDATETIME(),
TotalQuantity = @totalQuantity  Where   OfflineOrderID = @offlineOrderid
   end try
   begin catch
      PRINT @@ERROR;
  throw 50000, 'Invalid Values fetched',6
  return 0
   end catch
end

GO
/****** Object:  StoredProcedure [TeamB].[UpdateOfflineOrderDetail]    Script Date: 06-11-2019 10:34:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------------------------------------------------
--created Update offline order detail Procedure

CREATE Procedure [TeamB].[UpdateOfflineOrderDetail](@offlineOrderDetailID uniqueidentifier, @totalPrice money, @quantity int)
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
  throw 50000, 'Invalid Values fetched',1
  return 0
   end catch
end

GO
/****** Object:  StoredProcedure [TeamB].[UpdateOnlineReturn]    Script Date: 06-11-2019 10:34:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [TeamB].[UpdateOnlineReturn](@onlineReturnID uniqueidentifier,@orderID uniqueidentifier,@productID uniqueidentifier,
 @retailerID uniqueidentifier,@orderNumber int,@productNumber int, @totalAmount money, @productPrice money, 
@purpose varchar(40), @quantityOfReturn int,@lastModifiedDateTime datetime, @creationDateTime datetime)
AS
BEGIN
   begin try
   if @onlineReturnID is null 
   throw 50001, 'Invalid Online Return ID', 1
   if @orderNumber is null 
   throw 50001, 'Invalid Order Number', 2
   if @productNumber is null 
   throw 50001, 'Invalid Product Number', 3
   if @retailerID is null 
   throw 50001, 'Invalid Retailer ID', 4
   if @quantityOfReturn = 0
   throw 50001, 'Quantity Of Return is 0', 7
   if @purpose is null 
   throw 50001, 'Purpose Not Selected', 8
    if @orderID is null
   throw 50001, 'Invalid Order ID', 1
    if @productID is null 
   throw 50001, 'Invalid product ID', 1
   Update TeamB.OnlineReturns set QuantityOfReturn =@quantityOfReturn,Purpose=@purpose  Where   OnlineReturnID = @onlineReturnID
   select @@ROWCOUNT
   end try
   begin catch
   PRINT @@ERROR;
	  throw 5000, 'Invalid Values fatched',6
	
   end catch
end

GO
/****** Object:  StoredProcedure [TeamB].[UpdateOrder]    Script Date: 06-11-2019 10:34:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [TeamB].[UpdateOrder](@orderId uniqueidentifier, @totalQuantity int, @orderAmount money, @lastModifiedDate datetime)
as
 begin
	begin try
		 update TeamB.Orders
 		set
 			TotalQuantity=@totalQuantity,
  			OrderAmount=@orderAmount,
  			LastModifiedDateTime=@lastModifiedDate 		
  		where OrderID=@orderId
	end try
	begin catch
      PRINT @@ERROR;
	  throw 50000, 'Invalid Values',6
	  return 0
   end catch
	return @@ROWCOUNT
end

GO
/****** Object:  StoredProcedure [TeamB].[UpdateOrderDetails]    Script Date: 06-11-2019 10:34:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [TeamB].[UpdateOrderDetails](@orderDetailid uniqueidentifier, @productQuantityOrdered int, @addressId uniqueidentifier, @totalAmount money, @lastModifiedDate datetime)
as
 begin
 if @addressId is null 
	   throw 50006, 'Invalid Address ID', 6
if @orderDetailid is null 
	   throw 50007, 'Invalid OrderDetail ID', 7
 		update TeamB.OrderDetails
 		set
 		 ProductQuantityOrdered=@productQuantityOrdered,
 		 AddressId=@addressId,
  		 TotalAmount=@totalAmount,
  		 LastModifiedDateTime = @lastModifiedDate
		where OrderDetailID=@orderDetailid	
end
return @@ROWCOUNT

GO
/****** Object:  StoredProcedure [TeamB].[UpdateProduct]    Script Date: 06-11-2019 10:34:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [TeamB].[UpdateProduct] (@ProductID uniqueidentifier,@ProductName varchar(15), @ProductNumber int,@ProductCategory varchar(25), 
  @ProductColor varchar(30), @ProductSize varchar(15), @ProductMaterial varchar(30),@ProductPrice money )

as 
BEGIN

	begin try

		if exists(select ProductID from TeamB.Product where ProductID = @ProductID) 
		update TeamB.Product set  ProductColor = @ProductColor,ProductSize = @ProductSize,ProductMaterial=@ProductMaterial,ProductPrice = @ProductPrice, LastModifiedDateTime=sysdatetime() 
		where ProductID = @ProductID;
		else
		throw 500002, 'Product does not exist',1 

	end try

	begin catch

		throw 500000, 'Product not updated',1

	end catch

END
GO
/****** Object:  StoredProcedure [TeamB].[UpdateProductDescription]    Script Date: 06-11-2019 10:34:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [TeamB].[UpdateProductDescription] (@ProductID uniqueidentifier,@ProductName varchar(15), @ProductNumber int,@ProductCategory varchar(25), 
  @ProductColor varchar(30), @ProductSize varchar(15), @ProductMaterial varchar(30),@ProductPrice money )

as 
BEGIN

	begin try

		if exists(select ProductID from TeamB.Product where ProductID = @ProductID) 
		update TeamB.Product set  ProductColor = @ProductColor,ProductSize = @ProductSize,ProductMaterial = @ProductMaterial,LastModifiedDateTime=sysdatetime() 
		where ProductID = @ProductID;
		else
		throw 500002, 'Product does not exist',1 

	end try

	begin catch

		throw 500000, 'Product description not updated',1

	end catch

END
GO
/****** Object:  StoredProcedure [TeamB].[UpdateProductPrice]    Script Date: 06-11-2019 10:34:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [TeamB].[UpdateProductPrice] (@ProductID uniqueidentifier,@ProductName varchar(15), @ProductNumber int, @ProductCategory varchar(25),
  @ProductColor varchar(30), @ProductSize varchar(15), @ProductMaterial varchar(30),@ProductPrice money )

as
BEGIN

	begin try

		if exists(select ProductID from TeamB.Product where ProductID = @ProductID) 
		update TeamB.Product set  ProductPrice = @ProductPrice, LastModifiedDateTime=sysdatetime() where ProductID = @ProductID;
		else
		throw 500002, 'Product does not exist',1 

	end try

	begin catch

		throw 500000, 'Product price not updated',1

	end catch

END
GO
/****** Object:  StoredProcedure [TeamB].[UpdateRetailer]    Script Date: 06-11-2019 10:34:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [TeamB].[UpdateRetailer](@retailerID uniqueidentifier, @retailerName varchar(30),@retailerEmail varchAR(50),
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
		    throw 500012,'Mobile No. Already Exist',1;
		update TeamB.Retailers set RetailerName= @retailerName,RetailerEmail=@retailerEmail,Password= @password, RetailerMobile =@retailerMobile,LastModifiedDateTime =@LastModifiedDateTime
		where RetailerID= @retailerID
		Select @@ROWCOUNT
	end try
	begin Catch
		throw 500000,'Retailer Not Updated',1
	end catch	
  END
GO
/****** Object:  StoredProcedure [TeamB].[UpdateRetailerPassword]    Script Date: 06-11-2019 10:34:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [TeamB].[UpdateRetailerPassword](@retailerID uniqueidentifier,@password varchar(20))
AS 
  BEGIN
	begin try
		update TeamB.Retailers set password= @password
		where RetailerID= @retailerID
	end try
	begin Catch
		throw 500000,'SalesPerson Password Not Updated',1
	end catch	
  END

GO
/****** Object:  StoredProcedure [TeamB].[UpdateSalesPerson]    Script Date: 06-11-2019 10:34:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [TeamB].[UpdateSalesPerson](@salesPersonID uniqueidentifier, @salesPersonName varchar(30),@Email varchAR(50),
@password varchar(20), @salesPersonMobile varchar(50), @CreationDateTime datetime, @LastModifiedDateTime datetime)
AS 
  BEGIN
	begin try
		if exists (select Email from SalesPersons where Email = @Email)
		    throw 500011,'Email Already Exist',1;
		if @salesPersonName =''
		    throw 500010,'SalesPerson Name Is Must',1;
		if @Email =''
		    throw 500013,'SalesPerson Email Is Must',1;
		if @salesPersonMobile =''
		    throw 500014,'SalesPerson Mobile Is Must',1;
		if exists (select Email from SalesPersons where Email = @Email)
		    throw 500011,'Email Already Exist',1;
		
		update TeamB.SalesPersons set SalesPersonName= @salesPersonName,Email=@Email,Password= @password, SalesPersonMobile =@salesPersonMobile,LastModifiedDateTime =@LastModifiedDateTime
		where SalesPersonID= @salesPersonID
		Select @@ROWCOUNT
	end try
	begin Catch
		throw 500000,'SalesPerson Not Updated',1
	end catch	
  END

GO
/****** Object:  StoredProcedure [TeamB].[UpdateSalesPersonPassword]    Script Date: 06-11-2019 10:34:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [TeamB].[UpdateSalesPersonPassword](@salesPersonID uniqueidentifier , @salesPersonName varchar(30),@Email varchAR(30),
@password varchar(20), @salesPersonMobile varchar(50), @CreationDateTime datetime, @LastModifiedDateTime datetime)
AS 
  BEGIN
	begin try
		update TeamB.SalesPersons set password= @password,LastModifiedDateTime =@LastModifiedDateTime
		where SalesPersonID= @salesPersonID
	end try
	begin Catch
		throw 500000,'SalesPerson Not Updated',1
	end catch	
  END
GO
/****** Object:  StoredProcedure [TeamB].[ViewOrderByOrderID]    Script Date: 06-11-2019 10:34:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [TeamB].[ViewOrderByOrderID](@orderId uniqueidentifier)
as
 begin
	begin try
		select * from TeamB.Orders where OrderID= @orderId
	end try
	begin catch
		  PRINT @@ERROR;
		  throw 50000, 'Invalid OrderID',2
		  return 0
	end catch
return @@ROWCOUNT
 end

GO
/****** Object:  StoredProcedure [TeamB].[ViewOrderByOrderNumber]    Script Date: 06-11-2019 10:34:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 CREATE procedure [TeamB].[ViewOrderByOrderNumber](@orderNumber int)
as
 begin
	begin try
		select * from TeamB.Orders where OrderNumber= @orderNumber
	end try
	begin catch
		  PRINT @@ERROR;
		  throw 50000, 'Invalid OrderNumber',2
		  return 0
	end catch
return @@ROWCOUNT
 end

GO
/****** Object:  StoredProcedure [TeamB].[ViewOrderDetailByOrderDetailID]    Script Date: 06-11-2019 10:34:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--stored procedure to view a orderdetail from orderdetails table by orderdetail id

CREATE procedure [TeamB].[ViewOrderDetailByOrderDetailID](@orderDetailsId uniqueidentifier)
as
 begin
	begin try
		select * from TeamB.OrderDetails where OrderDetailID= @orderDetailsId
	end try
	begin catch
		throw 50000,'Invalid Orderdetails Id',1
	end catch
 end
 return @@ROWCOUNT

GO
/****** Object:  StoredProcedure [TeamB].[ViewOrderDetailsByOrderID]    Script Date: 06-11-2019 10:34:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [TeamB].[ViewOrderDetailsByOrderID](@orderId uniqueidentifier)
as
 begin
	begin try
		select TeamB.OrderDetails.OrderDetailID,TeamB.OrderDetails.OrderID,TeamB.OrderDetails.IsCancelled,TeamB.OrderDetails.ProductID,TeamB.OrderDetails.ProductQuantityOrdered,
		 TeamB.OrderDetails.ProductPrice,TeamB.OrderDetails.AddressID,TeamB.OrderDetails.TotalAmount,
		  TeamB.OrderDetails.LastModifiedDateTime,TeamB.OrderDetails.DateOfOrder,TeamB.Product.ProductName  from TeamB.OrderDetails join  TeamB.Product On TeamB.OrderDetails.ProductID = TeamB.Product.ProductID where OrderID= @orderId
	end try
	begin catch
		throw 50000,'Invalid Order Id',1
	end catch
 end
 
GO
/****** Object:  StoredProcedure [TeamB].[ViewRetailerOrders]    Script Date: 06-11-2019 10:34:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [TeamB].[ViewRetailerOrders](@retailerID uniqueidentifier)
as
begin
	begin try
		select * from TeamB.Orders where RetailerID= @retailerID
	end try
	begin catch
      PRINT @@ERROR;
	  throw 50000, 'Invalid Retailer ID',2
	  return 0
    end catch
	return @@ROWCOUNT
end

GO
/****** Object:  StoredProcedure [TeamB].[ViewsalesReportsproc]    Script Date: 06-11-2019 10:34:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [TeamB].[ViewsalesReportsproc]
 as
 begin
	begin try
	SELECT sp.SalesPersonID,sp.SalespersonName ,offl.OfflineCustomers,offl.Totalitems,offl.TotalAmount,
	(case   when  offl.totalamount> 10000 then 'exceeded' else 
	(case when offl.totalamount between 1000 and 10000 then 'Met' else  'NotMet' end)end) "target" 
	FROM TeamB.SalesPersons sp
	INNER JOIN (
	SELECT SalesPersonID,COUNT(*) AS OfflineCustomers,sum(TotalQuantity) as Totalitems,
	sum(TotalOrderAmount) AS TotalAmount
	FROM TeamB.OfflineOrders
	GROUP BY SalesPersonID) offl
	ON offl.SalesPersonID=sp.SalesPersonID;

 end try
 begin catch
 throw 500000,'View Sales reports Not Updated',1​
 end catch
 end

GO
