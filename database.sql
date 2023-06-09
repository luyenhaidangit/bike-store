USE [master]
GO
/****** Object:  Database [WebsiteXeDapMVC]    Script Date: 12/04/2023 6:20:16 CH ******/
CREATE DATABASE [WebsiteXeDapMVC]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'WebsiteXeDapMVC', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\WebsiteXeDapMVC.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'WebsiteXeDapMVC_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\WebsiteXeDapMVC_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [WebsiteXeDapMVC] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [WebsiteXeDapMVC].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [WebsiteXeDapMVC] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [WebsiteXeDapMVC] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [WebsiteXeDapMVC] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [WebsiteXeDapMVC] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [WebsiteXeDapMVC] SET ARITHABORT OFF 
GO
ALTER DATABASE [WebsiteXeDapMVC] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [WebsiteXeDapMVC] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [WebsiteXeDapMVC] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [WebsiteXeDapMVC] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [WebsiteXeDapMVC] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [WebsiteXeDapMVC] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [WebsiteXeDapMVC] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [WebsiteXeDapMVC] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [WebsiteXeDapMVC] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [WebsiteXeDapMVC] SET  DISABLE_BROKER 
GO
ALTER DATABASE [WebsiteXeDapMVC] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [WebsiteXeDapMVC] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [WebsiteXeDapMVC] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [WebsiteXeDapMVC] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [WebsiteXeDapMVC] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [WebsiteXeDapMVC] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [WebsiteXeDapMVC] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [WebsiteXeDapMVC] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [WebsiteXeDapMVC] SET  MULTI_USER 
GO
ALTER DATABASE [WebsiteXeDapMVC] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [WebsiteXeDapMVC] SET DB_CHAINING OFF 
GO
ALTER DATABASE [WebsiteXeDapMVC] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [WebsiteXeDapMVC] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [WebsiteXeDapMVC] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [WebsiteXeDapMVC] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [WebsiteXeDapMVC] SET QUERY_STORE = OFF
GO
USE [WebsiteXeDapMVC]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 12/04/2023 6:20:17 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CateID] [bigint] IDENTITY(1,1) NOT NULL,
	[CateName] [nvarchar](200) NULL,
	[Num] [int] NULL,
	[Status] [bit] NULL,
	[CateParentID] [bigint] NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CheckWarehouse]    Script Date: 12/04/2023 6:20:17 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CheckWarehouse](
	[CWhID] [bigint] IDENTITY(1,1) NOT NULL,
	[UserID] [bigint] NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[StatusWarehouse] [int] NULL,
	[WareID] [bigint] NULL,
	[Description] [ntext] NULL,
PRIMARY KEY CLUSTERED 
(
	[CWhID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CheckWarehouseDetail]    Script Date: 12/04/2023 6:20:17 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CheckWarehouseDetail](
	[CWD] [bigint] IDENTITY(1,1) NOT NULL,
	[ProID] [bigint] NULL,
	[CWhID] [bigint] NULL,
	[RealQuantity] [int] NULL,
	[CalculationNumber] [int] NULL,
	[DifferenceAmount] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[CWD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 12/04/2023 6:20:17 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment](
	[CmtID] [bigint] IDENTITY(1,1) NOT NULL,
	[CusID] [bigint] NULL,
	[ProID] [bigint] NULL,
	[Content] [ntext] NULL,
	[DateCmt] [nchar](10) NULL,
 CONSTRAINT [PK__Comment__F7B85D9004397872] PRIMARY KEY CLUSTERED 
(
	[CmtID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 12/04/2023 6:20:17 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[CusID] [bigint] IDENTITY(1,1) NOT NULL,
	[CusName] [nvarchar](200) NULL,
	[Phone] [varchar](12) NULL,
	[Email] [varchar](200) NULL,
	[Address] [nvarchar](200) NULL,
	[UserName] [nvarchar](200) NULL,
	[Password] [nvarchar](200) NULL,
	[Image] [nvarchar](200) NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[CusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetailImageProduct]    Script Date: 12/04/2023 6:20:17 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetailImageProduct](
	[ImgID] [bigint] IDENTITY(1,1) NOT NULL,
	[ProID] [bigint] NULL,
	[ImagePath] [varchar](500) NULL,
	[Caption] [nvarchar](200) NULL,
	[IsDefault] [bit] NULL,
	[DateCreated] [date] NULL,
	[SortOrder] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ImgID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ImportBill]    Script Date: 12/04/2023 6:20:17 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ImportBill](
	[ImpID] [bigint] IDENTITY(1,1) NOT NULL,
	[ImpDate] [date] NULL,
	[PrvID] [bigint] NULL,
	[UserID] [bigint] NULL,
	[TotalPay] [bigint] NULL,
 CONSTRAINT [PK_ImportBill] PRIMARY KEY CLUSTERED 
(
	[ImpID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ImportBillDetail]    Script Date: 12/04/2023 6:20:17 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ImportBillDetail](
	[ImpID] [bigint] IDENTITY(1,1) NOT NULL,
	[ProID] [bigint] NULL,
	[Quantity] [int] NULL,
	[Price] [bigint] NULL,
 CONSTRAINT [PK_ImportBillDetail] PRIMARY KEY CLUSTERED 
(
	[ImpID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[News]    Script Date: 12/04/2023 6:20:17 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[News](
	[NewsID] [bigint] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](200) NULL,
	[UserID] [bigint] NULL,
	[PublicDate] [date] NULL,
	[Content] [ntext] NULL,
	[Image] [ntext] NULL,
 CONSTRAINT [PK_News] PRIMARY KEY CLUSTERED 
(
	[NewsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 12/04/2023 6:20:17 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrdID] [bigint] IDENTITY(1,1) NOT NULL,
	[CusID] [bigint] NULL,
	[OrderDate] [date] NULL,
	[Phone] [varchar](15) NULL,
	[Recipient] [nvarchar](200) NULL,
	[DeliveryAddress] [nvarchar](200) NULL,
	[Status] [nvarchar](200) NULL,
	[TotalPay] [bigint] NULL,
	[Note] [ntext] NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[OrdID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 12/04/2023 6:20:17 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[ODID] [bigint] IDENTITY(1,1) NOT NULL,
	[OrdID] [bigint] NOT NULL,
	[ProID] [bigint] NULL,
	[Quantity] [int] NULL,
	[Price] [float] NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[ODID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PriceHistory]    Script Date: 12/04/2023 6:20:17 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PriceHistory](
	[PrHID] [bigint] IDENTITY(1,1) NOT NULL,
	[ProID] [bigint] NULL,
	[StartDate] [date] NULL,
	[EndDate] [date] NULL,
	[Price] [decimal](18, 0) NULL,
PRIMARY KEY CLUSTERED 
(
	[PrHID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 12/04/2023 6:20:17 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProID] [bigint] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](200) NULL,
	[CateID] [bigint] NULL,
	[Desscription] [ntext] NULL,
	[DateCreated] [date] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ProID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PromotionalProductDetail]    Script Date: 12/04/2023 6:20:17 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PromotionalProductDetail](
	[PromotionalDetailID] [bigint] IDENTITY(1,1) NOT NULL,
	[PromotionalID] [bigint] NULL,
	[ProID] [bigint] NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[Status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[PromotionalDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PromotionalProducts]    Script Date: 12/04/2023 6:20:17 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PromotionalProducts](
	[PromotionalID] [bigint] IDENTITY(1,1) NOT NULL,
	[PromotionalName] [nvarchar](500) NULL,
	[Description] [ntext] NULL,
PRIMARY KEY CLUSTERED 
(
	[PromotionalID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Provider]    Script Date: 12/04/2023 6:20:17 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Provider](
	[PrvID] [bigint] IDENTITY(1,1) NOT NULL,
	[PrvName] [nvarchar](200) NULL,
	[Address] [nvarchar](200) NULL,
	[Phone] [varchar](12) NULL,
	[Email] [nvarchar](200) NULL,
 CONSTRAINT [PK_Provider] PRIMARY KEY CLUSTERED 
(
	[PrvID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sale_Product]    Script Date: 12/04/2023 6:20:17 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sale_Product](
	[Sale_ID] [bigint] IDENTITY(1,1) NOT NULL,
	[ProID] [bigint] NULL,
	[OldPrice] [float] NULL,
	[SalePrice] [float] NULL,
	[StartDate] [date] NULL,
	[EndDate] [date] NULL,
 CONSTRAINT [PK_Sale_Product] PRIMARY KEY CLUSTERED 
(
	[Sale_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Slide]    Script Date: 12/04/2023 6:20:17 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Slide](
	[SlideID] [bigint] IDENTITY(1,1) NOT NULL,
	[Image] [nvarchar](250) NULL,
	[Link] [varchar](250) NULL,
PRIMARY KEY CLUSTERED 
(
	[SlideID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Specifications]    Script Date: 12/04/2023 6:20:17 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Specifications](
	[SpeID] [bigint] IDENTITY(1,1) NOT NULL,
	[ProID] [bigint] NULL,
	[SpeName] [nvarchar](200) NULL,
	[Description] [ntext] NULL,
PRIMARY KEY CLUSTERED 
(
	[SpeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 12/04/2023 6:20:17 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [bigint] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](200) NULL,
	[FullName] [nvarchar](200) NULL,
	[Password] [nvarchar](200) NULL,
	[Active] [bit] NULL,
	[RoleUser] [nvarchar](200) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Warehouse]    Script Date: 12/04/2023 6:20:17 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Warehouse](
	[WareID] [bigint] IDENTITY(1,1) NOT NULL,
	[WareName] [nvarchar](250) NULL,
	[WareAddress] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[WareID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WarehouseDetail]    Script Date: 12/04/2023 6:20:17 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WarehouseDetail](
	[WDID] [bigint] IDENTITY(1,1) NOT NULL,
	[WareID] [bigint] NULL,
	[ProID] [bigint] NULL,
	[Quantity] [int] NULL,
	[SlotTray] [nvarchar](1500) NULL,
PRIMARY KEY CLUSTERED 
(
	[WDID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ImportBill] ADD  CONSTRAINT [DF_ImportBill_ImpDate]  DEFAULT (getdate()) FOR [ImpDate]
GO
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_OrderDate]  DEFAULT (getdate()) FOR [OrderDate]
GO
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[OrderDetail] ADD  CONSTRAINT [DF_OrderDetail_Quantity]  DEFAULT ((1)) FOR [Quantity]
GO
ALTER TABLE [dbo].[CheckWarehouse]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[CheckWarehouse]  WITH CHECK ADD FOREIGN KEY([WareID])
REFERENCES [dbo].[Warehouse] ([WareID])
GO
ALTER TABLE [dbo].[CheckWarehouseDetail]  WITH CHECK ADD FOREIGN KEY([CWhID])
REFERENCES [dbo].[CheckWarehouse] ([CWhID])
GO
ALTER TABLE [dbo].[CheckWarehouseDetail]  WITH CHECK ADD FOREIGN KEY([ProID])
REFERENCES [dbo].[Product] ([ProID])
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK__Comment__CusID__43A1090D] FOREIGN KEY([CusID])
REFERENCES [dbo].[Customer] ([CusID])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK__Comment__CusID__43A1090D]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK__Comment__ProID__44952D46] FOREIGN KEY([ProID])
REFERENCES [dbo].[Product] ([ProID])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK__Comment__ProID__44952D46]
GO
ALTER TABLE [dbo].[DetailImageProduct]  WITH CHECK ADD FOREIGN KEY([ProID])
REFERENCES [dbo].[Product] ([ProID])
GO
ALTER TABLE [dbo].[DetailImageProduct]  WITH CHECK ADD FOREIGN KEY([ProID])
REFERENCES [dbo].[Product] ([ProID])
GO
ALTER TABLE [dbo].[DetailImageProduct]  WITH CHECK ADD FOREIGN KEY([ProID])
REFERENCES [dbo].[Product] ([ProID])
GO
ALTER TABLE [dbo].[DetailImageProduct]  WITH CHECK ADD FOREIGN KEY([ProID])
REFERENCES [dbo].[Product] ([ProID])
GO
ALTER TABLE [dbo].[DetailImageProduct]  WITH CHECK ADD FOREIGN KEY([ProID])
REFERENCES [dbo].[Product] ([ProID])
GO
ALTER TABLE [dbo].[ImportBill]  WITH CHECK ADD  CONSTRAINT [FK_ImportBill_Provider] FOREIGN KEY([PrvID])
REFERENCES [dbo].[Provider] ([PrvID])
GO
ALTER TABLE [dbo].[ImportBill] CHECK CONSTRAINT [FK_ImportBill_Provider]
GO
ALTER TABLE [dbo].[ImportBill]  WITH CHECK ADD  CONSTRAINT [FK_ImportBill_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[ImportBill] CHECK CONSTRAINT [FK_ImportBill_User]
GO
ALTER TABLE [dbo].[ImportBillDetail]  WITH CHECK ADD  CONSTRAINT [FK_ImportBillDetail_ImportBill] FOREIGN KEY([ImpID])
REFERENCES [dbo].[ImportBill] ([ImpID])
GO
ALTER TABLE [dbo].[ImportBillDetail] CHECK CONSTRAINT [FK_ImportBillDetail_ImportBill]
GO
ALTER TABLE [dbo].[ImportBillDetail]  WITH CHECK ADD  CONSTRAINT [FK_ImportBillDetail_Product] FOREIGN KEY([ProID])
REFERENCES [dbo].[Product] ([ProID])
GO
ALTER TABLE [dbo].[ImportBillDetail] CHECK CONSTRAINT [FK_ImportBillDetail_Product]
GO
ALTER TABLE [dbo].[News]  WITH CHECK ADD  CONSTRAINT [FK_News_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[News] CHECK CONSTRAINT [FK_News_User]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_OrdIDOrder_CusIDCustomer] FOREIGN KEY([CusID])
REFERENCES [dbo].[Customer] ([CusID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_OrdIDOrder_CusIDCustomer]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Order] FOREIGN KEY([OrdID])
REFERENCES [dbo].[Order] ([OrdID])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Order]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Product] FOREIGN KEY([ProID])
REFERENCES [dbo].[Product] ([ProID])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Product]
GO
ALTER TABLE [dbo].[PriceHistory]  WITH CHECK ADD FOREIGN KEY([ProID])
REFERENCES [dbo].[Product] ([ProID])
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([CateID])
REFERENCES [dbo].[Category] ([CateID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
ALTER TABLE [dbo].[PromotionalProductDetail]  WITH CHECK ADD FOREIGN KEY([ProID])
REFERENCES [dbo].[Product] ([ProID])
GO
ALTER TABLE [dbo].[PromotionalProductDetail]  WITH CHECK ADD FOREIGN KEY([PromotionalID])
REFERENCES [dbo].[PromotionalProducts] ([PromotionalID])
GO
ALTER TABLE [dbo].[Sale_Product]  WITH CHECK ADD  CONSTRAINT [FK_Sale_Product_Product] FOREIGN KEY([ProID])
REFERENCES [dbo].[Product] ([ProID])
GO
ALTER TABLE [dbo].[Sale_Product] CHECK CONSTRAINT [FK_Sale_Product_Product]
GO
ALTER TABLE [dbo].[Specifications]  WITH CHECK ADD FOREIGN KEY([ProID])
REFERENCES [dbo].[Product] ([ProID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[WarehouseDetail]  WITH CHECK ADD FOREIGN KEY([ProID])
REFERENCES [dbo].[Product] ([ProID])
GO
ALTER TABLE [dbo].[WarehouseDetail]  WITH CHECK ADD FOREIGN KEY([WareID])
REFERENCES [dbo].[Warehouse] ([WareID])
GO
/****** Object:  StoredProcedure [dbo].[sp_addimageproduct]    Script Date: 12/04/2023 6:20:17 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_addimageproduct](@ProID bigint, @ImagePath varchar(500), @Caption nvarchar(200), @IsDefault bit, @DateCreated date, @SortOrder int)
AS
	BEGIN
		INSERT INTO [dbo].[DetailImageProduct]
           ([ProID]
           ,[ImagePath]
           ,[Caption]
           ,[IsDefault]
           ,[DateCreated]
           ,[SortOrder])
		VALUES
           (@ProID
           ,@ImagePath
           ,@Caption
           ,@IsDefault
           ,@DateCreated
           ,@SortOrder)
	END
GO
/****** Object:  StoredProcedure [dbo].[sp_categories_getall]    Script Date: 12/04/2023 6:20:17 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_categories_getall]
AS
	BEGIN
		SELECT *
		FROM CATEGORY
	END
GO
/****** Object:  StoredProcedure [dbo].[sp_categories_getbyid]    Script Date: 12/04/2023 6:20:17 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_categories_getbyid](@CateID bigint)
AS
	BEGIN
		SELECT *
		FROM CATEGORY
		WHERE CateID = @CateID
	END
GO
/****** Object:  StoredProcedure [dbo].[sp_categories_getparentcategories]    Script Date: 12/04/2023 6:20:17 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_categories_getparentcategories]
AS
	BEGIN
		SELECT *
		FROM CATEGORY
		WHERE CateParentID is null
	END
GO
/****** Object:  StoredProcedure [dbo].[sp_create_productimage]    Script Date: 12/04/2023 6:20:17 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[sp_create_productimage](@ImagePath varchar(500), @Caption nvarchar(200), @DateCreated date, @IsDefault bit, @ProductID bigint, @SortOrder int, @FileSize bigint)
AS
	BEGIN
		INSERT INTO [dbo].[DetailImageProduct]
           ([ProID]
           ,[ImagePath]
           ,[Caption]
           ,[IsDefault]
           ,[DateCreated]
           ,[SortOrder]
		   ,[FileSize])
		VALUES
           (@ProductID
           ,@ImagePath
           ,@Caption
           ,@IsDefault
           ,@DateCreated
		   ,@SortOrder
		   ,@FileSize)
	END
GO
/****** Object:  StoredProcedure [dbo].[sp_customer_create]    Script Date: 12/04/2023 6:20:17 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
----
CREATE PROC [dbo].[sp_customer_create](@CusName NVARCHAR(200), @Phone varchar(12), @Email varchar(200), @Address nvarchar(200), @UserName nvarchar(200), @Pasword nvarchar(200), @Image nvarchar(200))
AS
BEGIN
	INSERT INTO [dbo].[Customer] ([CusName] ,[Phone] ,[Email] ,[Address] ,[UserName] ,[Password] ,[Image])
	VALUES (@CusName, @Phone, @Email, @Address, @UserName, @Pasword, @Image)
	select '';
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_customer_delete]    Script Date: 12/04/2023 6:20:17 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[sp_customer_delete](@CusID bigint)
AS
	BEGIN
		DELETE FROM Customer
		WHERE CusID = @CusID
	END;
GO
/****** Object:  StoredProcedure [dbo].[sp_customer_get_by_id]    Script Date: 12/04/2023 6:20:17 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[sp_customer_get_by_id] (@CusID bigint)
AS
	BEGIN
		SELECT * FROM Customer
		Where CusID = @CusID
	END;
GO
/****** Object:  StoredProcedure [dbo].[sp_customer_getall]    Script Date: 12/04/2023 6:20:17 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_customer_getall]
AS
	BEGIN
		SELECT * FROM Customer
	END;
GO
/****** Object:  StoredProcedure [dbo].[sp_customer_search]    Script Date: 12/04/2023 6:20:17 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[sp_customer_search](@page_index  INT, 
                                       @page_size   INT,
									   @CusName Nvarchar(250),
									   @CusID int,
									   @option varchar(50))
AS
	BEGIN
		DECLARE @RecordCount bigint;
		IF(@page_size <> 0)
			BEGIN
				SET NOCOUNT ON;
					SELECT(ROW_NUMBER() OVER(
						ORDER BY
						CASE
							WHEN @option = 'TEN' THEN c.CusName
						END ASC)) AS RowNumber,
						c.CusID,
						c.CusName,
						c.Phone,
						c.Email,
						c.Address,
						c.UserName,
						c.Password,
						c.Image
					into #Results1
					from Customer AS c
					WHERE (@CusName = ''or c.CusName like N'%' + @CusName + '%') AND
							(@CusID is null or c.CusID = @CusID);
					SELECT @RecordCount = Count(*)
					FROM #Results1
					SELECT *, @RecordCount AS RecordCount
					FROM #Results1
					WHERE ROWNUMBER BETWEEN(@page_index - 1) * @page_size + 1 AND (((@page_index - 1) * @page_size + 1) + @page_size) - 1
						OR @page_index = -1;
					DROP TABLE #Results1;
			END;
			ELSE
			BEGIN
				SET NOCOUNT ON;
					SELECT(ROW_NUMBER() OVER(
						ORDER BY
						CASE
							WHEN @option = 'TEN' THEN c.CusName
						END ASC)) AS RowNumber,
						c.CusID,
						c.CusName,
						c.Phone,
						c.Email,
						c.Address,
						c.UserName,
						c.Password,
						c.Image
					into #Results2
					from Customer AS c
					WHERE (@CusName = ''or c.CusName like N'%' + @CusName + '%') AND
							(@CusID is null or c.CusID = @CusID);
					SELECT @RecordCount = Count(*)
					FROM #Results2
					SELECT *, @RecordCount AS RecordCount
					FROM #Results2
					DROP TABLE #Results2;
		END;
	END;
GO
/****** Object:  StoredProcedure [dbo].[sp_customer_UPDATE]    Script Date: 12/04/2023 6:20:17 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_customer_UPDATE](@CusID bigint, @CusName NVARCHAR(200), @Phone varchar(12), @Email varchar(200), @Address nvarchar(200), @UserName nvarchar(200), @Password nvarchar(200), @Image nvarchar(200))
AS
	BEGIN
		UPDATE [dbo].[Customer]
	   SET [CusName] = @CusName
		  ,[Phone] = @Phone
		  ,[Email] = @Email
		  ,[Address] = @Address
		  ,[UserName] = @UserName
		  ,[Password] = @Password
		  ,[Image] = @Image
		WHERE CusID = @CusID
	END;
GO
/****** Object:  StoredProcedure [dbo].[sp_GetBestSellerProducts]    Script Date: 12/04/2023 6:20:17 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GetBestSellerProducts](@num int)
as
	BEGIN
		SELECT P.*, I.ImagePath, ph.Price
		FROM Product P RIGHT JOIN DetailImageProduct I on P.ProID = I.ProID
		INNER JOIN PriceHistory ph on P.ProID = ph.ProID
		where I.[IsDefault] = 1 and p.ProID IN (select top(@num)
		ProID from OrderDetail
		GROUP BY ProID
		ORDER BY Sum(Quantity) desc
		)
	END
GO
/****** Object:  StoredProcedure [dbo].[sp_getlistspecifications]    Script Date: 12/04/2023 6:20:17 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_getlistspecifications](@ProID bigint)
AS
	BEGIN
	    SELECT * FROM [dbo].[Specifications]
		WHERE ProID = @ProID
	END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetNewProducts]    Script Date: 12/04/2023 6:20:17 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GetNewProducts](@num int)
as
	BEGIN
		SELECT TOP(@num) P.*, I.ImagePath, ph.Price
		FROM Product P RIGHT JOIN DetailImageProduct I on P.ProID = I.ProID
		INNER JOIN PriceHistory ph on P.ProID = ph.ProID 
		where I.[IsDefault] = 1
		ORDER BY p.DateCreated desc
	END
GO
/****** Object:  StoredProcedure [dbo].[sp_imageproduct_get]    Script Date: 12/04/2023 6:20:17 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[sp_imageproduct_get](@ImgID bigint)
AS
	BEGIN
		SELECT *
		FROM [dbo].[DetailImageProduct]
		WHERE ImgID = @ImgID
	END
GO
/****** Object:  StoredProcedure [dbo].[sp_listimgbyidproduct]    Script Date: 12/04/2023 6:20:17 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[sp_listimgbyidproduct](@proId bigint)
AS
	BEGIN
		select i.*
		from [DetailImageProduct] i inner join Product p on i.ProID = p.ProID
		Where p.ProID = @proId
	END
GO
/****** Object:  StoredProcedure [dbo].[sp_login_user]    Script Date: 12/04/2023 6:20:17 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROC [dbo].[sp_login_user](@Username nvarchar(200), @Password nvarchar(200))
AS	
	BEGIN
		SELECT c.CusID, c.CusName, c.Phone, c.Email, c.[Address], c.[Image], c.UserName, c.[Password]
		FROM Customer c INNER JOIN [Order] o on c.CusID = o.CusID
		WHERE c.UserName = @Username AND c.[Password] = @Password
	END
GO
/****** Object:  StoredProcedure [dbo].[sp_news_create]    Script Date: 12/04/2023 6:20:17 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_news_create](@Title NVARCHAR(200), @UserID bigint, @PublicDate date, @Content ntext, @Image ntext)
AS
BEGIN
	INSERT INTO [dbo].[News] ([Title] ,[UserID] ,[PublicDate] ,[Content] ,[Image])
     VALUES
           (@Title
           ,@UserID
           ,@PublicDate
           ,@Content
           ,@Image)
	select '';
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_news_delete]    Script Date: 12/04/2023 6:20:17 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_news_delete](@NewsID bigint)
AS
	BEGIN
		DELETE FROM News
		WHERE NewsID = @NewsID
	END;
GO
/****** Object:  StoredProcedure [dbo].[sp_news_getall]    Script Date: 12/04/2023 6:20:17 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[sp_news_getall]
AS
	BEGIN
		SELECT * FROM News
	END;
GO
/****** Object:  StoredProcedure [dbo].[sp_news_search]    Script Date: 12/04/2023 6:20:17 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_news_search] (@page_index  INT, 
                                       @page_size   INT,
									   @Title Nvarchar(250),
									   @FullName varchar(20),
									   @fr_PublicDate Datetime,
									   @to_PublicDate Datetime
									   )
AS 
	BEGIN
		DECLARE @RecordCount bigint;
		IF(@page_size <> 0)
			BEGIN
				SET NOCOUNT ON;
					SELECT(ROW_NUMBER() OVER(
						ORDER BY n.PublicDate ASC )) AS RowNumber,
						n.NewsID,
						n.Title,
						n.PublicDate,
						n.Content,
						n.Image,
						u.FullName
					INTO #Results1
					FROM News AS n
					INNER JOIN [User] u on n.UserID = n.UserID
					WHERE (@Title = '' OR(n.Title LIKE  '%'+@Title+'%')) AND
						 (@FullName = '' OR(u.FullName LIKE  '%'+@FullName+'%')) AND
						 ((@fr_PublicDate IS NULL AND @to_PublicDate IS NULL)
							OR (@fr_PublicDate IS NOT NULL AND @to_PublicDate IS NULL AND n.PublicDate >= @fr_PublicDate)
							OR (@fr_PublicDate IS NULL AND @to_PublicDate IS NOT NULL AND n.PublicDate <= @to_PublicDate)
							OR (n.PublicDate BETWEEN @fr_PublicDate AND @to_PublicDate));
					SELECT @RecordCount = COUNT(*)
					FROM #Results1;
					SELECT *, @RecordCount AS RecordCount
					FROM #Results1
					WHERE ROWNUMBER BETWEEN (@page_index - 1)*@page_size + 1 AND(((@page_index - 1) * @page_size + 1) + @page_size) - 1
						OR @page_index = -1;
					DROP TABLE #Results1;
			END;
			ELSE
			BEGIN
				SET NOCOUNT ON;
					SELECT(ROW_NUMBER() OVER(
						ORDER BY n.PublicDate ASC )) AS RowNumber,
						n.NewsID,
						n.Title,
						n.PublicDate,
						n.Content,
						n.Image,
						u.FullName
					INTO #Results2
					FROM News AS n
					INNER JOIN [User] u on n.UserID = n.UserID
					WHERE (@Title = '' OR(n.Title LIKE  '%'+@Title+'%')) AND
						 (@FullName = '' OR(u.FullName LIKE  '%'+@FullName+'%')) AND
						 ((@fr_PublicDate IS NULL AND @to_PublicDate IS NULL)
							OR (@fr_PublicDate IS NOT NULL AND @to_PublicDate IS NULL AND n.PublicDate >= @fr_PublicDate)
							OR (@fr_PublicDate IS NULL AND @to_PublicDate IS NOT NULL AND n.PublicDate <= @to_PublicDate)
							OR (n.PublicDate BETWEEN @fr_PublicDate AND @to_PublicDate));
					SELECT @RecordCount = COUNT(*)
					FROM #Results2;
					SELECT *, @RecordCount AS RecordCount
					FROM #Results2

					DROP TABLE #Results2;
		END;
	END;
GO
/****** Object:  StoredProcedure [dbo].[sp_news_update]    Script Date: 12/04/2023 6:20:17 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[sp_news_update](@NewsID bigint, @Title NVARCHAR(200), @UserID bigint, @PublicDate date, @Content ntext, @Image ntext)
AS
BEGIN
	UPDATE [dbo].[News]
	SET [Title] = @Title
      ,[UserID] = @UserID
      ,[PublicDate] = @PublicDate
      ,[Content] = @Content
      ,[Image] = @Image
	WHERE NewsID = @NewsID
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_order_create]    Script Date: 12/04/2023 6:20:17 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[sp_order_create](@Phone varchar(15), @Email nvarchar(200), @Recipient nvarchar(200), @DeliveryAddress nvarchar(200), @TotalPay bigint, @Note ntext, @listjson_detail NVARCHAR(MAX))
AS
	BEGIN
		--IF(@objectjson_customer is not null)
		BEGIN
			INSERT INTO Customer(CusName, [Address], Phone, Email)
			VALUES (@Recipient, @DeliveryAddress, @Phone, @Email)
			--select json_value(c.value, '$.cusName'),
			--	   json_value(c.value, '$.address'),
			--	   json_value(c.value, '$.phone'),
			--	   json_value(c.value, '$.email')
			--from openjson(@objectjson_customer) as c;
		END;
		IF(@listjson_detail IS NOT NULL)
		BEGIN
			-- Thêm bảng Order
			INSERT INTO [Order]([CusID] ,[OrderDate], Phone, Recipient, DeliveryAddress ,[Status], TotalPay, Note)
			VALUES (IDENT_CURRENT('Customer'), GETDATE(), @Phone, @Recipient, @DeliveryAddress, N'Đã xác nhận', @TotalPay, @Note);
			
			-- Thêm vào bảng OrderDetail
			INSERT INTO [OrderDetail]([OrdID] ,[ProID] ,[Quantity] ,[Price])
			SELECT 
				IDENT_CURRENT('Order'),
				json_value(p.value, '$.proID'),
				json_value(p.value, '$.quantity'),
				json_value(p.value, '$.price')
			FROM OPENJSON(@listjson_detail) AS p;
		END;
		SELECT '';
	END;
GO
/****** Object:  StoredProcedure [dbo].[sp_order_delete]    Script Date: 12/04/2023 6:20:17 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_order_delete](@OrdID bigint)
AS
	BEGIN
		DELETE FROM [Order]
		WHERE OrdID = @OrdID
	END;
GO
/****** Object:  StoredProcedure [dbo].[sp_order_get_by_id]    Script Date: 12/04/2023 6:20:17 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_order_get_by_id] (@OrdID bigint)
AS
	BEGIN
		SELECT
			d.OrdID,
			d.OrderDate,
			k.CusName ,
			k.[Address],
			k.Email,
				(
					SELECT 
						c.ProID,
						c.Quantity,
						p.Title,
						c.Price
					FROM OrderDetail AS c inner join Product p on c.ProID = p.ProID
					WHERE c.OrdID = d.OrdID FOR JSON PATH
				) AS listjson_detail
			FROM [Order] d INNER JOIN Customer k on d.CusID = k.CusID
			WHERE d.OrdID = @OrdID
	END;
GO
/****** Object:  StoredProcedure [dbo].[sp_order_getall]    Script Date: 12/04/2023 6:20:17 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_order_getall]
AS
	BEGIN
		SELECT
			d.OrdID,
			d.OrderDate,
			d.DeliveryAddress,
			d.TotalPay,
			d.Recipient,
			d.[Status],
			k.Email,
				(
					SELECT 
						c.ProID,
						c.Quantity,
						p.Title,
						c.Price
					FROM OrderDetail AS c inner join Product p on c.ProID = p.ProID
					WHERE c.OrdID = d.OrdID FOR JSON PATH
				) AS listjson_detail
			FROM [Order] d INNER JOIN Customer k on d.CusID = k.CusID
	END;
GO
/****** Object:  StoredProcedure [dbo].[sp_order_search]    Script Date: 12/04/2023 6:20:17 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_order_search] (@page_index  INT, 
                                       @page_size   INT,
									   @CusName Nvarchar(250),
									   @Phone varchar(20),
									   @Email varchar(50),
									   @fr_OrderDate Datetime,
									   @to_OrderDate Datetime
									   )
AS 
	BEGIN
		DECLARE @RecordCount bigint;
		IF(@page_size <> 0)
			BEGIN
				SET NOCOUNT ON;
					SELECT(ROW_NUMBER() OVER(
						ORDER BY d.OrderDate ASC )) AS RowNumber,
						d.OrdID,
						d.OrderDate,
						k.CusName,
						k.[Address]
					INTO #Results1
					FROM [Order] AS d 
					INNER JOIN Customer k on d.CusID = k.CusID
					WHERE(@CusName = '' OR(k.CusName LIKE  '%'+@CusName+'%')) AND
						 (@Phone = '' OR(k.Phone LIKE  '%'+@Phone+'%')) AND
						 (@Email = '' OR(k.Email LIKE  '%'+@Email+'%')) AND
						 ((@fr_OrderDate IS NULL AND @to_OrderDate IS NULL)
							OR (@fr_OrderDate IS NOT NULL AND @to_OrderDate IS NULL AND d.OrderDate >= @fr_OrderDate)
							OR (@fr_OrderDate IS NULL AND @to_OrderDate IS NOT NULL AND d.OrderDate <= @to_OrderDate)
							OR (d.OrderDate BETWEEN @fr_OrderDate AND @to_OrderDate));
					SELECT @RecordCount = COUNT(*)
					FROM #Results1;
					SELECT *, @RecordCount AS RecordCount
					FROM #Results1
					WHERE ROWNUMBER BETWEEN (@page_index - 1)*@page_size + 1 AND(((@page_index - 1) * @page_size + 1) + @page_size) - 1
						OR @page_index = -1;
					DROP TABLE #Results1;
			END;
			ELSE
			BEGIN
				SET NOCOUNT ON;
					SELECT(ROW_NUMBER() OVER(
						ORDER BY d.OrderDate ASC )) AS RowNumber,
						d.OrdID,
						d.OrderDate,
						k.CusName,
						k.[Address]
					INTO #Results2
					FROM [Order] AS d 
					INNER JOIN Customer k on d.CusID = k.CusID
					WHERE(@CusName = '' OR(k.CusName LIKE  '%'+@CusName+'%')) AND
						 (@Phone = '' OR(k.Phone LIKE  '%'+@Phone+'%')) AND
						 (@Email = '' OR(k.Email LIKE  '%'+@Email+'%')) AND
						 ((@fr_OrderDate IS NULL AND @to_OrderDate IS NULL)
							OR (@fr_OrderDate IS NOT NULL AND @to_OrderDate IS NULL AND d.OrderDate >= @fr_OrderDate)
							OR (@fr_OrderDate IS NULL AND @to_OrderDate IS NOT NULL AND d.OrderDate <= @to_OrderDate)
							OR (d.OrderDate BETWEEN @fr_OrderDate AND @to_OrderDate));
					SELECT @RecordCount = COUNT(*)
					FROM #Results2;
					SELECT *, @RecordCount AS RecordCount
					FROM #Results2;

					DROP TABLE #Results2;
		END;
	END;
GO
/****** Object:  StoredProcedure [dbo].[sp_priceproduct_update]    Script Date: 12/04/2023 6:20:17 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[sp_priceproduct_update](@ProID bigint, @newPrice decimal, @CreateDate date, @EndDate date)
AS
	BEGIN
		Update PriceHistory
		SET EndDate = GETDATE()
		WHERE ProID = @ProID
		INSERT INTO PriceHistory(ProID, StartDate, EndDate, Price)
		VALUES (@ProID, @CreateDate, @EndDate, @newPrice)
	END
GO
/****** Object:  StoredProcedure [dbo].[sp_product_create]    Script Date: 12/04/2023 6:20:17 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_product_create](@Title NVARCHAR(200) ,@CateID BIGINT ,@Desscription NTEXT ,@Image NVARCHAR(500), @DateCreated date, @EndDate date, @Price decimal(18, 0), @listjson_specifications NVARCHAR(MAX))
AS
BEGIN
	INSERT INTO [dbo].[Product] ([Title] ,[CateID] ,[Desscription] ,[DateCreated])
    VALUES(@Title, @CateID, @Desscription, @DateCreated)
	INSERT INTO [dbo].[DetailImageProduct](ProID, ImagePath, IsDefault, DateCreated)
	VALUES (IDENT_CURRENT('Product'), @Image, 1, @DateCreated)
	INSERT INTO [dbo].[PriceHistory](ProID, StartDate, EndDate, Price)
	VALUES (IDENT_CURRENT('Product'), @DateCreated, @EndDate, @Price)
	INSERT INTO [dbo].[Specifications](ProID, SpeName, [Description])
	SELECT 
			IDENT_CURRENT('Product'),		
			JSON_VALUE(l.value, '$.speName'), 
			JSON_VALUE(l.value, '$.description')
    FROM OPENJSON(@listjson_specifications) AS l;
	SELECT '';
END
GO
/****** Object:  StoredProcedure [dbo].[sp_product_delete]    Script Date: 12/04/2023 6:20:17 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_product_delete](@ProID bigint)
AS
	BEGIN
		DELETE FROM [dbo].[DetailImageProduct]
		WHERE ProID = @ProID
		DELETE FROM [dbo].[PriceHistory]
		WHERE ProID = @ProID
		DELETE FROM [dbo].[Specifications]
		WHERE ProID = @ProID
		DELETE FROM [dbo].[PromotionalProductDetail]
		where ProID = @ProID
		DELETE FROM Product
		WHERE ProID = @ProID
	END;
GO
/****** Object:  StoredProcedure [dbo].[sp_product_get_by_id]    Script Date: 12/04/2023 6:20:17 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_product_get_by_id](@ProID bigint)
AS
	BEGIN
		SELECT P.*, I.ImagePath, ph.Price,
		(
			SELECT SpeName, [Description]
			FROM [dbo].[Specifications] 
			Where ProID = @ProID FOR JSON PATH
		) AS listjson_specifications
		FROM Product P LEFT JOIN DetailImageProduct I on P.ProID = I.ProID
					INNER JOIN PriceHistory ph on P.ProID = ph.ProID 
		WHERE p.ProID = @ProID AND ph.StartDate <= getdate() AND ph.EndDate > getdate()
	END;
GO
/****** Object:  StoredProcedure [dbo].[sp_product_getall]    Script Date: 12/04/2023 6:20:17 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_product_getall]
AS
	BEGIN
		SELECT P.*, I.ImagePath, ph.Price
		FROM Product P INNER JOIN DetailImageProduct I on P.ProID = I.ProID
		INNER JOIN PriceHistory ph on P.ProID = ph.ProID
		WHERE ph.StartDate <= getdate() AND ph.EndDate > getdate() AND I.[IsDefault] = 1
	END;
GO
/****** Object:  StoredProcedure [dbo].[sp_product_search]    Script Date: 12/04/2023 6:20:17 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_product_search] (@page_index  INT, 
                                       @page_size   INT,
									   @Title Nvarchar(250),
									   @CateID int,
									   @from_Price decimal(18, 0),
									   @to_Price decimal(18, 0),
									   @option varchar(50))
AS	
	BEGIN
		DECLARE @RecordCount bigint;
		IF(@page_size <> 0)
			BEGIN 
				SET NOCOUNT ON;
					SELECT(ROW_NUMBER() OVER(
						ORDER BY
						CASE
							WHEN @option = 'TEN' THEN p.Title
						END ASC)) AS RowNumber,
						p.ProID,
						p.Title,
						p.CateID,
						p.Desscription,
						d.ImagePath,
						ph.Price
						INTO #Results1
					FROM [Product] AS p INNER JOIN DetailImageProduct d ON p.ProID = d.ProID
					INNER JOIN PriceHistory ph on p.ProID = ph.ProID
					WHERE
						(ISNULL(@Title, '') = '' OR p.Title = @Title)
						AND (ISNULL(@CateID, '') = '' OR p.CateID = @CateID)
						AND (
							@from_Price = 0 AND @to_Price = 0
							OR (
								@from_Price = 0 AND @to_Price <> 0 AND ph.Price <= @to_Price
								OR @to_Price = 0 AND @from_Price <> 0 AND ph.Price >= @from_Price 
								OR ph.Price BETWEEN @from_Price AND @to_Price
							)
						) AND d.[IsDefault] = 1


					SELECT @RecordCount = Count(*)
					FROM #Results1
					SELECT *,
						@RecordCount AS RecordCount
					FROM #Results1
					WHERE ROWNUMBER BETWEEN(@page_index - 1) * @page_size + 1 AND (((@page_index - 1) * @page_size + 1) + @page_size) - 1
						OR @page_index = -1;
					DROP TABLE #Results1;
			END;
			ELSE
			BEGIN
				SET NOCOUNT ON;
					SELECT(ROW_NUMBER() OVER(
						ORDER BY
						CASE 
							WHEN @option = 'TEN' THEN p.Title
						END ASC )) AS ROWNUMBER,
						p.ProID,
						p.Title,
						p.CateID,
						p.Desscription,
						d.ImagePath,
						ph.Price
						INTO #Results2
					FROM [Product] AS p INNER JOIN DetailImageProduct d ON p.ProID = d.ProID
										INNER JOIN PriceHistory ph on p.ProID = ph.ProID
					WHERE
						(ISNULL(@Title, '') = '' OR p.Title = @Title)
						AND (ISNULL(@CateID, '') = '' OR p.CateID = @CateID)
						AND (
							@from_Price = 0 AND @to_Price = 0
							OR (
								@from_Price = 0 AND @to_Price <> 0 AND ph.Price <= @to_Price
								OR @to_Price = 0 AND @from_Price <> 0 AND ph.Price >= @from_Price 
								OR ph.Price BETWEEN @from_Price AND @to_Price
							)
						) AND d.[IsDefault] = 1

 
					--p.Title = IIf(@Title is Null, '', @Title)AND
					-- --(@Title ='' or p.Title like N'%' + @Title + '%') 
					--p.CateID = IIf(@CateID is Null, null, @CateID)AND
					--	--(@CateID is null or p.CateID = @CateID)AND
					--	((@from_Price is null AND @to_Price is not null AND ph.Price<=@to_Price) OR
					--	(@to_Price is null AND @from_Price is not null AND ph.Price>=@from_Price) OR
					--	(ph.Price <= @from_Price AND ph.Price >= @to_Price));
					SELECT @RecordCount = COUNT(*)
                    FROM #Results2;
                    SELECT *, 
						@RecordCount AS RecordCount
                    FROM #Results2;
                    DROP TABLE #Results2;
		END;
	END;

GO
/****** Object:  StoredProcedure [dbo].[sp_product_update]    Script Date: 12/04/2023 6:20:17 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_product_update](@ProID bigint, @Title NVARCHAR(200) ,@CateID BIGINT ,@Desscription NTEXT)
AS
	BEGIN
		UPDATE Product
		SET Title = @Title,
			CateID = @CateID,
			Desscription = @Desscription
		WHERE ProID = @ProID
		SELECT '';
	END
GO
/****** Object:  StoredProcedure [dbo].[sp_productimage_delete]    Script Date: 12/04/2023 6:20:17 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_productimage_delete](@ImgID bigint)
AS 
	BEGIN
		DELETE FROM [dbo].[DetailImageProduct]
		WHERE ImgID = @ImgID
	END
GO
/****** Object:  StoredProcedure [dbo].[sp_productimage_update]    Script Date: 12/04/2023 6:20:17 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_productimage_update](@ImgID bigint, @ImagePath varchar(500), @Caption nvarchar(200), @IsDefault bit, @DateCreated date, @SortOrder int, @FileSize bigint )
AS 
	BEGIN
		Update [DetailImageProduct]
		SET ImagePath = @ImagePath,
			Caption = @Caption,
			IsDefault = @IsDefault,
			DateCreated = @DateCreated,
			SortOrder = @SortOrder
		WHERE ImgID = @ImgID
	END
GO
/****** Object:  StoredProcedure [dbo].[sp_promotion_create]    Script Date: 12/04/2023 6:20:17 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_promotion_create](@ProID BIGINT,@ProName NVARCHAR(500), @Description ntext, @EndDate date)
AS
	BEGIN
		INSERT INTO [dbo].[PromotionalProducts]([PromotionalName], [Description])
		VALUES(@ProName, @Description)

		INSERT INTO [dbo].[PromotionalProductDetail]([PromotionalID], [ProID], [StartDate], [EndDate], [Status])
		VALUES(IDENT_CURRENT('PromotionalProducts'), @ProID, getdate(), @EndDate, 1)
	END
GO
USE [master]
GO
ALTER DATABASE [WebsiteXeDapMVC] SET  READ_WRITE 
GO
