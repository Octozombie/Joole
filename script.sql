USE [Joole]
GO
/****** Object:  Table [dbo].[tblCategory]    Script Date: 4/1/2019 11:47:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCategory](
	[Category_ID] [int] NOT NULL,
	[Category_Name] [nchar](10) NOT NULL,
 CONSTRAINT [PK_tblCategory] PRIMARY KEY CLUSTERED 
(
	[Category_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblCredential]    Script Date: 4/1/2019 11:47:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCredential](
	[Credential_ID] [int] NOT NULL,
	[User_Type] [nchar](10) NOT NULL,
 CONSTRAINT [PK_tblCredential] PRIMARY KEY CLUSTERED 
(
	[Credential_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblManufacturer]    Script Date: 4/1/2019 11:47:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblManufacturer](
	[Manufacturer_ID] [int] NOT NULL,
	[Manufacturer_Name] [nchar](10) NOT NULL,
	[Manufacturer_Department] [nchar](10) NULL,
	[Manufacturer_Web] [nchar](10) NULL,
	[User_ID] [int] NOT NULL,
 CONSTRAINT [PK_tblManufacturer] PRIMARY KEY CLUSTERED 
(
	[Manufacturer_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblProduct]    Script Date: 4/1/2019 11:47:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProduct](
	[Product_ID] [int] NOT NULL,
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
/****** Object:  Table [dbo].[tblSubCategory]    Script Date: 4/1/2019 11:47:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblSubCategory](
	[SubCategory_ID] [int] NOT NULL,
	[Category_ID] [int] NOT NULL,
	[SubCategory_Name] [nchar](10) NULL,
	[SubCategoryFilter] [nchar](50) NOT NULL,
 CONSTRAINT [PK_tblSubCategory] PRIMARY KEY CLUSTERED 
(
	[SubCategory_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblType]    Script Date: 4/1/2019 11:47:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblType](
	[ProductTypeID] [int] NOT NULL,
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
/****** Object:  Table [dbo].[tblUser]    Script Date: 4/1/2019 11:47:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUser](
	[User_ID] [int] NOT NULL,
	[User_Name] [nchar](10) NOT NULL,
	[User_Email] [nchar](10) NOT NULL,
	[User_Image] [image] NULL,
	[User_Password] [nchar](10) NOT NULL,
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
