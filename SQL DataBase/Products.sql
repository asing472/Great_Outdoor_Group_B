--created by  Arshpreet 

-- Date: 30/09/2019

--Product table creation

create database GreatOutdoor;

create table Product
(
	ProductID varchar(30)constraint ProductPK primary key,

	ProductName varchar(15) not null,

	ProductNumber int not  null constraint PNumberUnique unique,

	ProductCategory varchar(25) not null constraint PCategoryIN check(ProductCategory in
	('Camping Equipment','Outdoor Protection','Personal Accessories','Mountaineering Equipment','Golf Equipment')),

	ProductColor varchar(30) not null,

	ProductSize varchar(15) not null,

	ProductMaterial varchar(30) not null,

	ProductPrice money not null constraint PPriceNotNegative check(ProductPrice>0),

	CreationDateTime DateTime,

	LastModifiedDateTime DateTime,
)

drop table Product

Select * from Product
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