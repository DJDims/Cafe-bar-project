USE [master]
GO
/****** Object:  Database [dbCafeBar]    Script Date: 13/12/2021 09:47:04 ******/
CREATE DATABASE [dbCafeBar]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'dbCafeBar', FILENAME = N'C:\Users\pupil\dbCafeBar.mdf' , SIZE = 3136KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'dbCafeBar_log', FILENAME = N'C:\Users\pupil\dbCafeBar_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [dbCafeBar] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [dbCafeBar].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [dbCafeBar] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [dbCafeBar] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [dbCafeBar] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [dbCafeBar] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [dbCafeBar] SET ARITHABORT OFF 
GO
ALTER DATABASE [dbCafeBar] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [dbCafeBar] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [dbCafeBar] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [dbCafeBar] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [dbCafeBar] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [dbCafeBar] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [dbCafeBar] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [dbCafeBar] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [dbCafeBar] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [dbCafeBar] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [dbCafeBar] SET  ENABLE_BROKER 
GO
ALTER DATABASE [dbCafeBar] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [dbCafeBar] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [dbCafeBar] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [dbCafeBar] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [dbCafeBar] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [dbCafeBar] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [dbCafeBar] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [dbCafeBar] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [dbCafeBar] SET  MULTI_USER 
GO
ALTER DATABASE [dbCafeBar] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [dbCafeBar] SET DB_CHAINING OFF 
GO
ALTER DATABASE [dbCafeBar] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [dbCafeBar] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [dbCafeBar]
GO
/****** Object:  User [Employer]    Script Date: 13/12/2021 09:47:04 ******/
CREATE USER [Employer] FOR LOGIN [Employer] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  StoredProcedure [dbo].[prAddBill]    Script Date: 13/12/2021 09:47:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[prAddBill](@ClientCode INT, @PaymentDate DATE, @PaymentType INT, @PaymentStatus INT)
AS
BEGIN
	INSERT INTO tBill(ClientCode, PaymentDate, PaymentType, PaymentStatus) VALUES(@ClientCode, @PaymentDate, @PaymentType, @PaymentStatus)
END

GO
/****** Object:  StoredProcedure [dbo].[prAddCart]    Script Date: 13/12/2021 09:47:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[prAddCart](@BillId INT, @ProductCode INT, @Unit NVARCHAR(20))
AS
BEGIN
	INSERT INTO tCart(BillCode, ProductCode, Unit) VALUES(@BillId, @ProductCode, @Unit)
END

GO
/****** Object:  StoredProcedure [dbo].[prAddCategory]    Script Date: 13/12/2021 09:47:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[prAddCategory](@Description NVARCHAR(100))
AS
BEGIN
	INSERT INTO tCategory(CatDescription) VALUES(@Description)
END

GO
/****** Object:  StoredProcedure [dbo].[prAddClient]    Script Date: 13/12/2021 09:47:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[prAddClient](@Name NVARCHAR(10), @Mail NVARCHAR(30), @Phone NVARCHAR(10), @BornDate DATE)
AS
BEGIN
	INSERT INTO tClient(Name, Mail, Phone, BornDate) VALUES(@Name, @Mail, @Phone, @BornDate)
END
GO
/****** Object:  StoredProcedure [dbo].[prAddDrinks]    Script Date: 13/12/2021 09:47:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[prAddDrinks](@Category INT, @Name NVARCHAR(15), @Price MONEY)
AS
BEGIN
	INSERT INTO tDrinks(CategoryCode, Name, Price) VALUES(@Category, @Name, @Price)
END
GO
/****** Object:  StoredProcedure [dbo].[prAddEmployer]    Script Date: 13/12/2021 09:47:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[prAddEmployer](@ClientId INT, @BillCode INT, @Name NVARCHAR(20), @Phone NVARCHAR(15), @Mail NVARCHAR(25), @Salary MONEY)
AS
BEGIN
	INSERT INTO tEmployer(ClientCode, BillCode, Name, Phone, Mail, Salary) VALUES(@ClientId, @BillCode, @Name, @Phone, @Mail, @Salary)
END

GO
/****** Object:  StoredProcedure [dbo].[prAddSnacks]    Script Date: 13/12/2021 09:47:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[prAddSnacks](@Category INT, @Name NVARCHAR(20), @Price MONEY)
AS
BEGIN
	INSERT INTO tSnack(CategoryCode, Name, Price) VALUES(@Category, @Name, @Price)
END

GO
/****** Object:  Table [dbo].[tBill]    Script Date: 13/12/2021 09:47:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tBill](
	[BillCode] [int] IDENTITY(1,1) NOT NULL,
	[ClientCode] [int] NOT NULL,
	[PaymentDate] [date] NOT NULL,
	[PaymentType] [int] NOT NULL,
	[PaymentStatus] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[BillCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tCart]    Script Date: 13/12/2021 09:47:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tCart](
	[CartCode] [int] IDENTITY(1,1) NOT NULL,
	[BillCode] [int] NOT NULL,
	[ProductCode] [int] NOT NULL,
	[Unit] [nvarchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CartCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tCategory]    Script Date: 13/12/2021 09:47:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tCategory](
	[CategoryCode] [int] IDENTITY(1,1) NOT NULL,
	[CatDescription] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tClient]    Script Date: 13/12/2021 09:47:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tClient](
	[ClientCode] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](10) NOT NULL,
	[Mail] [nvarchar](30) NOT NULL,
	[Phone] [nvarchar](15) NOT NULL,
	[BornDate] [date] NOT NULL,
	[ClientStatus] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ClientCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tDrinks]    Script Date: 13/12/2021 09:47:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tDrinks](
	[DrinkCode] [int] IDENTITY(1,1) NOT NULL,
	[CategoryCode] [int] NOT NULL,
	[Name] [nvarchar](15) NOT NULL,
	[Price] [money] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[DrinkCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tEmployer]    Script Date: 13/12/2021 09:47:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tEmployer](
	[EmplCode] [int] IDENTITY(1,1) NOT NULL,
	[ClientCode] [int] NOT NULL,
	[BillCode] [int] NOT NULL,
	[Name] [nvarchar](20) NOT NULL,
	[Phone] [nvarchar](15) NOT NULL,
	[Mail] [nvarchar](25) NOT NULL,
	[Salary] [money] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[EmplCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tSnack]    Script Date: 13/12/2021 09:47:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tSnack](
	[SnackCode] [int] IDENTITY(1,1) NOT NULL,
	[CategoryCode] [int] NOT NULL,
	[Price] [money] NOT NULL,
	[Name] [nvarchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SnackCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  UserDefinedFunction [dbo].[fnFindCategories]    Script Date: 13/12/2021 09:47:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnFindCategories]()
RETURNS TABLE AS
	RETURN SELECT * FROM tCategory
GO
/****** Object:  UserDefinedFunction [dbo].[fnFindDrinks]    Script Date: 13/12/2021 09:47:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnFindDrinks]()
RETURNS TABLE AS
	RETURN SELECT * FROM tDrinks
GO
/****** Object:  UserDefinedFunction [dbo].[fnFindSnacks]    Script Date: 13/12/2021 09:47:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnFindSnacks]()
RETURNS TABLE AS
	RETURN SELECT * FROM tSnack
GO
ALTER TABLE [dbo].[tClient] ADD  DEFAULT ((0)) FOR [ClientStatus]
GO
ALTER TABLE [dbo].[tCart]  WITH CHECK ADD FOREIGN KEY([BillCode])
REFERENCES [dbo].[tBill] ([BillCode])
GO
USE [master]
GO
ALTER DATABASE [dbCafeBar] SET  READ_WRITE 
GO
