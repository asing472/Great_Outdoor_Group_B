
-- Cretate By Prafull Sharma on 25/09/2019

-- Retailers Table with Column Name
CREATE TABLE GreatOutdoor.Retailers
(
 RetailerID  varchar(30) PRIMARY KEY,
 RetailerName VARCHAR(30) NOT NULL,
 RetailerEmail VARCHAR(50) NOT NULL, 
 Password VARCHAR(20) NOT NULL,
 RetailerMobile VARCHAR (13) NOT NULL,
 CreationDateTime datetime, 
 LastModifiedDateTime datetime
)

-- Retailers Address Table
CREATE TABLE GreatOutdoor.Addresses
(
 AddressID  varchar(30)
 CONSTRAINT  AddressID_PK PRIMARY KEY,
 AddressLine1 VARCHAR(50) NOT NULL,
 AddressLine2 VARCHAR(50) NOT NULL, 
 LandMark VARCHAR(20) ,
 City VARCHAR (20) NOT NULL,
 State VARCHAR(20) ,
 PinCode VARCHAR (20) NOT NULL,
 RetailerID varchar(30)
 REFERENCES  GreatOutdoor.Retailers(RetailerID),
 CreationDateTime datetime, 
 LastModifiedDateTime datetime
)

--Retailer Report Table
CREATE TABLE GreatOutdoor.RetailerReport
(
RetailerID varchar(30) Primary Key
REFERENCES  GreatOutdoor.Retailers(RetailerID),
RetailerSalesCount int,  
RetailerSalesAmount money
)
