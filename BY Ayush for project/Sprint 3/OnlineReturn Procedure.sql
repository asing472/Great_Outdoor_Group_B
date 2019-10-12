USE GreatOutdoor
Go
DROP TABLE Greatoutdoor.Users.OnlineReturns
Create Table Users.OnlineReturns
(
 OnlineReturn_ID              varchar(255)       CONSTRAINT PK_OnlineReturn Primary key,
 OrderNumber                  varchar(255) NOT NULL ,--CONSTRAINT FK_Orders_OrderID REFERENCES Users.Orders(Order_ID),
 ProductNumber                varchar(255) NOT NULL, ---CONSTRAINT FK_Products_ProductID REFERENCES Users.Product(Product_ID),
 QuantityOfReturn             int NOT NULL,
 Purpose                      VARCHAR(50) NOT NULL,
 Retailer_ID                  varchar(255) NOT NULL, --CONSTRAINT FK_Retailer_RetailerID REFERENCES Users.Retailer(Retailer_ID),
 ProductPrice                 Decimal NOT NULL,
 TotalAmount                  int NOT NULL,
 Creation_DateTime            datetime,
 Last_Modified_DateTime       datetime,
   
)
GO

 Select*from GreatOutdoor.Users.OnlineReturns
 -- Created By Ayush Agrawal on 01/10/2019
 --Created Table With VARCHAR OF ONLINERETURN

--Exec GreatOutdoor.Users.AddOnlineReturn '100','30', 2000,200,'10', 'defective', 10,'1-oct-2019',34

 alter Procedure Users.AddOnlineReturn(@onlinereturnid varchar(255), @orderNumber varchar(255), 
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
     Insert into GreatOutdoor.Users.OnlineReturns(OnlineReturn_ID, OrderNumber, ProductNumber,  Purpose, 
   QuantityOfReturn, Last_Modified_DateTime, Creation_DateTime, ProductPrice, TotalAmount, Retailer_ID)
        values(@onlinereturnid, @orderNumber, @productNumber, @purpose, @quantityofreturn,
   null,@creationdatetime, @productprice, @totalamount, @retailerid)
end

--created procedure


Select*from GreatOutdoor.Users.OnlineReturns

-- Created By Ayush Agrawal on 01/10/2019
 --Created Table With VARCHAR OF ONLINERETURN
Create Procedure Users.GetOnlineReturnByOnlineReturnID(@onlinereturnid VARCHAR(255))
AS
BEGIN
   begin try
   select * from GreatOutdoor.Users.OnlineReturns where OnlineReturn_ID = @onlinereturnid
   end try
   begin catch
   PRINT @@ERROR;
	  throw 5000, 'Invalid Values fatched',2
	  return 0
   end catch
end
Go
--created procedure

--Exec Users.GetOnlineReturnByOnlineReturnID 100



-- Created By Ayush Agrawal on 01/10/2019
 --Created Table With VARCHAR OF ONLINERETURN
Create Procedure Users.GetOnlineReturnsByPurpose(@purpose VARCHAR(50))
AS
BEGIN
   begin try
   select * from GreatOutdoor.Users.OnlineReturns where Purpose = @purpose
   end try
   begin catch
   PRINT @@ERROR;
	  throw 5000, 'Invalid Values fatched',3
   return 0
   end catch
end
Go
--created procedure

--Exec Users.GetOnlineReturnsByPurpose 'Unsatisfactory'


-- Created By Ayush Agrawal on 01/10/2019
 --Created Table With VARCHAR OF RetailerID

Create Procedure Users.GetOnlineReturnByRetailerID(@retailerID VARCHAR(50))
AS
BEGIN
   begin try
   select * from GreatOutdoor.Users.OnlineReturns where Retailer_ID = @retailerID
   end try
   begin catch
   PRINT @@ERROR;
	  throw 5000, 'Invalid Values fatched',4  
   return 0
   end catch
end
Go
--created procedure
   
  -- Exec Users.GetOnlineReturnByRetailerID 20


  -- Created By Ayush Agrawal on 01/10/2019
 --Created Table With VARCHAR OF ONLINERETURN

Create Procedure Users.DeleteOnlineReturn(@onlinereturnid VARCHAR(255))
AS
BEGIN
   begin try
   Delete from GreatOutdoor.Users.OnlineReturns where OnlineReturn_ID = @onlinereturnid
   end try
   begin catch
   PRINT @@ERROR;
	  throw 5000, 'Invalid Values fatched',5
   return 0
   end catch
end
Go
--created procedure



-- Created By Ayush Agrawal on 01/10/2019
 --Created Table With VARCHAR OF ONLINERETURN
Create Procedure Users.UpdateOnlineReturn(@onlinereturnid VARCHAR(255), @purpose varchar(50), @quantityofreturn int)
AS
BEGIN
   begin try
   Update GreatOutdoor.Users.OnlineReturns set QuantityOfReturn =@quantityofreturn,Purpose=@purpose  Where   OnlineReturn_ID = @onlinereturnid
   end try
   begin catch
   PRINT @@ERROR;
	  throw 5000, 'Invalid Values fatched',6
	  return 0
   end catch
end
Go

Exec Users.UpdateOnlineReturn'100', 'unsatisfactory', 20
Select* from Users.OnlineReturns

--created procedure

Create Procedure Users.GetAllOnlineReturns(@onlinereturnid varchar(255))
AS
BEGIN
   begin try
   select * from GreatOutdoor.Users.OnlineReturns 
   end try
   begin catch
   PRINT @@ERROR;
	  throw 5000, 'Invalid Values fatched',7
	  return 0
   end catch
end
Go
--created procedure

--Exec Users.GetAllOnlineReturns 100
   
   
   