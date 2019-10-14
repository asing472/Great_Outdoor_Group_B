--developed by sravani
-- Date: 1/10/2019

/*
creating procedure to update admin details
*/
use GreatOutdoors
go

Create procedure UpdateAdmin(@AdminID varchar(30), @AdminName varchar(30),@Email varchAR(30),​
@Password varchar(15),@CreationDateTime datetime, @LastModifiedDateTime datetime)​
AS ​
BEGIN​
	begin try​
		update AdminTable set AdminName= @AdminName,Email=@Email,LastModifiedDateTime =@LastModifiedDateTime​
		where AdminID= @AdminID​
	end try​
	begin Catch​
		throw 500000,'Admin Not Updated',1​
	end catch ​
 END
---------------------------------------------------------------------------------------------------------------------------------------------------------------
--developed by sravani
-- Date: 1/10/2019

/*
alter procedure to update admin details
*/

Alter procedure UpdateAdmin(@AdminID varchar(30), @AdminName varchar(30),@Email varchAR(30),​
@Password varchar(15),@CreationDateTime datetime, @LastModifiedDateTime datetime)​
AS ​
 BEGIN​
	begin try​
		update AdminTable set AdminName= @AdminName,Email=@Email,LastModifiedDateTime =@LastModifiedDateTime​
		where AdminID= @AdminID​
	end try​
	begin Catch​
		throw 500000,'Admin Not Updated',1​
	end catch ​
 END​
---------------------------------------------------------------------------------------------------------------------------------------------------------------
--developed by sravani
-- Date: 1/10/2019

/*
creating procedure to update admin Password
*/

Create procedure UpdateAdminPassword(@Email varchar(30),@OldPassword varchar(15),@NewPassword varchar(15))​
AS ​
 BEGIN​
	begin try​
		if exists (select 1 from AdminTable where Email= @Email and Password=@OldPassword )
		   update AdminTable set Password=@NewPassword​,LastModifiedDateTime=DATETIME.NOW()
		   where Email=@Email
		else throw 500000,'Old password is incorrect',1
	end try​
	begin Catch​
		throw 500000,'Admin password Not Updated',1​
	end catch ​
 END
---------------------------------------------------------------------------------------------------------------------------------------------------------------
--developed by sravani
-- Date: 1/10/2019

/*
Alter Procedure for changing admin password
*/

Alter procedure UpdateAdminPassword(@AdminID varchar(30),@OldPassword varchar(15),@NewPassword varchar(15))​
AS ​
 BEGIN​
	begin try​
		if exists (select 1 from AdminTable where AdminID= @AdminID​ and Password=@OldPassword )
		    update AdminTable set Password=@NewPassword​,LastModifiedDateTime=DateTIME.NOW()
		    where AdminID=@AdminID
		else throw 500000,'Old password is incorrect',1
	end try​
	begin Catch​
		throw 500000,'Admin password Not Updated',1​
	end catch ​
 END
---------------------------------------------------------------------------------------------------------------------------------------------------------------
--developed by sravani
-- Date: 1/10/2019

/*
created procedure for reading admin details by passing Email Id
*/

create procedure GetAdminbyEmail(@Email varchar(30))
as 
 begin
	begin try
		SELECT* FROM AdminTable where Email=@Email
	end try
	begin catch
		PRINT @@ERROR;
		throw 5001,'Invalid Values Fetched',6
		return 0
    end catch
 end
GO

---------------------------------------------------------------------------------------------------------------------------------------------------------------
--developed by sravani
-- Date: 1/10/2019

/*
 procedure for reading admin details by passing Email Id
*/

Alter procedure GetAdminbyEmail(@Email varchar(30))
as 
 begin
	begin try
		SELECT* FROM AdminTable where Email=@Email
	end try
	begin catch
		PRINT @@ERROR;
		throw 5001,'Invalid Values Fetched',6
		return 0
    end catch
 end
GO

---------------------------------------------------------------------------------------------------------------------------------------------------------------
--developed by sravani
-- Date: 1/10/2019

/*
created procedure for reading admin details by passing Email Id and Password
*/

create procedure GetAdminbyEmailAndPassword(@Email varchar(30),@Password varchar(15))
as 
 begin
	begin try
		SELECT* FROM AdminTable where Email=@Email and Password=@Password
	end try
	begin catch
		PRINT @@ERROR;
		throw 5001,'Invalid Values Fetched',6
		return 0
    end catch
 end
GO

---------------------------------------------------------------------------------------------------------------------------------------------------------------
--developed by sravani
-- Date: 1/10/2019

/*
 procedure for reading admin details by passing Email Id and Password
*/

alter procedure GetAdminbyEmailAndPassword(@Email varchar(30),@Password varchar(15))
as 
 begin
	begin try
		SELECT* FROM AdminTable where Email=@Email and Password=@Password
	end try
	begin catch
		PRINT @@ERROR;
		throw 5001,'Invalid Values Fetched',6
		return 0
    end catch
 end
GO
---------------------------------------------------------------------------------------------------------------------------------------------------------------

--sql code for orders and orderdetails tables
--author: C Akhil Chowdary
-- Date: 1/10/2019

USE GreatOutdoors
GO

--stored procedure to add order to orders table

alter procedure AddOrder(@retailerId varchar(30), @dateOfOrder datetime, @totalQuantity int, @orderAmount float, @lastModifiedDate datetime,@orderStatus varchar(20))
as
 begin
	begin try
		insert into OrdersTable (RetailerId, DateOfOrder, TotalQuantity, OrderAmount, LastModifiedDateTime, OrderStatus) values (@retailerId, @dateOfOrder, @totalQuantity, @orderAmount, @lastModifiedDate, @orderStatus)
	end try
	begin catch
		throw 500000,'Invalid details',1
	end catch
 end
---------------------------------------------------------------------------------------------------------------------------------------------------------------

--stored procedure to show all orders

alter procedure ViewOrder(@orderId varchar(30))
as
 begin
	begin try
		select * from OrderDetailsTable where OrderId= @orderId
	end try
	begin catch
		throw 500000,'Invalid Order Id',1
	end catch
 end
---------------------------------------------------------------------------------------------------------------------------------------------------------------

--stored procedure to update an order in orders table

alter procedure UpdateOrder(@orderId varchar(30), @totalQuantity int, @orderAmount float, @lastModifiedDate datetime,@orderStatus varchar(20))
as
 begin
	begin try
		 update OrdersTable
 		set
 		 TotalQuantity=@totalQuantity,
  		OrderAmount=@orderAmount,
  		LastModifiedDateTime=@lastModifiedDate,
  		OrderStatus=@orderStatus
  		where OrderId=@orderId
	end try
	begin catch
		throw 500000,'Invalid details',1
	end catch
 end
---------------------------------------------------------------------------------------------------------------------------------------------------------------

--stored procedure to delete an order from orders table

alter procedure DeleteOrder(@orderId varchar(30))
as
 begin
	begin try
		delete from OrdersTable where OrderId=@orderId
		delete from OrderDetailstable where OrderId=@orderId
	end try
	begin catch
		throw 500000,'Invalid Order Id',1
	end catch
 end
---------------------------------------------------------------------------------------------------------------------------------------------------------------

--stored procedure to add a orderdetail to orderdetails table

alter procedure AddOrderDetails(@orderId varchar(30), @orderDetailsId varchar(30), @productId varchar(30), @productQuantityOrdered int, @productPrice float, @addressId varchar(30), @totalAmount float, @dateOfOrder datetime, @lastModifiedDate datetime)
as
 begin
	begin try
		insert into OrderDetailsTable (OrderId, OrderDetailId, ProductID, ProductQuantityOrdered, ProductPrice, AddressId, TotalAmount, DateOfOrder, LastModifiedDateTime ) values (@orderId, @orderDetailsId, @productId, @productQuantityOrdered, @productPrice, @addressId, @totalAmount, @dateOfOrder, @lastModifiedDate)
	end try
	begin catch
		throw 500000,'Invalid details',1
	end catch
 end

---------------------------------------------------------------------------------------------------------------------------------------------------------------

--stored procedure to view a orderdetail from orderdetails table

alter procedure ViewOrderDetails(@orderDetailsId varchar(30))
as
 begin
	begin try
		select * from OrderDetailsTable where OrderDetailId= @orderDetailsId
	end try
	begin catch
		throw 500000,'Invalid Orderdetails Id',1
	end catch
 end

---------------------------------------------------------------------------------------------------------------------------------------------------------------

--stored procedure to update a orderdetail in orderdetails table

alter procedure UpdateOrderDetails(@orderId varchar(30), @productQuantityOrdered int, @addressId varchar(30), @totalAmount float, @lastModifiedDate datetime)
as
 begin
	begin try
 		update OrderDetailsTable
 		set
 		 ProductQuantityOrdered=@productQuantityOrdered,
 		 AddressId=@addressId,
  		TotalAmount=@totalAmount,
  		LastModifiedDateTime = @lastModifiedDate
		  where OrderId=@orderId
	end try
	begin catch
		throw 500000,'Invalid details',1
	end catch
 end

---------------------------------------------------------------------------------------------------------------------------------------------------------------

--stored procedure to delete a orderdetail from orderdetails table

alter procedure DeleteOrderDetails(@orderId varchar(30))
as
 begin
	begin try
		delete from OrdersTable where OrderId=@orderId
	end try
	begin catch
		throw 500000,'Invalid Orderdetails Id',1
	end catch
 end
---------------------------------------------------------------------------------------------------------------------------------------------------------------

--stored procedure to view a orders of a retailer

create procedure ViewRetailerOrders(@retailerId varchar(30))
as
 begin
	begin try
		select * from OrderDetailsTable where OrderId=(select OrderId from OrdersTable where RetailerId= @retailerId)
	end try
	begin catch
		throw 500000,'Invalid Retailer Id',1
	end catch
 end
---------------------------------------------------------------------------------------------------------------------------------------------------------------

--stored procedure to view a orders of a retailer on a particular date

create procedure ViewRetailerOrdersByDateOfOrder(@retailerId varchar(30), @dateOfOrder datetime)
as
 begin
	begin try
		select * from OrderDetailsTable where OrderId=(select OrderId from OrdersTable where (RetailerId= @retailerId) and (DateOfOrder=@dateOfOrder))
	end try
	begin catch
		throw 500000,'Invalid Retailer Id',1
	end catch
 end

---------------------------------------------------------------------------------------------------------------------------------------------------------------

--stored procedure to view a orders on a particular date

create procedure ViewAllOrdersOnGivenDate(@dateOfOrder datetime)
as
 begin
	begin try
		select * from OrderDetailsTable where OrderId=(select OrderId from OrdersTable where DateOfOrder=@dateOfOrder)
	end try
	begin catch
		throw 500000,'Invalid Date',1
	end catch
 end

---------------------------------------------------------------------------------------------------------------------------------------------------------------

--stored procedure to view a orderdetails of a particular product

create procedure ViewOrderDetailsOfParticularProduct(@productId varchar(30))
as
 begin
	begin try
		select * from OrderDetailsTable where ProductID=@productId

	end try
	begin catch
		throw 500000,'Invalid Product',1
	end catch
 end

---------------------------------------------------------------------------------------------------------------------------------------------------------------

--stored procedure to view cancelled products

create procedure ViewCancelledProducts(@productId varchar(30))
as
 begin
	begin try
		select * from OrderDetailsTable where (ProductID=@productId and IsCancelled='yes')
	end try
	begin catch
		throw 500000,'Invalid Product',1
	end catch
 end
---------------------------------------------------------------------------------------------------------------------------------------------------------------

--stored procedure to view products delivered to a particular address

create procedure ViewProductsDeliveredToSameAddress(@addressId varchar(30))
as
 begin
	begin try
		select * from OrderDetailsTable where (AddressId=@addressId and IsCancelled='no')
	end try
	begin catch
		throw 500000,'Invalid Address',1
	end catch
 end

---------------------------------------------------------------------------------------------------------------------------

--Developed by Abhishek
-- Date: 30/09/2019


--procedure for sales person to add offline orders

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


Insert into  GreatOutdoors.OfflineOrders(OfflineOrderID, RetailerID, SalesPersonID, TotalOfflineOrderAmount,
				TotalQuantity,CreationDateTime,LastModifiedDateTime) 
  
   values(@offlineOrderID, @retailerID, @salesPersonID, @totalOrderAmount,
				@totalQuantity,@CreationDateTime,@LastModifiedDateTime)

end
GO
---------------------------------------------------------------------------------------------------------------------------
--Creating Procedures for Delete Offline Order

Create Procedure DeleteOfflineOrder(@OfflineOrderid VARCHAR(30))
AS
BEGIN
   begin try
		Delete from GreatOutdoors.OfflineOrders where OfflineOrderID = @OfflineOrderid
   end try
   begin catch
		PRINT @@ERROR;
	    throw 5000, 'Invalid Values fatched',5
	    return 0
   end catch
end

Go
---------------------------------------------------------------------------------------------------------------------------
--Created Procedure for updating offline order 

Create Procedure UpdateOfflineOrder(@OfflineOrderid VARCHAR(30), @totalOrderAmount float, @totalQuantity float)
AS
BEGIN
   begin try
   Update GreatOutdoors.OfflineOrders set TotalOfflineOrderAmount =@totalOrderAmount,TotalQuantity = @totalQuantity  Where   OfflineOrderID = @OfflineOrderid
   end try
   begin catch
      PRINT @@ERROR;
	  throw 5000, 'Invalid Values fatched',6
	  return 0
   end catch
end
Go
---------------------------------------------------------------------------------------------------------------------------
--Created procedure for getting offline order by orderid

Create Procedure GetOfflineOrderByOfflineOrderID(@OfflinerOrderid VARCHAR(30))
AS
BEGIN
   begin try
   select * from GreatOutdoors.OfflineOrders where OfflineOrderID = @OfflinerOrderid
   end try
   begin catch
      PRINT @@ERROR;
	  throw 5000, 'Invalid Values fatched',2
	  return 0
   end catch
end
Go
---------------------------------------------------------------------------------------------------------------------------
--Created procedure for getting offline order by salespersonid

Create Procedure GetOfflineOrderBySalesPersonID(@salespersonid VARCHAR(30))
AS
BEGIN
   begin try
   select * from GreatOutdoors.OfflineOrders where SalesPersonID = @salespersonid
   end try
   begin catch
      PRINT @@ERROR;
	  throw 5000, 'Invalid Values fatched',2
	  return 0
   end catch
end
Go
---------------------------------------------------------------------------------------------------------------------------
--Created procedure for getting offline order by retailerid

Create Procedure GetOfflineOrderByRetailerID(@retailerid VARCHAR(30))
AS
BEGIN
   begin try
   select * from GreatOutdoors.OfflineOrders where RetailerID = @retailerid
   end try
   begin catch
      PRINT @@ERROR;
	  throw 5000, 'Invalid Values fatched',2
	  return 0
   end catch
end
Go
 

---------------------------------------------------------------------------------------------------------------------------

--Developed by Abhishek
-- Date: 30/09/2019

-- Created procedure Adding offline order detail

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


Insert into  GreatOutdoors.OfflineOrderDetails(OfflineOrderDetailID, ProductID, OfflineOrderID, TotalPrice,UnitPrice,
				Quantity,CreationDateTime,LastModifiedDateTime) 
  
   values(@offlineOrderDetailID, @productID, @offlineOrderID, @totalPrice,@unitPrice,
				@Quantity,@CreationDateTime,@LastModifiedDateTime)

end

Go
---------------------------------------------------------------------------------------------------------------------------

--Created procedure for deleting offline order detail

Create Procedure DeleteOfflineOrderDetail(@OfflineOrderdetailid VARCHAR(30))
AS
BEGIN
   begin try
		Delete from GreatOutdoors.OfflineOrderDetails where OfflineOrderDetailID = @OfflineOrderdetailid
   end try
   begin catch
		PRINT @@ERROR;
	    throw 50000, 'Invalid Values fatched',5
	    return 0
   end catch
end

Go
---------------------------------------------------------------------------------------------------------------------------
--created Update offline order detail Procedure

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
---------------------------------------------------------------------------------------------------------------------------
--Created procedure for getting offline order detail by offline order id

Create Procedure GetOfflineOrderDetailByOfflineOrderDetailID(@OfflinerOrderdetailid VARCHAR(30))
AS
BEGIN
   begin try
   select * from GreatOutdoors.OfflineOrderDetails where OfflineOrderDetailID = @OfflinerOrderdetailid
   end try
   begin catch
      PRINT @@ERROR;
	  throw 5000, 'Invalid Values fatched',2
	  return 0
   end catch
end
Go
---------------------------------------------------------------------------------------------------------------------------
--Created procedure for getting offline order detail by offline order id

Create Procedure GetOfflineOrderDetailByOfflineOrderID(@OfflinerOrderid VARCHAR(30))
AS
BEGIN
   begin try
   select * from GreatOutdoors.OfflineOrderDetails where OfflineOrderID = @OfflinerOrderid
   end try
   begin catch
      PRINT @@ERROR;
	  throw 5000, 'Invalid Values fatched',2
	  return 0
   end catch
end
Go

---------------------------------------------------------------------------------------------------------------------------

--Developed by Abhishek
-- Date: 30/09/2019

-- Created procedure for adding offlinereturn

Alter Procedure AddOfflineReturn(@offlinereturnid varchar(30), @offlineofflineOfflineOrderid varchar(3s0), 
@returnamount int, @unitprice int, @productid varchar(100), 
@purpose varchar(50), @quantityofreturn int, @creationdatetime datetime)
as
  Begin
    
  	 if @Offlinereturnid is null OR @Offlinereturnid = ''
  	   throw 5001, 'Invalid Offline Return ID', 1
 	 if @offlineofflineOfflineOrderid is null OR @offlineofflineOfflineOrderid = ''
 	   throw 5001, 'Invalid offlineofflineOfflineOrder ID', 2
 	 if @productid is null OR @productid = ''
 	    throw 5001, 'Invalid Product ID', 3
  	 if @returnamount =0
 	    throw 5001, 'Invalid Return Amount', 4
	 if @unitprice = 0
	    throw 5001, 'Invalid Unit Price', 5
	 if @quantityofreturn = 0
	    throw 5001, 'Quantity Of Return is 0', 7
	 if @purpose is null OR @purpose = ''
	    throw 5001, 'Purpose Not Selected', 8
 	 Insert into  OfflineReturns(OfflineReturn_ID, offlineOrder_ID, Product_ID, Purpose,QuantityOfReturn, Last_Modified_DateTime, Creation_DateTime, Unit_Price, ReturnAmount) values(@Offlinereturnid, @offlineofflineOfflineOrderid, @productid, @purpose, @quantityofreturn, null,@creationdatetime, @unitprice, @returnamount)
  end

--created procedure

--Exec Users.AddOfflineReturns '20','30', 20,20,'55','r3', 'defective', 1,'1-oct-2019'
---------------------------------------------------------------------------------------------------------------------------------------------------------------
--Procedure  for viewing Offline return by Offline returnId

Create Procedure GetOfflineReturnByOfflineReturnID(@Offlinereturnid VARCHAR(100))
AS
 BEGIN
   begin try
  	 select * from OfflineReturns where OfflineReturn_ID = @Offlinereturnid
   end try
   begin catch
    	  PRINT @@ERROR;
	  throw 5000, 'Invalid Values fatched',2
	  return 0
   end catch
 end
Go
--created procedure
---------------------------------------------------------------------------------------------------------------------------------------------------------------
--Procedure  for viewing Offline return by Purpose

Create Procedure GetOfflineReturnsByPurpose(@purpose VARCHAR(50))
AS
 BEGIN
   begin try
   select * from OfflineReturns where Purpose = @purpose
   end try
   begin catch
      PRINT @@ERROR;
	  throw 5000, 'Invalid Values fatched',3
	  return 0
   end catch
 end
Go
--created procedure
---------------------------------------------------------------------------------------------------------------------------------------------------------------
--Procedure  for Deleting Offline return 
   
Create Procedure DeleteOfflineReturn(@Offlinereturnid VARCHAR(100))
AS
 BEGIN
   begin try
 	  Delete from OfflineReturns where OfflineReturn_ID = @Offlinereturnid
   end try
   begin catch
    	  PRINT @@ERROR;
	  throw 5000, 'Invalid Values fatched',5
	  return 0
   end catch
 end
Go
--created procedure
---------------------------------------------------------------------------------------------------------------------------------------------------------------
Procedure  for Updating Offline return 

Create Procedure UpdateOfflineReturn(@Offlinereturnid VARCHAR(100), @purpose varchar(50), @quantityofreturn int)
AS
 BEGIN
   begin try
  	 Update OfflineReturns set QuantityOfReturn =@quantityofreturn,Purpose=@purpose  Where   OfflineReturn_ID = @Offlinereturnid
   end try
   begin catch
    	  PRINT @@ERROR;
	  throw 5000, 'Invalid Values fatched',6
	  return 0
   end catch
 end
Go
--created procedure
---------------------------------------------------------------------------------------------------------------------------------------------------------------
Procedure  for viewing all Offline return 

Create Procedure GetAllOfflineReturns(@Offlinereturnid varchar(100))
AS
 BEGIN
   begin try
 	  select * from OfflineReturns 
   end try
   begin catch
   	   PRINT @@ERROR;
	  throw 5000, 'Invalid Values fatched',7
	  return 0
   end catch
 end
Go
--created procedure
---------------------------------------------------------------------------------------------------------------------------------------------------------------

--created by Arshpreet 

-- Date: 1/10/2019

--Procedure for adding the product to the Product table

create procedure AddProduct (@ProductID varchar(30), @ProductName varchar(15), @ProductNumber int, @ProductCategory varchar(25),
 @ProductColor varchar(10), @ProductSize varchar(5), @ProductMaterial varchar(15),@ProductPrice money )

as
BEGIN

	begin try

		if @ProductID = ''
		throw 500001, 'Product ID is a must',1
		else 
		insert into Product values
		(@ProductID,@ProductName,@ProductNumber,@ProductCategory,@ProductColor,@ProductSize,@ProductMaterial,@ProductPrice,sysdatetime(),sysdatetime())

	end try

	begin catch 

		throw 500000, 'Product not added',1

	end catch

END

exec AddProduct 'A1000','tent',1,'Camping Equipment','blue','S','rayon',9000

exec AddProduct 'A1001','tent',2,'Camping Equipment','red','L','nylon',11500

exec AddProduct 'A1002','rope',3,'Outdoor Protection','green','M','nylon',11500

exec AddProduct 'A1003','tent',4,'Camping Equipment','green','XL','rayon',13500

exec AddProduct 'A1004','rope',5,'Outdoor Protection','green','S','nylon',8500

select * from Product

delete from Product
---------------------------------------------------------------------------------------------------------------------------------------------------------------

--created by Arshpreet 

-- Date: 3/10/2019

--Procedure to update the product price in the Product table where ProductID is a match

create procedure UpdateProductPrice (@ProductID varchar(30), @ProductName varchar(15), @ProductNumber int, @ProductCategory varchar(25),
 @ProductColor varchar(10), @ProductSize varchar(5), @ProductMaterial varchar(15), @ProductPrice money)

as
BEGIN

	begin try

		if exists(select ProductID from Product where ProductID = @ProductID) 
		update Product set  ProductPrice = @ProductPrice, LastModifiedDateTime=sysdatetime() where ProductID = @ProductID;
		else
		throw 500002, 'Product does not exist',1 

	end try

	begin catch

		throw 500000, 'Product price not updated',1

	end catch

END

exec UpdateProductPrice 'A1000','tent',1,'Camping Equipment','blue','S','rayon',10000
--------------------------------------------------------------------------------------------------------------------------------------------------------------

--created by Arshpreet 

-- Date: 3/10/2019

--Procedure to update the product description in the Product table where ProductID is a match

create procedure UpdateProductDescription (@ProductID varchar(30), @ProductName varchar(15), @ProductNumber int,@ProductCategory varchar(25), 
@ProductColor varchar(10), @ProductSize varchar(5), @ProductMaterial varchar(15), @ProductPrice money)

as 
BEGIN

	begin try

		if exists(select ProductID from Product where ProductID = @ProductID) 
		update Product set  ProductColor = @ProductColor,ProductSize = @ProductSize,ProductMaterial = @ProductMaterial,LastModifiedDateTime=sysdatetime() 
		where ProductID = @ProductID;
		else
		throw 500002, 'Product does not exist',1 

	end try

	begin catch

		throw 500000, 'Product description not updated',1

	end catch

END

exec UpdateProductDescription 'A1000','tent',1,'Camping Equipment','red','L','nylon',10000

select * from Product
--------------------------------------------------------------------------------------------------------------------------------------------------------------

--created by Arshpreet 

--Date: 3/10/2019

--Procedure to get all products

create procedure GetAllProducts

as
BEGIN

	Select * from Product;

END

exec GetAllProducts
---------------------------------------------------------------------------------------------------------------------------------------------------------------

--created by Arshpreet 

--Date: 3/10/2019

--Procedure to get product by product ID

create procedure GetProductByProductID(@ProductID varchar(30))
as 
BEGIN
begin try
	if exists(select ProductID from Product where ProductID = @ProductID) 
		select * from Product where ProductID = @ProductID
	else
		throw 500002, 'Product does not exist',1 
end try
begin catch
	throw 500003, 'Unable to fetch product',1
end catch
END

exec GetProductByProductID 'A1000'
exec GetProductByProductID 'A10001'
-------------------------------------------------------------------------------------------------------------------------------------------------------------

--created by Arshpreet 

--Date: 3/10/2019

--Procedure to get product by product category

create procedure GetProductsByProductCategory(@ProductCategory varchar(25))
as 
BEGIN
begin try
	select * from Product where ProductCategory = @ProductCategory
end try
begin catch
	throw 500003, 'Unable to fetch products',1
end catch
END

exec GetProductsByProductCategory 'Camping Equipment'
--------------------------------------------------------------------------------------------------------------------------------------------------------------

--created by Arshpreet 

--Date: 3/10/2019

--Procedure to get product by product name

create procedure GetProductsByProductName( @ProductName varchar(15))
as 
BEGIN
begin try
	select * from Product where ProductName = @ProductName
end try
begin catch
	throw 500003, 'Unable to fetch products',1
end catch
END

exec GetProductsByProductName 'rope'
--------------------------------------------------------------------------------------------------------------------------------------------------------------

--created by Arshpreet 

--Date: 3/10/2019

--Procedure to delete product by product ID

create procedure DeleteProduct(@ProductID varchar(30))
as 
BEGIN
begin try
	if exists(select ProductID from Product where ProductID = @ProductID) 
		delete from Product where ProductID = @ProductID
	else
		throw 500002, 'Product does not exist',1 
end try
begin catch
	throw 500003, 'Unable to fetch product',1
end catch
END

exec DeleteProduct 'A1001'

select * from Product 
---------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Created By Ayush Agrawal on 01/10/2019
--Procedure for retailers to add Online Return

--Exec AddOnlineReturn '100','30', 2000,200,'10', 'defective', 10,'1-oct-2019',34

alter Procedure GreatOutdoors.AddOnlineReturn(@onlinereturnid varchar(255), @orderNumber varchar(255), 
@totalamount int, @productprice int, @productNumber varchar(255), 
@purpose varchar(50), @quantityofreturn int, @creationdatetime datetime ,@retailerid varchar(255))
as
  Begin
    
      if @onlinereturnid is null OR @onlinereturnid = ''
     	throw 5001, 'Invalid Online Return ID', 1
      if @orderNumber is null OR @orderNumber = ''
     	throw 5001, 'Invalid Order ID', 2
     if @productNumber is null OR @productNumber = ''
     	throw 5001, 'Invalid Product ID', 3
     if @retailerid is null OR @retailerid = ''
     	throw 5001, 'Invalid Product ID', 4
     if @totalamount =0
     	throw 5001, 'Invalid Return Amount', 5
     if @productprice = 0
     	throw 5001, 'Invalid Unit Price', 6
     if @quantityofreturn = 0
     	throw 5001, 'Quantity Of Return is 0', 7
     if @purpose is null OR @purpose = ''
     	throw 5001, 'Purpose Not Selected', 8
     Insert into GreatOutdoors.OnlineReturns(OnlineReturn_ID, OrderNumber, ProductNumber,  Purpose, QuantityOfReturn, Last_Modified_DateTime, Creation_DateTime, ProductPrice, TotalAmount, Retailer_ID)
        values(@onlinereturnid, @orderNumber, @productNumber, @purpose, @quantityofreturn,
   null,@creationdatetime, @productprice, @totalamount, @retailerid)
 end

--created procedure
---------------------------------------------------------------------------------------------------------------------------------------------------------------


-- Created By Ayush Agrawal on 01/10/2019
--Created Table With VARCHAR OF ONLINERETURN
Create Procedure GreatOutdoors.GetOnlineReturnByOnlineReturnID(@onlinereturnid VARCHAR(255))
AS
  BEGIN
     begin try
  	 select * from GreatOutdoors.OnlineReturns where OnlineReturn_ID = @onlinereturnid
     end try
     begin catch
   	PRINT @@ERROR;
	throw 5000, 'Invalid Values fatched',2
	return 0
     end catch
  end

--created procedure

--Exec GreatOutdoors.GetOnlineReturnByOnlineReturnID 100


---------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Created By Ayush Agrawal on 01/10/2019
 --Created Table With VARCHAR OF ONLINERETURN
Create Procedure GreatOutdoors.GetOnlineReturnsByPurpose(@purpose VARCHAR(50))
AS
BEGIN
   begin try
  	 select * from GreatOutdoors.OnlineReturns where Purpose = @purpose
   end try
   begin catch
   	PRINT @@ERROR;
	throw 5000, 'Invalid Values fatched',3
   	return 0
   end catch
end
Go
--created procedure

--Exec GreatOutdoors.GetOnlineReturnsByPurpose 'Unsatisfactory'
---------------------------------------------------------------------------------------------------------------------------------------------------------------


-- Created By Ayush Agrawal on 01/10/2019
 --Created Table With VARCHAR OF RetailerID

Create Procedure GreatOutdoors.GetOnlineReturnByRetailerID(@retailerID VARCHAR(50))
AS
BEGIN
   begin try
  	 select * from GreatOutdoors.OnlineReturns where Retailer_ID = @retailerID
   end try
   begin catch
  	PRINT @@ERROR;
	throw 5000, 'Invalid Values fatched',4  
   	return 0
   end catch
end
Go
--created procedure
   
-- Exec GreatOutdoors.GetOnlineReturnByRetailerID 20

---------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Created By Ayush Agrawal on 01/10/2019
--Created Table With VARCHAR OF ONLINERETURN

Create Procedure GreatOutdoors.DeleteOnlineReturn(@onlinereturnid VARCHAR(255))
AS
BEGIN
   begin try
  	 Delete from GreatOutdoors.OnlineReturns where OnlineReturn_ID = @onlinereturnid
   end try
   begin catch
   	PRINT @@ERROR;
	throw 5000, 'Invalid Values fatched',5
   	return 0
   end catch
end
Go
--created procedure

---------------------------------------------------------------------------------------------------------------------------------------------------------------


-- Created By Ayush Agrawal on 01/10/2019
--Created Table With VARCHAR OF ONLINERETURN
Create Procedure GreatOutdoors.UpdateOnlineReturn(@onlinereturnid VARCHAR(255), @purpose varchar(50), @quantityofreturn int)
AS
BEGIN
   begin try
   	Update GreatOutdoors.OnlineReturns set QuantityOfReturn =@quantityofreturn,Purpose=@purpose  Where   OnlineReturn_ID = @onlinereturnid
   end try
   begin catch
   	  PRINT @@ERROR;
	  throw 5000, 'Invalid Values fatched',6
	  return 0
   end catch
end
Go

Exec GreatOutdoors.UpdateOnlineReturn'100', 'unsatisfactory', 20
Select* from OnlineReturns

--created procedure
---------------------------------------------------------------------------------------------------------------------------------------------------------------

Create Procedure GreatOutdoors.GetAllOnlineReturns(@onlinereturnid varchar(255))
AS
BEGIN
   begin try
  	 select * from OnlineReturns 
   end try
   begin catch
   	  PRINT @@ERROR;
	  throw 5000, 'Invalid Values fatched',7
	  return 0
   end catch
end
Go
--created procedure

--Exec GreatOutdoors.GetAllOnlineReturns 100

 ---------------------------------------------------------------------------------------------------------------------------------------------------------------
  
   
-- Created By Ayush Agrawal on 01/10/2019
-- Procedure For Adding SalesPerson
Create procedure GreatOutdoors.AddSalesPerson(@salesPersonID varchar(255), @salesPersonName varchar(30),@Email varchAR(50),
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
    		insert into GreatOutdoors.SalesPersons
	 	values(@salesPersonID, @salesPersonName,@Email,@password,@salesPersonMobile,@CreationDateTime,/*@LastModifiedDateTime*/null)
	end try
	begin Catch
           throw 500000,'SalesPerson Not Added',5;
	end catch	
  END

--Exec GreatOutdoors.AddSalesPerson '20','Ayush', 'ayush087@gmail.com','Ayush087','9893103651','1-oct-2019'

---------------------------------------------------------------------------------------------------------------------------------------------------------------

--Procedure to Update SalesPerson
-- Created By Ayush Agrawal on 01/10/2019
--It Takes salesperson Object as Input

Create procedure GreatOutdoors.UpdateSalesPerson(@salesPersonID varchar(30), @salesPersonName varchar(30),@Email varchAR(50),
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
  		   update GreatOutdoors.SalesPersons set SalesPerson_Name= @salesPersonName,Email=@Email,password= @password, SalesPerson_Mobile =@salespersonMobile,Last_Modified_DateTime =@LastModifiedDateTime
		   where SalesPersonID= @salesPersonID
	end try
	begin Catch
    		throw 500000,'SalesPerson Not Updated',3
	end catch	
  END

--Exec GreatOutdoors.UpdateSalesPerson '20','Ayush', 'ayush087@gmail.com','Kaushik087','9893103651','1-oct-2019', '2-oct-2019'
--Select*from GreatOutdoors.SalesPersons
---------------------------------------------------------------------------------------------------------------------------------------------------------------


--Procedure to Delete SalesPerson
-- Created By Ayush Agrawal on 01/10/2019
-- Takes SalesPerson ID as input

Create procedure GreatOutdoors.DeleteSalesPerson(@salesPersonID varchar(50) )
AS 
  BEGIN
	begin try
     		 Delete GreatOutdoors.SalesPersons where SalesPersonID= @salesPersonID
	end try
	begin Catch
      		throw 500000,'SalesPerson Not Deleted',4
	end catch	
  END

---------------------------------------------------------------------------------------------------------------------------------------------------------------

--Update SalesPerson Password of SalesPerson
-- Created By Ayush Agrawal on 01/10/2019
--Take SalesPerson Object as Input

CREATE procedure GreatOutdoors.UpdateSalesPersonPassword(@salesPersonID varchar(30), @salesPersonName varchar(30),@Email varchAR(30),
@password varchar(20), @salesPersonMobile varchar(50), @CreationDateTime datetime, @LastModifiedDateTime datetime)
AS 
  BEGIN
	begin try
        	update GreatOutdoors.SalesPersons set password= @password,Last_Modified_DateTime =@LastModifiedDateTime
        	where SalesPersonID= @salesPersonID
	end try
	begin Catch
       		throw 500000,'SalesPerson Not Updated',5
	end catch	
END


--EXEC GreatOutdoors.UpdateSalesPersonPassword '20','Ayush', 'ayush087@gmail.com','kaushik087','9893103651','1-oct-2019','2-oct-2019'
--Select*from GreatOutdoors.SalesPersons

---------------------------------------------------------------------------------------------------------------------------------------------------------------

--Get SalesPerson By salesPersonID
-- Created By Ayush Agrawal on 01/10/2019
-- Takes salesPerson ID as input
CREATE procedure GreatOutdoors.GetSalesPersonBySalesPersonID(@salesPersonID varchar(30))
AS
  BEGIN
	begin try
		select * from GreatOutdoors.SalesPersons where SalesPersonID=@salesPersonID
	end try
	begin catch
		 throw 500021,'SalesPersonID does not Exist',6
	end catch
  END

--EXEC GreatOutdoors.GetSalesPersonBySalesPersonID 20
---------------------------------------------------------------------------------------------------------------------------------------------------------------


-- Procedure For selecting SalesPerson by Email
-- Created By Ayush Agrawal on 01/10/2019
--Takes Email As Input

CREATE procedure GreatOutdoors.GetSalesPersonByEmail(@Email varchar(30))
AS
  BEGIN
	begin try
	     select * from GreatOutdoors.SalesPersons where Email=@Email
	end try
	begin catch
        	throw 500021,'SalesPerson Email does not Exist',7
	end catch
END

--Exec GreatOutdoors.GetSalesPersonByEmail 'ayush087@gmail.com'

---------------------------------------------------------------------------------------------------------------------------------------------------------------

--Procedure for Select SalesPerson By EmailId and Password
-- Created By Ayush Agrawal on 01/10/2019
--Takes Email and Password as Input

CREATE procedure GreatOutdoors.GetSalesPersonByEmailAndPassword(@Email varchar(30), @password varchar(30))
AS
  BEGIN
	begin try
       		 select * from GreatOutdoors.SalesPersons where Email=@Email and Password = @password
	end try
	begin catch
         	 throw 500021,'SalesPerson Email and Password Invalid',8
	end catch
  END


--EXEC GreatOutdoors.GetSalesPersonByEmailAndPassword 'ayush087@gmail.com','kaushik087'

---------------------------------------------------------------------------------------------------------------------------------------------------------------

--Get SalesPerson By Name
--Take Name as Input

CREATE  procedure GreatOutdoors.GetSalesPersonByName(@salesPersonName varchar(30))
AS
  BEGIN
	begin try
	       select * from GreatOutdoors.SalesPersons where SalesPerson_Name=@salesPersonName
	end try
	begin catch
    	  	throw 500021,'SalesPersonID does not Exist',9
	end catch
END

--Exec GreatOutdoors.GetSalesPersonByName 'Ayush'

---------------------------------------------------------------------------------------------------------------------------------------------------------------


--Get All SalesPerson 
-- Created By Ayush Agrawal on 01/10/2019
--Take SalesPersonID as Input

CREATE  procedure GreatOutdoors.GetAllSalesPerson(@salesPersonID varchar(30))
AS
  BEGIN
	begin try
        	select * from GreatOutdoors.SalesPersons 
	end try
	begin catch
         	throw 500021,'SalesPersonID does not Exist',9
	end catch
  END

---------------------------------------------------------------------------------------------------------------------------------------------------------------

--Exec GreatOutdoors.GetAllSalesPerson '20'
﻿--Created By Prafull Sharma on 29/09/2019
-- Retailer Report Procedure

Create procedure UpdateRetailerReport(@retailerID varchar(30), @retailerSalesCount int,@retailerSalesAmount money)
AS 
  BEGIN
     begin try
	   //Viewing Retailer Reports
           update RetailerReport set RetailerSalesCount= @retailerSalesCount,RetailerSalesAmount = @retailerSalesAmount
           where RetailerID= @retailerID
     end try
     begin Catch
        throw 500000,'Retailer Not Updated',1
     end catch	
  END

---------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Created By Prafull on 01/10/2019
-- Procedure For Adding Retailer

alter procedure GreatOutdoors.AddRetailer(@retailerID varchar(30), @retailerName varchar(30),@retailerEmail varchAR(50),
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
		insert into GreatOutdoors.Retailers values(@retailerID, @retailerName,@retailerEmail,@password,@retailerMobile,@CreationDateTime,@LastModifiedDateTime);
	end try
	begin Catch
		throw; ---500000,'Retailer Not Added',1
	end catch	
  END
---------------------------------------------------------------------------------------------------------------------------------------------------------------

--Procedure to Update Retailer
--It Takes retailer Object as Input

alter procedure GreatOutdoors.UpdateRetailer(@retailerID varchar(30), @retailerName varchar(30),@retailerEmail varchAR(50),
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
		update GreatOutdoors.Retailers set RetailerName= @retailerName,RetailerEmail=@retailerEmail,password= @password, RetailerMobile =@retailerMobile,LastModifiedDateTime =@LastModifiedDateTime
		where RetailerID= @retailerID
	end try
	begin Catch
		throw 500000,'Retailer Not Updated',1
	end catch	
  END
---------------------------------------------------------------------------------------------------------------------------------------------------------------

--Procedure to Delete Retailer 
-- Takes Retailer ID as input

CREATE procedure GreatOutdoors.DeleteRetailer(@retailerID varchar(50) )
AS 
  BEGIN
	begin try 
		Delete from GreatOutdoors.Reailers where RetailerID= @retailerID
	end try
	begin Catch
		throw 500000,'Retailer Not Deleted',1
	end catch	
  END
---------------------------------------------------------------------------------------------------------------------------------------------------------------

--Update Password of Retailer
--Take Reailer Object as Input

CREATE procedure GreatOutdoors.UpdatePassword(@retailerID varchar(30), @retailerName varchar(30),@retailerEmail varchAR(30),
@password varchar(20), @retailerMobile varchar(50), @CreationDateTime datetime, @LastModifiedDateTime datetime)
AS 
  BEGIN
	begin try
		update GreatOutdoors.Retailers set password= @password,LastModifiedDateTime =@LastModifiedDateTime
		where RetailerID= @retailerID
	end try
	begin Catch
		throw 500000,'Retailer Not Updated',1
	end catch	
  END
---------------------------------------------------------------------------------------------------------------------------------------------------------------

--Get Retailer By retailerID
-- Takes retailer ID as input

CREATE procedure GreatOutdoors.GetReatilerByReatilerID(@retailerID varchar(30))
AS
  BEGIN
	begin try
		select * from GreatOutdoors.Retailers where RetailerID=@retailerID
	end try
	begin catch
		throw 500021,'RetailerID does not Exist',1
	end catch
  END
---------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Procedure For selecting Reailer by Email
--Takes Email As Input

CREATE procedure GreatOutdoors.GetReatilerByEmail(@retailerEmail varchar(30))
AS
  BEGIN
	begin try
		select * from GreatOutdoors.Retailers where RetailerEmail=@retailerEmail
	end try
	begin catch
		throw 500021,'Retailer Email does not Exist',1
	end catch
  END
---------------------------------------------------------------------------------------------------------------------------------------------------------------

--Procedure for Select Retailer By EmailId and PassWord
--Takes Email and Password as Input

CREATE procedure GreatOutdoors.GetReatilerByEmailAndPassword(@retailerEmail varchar(30), @password varchar(30))
AS
  BEGIN
	begin try
		select * from GreatOutdoors.Retailers where RetailerEmail=@retailerEmail and Password = @password
	end try
	begin catch
		throw 500021,'Retailer Email and Password Invalid',1
	end catch
  END
---------------------------------------------------------------------------------------------------------------------------------------------------------------

--Get Reatiler By Name
--Take Name as Input
CREATE  procedure GreatOutdoors.GetReatilerByName(@retailerName varchar(30))
AS
  BEGIN
	begin try
		select * from GreatOutdoors.Retailers where RetailerName=@retailerName
	end try
	begin catch
		throw 500021,'RetailerID does not Exist',1
	end catch
  END

----------------------------------------------------------------------------------------------------------------------------------------------------------------
- Created By Prafull on 01/10/2019
-- Procedure For Adding Address

CREATE procedure GreatOutdoors.AddAddress(@addressID varchar(30), @addressLine1 varchar(30),@addressLine2 varchAR(50),
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
		insert into GreatOutdoors.Addresses values(@addressID, @addressLine1,@addressLine2,@landmark,@city,@state,@pinCode,@retailerID,@CreationDateTime,@LastModifiedDateTime)
	end try
	begin Catch
		throw 500000,'Address Not Added',1
	end catch	
  END
---------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Procedure to Update Address
-- It takes Address Object As input

CREATE procedure GreatOutdoors.UpdateAddress(@addressID varchar(30), @addressLine1 varchar(30),@addressLine2 varchAR(50),
@landmark varchar(20), @city varchar(20),@state varchar(20), @pinCode varchar(20),@retailerID varchar(20), @CreationDateTime datetime, @LastModifiedDateTime datetime)
AS 
  BEGIN
	begin try
		if @addressID =''
	  	   begin
		      throw 500010,'Address ID Is Must',1
	 	   end
		else
		    update GreatOutdoors.Addresses set AddressLine1=@addressLine1,AddressLine2=@addressLine2,LandMark=@landmark,City=@city,State =@state,PinCode=@pinCode,LastModifiedDateTime=@LastModifiedDateTime where AddressID = @addressID
	end try
	begin Catch
		throw 500000,'Address Not Added',1
	end catch	
  END

---------------------------------------------------------------------------------------------------------------------------------------------------------------

--Create Procedure for selecting address based on RetailerID
--Input is retailerID

CREATE procedure GreatOutdoors.GetAddressesByRetailerID(@retailerID varchar(30))
AS
  BEGIN
	begin try
		Select *From GreatOutdoors.Addresses where RetailerID = @retailerID
	end try
	begin catch
		throw 500010,'Invalid Retailer ID',1
	end catch
  END
---------------------------------------------------------------------------------------------------------------------------------------------------------------

--Create Procedure for selecting address based on RetailerID
--Input is retailerID

CREATE procedure GreatOutdoors.GetAddressesByAddressID(@addressID varchar(30))
AS
  BEGIN
	begin try
		Select *From GreatOutdoors.Addresses where AddressID = @addressID
	end try
	begin catch
		throw 500010,'Address Id Does Not Exist',1
	end catch
  END
---------------------------------------------------------------------------------------------------------------------------------------------------------------

--Create Procedure for selecting address based on RetailerID
--Input is retailerID

CREATE procedure GreatOutdoors.DeleteAddress(@addressID varchar(30))
AS
  BEGIN
	begin try
		Delete From GreatOutdoors.Addresses where AddressID = @addressID
	end try
	begin catch
		throw 500010,'Address Not Deleted',1
	end catch
  END


