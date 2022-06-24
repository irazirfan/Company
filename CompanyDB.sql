USE [master]
GO
/****** Object:  Database [CompanyDB]    Script Date: 6/24/2022 6:02:45 PM ******/
CREATE DATABASE [CompanyDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CompanyDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\CompanyDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CompanyDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\CompanyDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [CompanyDB] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CompanyDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CompanyDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CompanyDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CompanyDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CompanyDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CompanyDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [CompanyDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CompanyDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CompanyDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CompanyDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CompanyDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CompanyDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CompanyDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CompanyDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CompanyDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CompanyDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CompanyDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CompanyDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CompanyDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CompanyDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CompanyDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CompanyDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CompanyDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CompanyDB] SET RECOVERY FULL 
GO
ALTER DATABASE [CompanyDB] SET  MULTI_USER 
GO
ALTER DATABASE [CompanyDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CompanyDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CompanyDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CompanyDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CompanyDB] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'CompanyDB', N'ON'
GO
ALTER DATABASE [CompanyDB] SET QUERY_STORE = OFF
GO
USE [CompanyDB]
GO
/****** Object:  Table [dbo].[CompanyInfo]    Script Date: 6/24/2022 6:02:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CompanyInfo](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](150) NULL,
	[Email] [nvarchar](150) NULL,
	[Phone] [nvarchar](50) NULL,
	[Address] [nvarchar](250) NULL,
	[LogoPath] [nvarchar](250) NULL,
 CONSTRAINT [PK_CompanyInfo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[CompanyInfo] ON 
GO
INSERT [dbo].[CompanyInfo] ([Id], [Name], [Email], [Phone], [Address], [LogoPath]) VALUES (3, N'Bkash Limited', N'info@bkash.com', N'+8802441139', N'Nikunja-2, Dhaka', N'https://res.cloudinary.com/ione/image/upload/v1656070863/qpgmcw9uo3qwloerbr00.png')
GO
INSERT [dbo].[CompanyInfo] ([Id], [Name], [Email], [Phone], [Address], [LogoPath]) VALUES (4, N'Nagad', N'support@nagad.com', N'+8801679332699', N'Banani, Dhaka', N'https://res.cloudinary.com/ione/image/upload/v1656071957/k1vqgsrdhiixvex6mnhu.png')
GO
SET IDENTITY_INSERT [dbo].[CompanyInfo] OFF
GO
USE [master]
GO
ALTER DATABASE [CompanyDB] SET  READ_WRITE 
GO
