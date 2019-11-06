USE [13th Aug CLoud PT Immersive]
GO
/****** Object:  Table [TeamB].[Addresses]    Script Date: 06-11-2019 09:51:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [TeamB].[Addresses](
	[AddressID] [uniqueidentifier] NOT NULL,
	[AddressLine1] [varchar](50) NOT NULL,
	[AddressLine2] [varchar](50) NOT NULL,
	[LandMark] [varchar](20) NULL,
	[City] [varchar](20) NOT NULL,
	[State] [varchar](20) NOT NULL,
	[PinCode] [varchar](20) NOT NULL,
	[RetailerID] [uniqueidentifier] NULL,
	[CreationDateTime] [datetime] NULL,
	[LastModifiedDateTime] [datetime] NULL,
 CONSTRAINT [AddressID_PK] PRIMARY KEY CLUSTERED 
(
	[AddressID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [TeamB].[Admin]    Script Date: 06-11-2019 09:51:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [TeamB].[Admin](
	[AdminID] [uniqueidentifier] NOT NULL,
	[AdminName] [varchar](30) NOT NULL,
	[Email] [varchar](30) NOT NULL,
	[Password] [varchar](15) NOT NULL,
	[CreationDateTime] [datetime] NULL,
	[LastModifiedDateTime] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[AdminID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [TeamB].[OfflineOrderDetails]    Script Date: 06-11-2019 09:51:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [TeamB].[OfflineOrderDetails](
	[OfflineOrderDetailID] [uniqueidentifier] NOT NULL,
	[ProductID] [uniqueidentifier] NOT NULL,
	[ProductName] [varchar](30) NULL,
	[Quantity] [int] NULL,
	[UnitPrice] [money] NULL,
	[TotalPrice] [money] NULL,
	[CreationDateTime] [datetime] NOT NULL,
	[LastModifiedDateTime] [datetime] NOT NULL,
	[OfflineOrderID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_OfflineOrderDetailID] PRIMARY KEY CLUSTERED 
(
	[OfflineOrderDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [TeamB].[OfflineOrders]    Script Date: 06-11-2019 09:51:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [TeamB].[OfflineOrders](
	[OfflineOrderID] [uniqueidentifier] NOT NULL,
	[RetailerID] [uniqueidentifier] NOT NULL,
	[SalesPersonID] [uniqueidentifier] NOT NULL,
	[TotalOrderAmount] [money] NULL,
	[TotalQuantity] [money] NULL,
	[CreationDateTime] [datetime] NOT NULL,
	[LastModifiedDateTime] [datetime] NOT NULL,
 CONSTRAINT [PK_OfflineOrderID] PRIMARY KEY CLUSTERED 
(
	[OfflineOrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [TeamB].[OfflineReturns]    Script Date: 06-11-2019 09:51:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [TeamB].[OfflineReturns](
	[OfflineReturn_ID] [uniqueidentifier] NOT NULL,
	[Purpose] [varchar](30) NOT NULL,
	[QuantityOfReturn] [int] NOT NULL,
	[OfflineOrder_ID] [uniqueidentifier] NOT NULL,
	[Product_ID] [uniqueidentifier] NOT NULL,
	[ReturnAmount] [money] NOT NULL,
	[Unit_Price] [money] NOT NULL,
	[CreationDateTime] [datetime] NULL,
	[LastModifiedDateTime] [datetime] NULL,
 CONSTRAINT [PK_OfflineReturn] PRIMARY KEY CLUSTERED 
(
	[OfflineReturn_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [TeamB].[OnlineReturns]    Script Date: 06-11-2019 09:51:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [TeamB].[OnlineReturns](
	[OnlineReturnID] [uniqueidentifier] NOT NULL,
	[OrderID] [uniqueidentifier] NOT NULL,
	[OrderNumber] [int] NOT NULL,
	[ProductNumber] [int] NOT NULL,
	[ProductID] [uniqueidentifier] NOT NULL,
	[QuantityOfReturn] [int] NOT NULL,
	[Purpose] [varchar](40) NOT NULL,
	[RetailerID] [uniqueidentifier] NOT NULL,
	[ProductPrice] [money] NOT NULL,
	[TotalAmount] [money] NOT NULL,
	[CreationDateTime] [datetime] NULL,
	[LastModifiedDateTime] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[OnlineReturnID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [TeamB].[OrderDetails]    Script Date: 06-11-2019 09:51:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [TeamB].[OrderDetails](
	[OrderDetailID] [uniqueidentifier] NOT NULL,
	[OrderID] [uniqueidentifier] NOT NULL,
	[IsCancelled] [varchar](3) NULL DEFAULT ('no'),
	[ProductID] [uniqueidentifier] NOT NULL,
	[ProductQuantityOrdered] [int] NOT NULL,
	[ProductPrice] [money] NOT NULL,
	[ProductName] [varchar](20) NULL,
	[AddressID] [uniqueidentifier] NOT NULL,
	[TotalAmount] [money] NOT NULL,
	[LastModifiedDateTime] [datetime] NOT NULL,
	[DateOfOrder] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [TeamB].[Orders]    Script Date: 06-11-2019 09:51:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [TeamB].[Orders](
	[OrderID] [uniqueidentifier] NOT NULL,
	[RetailerID] [uniqueidentifier] NOT NULL,
	[DateOfOrder] [datetime] NOT NULL,
	[TotalQuantity] [int] NOT NULL,
	[OrderAmount] [money] NOT NULL,
	[LastModifiedDateTime] [datetime] NOT NULL,
	[OrderNumber] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [OrderID_PK] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [TeamB].[Product]    Script Date: 06-11-2019 09:51:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [TeamB].[Product](
	[ProductID] [uniqueidentifier] NOT NULL,
	[ProductName] [varchar](15) NOT NULL,
	[ProductNumber] [int] NOT NULL,
	[ProductCategory] [varchar](25) NOT NULL,
	[ProductColor] [varchar](30) NOT NULL,
	[ProductSize] [varchar](15) NOT NULL,
	[ProductMaterial] [varchar](30) NOT NULL,
	[ProductPrice] [money] NOT NULL,
	[CreationDateTime] [datetime] NULL,
	[LastModifiedDateTime] [datetime] NULL,
 CONSTRAINT [ProductPK] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [PNumberUnique] UNIQUE NONCLUSTERED 
(
	[ProductNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [TeamB].[Retailers]    Script Date: 06-11-2019 09:51:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [TeamB].[Retailers](
	[RetailerID] [uniqueidentifier] NOT NULL,
	[RetailerName] [varchar](30) NOT NULL,
	[RetailerEmail] [varchar](50) NOT NULL,
	[Password] [varchar](20) NOT NULL,
	[RetailerMobile] [varchar](13) NOT NULL,
	[CreationDateTime] [datetime] NULL,
	[LastModifiedDateTime] [datetime] NULL,
 CONSTRAINT [RetailerID_PK] PRIMARY KEY CLUSTERED 
(
	[RetailerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[RetailerEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [TeamB].[SalesPersons]    Script Date: 06-11-2019 09:51:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [TeamB].[SalesPersons](
	[SalesPersonID] [uniqueidentifier] NOT NULL,
	[SalesPersonName] [varchar](30) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Password] [varchar](20) NOT NULL,
	[SalesPersonMobile] [varchar](50) NOT NULL,
	[CreationDateTime] [datetime] NULL,
	[LastModifiedDateTime] [datetime] NULL,
 CONSTRAINT [Pk_SalesPerson] PRIMARY KEY CLUSTERED 
(
	[SalesPersonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [TeamB].[ViewSalesReport]    Script Date: 06-11-2019 09:51:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [TeamB].[ViewSalesReport](
	[SalesPersonID] [uniqueidentifier] NULL,
	[SalespersonName] [varchar](30) NOT NULL,
	[OfflineCustomers] [int] NULL,
	[Totalitems] [int] NULL,
	[TotalAmount] [money] NULL,
	[Target] [varchar](10) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [TeamB].[Addresses]  WITH CHECK ADD  CONSTRAINT [FK_RetailerID_For_Address] FOREIGN KEY([RetailerID])
REFERENCES [TeamB].[Retailers] ([RetailerID])
GO
ALTER TABLE [TeamB].[Addresses] CHECK CONSTRAINT [FK_RetailerID_For_Address]
GO
ALTER TABLE [TeamB].[OfflineOrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OfflineOrders_OfflineOrderID] FOREIGN KEY([OfflineOrderID])
REFERENCES [TeamB].[OfflineOrders] ([OfflineOrderID])
GO
ALTER TABLE [TeamB].[OfflineOrderDetails] CHECK CONSTRAINT [FK_OfflineOrders_OfflineOrderID]
GO
ALTER TABLE [TeamB].[OfflineOrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_PRODUCTID_FOR_OOD] FOREIGN KEY([ProductID])
REFERENCES [TeamB].[Product] ([ProductID])
GO
ALTER TABLE [TeamB].[OfflineOrderDetails] CHECK CONSTRAINT [FK_PRODUCTID_FOR_OOD]
GO
ALTER TABLE [TeamB].[OfflineOrders]  WITH CHECK ADD FOREIGN KEY([RetailerID])
REFERENCES [TeamB].[Retailers] ([RetailerID])
GO
ALTER TABLE [TeamB].[OfflineOrders]  WITH CHECK ADD FOREIGN KEY([SalesPersonID])
REFERENCES [TeamB].[SalesPersons] ([SalesPersonID])
GO
ALTER TABLE [TeamB].[OfflineReturns]  WITH CHECK ADD  CONSTRAINT [FK_PRODUCTID_FOR_OR] FOREIGN KEY([Product_ID])
REFERENCES [TeamB].[Product] ([ProductID])
GO
ALTER TABLE [TeamB].[OfflineReturns] CHECK CONSTRAINT [FK_PRODUCTID_FOR_OR]
GO
ALTER TABLE [TeamB].[OfflineReturns]  WITH CHECK ADD  CONSTRAINT [FK1_OfflineOrders_OfflineOrderID] FOREIGN KEY([OfflineOrder_ID])
REFERENCES [TeamB].[OfflineOrders] ([OfflineOrderID])
GO
ALTER TABLE [TeamB].[OfflineReturns] CHECK CONSTRAINT [FK1_OfflineOrders_OfflineOrderID]
GO
ALTER TABLE [TeamB].[OnlineReturns]  WITH CHECK ADD FOREIGN KEY([OrderID])
REFERENCES [TeamB].[Orders] ([OrderID])
GO
ALTER TABLE [TeamB].[OnlineReturns]  WITH CHECK ADD  CONSTRAINT [FK_PRODUCTID_FOR_ONR] FOREIGN KEY([ProductID])
REFERENCES [TeamB].[Product] ([ProductID])
GO
ALTER TABLE [TeamB].[OnlineReturns] CHECK CONSTRAINT [FK_PRODUCTID_FOR_ONR]
GO
ALTER TABLE [TeamB].[OnlineReturns]  WITH CHECK ADD  CONSTRAINT [FK_RetailerID_ForOnlineReturn] FOREIGN KEY([RetailerID])
REFERENCES [TeamB].[Retailers] ([RetailerID])
GO
ALTER TABLE [TeamB].[OnlineReturns] CHECK CONSTRAINT [FK_RetailerID_ForOnlineReturn]
GO
ALTER TABLE [TeamB].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_for_OrderDetail_of_AddressID] FOREIGN KEY([AddressID])
REFERENCES [TeamB].[Addresses] ([AddressID])
GO
ALTER TABLE [TeamB].[OrderDetails] CHECK CONSTRAINT [FK_for_OrderDetail_of_AddressID]
GO
ALTER TABLE [TeamB].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderID] FOREIGN KEY([OrderID])
REFERENCES [TeamB].[Orders] ([OrderID])
GO
ALTER TABLE [TeamB].[OrderDetails] CHECK CONSTRAINT [FK_OrderID]
GO
ALTER TABLE [TeamB].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_ProductID] FOREIGN KEY([ProductID])
REFERENCES [TeamB].[Product] ([ProductID])
GO
ALTER TABLE [TeamB].[OrderDetails] CHECK CONSTRAINT [FK_ProductID]
GO
ALTER TABLE [TeamB].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_RetailerID_For_Order] FOREIGN KEY([RetailerID])
REFERENCES [TeamB].[Retailers] ([RetailerID])
GO
ALTER TABLE [TeamB].[Orders] CHECK CONSTRAINT [FK_RetailerID_For_Order]
GO
ALTER TABLE [TeamB].[ViewSalesReport]  WITH CHECK ADD  CONSTRAINT [FK_SalesPerson_Id] FOREIGN KEY([SalesPersonID])
REFERENCES [TeamB].[SalesPersons] ([SalesPersonID])
GO
ALTER TABLE [TeamB].[ViewSalesReport] CHECK CONSTRAINT [FK_SalesPerson_Id]
GO
ALTER TABLE [TeamB].[Product]  WITH CHECK ADD  CONSTRAINT [PCategoryIN] CHECK  (([ProductCategory]='Golf Equipment' OR [ProductCategory]='Mountaineering Equipment' OR [ProductCategory]='Personal Accessories' OR [ProductCategory]='Outdoor Protection' OR [ProductCategory]='Camping Equipment'))
GO
ALTER TABLE [TeamB].[Product] CHECK CONSTRAINT [PCategoryIN]
GO
ALTER TABLE [TeamB].[Product]  WITH CHECK ADD  CONSTRAINT [PPriceNotNegative] CHECK  (([ProductPrice]>(0)))
GO
ALTER TABLE [TeamB].[Product] CHECK CONSTRAINT [PPriceNotNegative]
GO
