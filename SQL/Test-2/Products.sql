USE [ProductDB]
GO
/****** Object:  Table [dbo].[products]    Script Date: 07-Dec-20 12:07:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[products](
	[productId] [int] IDENTITY(1,1) NOT NULL,
	[productName] [varchar](100) NOT NULL,
	[materialNum] [varchar](100) NULL,
	[EAN] [varchar](100) NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[productId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[productSpecifications]    Script Date: 07-Dec-20 12:07:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[productSpecifications](
	[productSpecificationId] [int] IDENTITY(1,1) NOT NULL,
	[productId] [int] NOT NULL,
	[specificationNameId] [int] NOT NULL,
	[specificationLanguageId] [int] NOT NULL,
	[specificationValueId] [int] NOT NULL,
 CONSTRAINT [PK_productSpecifications_1] PRIMARY KEY CLUSTERED 
(
	[productSpecificationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[specificationLanguages]    Script Date: 07-Dec-20 12:07:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[specificationLanguages](
	[specificationLanguageId] [int] IDENTITY(1,1) NOT NULL,
	[languageName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_specificationLanguages] PRIMARY KEY CLUSTERED 
(
	[specificationLanguageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[specificationNames]    Script Date: 07-Dec-20 12:07:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[specificationNames](
	[specificationNameId] [int] IDENTITY(1,1) NOT NULL,
	[specificationName] [varchar](50) NULL,
 CONSTRAINT [PK_ProductSpecifications] PRIMARY KEY CLUSTERED 
(
	[specificationNameId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[specificationValues]    Script Date: 07-Dec-20 12:07:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[specificationValues](
	[specificationValueId] [int] IDENTITY(1,1) NOT NULL,
	[specificationValue] [varchar](100) NOT NULL,
 CONSTRAINT [PK_specificationValues] PRIMARY KEY CLUSTERED 
(
	[specificationValueId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[products] ON 
GO
INSERT [dbo].[products] ([productId], [productName], [materialNum], [EAN]) VALUES (1, N'Car', N'11', N'CAR11')
GO
INSERT [dbo].[products] ([productId], [productName], [materialNum], [EAN]) VALUES (2, N'Jeep', N'22', N'Jeep22')
GO
SET IDENTITY_INSERT [dbo].[products] OFF
GO
SET IDENTITY_INSERT [dbo].[productSpecifications] ON 
GO
INSERT [dbo].[productSpecifications] ([productSpecificationId], [productId], [specificationNameId], [specificationLanguageId], [specificationValueId]) VALUES (1, 1, 1, 1, 1)
GO
INSERT [dbo].[productSpecifications] ([productSpecificationId], [productId], [specificationNameId], [specificationLanguageId], [specificationValueId]) VALUES (4, 1, 1, 2, 3)
GO
SET IDENTITY_INSERT [dbo].[productSpecifications] OFF
GO
SET IDENTITY_INSERT [dbo].[specificationLanguages] ON 
GO
INSERT [dbo].[specificationLanguages] ([specificationLanguageId], [languageName]) VALUES (1, N'English')
GO
INSERT [dbo].[specificationLanguages] ([specificationLanguageId], [languageName]) VALUES (2, N'French')
GO
INSERT [dbo].[specificationLanguages] ([specificationLanguageId], [languageName]) VALUES (3, N'Spanich')
GO
SET IDENTITY_INSERT [dbo].[specificationLanguages] OFF
GO
SET IDENTITY_INSERT [dbo].[specificationNames] ON 
GO
INSERT [dbo].[specificationNames] ([specificationNameId], [specificationName]) VALUES (1, N'Height')
GO
INSERT [dbo].[specificationNames] ([specificationNameId], [specificationName]) VALUES (2, N'Color')
GO
SET IDENTITY_INSERT [dbo].[specificationNames] OFF
GO
SET IDENTITY_INSERT [dbo].[specificationValues] ON 
GO
INSERT [dbo].[specificationValues] ([specificationValueId], [specificationValue]) VALUES (1, N'11H')
GO
INSERT [dbo].[specificationValues] ([specificationValueId], [specificationValue]) VALUES (2, N'White_colr')
GO
INSERT [dbo].[specificationValues] ([specificationValueId], [specificationValue]) VALUES (3, N'white_colr_french')
GO
SET IDENTITY_INSERT [dbo].[specificationValues] OFF
GO
ALTER TABLE [dbo].[productSpecifications]  WITH CHECK ADD  CONSTRAINT [FK_productSpecifications_Products] FOREIGN KEY([productId])
REFERENCES [dbo].[products] ([productId])
GO
ALTER TABLE [dbo].[productSpecifications] CHECK CONSTRAINT [FK_productSpecifications_Products]
GO
ALTER TABLE [dbo].[productSpecifications]  WITH CHECK ADD  CONSTRAINT [FK_productSpecifications_specificationLanguages] FOREIGN KEY([specificationLanguageId])
REFERENCES [dbo].[specificationLanguages] ([specificationLanguageId])
GO
ALTER TABLE [dbo].[productSpecifications] CHECK CONSTRAINT [FK_productSpecifications_specificationLanguages]
GO
ALTER TABLE [dbo].[productSpecifications]  WITH CHECK ADD  CONSTRAINT [FK_productSpecifications_specificationNames] FOREIGN KEY([specificationNameId])
REFERENCES [dbo].[specificationNames] ([specificationNameId])
GO
ALTER TABLE [dbo].[productSpecifications] CHECK CONSTRAINT [FK_productSpecifications_specificationNames]
GO
ALTER TABLE [dbo].[productSpecifications]  WITH CHECK ADD  CONSTRAINT [FK_productSpecifications_specificationValues] FOREIGN KEY([specificationValueId])
REFERENCES [dbo].[specificationValues] ([specificationValueId])
GO
ALTER TABLE [dbo].[productSpecifications] CHECK CONSTRAINT [FK_productSpecifications_specificationValues]
GO
