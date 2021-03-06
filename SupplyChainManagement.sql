USE [master]
GO
/****** Object:  Database [SupplyChainManagement]    Script Date: 5/26/2018 12:46:03 AM ******/
CREATE DATABASE [SupplyChainManagement]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SupplyChainManagement', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\SupplyChainManagement.mdf' , SIZE = 3136KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'SupplyChainManagement_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\SupplyChainManagement_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [SupplyChainManagement] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SupplyChainManagement].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SupplyChainManagement] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SupplyChainManagement] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SupplyChainManagement] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SupplyChainManagement] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SupplyChainManagement] SET ARITHABORT OFF 
GO
ALTER DATABASE [SupplyChainManagement] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [SupplyChainManagement] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [SupplyChainManagement] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SupplyChainManagement] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SupplyChainManagement] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SupplyChainManagement] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SupplyChainManagement] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SupplyChainManagement] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SupplyChainManagement] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SupplyChainManagement] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SupplyChainManagement] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SupplyChainManagement] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SupplyChainManagement] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SupplyChainManagement] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SupplyChainManagement] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SupplyChainManagement] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SupplyChainManagement] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SupplyChainManagement] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SupplyChainManagement] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SupplyChainManagement] SET  MULTI_USER 
GO
ALTER DATABASE [SupplyChainManagement] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SupplyChainManagement] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SupplyChainManagement] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SupplyChainManagement] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [SupplyChainManagement]
GO
/****** Object:  Table [dbo].[City]    Script Date: 5/26/2018 12:46:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[City](
	[CityID] [int] IDENTITY(1,1) NOT NULL,
	[CityName] [varchar](50) NOT NULL,
	[CountryID] [int] NOT NULL,
 CONSTRAINT [PK_City] PRIMARY KEY CLUSTERED 
(
	[CityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Country]    Script Date: 5/26/2018 12:46:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Country](
	[CountryID] [int] IDENTITY(1,1) NOT NULL,
	[CountryName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
(
	[CountryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 5/26/2018 12:46:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Customer](
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerName] [varchar](50) NOT NULL,
	[CustomerSurname] [varchar](50) NOT NULL,
	[CityID] [int] NOT NULL,
	[Phone] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Address] [varchar](50) NOT NULL,
	[Sex] [bit] NOT NULL,
	[CustomerBirthdate] [date] NOT NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 5/26/2018 12:46:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Employees](
	[EmployeeID] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeName] [varchar](50) NOT NULL,
	[EmployeeLastname] [varchar](50) NOT NULL,
	[TitleID] [int] NOT NULL,
	[Birthdate] [date] NOT NULL,
	[Hiredate] [date] NOT NULL,
	[CityID] [int] NOT NULL,
	[Phone] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[ReportsTo] [int] NULL,
	[ObjectID] [int] NOT NULL,
	[Sex] [bit] NOT NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[InputDetails]    Script Date: 5/26/2018 12:46:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InputDetails](
	[InputDetailsID] [int] IDENTITY(1,1) NOT NULL,
	[InputID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[UnitPrice] [float] NOT NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_InputDetails] PRIMARY KEY CLUSTERED 
(
	[InputDetailsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Inputs]    Script Date: 5/26/2018 12:46:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inputs](
	[InputID] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeID] [int] NOT NULL,
	[InputDate] [date] NOT NULL,
	[ObjectID] [int] NOT NULL,
	[ShipperID] [int] NULL,
 CONSTRAINT [PK_Inputs] PRIMARY KEY CLUSTERED 
(
	[InputID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Objects]    Script Date: 5/26/2018 12:46:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Objects](
	[ObjectID] [int] IDENTITY(1,1) NOT NULL,
	[CompanyName] [varchar](50) NOT NULL,
	[Address] [varchar](50) NOT NULL,
	[CityID] [int] NOT NULL,
	[Phone] [varchar](50) NOT NULL,
	[Email] [varchar](50) NULL,
 CONSTRAINT [PK_Objects] PRIMARY KEY CLUSTERED 
(
	[ObjectID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Offers]    Script Date: 5/26/2018 12:46:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Offers](
	[OfferID] [int] IDENTITY(1,1) NOT NULL,
	[ProductCategoryID] [int] NOT NULL,
	[DiscountPrs] [int] NOT NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NOT NULL,
	[Valid] [bit] NOT NULL,
	[ObjectID] [int] NOT NULL,
 CONSTRAINT [PK_Offers] PRIMARY KEY CLUSTERED 
(
	[OfferID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 5/26/2018 12:46:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[UnitPrice] [float] NULL,
	[QuantityOrdered] [int] NOT NULL,
	[TotalPrice] [float] NULL,
	[TotalPriceDsc] [float] NOT NULL,
	[Discount] [float] NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Orders]    Script Date: 5/26/2018 12:46:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NULL,
	[EmployeeID] [int] NOT NULL,
	[OrderDate] [date] NOT NULL,
	[ShipperID] [int] NULL,
	[ObjectID] [int] NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Permission]    Script Date: 5/26/2018 12:46:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Permission](
	[PermissionID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Description] [varchar](150) NULL,
	[EmployeesRead] [bit] NOT NULL,
	[EmployeesManage] [bit] NOT NULL,
	[UsersRead] [bit] NOT NULL,
	[UsersManage] [bit] NOT NULL,
	[ObjectsRead] [bit] NOT NULL,
	[ObjectsManage] [bit] NOT NULL,
	[CustomersRead] [bit] NOT NULL,
	[CustomersManage] [bit] NOT NULL,
	[SuppliersRead] [bit] NOT NULL,
	[SuppliersManage] [bit] NOT NULL,
	[ProductsRead] [bit] NOT NULL,
	[ProductsManage] [bit] NOT NULL,
	[RequestRead] [bit] NOT NULL,
	[RequestMake] [bit] NOT NULL,
	[OrdersRead] [bit] NOT NULL,
	[SalesMake] [bit] NOT NULL,
	[CountryRead] [bit] NOT NULL,
	[CountryManage] [bit] NOT NULL,
	[CityRead] [bit] NOT NULL,
	[CityManage] [bit] NOT NULL,
	[TitleRead] [bit] NOT NULL,
	[TitleManage] [bit] NOT NULL,
 CONSTRAINT [PK_Permission] PRIMARY KEY CLUSTERED 
(
	[PermissionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ProductCategory]    Script Date: 5/26/2018 12:46:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ProductCategory](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [varchar](50) NOT NULL,
	[Description] [varchar](150) NULL,
 CONSTRAINT [PK_ProductCategory] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Products]    Script Date: 5/26/2018 12:46:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Products](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[Barcode] [int] NOT NULL,
	[ProductName] [varchar](50) NOT NULL,
	[CategoryID] [int] NOT NULL,
	[BuyPrice] [float] NOT NULL,
	[SellPrice] [float] NULL,
	[SupplierID] [int] NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Request]    Script Date: 5/26/2018 12:46:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Request](
	[RequestID] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeID] [int] NOT NULL,
	[Approved] [bit] NOT NULL,
	[RequestDate] [date] NULL,
 CONSTRAINT [PK_Request] PRIMARY KEY CLUSTERED 
(
	[RequestID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RequestDetails]    Script Date: 5/26/2018 12:46:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RequestDetails](
	[RequestDetailsID] [int] IDENTITY(1,1) NOT NULL,
	[RequestID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_RequestDetails] PRIMARY KEY CLUSTERED 
(
	[RequestDetailsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Shippers]    Script Date: 5/26/2018 12:46:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Shippers](
	[ShipperID] [int] NOT NULL,
	[CompanyName] [varchar](50) NOT NULL,
	[Phone] [varchar](50) NOT NULL,
	[Email] [varchar](50) NULL,
 CONSTRAINT [PK_Shippers] PRIMARY KEY CLUSTERED 
(
	[ShipperID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Suppliers]    Script Date: 5/26/2018 12:46:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Suppliers](
	[SupplierID] [int] IDENTITY(1,1) NOT NULL,
	[CompanyName] [varchar](50) NOT NULL,
	[CityID] [int] NOT NULL,
	[Phone] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Suppliers] PRIMARY KEY CLUSTERED 
(
	[SupplierID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Title]    Script Date: 5/26/2018 12:46:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Title](
	[TitleID] [int] IDENTITY(1,1) NOT NULL,
	[TitleName] [varchar](50) NOT NULL,
	[Description] [varchar](150) NULL,
 CONSTRAINT [PK_Title] PRIMARY KEY CLUSTERED 
(
	[TitleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Users]    Script Date: 5/26/2018 12:46:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Users](
	[EmployeeID] [int] NOT NULL,
	[Username] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[PermissionID] [int] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[City] ON 

INSERT [dbo].[City] ([CityID], [CityName], [CountryID]) VALUES (1, N'Prishtine', 1)
INSERT [dbo].[City] ([CityID], [CityName], [CountryID]) VALUES (2, N'Mitrovica', 1)
INSERT [dbo].[City] ([CityID], [CityName], [CountryID]) VALUES (3, N'Peje', 1)
INSERT [dbo].[City] ([CityID], [CityName], [CountryID]) VALUES (4, N'Prizreni', 1)
INSERT [dbo].[City] ([CityID], [CityName], [CountryID]) VALUES (5, N'Ferizaj', 1)
INSERT [dbo].[City] ([CityID], [CityName], [CountryID]) VALUES (6, N'Gjilan', 1)
INSERT [dbo].[City] ([CityID], [CityName], [CountryID]) VALUES (7, N'Gjakove', 1)
SET IDENTITY_INSERT [dbo].[City] OFF
SET IDENTITY_INSERT [dbo].[Country] ON 

INSERT [dbo].[Country] ([CountryID], [CountryName]) VALUES (1, N'Kosova')
SET IDENTITY_INSERT [dbo].[Country] OFF
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [CustomerSurname], [CityID], [Phone], [Email], [Address], [Sex], [CustomerBirthdate]) VALUES (1, N'Rina', N'Adili', 1, N'099', N'rinaadili@hotmail.com', N'Emshir', 0, CAST(0x5E220B00 AS Date))
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [CustomerSurname], [CityID], [Phone], [Email], [Address], [Sex], [CustomerBirthdate]) VALUES (3, N'Ema', N'Adili', 1, N'432423', N'sdfdfsdf', N'Kalabri', 0, CAST(0x3D3E0B00 AS Date))
SET IDENTITY_INSERT [dbo].[Customer] OFF
SET IDENTITY_INSERT [dbo].[Employees] ON 

INSERT [dbo].[Employees] ([EmployeeID], [EmployeeName], [EmployeeLastname], [TitleID], [Birthdate], [Hiredate], [CityID], [Phone], [Email], [ReportsTo], [ObjectID], [Sex]) VALUES (1, N'Sonia', N'Richardson', 1, CAST(0x691A0B00 AS Date), CAST(0x493C0B00 AS Date), 1, N'044114232', N'Sonia@gmail.com', NULL, 1, 0)
INSERT [dbo].[Employees] ([EmployeeID], [EmployeeName], [EmployeeLastname], [TitleID], [Birthdate], [Hiredate], [CityID], [Phone], [Email], [ReportsTo], [ObjectID], [Sex]) VALUES (2, N'Rex', N'Fuller', 2, CAST(0x82160B00 AS Date), CAST(0xD73C0B00 AS Date), 1, N'046542132', N'rex@gmail.com', 1, 1, 1)
INSERT [dbo].[Employees] ([EmployeeID], [EmployeeName], [EmployeeLastname], [TitleID], [Birthdate], [Hiredate], [CityID], [Phone], [Email], [ReportsTo], [ObjectID], [Sex]) VALUES (3, N'Arlene', N'Rule', 2, CAST(0xCD180B00 AS Date), CAST(0xD73C0B00 AS Date), 1, N'045485441', N'Rule@gmail.com', 1, 1, 0)
INSERT [dbo].[Employees] ([EmployeeID], [EmployeeName], [EmployeeLastname], [TitleID], [Birthdate], [Hiredate], [CityID], [Phone], [Email], [ReportsTo], [ObjectID], [Sex]) VALUES (4, N'Irving', N'Barker', 1, CAST(0x381E0B00 AS Date), CAST(0x9E3B0B00 AS Date), 1, N'043123441', N'irving@gmail.com', 1, 2, 1)
INSERT [dbo].[Employees] ([EmployeeID], [EmployeeName], [EmployeeLastname], [TitleID], [Birthdate], [Hiredate], [CityID], [Phone], [Email], [ReportsTo], [ObjectID], [Sex]) VALUES (5, N'Matthew', N'Ray', 2, CAST(0xD0170B00 AS Date), CAST(0xD93D0B00 AS Date), 3, N'045616212', N'ray@gmail.com', 4, 2, 1)
INSERT [dbo].[Employees] ([EmployeeID], [EmployeeName], [EmployeeLastname], [TitleID], [Birthdate], [Hiredate], [CityID], [Phone], [Email], [ReportsTo], [ObjectID], [Sex]) VALUES (6, N'Gina', N'Haney', 2, CAST(0xAF1A0B00 AS Date), CAST(0x323D0B00 AS Date), 6, N'04423214', N'gina@gmail.com', 4, 2, 0)
INSERT [dbo].[Employees] ([EmployeeID], [EmployeeName], [EmployeeLastname], [TitleID], [Birthdate], [Hiredate], [CityID], [Phone], [Email], [ReportsTo], [ObjectID], [Sex]) VALUES (7, N'x', N'y', 1, CAST(0x363E0B00 AS Date), CAST(0xFD1A0800 AS Date), 1, N'phone', N'x', 1, 1, 1)
INSERT [dbo].[Employees] ([EmployeeID], [EmployeeName], [EmployeeLastname], [TitleID], [Birthdate], [Hiredate], [CityID], [Phone], [Email], [ReportsTo], [ObjectID], [Sex]) VALUES (11, N'r', N'rfgd', 2, CAST(0x343E0B00 AS Date), CAST(0x353E0B00 AS Date), 1, N'rfds', N'rfds', 1, 1, 0)
INSERT [dbo].[Employees] ([EmployeeID], [EmployeeName], [EmployeeLastname], [TitleID], [Birthdate], [Hiredate], [CityID], [Phone], [Email], [ReportsTo], [ObjectID], [Sex]) VALUES (13, N'gsdf', N'gsdfg', 1, CAST(0xE3950A00 AS Date), CAST(0x303E0B00 AS Date), 1, N'325235', N'gsdfg@gsdfg', NULL, 2, 1)
INSERT [dbo].[Employees] ([EmployeeID], [EmployeeName], [EmployeeLastname], [TitleID], [Birthdate], [Hiredate], [CityID], [Phone], [Email], [ReportsTo], [ObjectID], [Sex]) VALUES (14, N'rgrffg', N'fgsfg', 2, CAST(0xCAE50A00 AS Date), CAST(0x303E0B00 AS Date), 2, N'52452', N'fsgsdfg@gsfdg', 3, 2, 1)
INSERT [dbo].[Employees] ([EmployeeID], [EmployeeName], [EmployeeLastname], [TitleID], [Birthdate], [Hiredate], [CityID], [Phone], [Email], [ReportsTo], [ObjectID], [Sex]) VALUES (15, N'ghj', N'grfd', 1, CAST(0xB9210B00 AS Date), CAST(0x3D3E0B00 AS Date), 1, N'098890098', N'rfeds@f', 3, 1, 0)
SET IDENTITY_INSERT [dbo].[Employees] OFF
SET IDENTITY_INSERT [dbo].[InputDetails] ON 

INSERT [dbo].[InputDetails] ([InputDetailsID], [InputID], [ProductID], [UnitPrice], [Quantity]) VALUES (1, 2, 5, 17.99, 1)
INSERT [dbo].[InputDetails] ([InputDetailsID], [InputID], [ProductID], [UnitPrice], [Quantity]) VALUES (2, 3, 3, 6.99, 30)
INSERT [dbo].[InputDetails] ([InputDetailsID], [InputID], [ProductID], [UnitPrice], [Quantity]) VALUES (3, 3, 3, 9.99, 20)
INSERT [dbo].[InputDetails] ([InputDetailsID], [InputID], [ProductID], [UnitPrice], [Quantity]) VALUES (4, 3, 9, 20, 10)
INSERT [dbo].[InputDetails] ([InputDetailsID], [InputID], [ProductID], [UnitPrice], [Quantity]) VALUES (5, 4, 1, 12.99, 20)
INSERT [dbo].[InputDetails] ([InputDetailsID], [InputID], [ProductID], [UnitPrice], [Quantity]) VALUES (6, 4, 3, 9.99, 20)
INSERT [dbo].[InputDetails] ([InputDetailsID], [InputID], [ProductID], [UnitPrice], [Quantity]) VALUES (7, 4, 5, 17.99, 20)
INSERT [dbo].[InputDetails] ([InputDetailsID], [InputID], [ProductID], [UnitPrice], [Quantity]) VALUES (8, 4, 7, 20, 20)
INSERT [dbo].[InputDetails] ([InputDetailsID], [InputID], [ProductID], [UnitPrice], [Quantity]) VALUES (9, 5, 8, 12, 100)
INSERT [dbo].[InputDetails] ([InputDetailsID], [InputID], [ProductID], [UnitPrice], [Quantity]) VALUES (10, 5, 9, 20, 200)
INSERT [dbo].[InputDetails] ([InputDetailsID], [InputID], [ProductID], [UnitPrice], [Quantity]) VALUES (11, 6, 5, 17.99, 500)
INSERT [dbo].[InputDetails] ([InputDetailsID], [InputID], [ProductID], [UnitPrice], [Quantity]) VALUES (12, 7, 5, 17.99, 100)
INSERT [dbo].[InputDetails] ([InputDetailsID], [InputID], [ProductID], [UnitPrice], [Quantity]) VALUES (13, 8, 7, 20, 300)
SET IDENTITY_INSERT [dbo].[InputDetails] OFF
SET IDENTITY_INSERT [dbo].[Inputs] ON 

INSERT [dbo].[Inputs] ([InputID], [EmployeeID], [InputDate], [ObjectID], [ShipperID]) VALUES (2, 1, CAST(0x443E0B00 AS Date), 2, 1)
INSERT [dbo].[Inputs] ([InputID], [EmployeeID], [InputDate], [ObjectID], [ShipperID]) VALUES (3, 1, CAST(0x443E0B00 AS Date), 2, NULL)
INSERT [dbo].[Inputs] ([InputID], [EmployeeID], [InputDate], [ObjectID], [ShipperID]) VALUES (4, 1, CAST(0x453E0B00 AS Date), 1, NULL)
INSERT [dbo].[Inputs] ([InputID], [EmployeeID], [InputDate], [ObjectID], [ShipperID]) VALUES (5, 1, CAST(0x453E0B00 AS Date), 1, NULL)
INSERT [dbo].[Inputs] ([InputID], [EmployeeID], [InputDate], [ObjectID], [ShipperID]) VALUES (6, 1, CAST(0x453E0B00 AS Date), 1, NULL)
INSERT [dbo].[Inputs] ([InputID], [EmployeeID], [InputDate], [ObjectID], [ShipperID]) VALUES (7, 6, CAST(0x453E0B00 AS Date), 2, NULL)
INSERT [dbo].[Inputs] ([InputID], [EmployeeID], [InputDate], [ObjectID], [ShipperID]) VALUES (8, 6, CAST(0x453E0B00 AS Date), 2, NULL)
SET IDENTITY_INSERT [dbo].[Inputs] OFF
SET IDENTITY_INSERT [dbo].[Objects] ON 

INSERT [dbo].[Objects] ([ObjectID], [CompanyName], [Address], [CityID], [Phone], [Email]) VALUES (1, N'Depo', N'Rr Luan', 1, N'046414414', N'depo@gmail.com')
INSERT [dbo].[Objects] ([ObjectID], [CompanyName], [Address], [CityID], [Phone], [Email]) VALUES (2, N'NoLimit', N'Rr UCK', 1, N'044112211', N'nolimit@gmail.com')
INSERT [dbo].[Objects] ([ObjectID], [CompanyName], [Address], [CityID], [Phone], [Email]) VALUES (6, N'Albi', N'Shtoj', 5, N'0442323123', N'albi@gmail.com')
SET IDENTITY_INSERT [dbo].[Objects] OFF
SET IDENTITY_INSERT [dbo].[Offers] ON 

INSERT [dbo].[Offers] ([OfferID], [ProductCategoryID], [DiscountPrs], [StartDate], [EndDate], [Valid], [ObjectID]) VALUES (2, 1, 10, CAST(0x413E0B00 AS Date), CAST(0x5D400B00 AS Date), 1, 1)
INSERT [dbo].[Offers] ([OfferID], [ProductCategoryID], [DiscountPrs], [StartDate], [EndDate], [Valid], [ObjectID]) VALUES (11, 1, 30, CAST(0x423E0B00 AS Date), CAST(0x493E0B00 AS Date), 1, 2)
SET IDENTITY_INSERT [dbo].[Offers] OFF
SET IDENTITY_INSERT [dbo].[OrderDetails] ON 

INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductID], [UnitPrice], [QuantityOrdered], [TotalPrice], [TotalPriceDsc], [Discount]) VALUES (1, 1, 1, NULL, 20, NULL, 30, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductID], [UnitPrice], [QuantityOrdered], [TotalPrice], [TotalPriceDsc], [Discount]) VALUES (2, 4, 1, NULL, 1, NULL, 23, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductID], [UnitPrice], [QuantityOrdered], [TotalPrice], [TotalPriceDsc], [Discount]) VALUES (3, 5, 1, NULL, 1, NULL, 12.99, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductID], [UnitPrice], [QuantityOrdered], [TotalPrice], [TotalPriceDsc], [Discount]) VALUES (4, 6, 2, NULL, 1, NULL, 12.99, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductID], [UnitPrice], [QuantityOrdered], [TotalPrice], [TotalPriceDsc], [Discount]) VALUES (5, 6, 3, NULL, 3, NULL, 29.97, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductID], [UnitPrice], [QuantityOrdered], [TotalPrice], [TotalPriceDsc], [Discount]) VALUES (9, 10, 24, NULL, 1, NULL, 17.99, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductID], [UnitPrice], [QuantityOrdered], [TotalPrice], [TotalPriceDsc], [Discount]) VALUES (10, 11, 25, NULL, 2, NULL, 29.98, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductID], [UnitPrice], [QuantityOrdered], [TotalPrice], [TotalPriceDsc], [Discount]) VALUES (11, 12, 24, NULL, 1, NULL, 17.99, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductID], [UnitPrice], [QuantityOrdered], [TotalPrice], [TotalPriceDsc], [Discount]) VALUES (13, 14, 24, NULL, 1, NULL, 17.99, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductID], [UnitPrice], [QuantityOrdered], [TotalPrice], [TotalPriceDsc], [Discount]) VALUES (18, 18, 24, NULL, 1, NULL, 17.99, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductID], [UnitPrice], [QuantityOrdered], [TotalPrice], [TotalPriceDsc], [Discount]) VALUES (20, 19, 27, NULL, 3, NULL, 89.97, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductID], [UnitPrice], [QuantityOrdered], [TotalPrice], [TotalPriceDsc], [Discount]) VALUES (24, 19, 5, NULL, 7, NULL, 100, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductID], [UnitPrice], [QuantityOrdered], [TotalPrice], [TotalPriceDsc], [Discount]) VALUES (25, 22, 3, NULL, 40, NULL, 400, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductID], [UnitPrice], [QuantityOrdered], [TotalPrice], [TotalPriceDsc], [Discount]) VALUES (26, 22, 3, NULL, 5, NULL, 50, 0)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductID], [UnitPrice], [QuantityOrdered], [TotalPrice], [TotalPriceDsc], [Discount]) VALUES (27, 22, 3, NULL, 5, NULL, 50, 0)
SET IDENTITY_INSERT [dbo].[OrderDetails] OFF
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [ShipperID], [ObjectID]) VALUES (1, 1, 1, CAST(0x691A0B00 AS Date), 1, 1)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [ShipperID], [ObjectID]) VALUES (4, 1, 6, CAST(0xAF1A0B00 AS Date), 1, 2)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [ShipperID], [ObjectID]) VALUES (5, 1, 1, CAST(0x383E0B00 AS Date), 1, 1)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [ShipperID], [ObjectID]) VALUES (6, 1, 1, CAST(0x383E0B00 AS Date), 1, 1)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [ShipperID], [ObjectID]) VALUES (7, 1, 6, CAST(0x383E0B00 AS Date), 1, 1)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [ShipperID], [ObjectID]) VALUES (8, NULL, 6, CAST(0x383E0B00 AS Date), 1, 1)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [ShipperID], [ObjectID]) VALUES (9, 1, 6, CAST(0x383E0B00 AS Date), 1, 1)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [ShipperID], [ObjectID]) VALUES (10, 1, 6, CAST(0x383E0B00 AS Date), 1, 1)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [ShipperID], [ObjectID]) VALUES (11, 1, 6, CAST(0x383E0B00 AS Date), 1, 1)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [ShipperID], [ObjectID]) VALUES (12, 1, 6, CAST(0x383E0B00 AS Date), 1, 1)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [ShipperID], [ObjectID]) VALUES (13, 1, 6, CAST(0x383E0B00 AS Date), 1, 1)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [ShipperID], [ObjectID]) VALUES (14, 1, 6, CAST(0x383E0B00 AS Date), 1, 1)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [ShipperID], [ObjectID]) VALUES (15, 1, 6, CAST(0x383E0B00 AS Date), 1, 1)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [ShipperID], [ObjectID]) VALUES (16, 1, 6, CAST(0x383E0B00 AS Date), 1, 1)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [ShipperID], [ObjectID]) VALUES (17, 1, 6, CAST(0x383E0B00 AS Date), 1, 1)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [ShipperID], [ObjectID]) VALUES (18, 1, 6, CAST(0x383E0B00 AS Date), 1, 1)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [ShipperID], [ObjectID]) VALUES (19, 1, 6, CAST(0x393E0B00 AS Date), 1, 1)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [ShipperID], [ObjectID]) VALUES (20, 1, 6, CAST(0x3B3E0B00 AS Date), 1, 2)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [ShipperID], [ObjectID]) VALUES (21, 1, 6, CAST(0x3B3E0B00 AS Date), 1, 2)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [ShipperID], [ObjectID]) VALUES (22, NULL, 6, CAST(0x443E0B00 AS Date), NULL, 2)
SET IDENTITY_INSERT [dbo].[Orders] OFF
SET IDENTITY_INSERT [dbo].[Permission] ON 

INSERT [dbo].[Permission] ([PermissionID], [Name], [Description], [EmployeesRead], [EmployeesManage], [UsersRead], [UsersManage], [ObjectsRead], [ObjectsManage], [CustomersRead], [CustomersManage], [SuppliersRead], [SuppliersManage], [ProductsRead], [ProductsManage], [RequestRead], [RequestMake], [OrdersRead], [SalesMake], [CountryRead], [CountryManage], [CityRead], [CityManage], [TitleRead], [TitleManage]) VALUES (1, N'Administratori', N'Bossi', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Permission] ([PermissionID], [Name], [Description], [EmployeesRead], [EmployeesManage], [UsersRead], [UsersManage], [ObjectsRead], [ObjectsManage], [CustomersRead], [CustomersManage], [SuppliersRead], [SuppliersManage], [ProductsRead], [ProductsManage], [RequestRead], [RequestMake], [OrdersRead], [SalesMake], [CountryRead], [CountryManage], [CityRead], [CityManage], [TitleRead], [TitleManage]) VALUES (3, N'sa', N'dsasd', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
SET IDENTITY_INSERT [dbo].[Permission] OFF
SET IDENTITY_INSERT [dbo].[ProductCategory] ON 

INSERT [dbo].[ProductCategory] ([CategoryID], [CategoryName], [Description]) VALUES (1, N'Shirts', NULL)
INSERT [dbo].[ProductCategory] ([CategoryID], [CategoryName], [Description]) VALUES (2, N'Hoodies', NULL)
INSERT [dbo].[ProductCategory] ([CategoryID], [CategoryName], [Description]) VALUES (3, N'Jeans', NULL)
INSERT [dbo].[ProductCategory] ([CategoryID], [CategoryName], [Description]) VALUES (4, N'Jackets', NULL)
INSERT [dbo].[ProductCategory] ([CategoryID], [CategoryName], [Description]) VALUES (5, N'Shorts', NULL)
INSERT [dbo].[ProductCategory] ([CategoryID], [CategoryName], [Description]) VALUES (6, N'Shoes', NULL)
INSERT [dbo].[ProductCategory] ([CategoryID], [CategoryName], [Description]) VALUES (7, N'Swimwear', NULL)
INSERT [dbo].[ProductCategory] ([CategoryID], [CategoryName], [Description]) VALUES (8, N'Bags
', NULL)
INSERT [dbo].[ProductCategory] ([CategoryID], [CategoryName], [Description]) VALUES (9, N'Socks', NULL)
INSERT [dbo].[ProductCategory] ([CategoryID], [CategoryName], [Description]) VALUES (10, N'T-shirts', NULL)
INSERT [dbo].[ProductCategory] ([CategoryID], [CategoryName], [Description]) VALUES (11, N'Pants', NULL)
SET IDENTITY_INSERT [dbo].[ProductCategory] OFF
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ProductID], [Barcode], [ProductName], [CategoryID], [BuyPrice], [SellPrice], [SupplierID]) VALUES (1, 5465465, N'T-shirt with Chest Pocket', 10, 12.99, 12.99, 1)
INSERT [dbo].[Products] ([ProductID], [Barcode], [ProductName], [CategoryID], [BuyPrice], [SellPrice], [SupplierID]) VALUES (2, 654654, N'T-shirt with Printed Motif', 10, 12.99, 12.99, 1)
INSERT [dbo].[Products] ([ProductID], [Barcode], [ProductName], [CategoryID], [BuyPrice], [SellPrice], [SupplierID]) VALUES (3, 1213244, N'T-shirt with Printed Motif', 10, 9.99, 9.99, 1)
INSERT [dbo].[Products] ([ProductID], [Barcode], [ProductName], [CategoryID], [BuyPrice], [SellPrice], [SupplierID]) VALUES (4, 123156, N'Round-necked T-shirt', 10, 6.99, 6.99, 1)
INSERT [dbo].[Products] ([ProductID], [Barcode], [ProductName], [CategoryID], [BuyPrice], [SellPrice], [SupplierID]) VALUES (5, 212414, N'Cotton Jersey T-shirt', 10, 17.99, 17.99, 1)
INSERT [dbo].[Products] ([ProductID], [Barcode], [ProductName], [CategoryID], [BuyPrice], [SellPrice], [SupplierID]) VALUES (7, 4515332, N'Regular Fit Short-sleeve Shirt', 1, 20, 20, 1)
INSERT [dbo].[Products] ([ProductID], [Barcode], [ProductName], [CategoryID], [BuyPrice], [SellPrice], [SupplierID]) VALUES (8, 2312412, N'Relaxed Fit Short-sleeve Shirt', 1, 12, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [Barcode], [ProductName], [CategoryID], [BuyPrice], [SellPrice], [SupplierID]) VALUES (9, 1323141, N'Poplin Shirt Regular fit', 1, 20, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [Barcode], [ProductName], [CategoryID], [BuyPrice], [SellPrice], [SupplierID]) VALUES (10, 1324165, N'Oxford Shirt Regular fit', 1, 24, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [Barcode], [ProductName], [CategoryID], [BuyPrice], [SellPrice], [SupplierID]) VALUES (11, 5151321, N'Hooded Sweatshirt', 2, 17.99, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [Barcode], [ProductName], [CategoryID], [BuyPrice], [SellPrice], [SupplierID]) VALUES (12, 5422133, N'Hooded Jacket', 2, 24.99, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [Barcode], [ProductName], [CategoryID], [BuyPrice], [SellPrice], [SupplierID]) VALUES (13, 1235413, N'Hooded Raglan-sleeve Shirt', 2, 24.99, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [Barcode], [ProductName], [CategoryID], [BuyPrice], [SellPrice], [SupplierID]) VALUES (14, 2312541, N'Color-block Hooded Shirt', 2, 34.99, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [Barcode], [ProductName], [CategoryID], [BuyPrice], [SellPrice], [SupplierID]) VALUES (16, 23124221, N'Printed Hooded Shirt', 2, 7.99, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [Barcode], [ProductName], [CategoryID], [BuyPrice], [SellPrice], [SupplierID]) VALUES (17, 51321311, N'Trashed Skinny Jeans', 3, 39.99, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [Barcode], [ProductName], [CategoryID], [BuyPrice], [SellPrice], [SupplierID]) VALUES (18, 13231541, N'Skinny Jeans', 3, 24.99, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [Barcode], [ProductName], [CategoryID], [BuyPrice], [SellPrice], [SupplierID]) VALUES (19, 2354111, N'Tech Stretch Skinny Jeans', 3, 59.99, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [Barcode], [ProductName], [CategoryID], [BuyPrice], [SellPrice], [SupplierID]) VALUES (20, 44512223, N'Biker Jeans', 3, 39.99, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [Barcode], [ProductName], [CategoryID], [BuyPrice], [SellPrice], [SupplierID]) VALUES (21, 848115, N'Slim Selvedge Jeans', 3, 59.99, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [Barcode], [ProductName], [CategoryID], [BuyPrice], [SellPrice], [SupplierID]) VALUES (24, 212414, N'Cotton Jersey T-shirt', 10, 17.99, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [Barcode], [ProductName], [CategoryID], [BuyPrice], [SellPrice], [SupplierID]) VALUES (25, 1231561, N'Easy-iron Shirt Slim fit', 1, 9, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [Barcode], [ProductName], [CategoryID], [BuyPrice], [SellPrice], [SupplierID]) VALUES (27, 1324165, N'Oxford Shirt Regular fit', 1, 19, NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [Barcode], [ProductName], [CategoryID], [BuyPrice], [SellPrice], [SupplierID]) VALUES (29, 23124221, N'Printed Hooded Shirt', 2, 7, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Products] OFF
SET IDENTITY_INSERT [dbo].[Request] ON 

INSERT [dbo].[Request] ([RequestID], [EmployeeID], [Approved], [RequestDate]) VALUES (1, 1, 1, NULL)
INSERT [dbo].[Request] ([RequestID], [EmployeeID], [Approved], [RequestDate]) VALUES (2, 1, 0, NULL)
INSERT [dbo].[Request] ([RequestID], [EmployeeID], [Approved], [RequestDate]) VALUES (3, 6, 1, NULL)
INSERT [dbo].[Request] ([RequestID], [EmployeeID], [Approved], [RequestDate]) VALUES (4, 1, 0, NULL)
INSERT [dbo].[Request] ([RequestID], [EmployeeID], [Approved], [RequestDate]) VALUES (5, 6, 1, NULL)
SET IDENTITY_INSERT [dbo].[Request] OFF
SET IDENTITY_INSERT [dbo].[RequestDetails] ON 

INSERT [dbo].[RequestDetails] ([RequestDetailsID], [RequestID], [ProductID], [Quantity]) VALUES (1, 1, 25, 40)
INSERT [dbo].[RequestDetails] ([RequestDetailsID], [RequestID], [ProductID], [Quantity]) VALUES (2, 1, 29, 10)
INSERT [dbo].[RequestDetails] ([RequestDetailsID], [RequestID], [ProductID], [Quantity]) VALUES (3, 2, 24, 35)
INSERT [dbo].[RequestDetails] ([RequestDetailsID], [RequestID], [ProductID], [Quantity]) VALUES (4, 2, 27, 50)
INSERT [dbo].[RequestDetails] ([RequestDetailsID], [RequestID], [ProductID], [Quantity]) VALUES (5, 3, 27, 23)
INSERT [dbo].[RequestDetails] ([RequestDetailsID], [RequestID], [ProductID], [Quantity]) VALUES (6, 3, 29, 11)
INSERT [dbo].[RequestDetails] ([RequestDetailsID], [RequestID], [ProductID], [Quantity]) VALUES (7, 4, 2, 10)
INSERT [dbo].[RequestDetails] ([RequestDetailsID], [RequestID], [ProductID], [Quantity]) VALUES (8, 4, 1, 40)
INSERT [dbo].[RequestDetails] ([RequestDetailsID], [RequestID], [ProductID], [Quantity]) VALUES (9, 5, 3, 5)
INSERT [dbo].[RequestDetails] ([RequestDetailsID], [RequestID], [ProductID], [Quantity]) VALUES (10, 5, 3, 5)
SET IDENTITY_INSERT [dbo].[RequestDetails] OFF
INSERT [dbo].[Shippers] ([ShipperID], [CompanyName], [Phone], [Email]) VALUES (1, N'r', N'dsd', N'sdsd')
SET IDENTITY_INSERT [dbo].[Suppliers] ON 

INSERT [dbo].[Suppliers] ([SupplierID], [CompanyName], [CityID], [Phone], [Email]) VALUES (1, N'DeFacto', 2, N'038232141', N'defacto@gmail.com')
INSERT [dbo].[Suppliers] ([SupplierID], [CompanyName], [CityID], [Phone], [Email]) VALUES (2, N'Amazon', 5, N'038232423', N'amazon@gmail.com')
SET IDENTITY_INSERT [dbo].[Suppliers] OFF
SET IDENTITY_INSERT [dbo].[Title] ON 

INSERT [dbo].[Title] ([TitleID], [TitleName], [Description]) VALUES (1, N'Menagjer', N'Menagjon piken ose depoen perkatese')
INSERT [dbo].[Title] ([TitleID], [TitleName], [Description]) VALUES (2, N'Shites', N'Shites ne piken e shitjes')
SET IDENTITY_INSERT [dbo].[Title] OFF
INSERT [dbo].[Users] ([EmployeeID], [Username], [Password], [PermissionID]) VALUES (1, N'admin', N'21232f297a57a5a743894a0e4a801fc3', 1)
INSERT [dbo].[Users] ([EmployeeID], [Username], [Password], [PermissionID]) VALUES (2, N'rex', N'6b4023d367b91c97f19597c4069337d3', 1)
INSERT [dbo].[Users] ([EmployeeID], [Username], [Password], [PermissionID]) VALUES (4, N'irving', N'5e4d614d1c5e99716f23462a4e6aba4d', 1)
INSERT [dbo].[Users] ([EmployeeID], [Username], [Password], [PermissionID]) VALUES (6, N'gina', N'7df27de84ed79a46d75c7c57ad00f76f', 1)
INSERT [dbo].[Users] ([EmployeeID], [Username], [Password], [PermissionID]) VALUES (7, N'x', N'415290769594460e2e485922904f345d', 1)
ALTER TABLE [dbo].[Offers] ADD  CONSTRAINT [DF_Offers_Valid]  DEFAULT ((0)) FOR [Valid]
GO
ALTER TABLE [dbo].[City]  WITH CHECK ADD  CONSTRAINT [FK_City_Country] FOREIGN KEY([CountryID])
REFERENCES [dbo].[Country] ([CountryID])
GO
ALTER TABLE [dbo].[City] CHECK CONSTRAINT [FK_City_Country]
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_Customer_City] FOREIGN KEY([CityID])
REFERENCES [dbo].[City] ([CityID])
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_Customer_City]
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_Employees_City] FOREIGN KEY([CityID])
REFERENCES [dbo].[City] ([CityID])
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_Employees_City]
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_Employees_Employees] FOREIGN KEY([ReportsTo])
REFERENCES [dbo].[Employees] ([EmployeeID])
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_Employees_Employees]
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_Employees_Objects] FOREIGN KEY([ObjectID])
REFERENCES [dbo].[Objects] ([ObjectID])
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_Employees_Objects]
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_Employees_Title] FOREIGN KEY([TitleID])
REFERENCES [dbo].[Title] ([TitleID])
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_Employees_Title]
GO
ALTER TABLE [dbo].[InputDetails]  WITH CHECK ADD  CONSTRAINT [FK_InputDetails_Inputs1] FOREIGN KEY([InputID])
REFERENCES [dbo].[Inputs] ([InputID])
GO
ALTER TABLE [dbo].[InputDetails] CHECK CONSTRAINT [FK_InputDetails_Inputs1]
GO
ALTER TABLE [dbo].[InputDetails]  WITH CHECK ADD  CONSTRAINT [FK_InputDetails_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[InputDetails] CHECK CONSTRAINT [FK_InputDetails_Products]
GO
ALTER TABLE [dbo].[Inputs]  WITH CHECK ADD  CONSTRAINT [FK_Inputs_Employees] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employees] ([EmployeeID])
GO
ALTER TABLE [dbo].[Inputs] CHECK CONSTRAINT [FK_Inputs_Employees]
GO
ALTER TABLE [dbo].[Inputs]  WITH CHECK ADD  CONSTRAINT [FK_Inputs_Objects] FOREIGN KEY([ObjectID])
REFERENCES [dbo].[Objects] ([ObjectID])
GO
ALTER TABLE [dbo].[Inputs] CHECK CONSTRAINT [FK_Inputs_Objects]
GO
ALTER TABLE [dbo].[Inputs]  WITH CHECK ADD  CONSTRAINT [FK_Inputs_Shippers] FOREIGN KEY([ShipperID])
REFERENCES [dbo].[Shippers] ([ShipperID])
GO
ALTER TABLE [dbo].[Inputs] CHECK CONSTRAINT [FK_Inputs_Shippers]
GO
ALTER TABLE [dbo].[Objects]  WITH CHECK ADD  CONSTRAINT [FK_Objects_City] FOREIGN KEY([CityID])
REFERENCES [dbo].[City] ([CityID])
GO
ALTER TABLE [dbo].[Objects] CHECK CONSTRAINT [FK_Objects_City]
GO
ALTER TABLE [dbo].[Offers]  WITH CHECK ADD  CONSTRAINT [FK_Offers_Objects] FOREIGN KEY([ObjectID])
REFERENCES [dbo].[Objects] ([ObjectID])
GO
ALTER TABLE [dbo].[Offers] CHECK CONSTRAINT [FK_Offers_Objects]
GO
ALTER TABLE [dbo].[Offers]  WITH CHECK ADD  CONSTRAINT [FK_Offers_ProductCategory] FOREIGN KEY([ProductCategoryID])
REFERENCES [dbo].[ProductCategory] ([CategoryID])
GO
ALTER TABLE [dbo].[Offers] CHECK CONSTRAINT [FK_Offers_ProductCategory]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Orders] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([OrderID])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Orders]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Products]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Customer] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([CustomerID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Customer]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Employees] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employees] ([EmployeeID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Employees]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Objects] FOREIGN KEY([ObjectID])
REFERENCES [dbo].[Objects] ([ObjectID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Objects]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Shippers] FOREIGN KEY([ShipperID])
REFERENCES [dbo].[Shippers] ([ShipperID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Shippers]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_ProductCategory] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[ProductCategory] ([CategoryID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_ProductCategory]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Suppliers] FOREIGN KEY([SupplierID])
REFERENCES [dbo].[Suppliers] ([SupplierID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Suppliers]
GO
ALTER TABLE [dbo].[Request]  WITH CHECK ADD  CONSTRAINT [FK_Request_Employees] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employees] ([EmployeeID])
GO
ALTER TABLE [dbo].[Request] CHECK CONSTRAINT [FK_Request_Employees]
GO
ALTER TABLE [dbo].[RequestDetails]  WITH CHECK ADD  CONSTRAINT [FK_RequestDetails_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[RequestDetails] CHECK CONSTRAINT [FK_RequestDetails_Products]
GO
ALTER TABLE [dbo].[RequestDetails]  WITH CHECK ADD  CONSTRAINT [FK_RequestDetails_Request] FOREIGN KEY([RequestID])
REFERENCES [dbo].[Request] ([RequestID])
GO
ALTER TABLE [dbo].[RequestDetails] CHECK CONSTRAINT [FK_RequestDetails_Request]
GO
ALTER TABLE [dbo].[Suppliers]  WITH CHECK ADD  CONSTRAINT [FK_Suppliers_City] FOREIGN KEY([CityID])
REFERENCES [dbo].[City] ([CityID])
GO
ALTER TABLE [dbo].[Suppliers] CHECK CONSTRAINT [FK_Suppliers_City]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Employees] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employees] ([EmployeeID])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Employees]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Permission] FOREIGN KEY([PermissionID])
REFERENCES [dbo].[Permission] ([PermissionID])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Permission]
GO
USE [master]
GO
ALTER DATABASE [SupplyChainManagement] SET  READ_WRITE 
GO
