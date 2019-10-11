--Created By Prafull Sharma on 29/09/2019
-- Retailer Report Procedure
Create procedure GreatOutdoor.UpdateRetailerReport(@retailerID varchar(30), @retailerSalesCount int,@retailerSalesAmount money)
AS 
BEGIN
begin try
update GreatOutdoor.RetailerReport set RetailerSalesCount= @retailerSalesCount,RetailerSalesAmount = @retailerSalesAmount
where RetailerID= @retailerID
end try
begin Catch
throw 500000,'Retailer Not Updated',1
end catch	
END