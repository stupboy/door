USE [master]
GO
/****** Object:  Database [cha]    Script Date: 09/01/2015 17:47:06 ******/
CREATE DATABASE [cha] ON  PRIMARY 
( NAME = N'cha', FILENAME = N'D:\Program Files\Microsoft SQL Server\Data\cha.mdf' , SIZE = 7168KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'cha_log', FILENAME = N'D:\Program Files\Microsoft SQL Server\Data\cha_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [cha].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [cha] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [cha] SET ANSI_NULLS OFF
GO
ALTER DATABASE [cha] SET ANSI_PADDING OFF
GO
ALTER DATABASE [cha] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [cha] SET ARITHABORT OFF
GO
ALTER DATABASE [cha] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [cha] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [cha] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [cha] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [cha] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [cha] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [cha] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [cha] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [cha] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [cha] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [cha] SET  DISABLE_BROKER
GO
ALTER DATABASE [cha] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [cha] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [cha] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [cha] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [cha] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [cha] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [cha] SET  READ_WRITE
GO
ALTER DATABASE [cha] SET RECOVERY SIMPLE
GO
ALTER DATABASE [cha] SET  MULTI_USER
GO
ALTER DATABASE [cha] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [cha] SET DB_CHAINING OFF
GO
USE [cha]
GO
/****** Object:  Table [dbo].[Information]    Script Date: 09/01/2015 17:47:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Information](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[cname] [nvarchar](50) NULL,
	[idcard] [nvarchar](50) NULL,
	[rank] [nvarchar](50) NULL,
	[address] [nvarchar](50) NULL,
	[pcode] [nvarchar](50) NULL,
	[owner] [nvarchar](50) NULL,
	[phone] [nvarchar](50) NULL,
	[fax] [nvarchar](50) NULL,
	[email] [nvarchar](50) NULL,
	[www] [nvarchar](50) NULL,
	[comment] [nvarchar](max) NULL,
	[addtime] [nvarchar](50) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Information] ON
INSERT [dbo].[Information] ([id], [cname], [idcard], [rank], [address], [pcode], [owner], [phone], [fax], [email], [www], [comment], [addtime]) VALUES (2, N'芦苇工作室', N'KH2011011', N'4', N'', N'', N'芦苇', N'123456789', N'', N'jayah@qq.com', N'', N'芦苇工作室为公司、企业提供专业的网站建设服务，工作室拥有设计经验丰富的网页设计师，您的网站将由资深网页设计师为您规划设计，提供最专业的建议和解决方案；专业的程序设计师提供方便强大的管理后台，让您能轻松管理自己的网站。', N'2011-3-2')
INSERT [dbo].[Information] ([id], [cname], [idcard], [rank], [address], [pcode], [owner], [phone], [fax], [email], [www], [comment], [addtime]) VALUES (3, N'明星网址导航', N'KH2011012', N'5', N'', N'', N'王韦', N'123456789', N'', N'jayah@qq.com', N'http://www.mxdh.net/', N'', N'2011-3-2')
INSERT [dbo].[Information] ([id], [cname], [idcard], [rank], [address], [pcode], [owner], [phone], [fax], [email], [www], [comment], [addtime]) VALUES (5, N'ssss', N'KH20158279827', N'1', N'sss', N'', N'sss', N'7777777', N'', N'', N'', N'', N'2015-8-27')
SET IDENTITY_INSERT [dbo].[Information] OFF
/****** Object:  Table [dbo].[GoodsInfo]    Script Date: 09/01/2015 17:47:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GoodsInfo](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Gname] [nchar](15) NOT NULL,
	[Gcat] [nchar](10) NOT NULL,
	[Gcost] [float] NOT NULL,
	[Gsell] [float] NOT NULL,
	[Gprice1] [float] NULL,
	[Gprice2] [float] NULL,
	[AddTime] [datetime] NULL,
	[AddUser] [nchar](10) NULL,
	[MTime] [datetime] NULL,
	[MUser] [nchar](10) NULL,
	[is_ok] [bit] NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[GoodsInfo] ON
INSERT [dbo].[GoodsInfo] ([id], [Gname], [Gcat], [Gcost], [Gsell], [Gprice1], [Gprice2], [AddTime], [AddUser], [MTime], [MUser], [is_ok]) VALUES (1, N'红茶             ', N'养生        ', 15, 20, 20, 20, CAST(0x0000A50100000000 AS DateTime), NULL, CAST(0x0000A50100000000 AS DateTime), NULL, 1)
INSERT [dbo].[GoodsInfo] ([id], [Gname], [Gcat], [Gcost], [Gsell], [Gprice1], [Gprice2], [AddTime], [AddUser], [MTime], [MUser], [is_ok]) VALUES (2, N'绿茶             ', N'养生        ', 10, 30, 30, 30, CAST(0x0000A50100000000 AS DateTime), NULL, CAST(0x0000A50100000000 AS DateTime), NULL, 1)
SET IDENTITY_INSERT [dbo].[GoodsInfo] OFF
/****** Object:  Table [dbo].[Admin]    Script Date: 09/01/2015 17:47:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[LastLoginIP] [nvarchar](50) NULL,
	[LastLoginTime] [datetime] NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Admin] ON
INSERT [dbo].[Admin] ([id], [Username], [Password], [LastLoginIP], [LastLoginTime]) VALUES (1, N'admin', N'7a57a5a743894a0e', N'192.168.1.101', CAST(0x0000A50500AD3310 AS DateTime))
INSERT [dbo].[Admin] ([id], [Username], [Password], [LastLoginIP], [LastLoginTime]) VALUES (4, N'stupboy', N'49ba59abbe56e057', NULL, NULL)
INSERT [dbo].[Admin] ([id], [Username], [Password], [LastLoginIP], [LastLoginTime]) VALUES (3, N'text1', N'965eb72c92a549dd', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Admin] OFF
/****** Object:  Default [DF_GoodsInfo_Gcost]    Script Date: 09/01/2015 17:47:07 ******/
ALTER TABLE [dbo].[GoodsInfo] ADD  CONSTRAINT [DF_GoodsInfo_Gcost]  DEFAULT ((0)) FOR [Gcost]
GO
/****** Object:  Default [DF_GoodsInfo_Gsell]    Script Date: 09/01/2015 17:47:07 ******/
ALTER TABLE [dbo].[GoodsInfo] ADD  CONSTRAINT [DF_GoodsInfo_Gsell]  DEFAULT ((0)) FOR [Gsell]
GO
/****** Object:  Default [DF_GoodsInfo_Gprice1]    Script Date: 09/01/2015 17:47:07 ******/
ALTER TABLE [dbo].[GoodsInfo] ADD  CONSTRAINT [DF_GoodsInfo_Gprice1]  DEFAULT ((0)) FOR [Gprice1]
GO
/****** Object:  Default [DF_GoodsInfo_Gprice2]    Script Date: 09/01/2015 17:47:07 ******/
ALTER TABLE [dbo].[GoodsInfo] ADD  CONSTRAINT [DF_GoodsInfo_Gprice2]  DEFAULT ((0)) FOR [Gprice2]
GO
/****** Object:  Default [DF_GoodsInfo_AddTime]    Script Date: 09/01/2015 17:47:07 ******/
ALTER TABLE [dbo].[GoodsInfo] ADD  CONSTRAINT [DF_GoodsInfo_AddTime]  DEFAULT (getdate()) FOR [AddTime]
GO
/****** Object:  Default [DF_GoodsInfo_MTime]    Script Date: 09/01/2015 17:47:07 ******/
ALTER TABLE [dbo].[GoodsInfo] ADD  CONSTRAINT [DF_GoodsInfo_MTime]  DEFAULT (getdate()) FOR [MTime]
GO
/****** Object:  Default [DF_GoodsInfo_is_ok]    Script Date: 09/01/2015 17:47:07 ******/
ALTER TABLE [dbo].[GoodsInfo] ADD  CONSTRAINT [DF_GoodsInfo_is_ok]  DEFAULT ('true') FOR [is_ok]
GO
