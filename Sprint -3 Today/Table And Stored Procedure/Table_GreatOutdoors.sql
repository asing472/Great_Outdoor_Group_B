-- Cretate By Prafull Sharma on 25/09/2019

-- Retailers Table with Column Name
Create DATABASE GreatOutdoors
Go

USE GreatOutdoors
Go

CREATE SCHEMA Greatoutdoors
GO

CREATE TABLE GreatOutdoors.Retailers
(
 RetailerID       varchar(30)        PRIMARY KEY,
 RetailerName     VARCHAR(30)        NOT NULL,
 RetailerEmail    VARCHAR(50)        NOT NULL, 
 Password         VARCHAR(20)        NOT NULL,
 RetailerMobile   VARCHAR (13)       NOT NULL,
 CreationDateTime datetime, 
 LastModifiedDateTime datetime
)
-- Cretate By Prafull Sharma on 25/09/2019

-- Retailers Address Table
CREATE TABLE GreatOutdoors.Addresses
(
 AddressID                  varchar(30)
 CONSTRAINT                AddressID_PK   PRIMARY KEY,
 AddressLine1               VARCHAR(50)   NOT NULL,
 AddressLine2               VARCHAR(50)   NOT NULL, 
 LandMark                   VARCHAR(20) ,
 City                       VARCHAR (20)  NOT NULL,
 State                      VARCHAR(20) ,
 PinCode                    VARCHAR (20) NOT NULL,
 RetailerID                 varchar(30) REFERENCES  GreatOutdoors.Retailers(RetailerID),
 CreationDateTime            datetime, 
 LastModifiedDateTime        datetime
)
-- Cretate By Shravni on 25/09/2019

/*
created admin table
*/
create table GreatOutdoors.AdminTable
(
AdminID                          uniqueidentifier  primary key,
AdminName                        varchar(30) not null,
Email                            varchar(30) unique not null,
Password                         varchar(15) not null,
CreationDateTime                  datetime,
LastModifiedDateTime              datetime
)
go
-- Cretate By Shravni on 25/09/2019
/*
created View sales reports table
*/
create table ViewSalesReports
(
ReportId                    varchar(20)   primary key,
SalespersonID               varchar(20)   REFERENCES  GreatOutdoors.SalesPersons(SalesPersonID),
SalespersonName             varchar(30)    not null,
OfflinesalesCount           int,
TotalAmount                 money,
Target                      varchar(10),
LastUpdatedsalestime        datetime
)
go
-- Cretate By Prafull Sharma on 25/09/2019
--Retailer Report Table
CREATE TABLE GreatOutdoors.RetailerReport
(
RetailerID               varchar(30)    Primary Key REFERENCES GreatOutdoors.Retailers(RetailerID),
RetailerSalesCount        int,  
RetailerSalesAmount      money

)
-- Cretate By Ayush Agrawal on 25/09/2019

-- SalesPersons Table with Column Name

CREATE TABLE GreatOutdoors.SalesPersons
(
 SalesPersonID              varchar(20)            Constraint Pk_SalesPerson Primary key,
 SalesPerson_Name           VARCHAR(30)             NOT NULL,
 Email                      VARCHAR(50)             NOT NULL,
 Password                   VARCHAR(20)             NOT NULL,
 SalesPerson_Mobile         VARCHAR(50)             NOT NULL,
 Creation_DateTime          datetime,
 Last_Modified_DateTime     datetime,
 )
 Go

 --created by  Arshpreet on 30/09/2019
--Product table creation

create table GreatOutdoors.Product
(
ProductID               varchar(30)     constraint ProductPK primary key,
ProductName             varchar(15)    not null,
ProductNumber            int           not  null constraint PNumberUnique unique,
ProductCategory         varchar(25)    not null  constraint PCategoryIN check(ProductCategory in('Camping Equipment','Outdoor Protection','Personal Accessories','Mountaineering Equipment','Golf Equipment')),
ProductColor            varchar(30)    not null,
ProductSize             varchar(15)    not null,
ProductMaterial         varchar(30)    not null,
ProductPrice             money         not null constraint PPriceNotNegative check(ProductPrice>0),
CreationDateTime        DateTime,
LastModifiedDateTime    DateTime
)
-- Cretate By Akhil on 25/09/2019
--Orders Table to store orders
create table GreatOutdoors.OrdersTable
(
OrderId         varchar(30)     primary key not null,
RetailerId      varchar(30)     not null,
DateOfOrder     datetime        not null,
TotalQuantity    int            not null,
OrderAmount     float           not null,
LastModifiedDateTime datetime   not null,
OrderStatus     varchar(20)     not null,
OrderNumber     int             not null
)
-- Cretate By Akhil on 25/09/2019
--Orders Table to store orderdetails
create table GreatOutdoors.OrderDetailsTable
(
OrderDetailId     varchar(30)     primary key not null,
OrderId           varchar(30)     foreign key references Greatoutdoors.OrdersTable,
IsCancelled       varchar(3)      default 'no',
ProductID         varchar(30)      not null,
ProductQuantityOrdered int        not null,
ProductPrice      float          not null,
AddressId        varchar(30)     not null,
TotalAmount       float          not null,   
LastModifiedDateTime datetime    not null,
DateOfOrder      datetime        not null,
)

--created by Ayush Agrawal  on 25/09/2019
-- Online Returns Table Created with OnlineReturns Column
Create Table Greatoutdoors.OnlineReturns
(
 OnlineReturn_ID              varchar(30)                  Primary key Not Null,
 OrderId                      varchar(30)     NOT NULL     REFERENCES GreatOutdoors.OrdersTable(OrderId),
 ProductNumber                int             NOT NULL     REFERENCES GreatOutdoors.Product(ProductNumber),
 QuantityOfReturn             int             NOT NULL,
 Purpose                      VARCHAR(40)     NOT NULL,
 RetailerID                   varchar(30)     NOT NULL     REFERENCES Greatoutdoors.Retailers(RetailerID),
 ProductPrice                 Decimal         NOT NULL,
 TotalAmount                  int             NOT NULL,
 Creation_DateTime            datetime,
 Last_Modified_DateTime       datetime,
   
)
GO

-- Cretate By Abhishek on 25/09/2019

-- Creating table for OfflineOrder class
CREATE TABLE GreatOutdoors.OfflineOrders
(
OfflineOrderID     varchar(30)               NOT NULL       CONSTRAINT PK_OfflineOrderID Primary key,
RetailerID         varchar(30)               NOT NULL       REFERENCES Greatoutdoors.Retailers(RetailerID),
SalesPersonID      varchar(20)               NOT NULL       REFERENCES Greatoutdoors.SalesPersons(SalesPersonID),
TotalOfflineOrderAmount float                NOT NULL,
TotalQuantity      float                     NOT NULL,
OfflineOrderNumber  int                      NOT NULL,
CreationDateTime     DATETIME                NOT NULL,
LastModifiedDateTime DATETIME NOT NULL)

GO
-- Cretate By Abhishek on 25/09/2019
--Offline OfflineOrder Detail table creation
CREATE TABLE GreatOutdoors.OfflineOrderDetails(
OfflineOrderDetailID            varchar(30)  NOT NULL CONSTRAINT PK_OfflineOrderDetailID Primary key,
ProductID                       varchar(30)  NOT NULL,
ProductName                     varchar(30),
Quantity                        float,
UnitPrice                       float,
TotalPrice                      float,
CreationDateTime                DATETIME    NOT NULL,
LastModifiedDateTime            DATETIME    NOT NULL,
OfflineOrderID                  varchar(30) NOT NULL CONSTRAINT FK_OfflineOrders_OfflineOrderID REFERENCES GreatOutdoors.OfflineOrders(OfflineOrderID))

GO
-- Cretate By Abhishek on 25/09/2019
Create Table GreatOutdoors.OfflineReturns
(
 OfflineReturn_ID           varchar(30)          CONSTRAINT PK_OfflineReturn Primary key,
 Purpose                    varchar(30) NOT NULL,
 QuantityOfReturn           int         NOT NULL,
 OfflineOrder_ID            varchar(30) NOT NULL CONSTRAINT FK1_OfflineOrders_OfflineOrderID REFERENCES GreatOutdoors.OfflineOrders(OfflineOrderID),
 Product_ID                 varchar(30) NOT NULL, 
 ReturnAmount               int         NOT NULL,
 Unit_Price                 Decimal     NOT NULL,
 CreationDateTime           datetime,
 LastModifiedDateTime       datetime,
   
)
GO


 