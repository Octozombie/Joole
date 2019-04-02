USE [master]
GO
/****** Object:  Database [Joole]    Script Date: 4/2/2019 11:54:00 AM ******/
CREATE DATABASE [Joole]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Joole', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Joole.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Joole_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Joole_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Joole] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Joole].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Joole] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Joole] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Joole] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Joole] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Joole] SET ARITHABORT OFF 
GO
ALTER DATABASE [Joole] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Joole] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Joole] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Joole] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Joole] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Joole] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Joole] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Joole] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Joole] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Joole] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Joole] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Joole] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Joole] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Joole] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Joole] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Joole] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Joole] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Joole] SET RECOVERY FULL 
GO
ALTER DATABASE [Joole] SET  MULTI_USER 
GO
ALTER DATABASE [Joole] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Joole] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Joole] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Joole] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Joole] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Joole', N'ON'
GO
ALTER DATABASE [Joole] SET QUERY_STORE = OFF
GO
USE [Joole]
GO
/****** Object:  Table [dbo].[tblCategory]    Script Date: 4/2/2019 11:54:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCategory](
	[Category_ID] [int] IDENTITY(1,1) NOT NULL,
	[Category_Name] [nchar](10) NOT NULL,
 CONSTRAINT [PK_tblCategory] PRIMARY KEY CLUSTERED 
(
	[Category_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblCredential]    Script Date: 4/2/2019 11:54:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCredential](
	[Credential_ID] [int] IDENTITY(1,1) NOT NULL,
	[User_Type] [nchar](10) NOT NULL,
 CONSTRAINT [PK_tblCredential] PRIMARY KEY CLUSTERED 
(
	[Credential_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblManufacturer]    Script Date: 4/2/2019 11:54:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblManufacturer](
	[Manufacturer_ID] [int] IDENTITY(1,1) NOT NULL,
	[Manufacturer_Name] [nchar](30) NOT NULL,
	[Manufacturer_Department] [nchar](30) NULL,
	[Manufacturer_Web] [nchar](40) NULL,
	[User_ID] [int] NOT NULL,
 CONSTRAINT [PK_tblManufacturer] PRIMARY KEY CLUSTERED 
(
	[Manufacturer_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblProduct]    Script Date: 4/2/2019 11:54:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProduct](
	[Product_ID] [int] IDENTITY(1,1) NOT NULL,
	[Manufacturer_ID] [int] NOT NULL,
	[SubCategory_ID] [int] NOT NULL,
	[Product_Name] [nchar](10) NOT NULL,
	[Product_Image] [image] NULL,
	[Series] [nchar](10) NOT NULL,
	[Model] [nchar](25) NOT NULL,
	[ProductTypeID] [int] NOT NULL,
	[Characteristics] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_tblProduct] PRIMARY KEY CLUSTERED 
(
	[Product_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblSubCategory]    Script Date: 4/2/2019 11:54:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblSubCategory](
	[SubCategory_ID] [int] IDENTITY(1,1) NOT NULL,
	[Category_ID] [int] NOT NULL,
	[SubCategory_Name] [nchar](10) NULL,
	[SubCategoryFilter] [nchar](50) NOT NULL,
 CONSTRAINT [PK_tblSubCategory] PRIMARY KEY CLUSTERED 
(
	[SubCategory_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblType]    Script Date: 4/2/2019 11:54:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblType](
	[ProductTypeID] [int] IDENTITY(1,1) NOT NULL,
	[UseType] [nchar](10) NULL,
	[Application] [nchar](10) NULL,
	[MountingLocation] [nchar](10) NULL,
	[Accessories] [nchar](10) NULL,
	[ModelYear] [nchar](10) NULL,
 CONSTRAINT [PK_tblType] PRIMARY KEY CLUSTERED 
(
	[ProductTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUser]    Script Date: 4/2/2019 11:54:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUser](
	[User_ID] [int] IDENTITY(1,1) NOT NULL,
	[User_Name] [nchar](30) NOT NULL,
	[User_Email] [nchar](30) NOT NULL,
	[User_Image] [image] NULL,
	[User_Password] [nchar](30) NOT NULL,
	[Credential_ID] [int] NOT NULL,
 CONSTRAINT [PK_tblUser] PRIMARY KEY CLUSTERED 
(
	[User_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblManufacturer]  WITH CHECK ADD  CONSTRAINT [FK_tblManufacturer_tblUser] FOREIGN KEY([User_ID])
REFERENCES [dbo].[tblUser] ([User_ID])
GO
ALTER TABLE [dbo].[tblManufacturer] CHECK CONSTRAINT [FK_tblManufacturer_tblUser]
GO
ALTER TABLE [dbo].[tblProduct]  WITH CHECK ADD  CONSTRAINT [FK_tblProduct_tblManufacturer] FOREIGN KEY([Manufacturer_ID])
REFERENCES [dbo].[tblManufacturer] ([Manufacturer_ID])
GO
ALTER TABLE [dbo].[tblProduct] CHECK CONSTRAINT [FK_tblProduct_tblManufacturer]
GO
ALTER TABLE [dbo].[tblProduct]  WITH CHECK ADD  CONSTRAINT [FK_tblProduct_tblSubCategory] FOREIGN KEY([SubCategory_ID])
REFERENCES [dbo].[tblSubCategory] ([SubCategory_ID])
GO
ALTER TABLE [dbo].[tblProduct] CHECK CONSTRAINT [FK_tblProduct_tblSubCategory]
GO
ALTER TABLE [dbo].[tblProduct]  WITH CHECK ADD  CONSTRAINT [FK_tblProduct_tblType] FOREIGN KEY([ProductTypeID])
REFERENCES [dbo].[tblType] ([ProductTypeID])
GO
ALTER TABLE [dbo].[tblProduct] CHECK CONSTRAINT [FK_tblProduct_tblType]
GO
ALTER TABLE [dbo].[tblSubCategory]  WITH CHECK ADD  CONSTRAINT [FK_tblSubCategory_tblCategory] FOREIGN KEY([Category_ID])
REFERENCES [dbo].[tblCategory] ([Category_ID])
GO
ALTER TABLE [dbo].[tblSubCategory] CHECK CONSTRAINT [FK_tblSubCategory_tblCategory]
GO
ALTER TABLE [dbo].[tblUser]  WITH CHECK ADD  CONSTRAINT [FK_tblUser_tblCredential] FOREIGN KEY([Credential_ID])
REFERENCES [dbo].[tblCredential] ([Credential_ID])
GO
ALTER TABLE [dbo].[tblUser] CHECK CONSTRAINT [FK_tblUser_tblCredential]
GO
USE [master]
GO
ALTER DATABASE [Joole] SET  READ_WRITE 
GO
