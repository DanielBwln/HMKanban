USE [master]
GO

/****** Object:  Database [KanBan]    Script Date: 3/7/2017 3:18:08 PM ******/
CREATE DATABASE [KanBan]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'KanBan', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\KanBan.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'KanBan_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\KanBan_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO

ALTER DATABASE [KanBan] SET COMPATIBILITY_LEVEL = 130
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [KanBan].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [KanBan] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [KanBan] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [KanBan] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [KanBan] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [KanBan] SET ARITHABORT OFF 
GO

ALTER DATABASE [KanBan] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [KanBan] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [KanBan] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [KanBan] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [KanBan] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [KanBan] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [KanBan] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [KanBan] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [KanBan] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [KanBan] SET  DISABLE_BROKER 
GO

ALTER DATABASE [KanBan] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [KanBan] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [KanBan] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [KanBan] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [KanBan] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [KanBan] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [KanBan] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [KanBan] SET RECOVERY FULL 
GO

ALTER DATABASE [KanBan] SET  MULTI_USER 
GO

ALTER DATABASE [KanBan] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [KanBan] SET DB_CHAINING OFF 
GO

ALTER DATABASE [KanBan] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO

ALTER DATABASE [KanBan] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO

ALTER DATABASE [KanBan] SET DELAYED_DURABILITY = DISABLED 
GO

ALTER DATABASE [KanBan] SET QUERY_STORE = OFF
GO

USE [KanBan]
GO

ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO

ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO

ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO

ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO

ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO

ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO

ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO

ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO

ALTER DATABASE [KanBan] SET  READ_WRITE 
GO

/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [KanBan_User]    Script Date: 3/7/2017 2:50:20 PM ******/
CREATE LOGIN [KanBan_User] WITH PASSWORD=N'pass@word1', DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=ON, CHECK_POLICY=ON
GO

ALTER SERVER ROLE [sysadmin] ADD MEMBER [KanBan_User]
GO

USE [KanBan]
/****** Object:  Table [dbo].[KanBan]    Script Date: 3/6/2017 2:57:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KanBan](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Status] [smallint] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KanBan_Assignment]    Script Date: 3/6/2017 2:57:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KanBan_Assignment](
	[StoryID] [bigint] IDENTITY(1,1) NOT NULL,
	[UserID] [bigint] NOT NULL,
	[AssignType] [smallint] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KanBan_Column]    Script Date: 3/6/2017 2:57:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KanBan_Column](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Seq] [int] NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[KanBan_ID] [bigint] NOT NULL,
	[Status] [smallint] NOT NULL,
	[Type] [smallint] NOT NULL,
	[RoleType] [smallint] NULL,
	[TraceType] [smallint] NULL,
	[Link] [nvarchar](4000) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KanBan_Column_Check]    Script Date: 3/6/2017 2:57:14 PM ******/
/****** Comment out by Daniel since these tables are useless tentatively******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--CREATE TABLE [dbo].[KanBan_Column_Check](
--	[ID] [bigint] IDENTITY(1,1) NOT NULL,
--	[Name] [nvarchar](255) NOT NULL,
--	[Type] [smallint] NOT NULL,
--	[Column_Checklist_ID] [bigint] NOT NULL
--) ON [PRIMARY]

--GO
/****** Object:  Table [dbo].[KanBan_Column_Checklist]    Script Date: 3/6/2017 2:57:14 PM ******/
/****** Comment out by Daniel since these tables are useless tentatively******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--CREATE TABLE [dbo].[KanBan_Column_Checklist](
--	[ID] [bigint] IDENTITY(1,1) NOT NULL,
--	[Column_ID] [bigint] NOT NULL,
--	[Status] [smallint] NOT NULL,
--	[Name] [nvarchar](255) NULL
--) ON [PRIMARY]

--GO
/****** Object:  Table [dbo].[KanBan_Column_Checklist_Mapping]    Script Date: 3/6/2017 2:57:14 PM ******/
/****** Comment out by Daniel since these tables are useless tentatively******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--CREATE TABLE [dbo].[KanBan_Column_Checklist_Mapping](
--	[Checklist_ID] [bigint] NOT NULL,
--	[CheckItem_ID] [bigint] NOT NULL
--) ON [PRIMARY]

--GO
/****** Object:  Table [dbo].[KanBan_ColumnGroup]    Script Date: 3/6/2017 2:57:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KanBan_ColumnGroup](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[KanBan_ID] [bigint] NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Seq] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KanBan_ColumnGroup_Mapping]    Script Date: 3/6/2017 2:57:14 PM ******/
/****** Comment out by Daniel since these tables are useless tentatively******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--CREATE TABLE [dbo].[KanBan_ColumnGroup_Mapping](
--	[ColumnGroup_ID] [bigint] NOT NULL,
--	[Column_ID] [bigint] NOT NULL
--) ON [PRIMARY]

--GO
/****** Object:  Table [dbo].[KanBan_Cycle]    Script Date: 3/6/2017 2:57:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KanBan_Cycle](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[KanBan_ID] [bigint] NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[IsDefault] [bit] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KanBan_Cycle_Period]    Script Date: 3/6/2017 2:57:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KanBan_Cycle_Period](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Cycle_ID] [bigint] NOT NULL,
	[KanBan_ID] [bigint] NOT NULL,
	[Name] [nvarchar](127) NOT NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KanBan_Cycle_Period_Status]    Script Date: 3/6/2017 2:57:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KanBan_Cycle_Period_Status](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[KanBan_ID] [bigint] NOT NULL,
	[Cycle_Period_ID] [bigint] NOT NULL,
	[Inventory_Num] [int] NOT NULL,
	[Income_Num] [int] NOT NULL,
	[Outcome_Num] [int] NOT NULL,
	[Fire_Num] [int] NOT NULL,
	[Resolve_Num] [int] NOT NULL,
	[Income_Num_Cu] [int] NOT NULL,
	[Outcome_Num_Cu] [int] NOT NULL,
	[Fire_Num_Cu] [int] NOT NULL,
	[Resolve_Num_Cu] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KanBan_Story]    Script Date: 3/6/2017 2:57:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KanBan_Story](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Description] [ntext] NULL,
	[DueDate] [date] NOT NULL,
	[StoryStatus] [bigint] NOT NULL,
	[StoryType] [smallint] NOT NULL,
	[TaskType] [smallint] NOT NULL,
	[SwimLane_ID] [bigint] NOT NULL,
	[KanBan_ID] [bigint] NOT NULL,
	[Prior] [smallint] NOT NULL,
	[Status] [smallint] NOT NULL,
	[StageDueDate] [date] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KanBan_Story_ChangeLog]    Script Date: 3/6/2017 2:57:15 PM ******/
/****** Comment out by Daniel since these tables are useless tentatively ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--CREATE TABLE [dbo].[KanBan_Story_ChangeLog](
--	[Alias] [nvarchar](50) NOT NULL,
--	[CurDateTime] [datetime] NOT NULL,
--	[Story_ID] [bigint] NOT NULL,
--	[Field] [nvarchar](50) NOT NULL,
--	[Value_Prev] [nvarchar](255) NULL,
--	[Value_New] [nvarchar](255) NULL
--) ON [PRIMARY]

--GO
/****** Object:  Table [dbo].[KanBan_Story_Check]    Script Date: 3/6/2017 2:57:15 PM ******/
/****** Comment out by Daniel since these tables are useless tentatively ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--CREATE TABLE [dbo].[KanBan_Story_Check](
--	[ID] [bigint] IDENTITY(1,1) NOT NULL,
--	[Story_ID] [bigint] NOT NULL,
--	[Column_Check_ID] [bigint] NOT NULL,
--	[Checked] [bit] NOT NULL
--) ON [PRIMARY]

--GO
/****** Object:  Table [dbo].[KanBan_Story_ColumnLog]    Script Date: 3/6/2017 2:57:15 PM ******/
/****** Comment out by Daniel since these tables are useless tentatively ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--CREATE TABLE [dbo].[KanBan_Story_ColumnLog](
--	[Alias] [nvarchar](31) NOT NULL,
--	[CurDatetime] [datetime] NOT NULL,
--	[Story_ID] [bigint] NOT NULL,
--	[Column_ID_Prev] [bigint] NOT NULL,
--	[Column_ID_New] [bigint] NOT NULL
--) ON [PRIMARY]

--GO
/****** Object:  Table [dbo].[KanBan_Story_StatusLog]    Script Date: 3/6/2017 2:57:15 PM ******/
/****** Comment out by Daniel since these tables are useless tentatively ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--CREATE TABLE [dbo].[KanBan_Story_StatusLog](
--	[Alias] [nvarchar](31) NOT NULL,
--	[CurDatetime] [datetime] NOT NULL,
--	[Story_ID] [bigint] NOT NULL,
--	[Status_Prev] [bigint] NOT NULL,
--	[Status_New] [bigint] NOT NULL
--) ON [PRIMARY]

--GO
/****** Object:  Table [dbo].[KanBan_SwimLane]    Script Date: 3/6/2017 2:57:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KanBan_SwimLane](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[KanBan_ID] [bigint] NOT NULL,
	[Status] [smallint] NOT NULL,
	[Type] [smallint] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Index [ClusteredIndex-20170303-170033]    Script Date: 3/6/2017 2:57:15 PM ******/
CREATE CLUSTERED INDEX [ClusteredIndex-20170303-170033] ON [dbo].[KanBan_SwimLane]
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KanBan_SwimLane_StatusLog]    Script Date: 3/6/2017 2:57:15 PM ******/
/****** Comment out by Daniel since these tables are useless tentatively ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--CREATE TABLE [dbo].[KanBan_SwimLane_StatusLog](
--	[Alias] [nvarchar](31) NOT NULL,
--	[CurDatetime] [datetime] NOT NULL,
--	[Lane_ID] [bigint] NOT NULL,
--	[Status_Prev] [smallint] NOT NULL,
--	[Status_New] [smallint] NOT NULL
--) ON [PRIMARY]

--GO
/****** Object:  Table [dbo].[KanBan_TFS_Server]    Script Date: 3/6/2017 2:57:15 PM ******/
/****** Comment out by Daniel since these tables are useless tentatively ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--CREATE TABLE [dbo].[KanBan_TFS_Server](
--	[ID] [bigint] IDENTITY(1,1) NOT NULL,
--	[Server] [nvarchar](255) NOT NULL,
--	[Collection] [nvarchar](63) NOT NULL,
--	[Project] [nvarchar](63) NOT NULL
--) ON [PRIMARY]

--GO
/****** Object:  Table [dbo].[KanBan_TFS_WIQ]    Script Date: 3/6/2017 2:57:15 PM ******/
/****** Comment out by Daniel since these tables are useless tentatively ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--CREATE TABLE [dbo].[KanBan_TFS_WIQ](
--	[ID] [bigint] IDENTITY(1,1) NOT NULL,
--	[KanBan_ID] [bigint] NOT NULL,
--	[Name] [nvarchar](255) NOT NULL,
--	[WIQ] [ntext] NOT NULL
--) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

--GO
/****** Object:  Table [dbo].[KanBan_User]    Script Date: 3/6/2017 2:57:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KanBan_User](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Alias] [nvarchar](31) NOT NULL,
	[FirstName] [nvarchar](63) NOT NULL,
	[LastName] [nvarchar](63) NOT NULL,
	[Role] [smallint] NOT NULL,
	[Status] [smallint] NOT NULL,
	[KanBan_ID] [bigint] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SYS_User]    Script Date: 3/6/2017 2:57:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SYS_User](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Alias] [nvarchar](255) NOT NULL,
	[Status] [smallint] NOT NULL,
	[Config_TicketColor] [smallint] NOT NULL
) ON [PRIMARY]

GO

/****** Insert data to  [dbo].[KanBan] ******/
SET IDENTITY_INSERT [dbo].[KanBan] ON 
INSERT [dbo].[KanBan] ([ID], [Name], [Status]) VALUES (1, N'Huamei Dept.II KanBan', 1)
SET IDENTITY_INSERT [dbo].[KanBan] OFF

/****** Insert data to  [dbo].[KanBan_Assignment] ******/
SET IDENTITY_INSERT [dbo].[KanBan_Assignment] ON
INSERT [dbo].[KanBan_Assignment] ([StoryID], [UserID], [AssignType]) VALUES (44, 130, 1)
INSERT [dbo].[KanBan_Assignment] ([StoryID], [UserID], [AssignType]) VALUES (45, 122, 1)
INSERT [dbo].[KanBan_Assignment] ([StoryID], [UserID], [AssignType]) VALUES (53, 124, 1)
INSERT [dbo].[KanBan_Assignment] ([StoryID], [UserID], [AssignType]) VALUES (49, 121, 1)
INSERT [dbo].[KanBan_Assignment] ([StoryID], [UserID], [AssignType]) VALUES (50, 123, 1)
INSERT [dbo].[KanBan_Assignment] ([StoryID], [UserID], [AssignType]) VALUES (51, 126, 1)
INSERT [dbo].[KanBan_Assignment] ([StoryID], [UserID], [AssignType]) VALUES (55, 124, 1)
INSERT [dbo].[KanBan_Assignment] ([StoryID], [UserID], [AssignType]) VALUES (57, 136, 1)
INSERT [dbo].[KanBan_Assignment] ([StoryID], [UserID], [AssignType]) VALUES (66, 133, 1)
INSERT [dbo].[KanBan_Assignment] ([StoryID], [UserID], [AssignType]) VALUES (67, 133, 1)
INSERT [dbo].[KanBan_Assignment] ([StoryID], [UserID], [AssignType]) VALUES (68, 133, 1)
INSERT [dbo].[KanBan_Assignment] ([StoryID], [UserID], [AssignType]) VALUES (69, 133, 1)
INSERT [dbo].[KanBan_Assignment] ([StoryID], [UserID], [AssignType]) VALUES (54, 124, 1)
INSERT [dbo].[KanBan_Assignment] ([StoryID], [UserID], [AssignType]) VALUES (56, 136, 1)
INSERT [dbo].[KanBan_Assignment] ([StoryID], [UserID], [AssignType]) VALUES (58, 131, 1)
INSERT [dbo].[KanBan_Assignment] ([StoryID], [UserID], [AssignType]) VALUES (59, 131, 1)
INSERT [dbo].[KanBan_Assignment] ([StoryID], [UserID], [AssignType]) VALUES (60, 131, 1)
INSERT [dbo].[KanBan_Assignment] ([StoryID], [UserID], [AssignType]) VALUES (61, 131, 1)
INSERT [dbo].[KanBan_Assignment] ([StoryID], [UserID], [AssignType]) VALUES (62, 131, 1)
INSERT [dbo].[KanBan_Assignment] ([StoryID], [UserID], [AssignType]) VALUES (63, 132, 1)
INSERT [dbo].[KanBan_Assignment] ([StoryID], [UserID], [AssignType]) VALUES (64, 139, 1)
INSERT [dbo].[KanBan_Assignment] ([StoryID], [UserID], [AssignType]) VALUES (65, 139, 1)
INSERT [dbo].[KanBan_Assignment] ([StoryID], [UserID], [AssignType]) VALUES (70, 133, 1)
INSERT [dbo].[KanBan_Assignment] ([StoryID], [UserID], [AssignType]) VALUES (71, 124, 2)
INSERT [dbo].[KanBan_Assignment] ([StoryID], [UserID], [AssignType]) VALUES (71, 133, 1)
INSERT [dbo].[KanBan_Assignment] ([StoryID], [UserID], [AssignType]) VALUES (73, 133, 1)
INSERT [dbo].[KanBan_Assignment] ([StoryID], [UserID], [AssignType]) VALUES (72, 133, 1)
INSERT [dbo].[KanBan_Assignment] ([StoryID], [UserID], [AssignType]) VALUES (41, 138, 1)
INSERT [dbo].[KanBan_Assignment] ([StoryID], [UserID], [AssignType]) VALUES (40, 138, 1)
INSERT [dbo].[KanBan_Assignment] ([StoryID], [UserID], [AssignType]) VALUES (39, 138, 1)
INSERT [dbo].[KanBan_Assignment] ([StoryID], [UserID], [AssignType]) VALUES (42, 138, 1)
INSERT [dbo].[KanBan_Assignment] ([StoryID], [UserID], [AssignType]) VALUES (43, 138, 1)
INSERT [dbo].[KanBan_Assignment] ([StoryID], [UserID], [AssignType]) VALUES (29, 140, 1)
INSERT [dbo].[KanBan_Assignment] ([StoryID], [UserID], [AssignType]) VALUES (30, 140, 1)
INSERT [dbo].[KanBan_Assignment] ([StoryID], [UserID], [AssignType]) VALUES (31, 140, 1)
INSERT [dbo].[KanBan_Assignment] ([StoryID], [UserID], [AssignType]) VALUES (33, 140, 1)
INSERT [dbo].[KanBan_Assignment] ([StoryID], [UserID], [AssignType]) VALUES (32, 140, 1)
INSERT [dbo].[KanBan_Assignment] ([StoryID], [UserID], [AssignType]) VALUES (26, 137, 1)
INSERT [dbo].[KanBan_Assignment] ([StoryID], [UserID], [AssignType]) VALUES (27, 137, 1)
INSERT [dbo].[KanBan_Assignment] ([StoryID], [UserID], [AssignType]) VALUES (28, 137, 1)
INSERT [dbo].[KanBan_Assignment] ([StoryID], [UserID], [AssignType]) VALUES (74, 139, 1)
INSERT [dbo].[KanBan_Assignment] ([StoryID], [UserID], [AssignType]) VALUES (34, 129, 1)
INSERT [dbo].[KanBan_Assignment] ([StoryID], [UserID], [AssignType]) VALUES (35, 129, 1)
INSERT [dbo].[KanBan_Assignment] ([StoryID], [UserID], [AssignType]) VALUES (36, 129, 1)
INSERT [dbo].[KanBan_Assignment] ([StoryID], [UserID], [AssignType]) VALUES (37, 129, 1)
INSERT [dbo].[KanBan_Assignment] ([StoryID], [UserID], [AssignType]) VALUES (38, 129, 1)
INSERT [dbo].[KanBan_Assignment] ([StoryID], [UserID], [AssignType]) VALUES (75, 128, 1)
INSERT [dbo].[KanBan_Assignment] ([StoryID], [UserID], [AssignType]) VALUES (76, 128, 1)
INSERT [dbo].[KanBan_Assignment] ([StoryID], [UserID], [AssignType]) VALUES (77, 128, 1)
INSERT [dbo].[KanBan_Assignment] ([StoryID], [UserID], [AssignType]) VALUES (78, 129, 1)
INSERT [dbo].[KanBan_Assignment] ([StoryID], [UserID], [AssignType]) VALUES (79, 129, 1)
INSERT [dbo].[KanBan_Assignment] ([StoryID], [UserID], [AssignType]) VALUES (80, 140, 1)
INSERT [dbo].[KanBan_Assignment] ([StoryID], [UserID], [AssignType]) VALUES (46, 125, 1)
INSERT [dbo].[KanBan_Assignment] ([StoryID], [UserID], [AssignType]) VALUES (47, 125, 1)
SET IDENTITY_INSERT [dbo].[KanBan_Assignment] OFF

/****** Insert data to  [dbo].[KanBan_Column] ******/
SET IDENTITY_INSERT [dbo].[KanBan_Column] ON 
INSERT [dbo].[KanBan_Column] ([ID], [Seq], [Name], [KanBan_ID], [Status], [Type], [RoleType], [TraceType], [Link]) 
	VALUES (1, 1, N'To Do', 1, 1, 1, 1, 0, N'')
INSERT [dbo].[KanBan_Column] ([ID], [Seq], [Name], [KanBan_ID], [Status], [Type], [RoleType], [TraceType], [Link]) 
	VALUES (2, 2, N'Coding', 1, 1, 1, 1, 0, N'')
INSERT [dbo].[KanBan_Column] ([ID], [Seq], [Name], [KanBan_ID], [Status], [Type], [RoleType], [TraceType], [Link]) 
	VALUES (3, 3, N'Review', 1, 1, 1, 1, 0, N'')
INSERT [dbo].[KanBan_Column] ([ID], [Seq], [Name], [KanBan_ID], [Status], [Type], [RoleType], [TraceType], [Link]) 
	VALUES (4, 4, N'Testing', 1, 1, 1, 1, 0, N'')
INSERT [dbo].[KanBan_Column] ([ID], [Seq], [Name], [KanBan_ID], [Status], [Type], [RoleType], [TraceType], [Link]) 
	VALUES (5, 5, N'Done', 1, 1, 1, 1, 0, N'')
SET IDENTITY_INSERT [dbo].[KanBan_Column] OFF

/****** Insert data to  [dbo].[KanBan_Cycle] ******/
SET IDENTITY_INSERT [dbo].[KanBan_Cycle] ON 
INSERT [dbo].[KanBan_Cycle] ([ID], [KanBan_ID], [Name], [IsDefault]) VALUES (1, 1, N'Default Calendar', 1)
SET IDENTITY_INSERT [dbo].[KanBan_Cycle] OFF

/****** Insert data to  [dbo].[KanBan_Cycle_Period] ******/
SET IDENTITY_INSERT [dbo].[KanBan_Cycle_Period] ON 
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1, 1, 1, N'C1.1', CAST(N'2017-01-01' AS Date), CAST(N'2017-01-07' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (2, 1, 1, N'C1.2', CAST(N'2017-01-08' AS Date), CAST(N'2017-01-14' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (3, 1, 1, N'C1.3', CAST(N'2017-01-15' AS Date), CAST(N'2017-01-21' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (4, 1, 1, N'C1.4', CAST(N'2017-01-22' AS Date), CAST(N'2017-01-28' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (5, 1, 1, N'C1.5', CAST(N'2017-01-29' AS Date), CAST(N'2017-02-04' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (6, 1, 1, N'C1.6', CAST(N'2017-02-05' AS Date), CAST(N'2017-02-11' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (7, 1, 1, N'C1.7', CAST(N'2017-02-12' AS Date), CAST(N'2017-02-18' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (8, 1, 1, N'C1.8', CAST(N'2017-02-19' AS Date), CAST(N'2017-02-25' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (9, 1, 1, N'C1.9', CAST(N'2017-02-26' AS Date), CAST(N'2017-03-04' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (10, 1, 1, N'C1.10', CAST(N'2017-03-05' AS Date), CAST(N'2017-03-11' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (11, 1, 1, N'C1.11', CAST(N'2017-03-12' AS Date), CAST(N'2017-03-18' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (12, 1, 1, N'C1.12', CAST(N'2017-03-19' AS Date), CAST(N'2017-03-25' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (13, 1, 1, N'C1.13', CAST(N'2017-03-26' AS Date), CAST(N'2017-04-01' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (14, 1, 1, N'C1.14', CAST(N'2017-04-02' AS Date), CAST(N'2017-04-08' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (15, 1, 1, N'C1.15', CAST(N'2017-04-09' AS Date), CAST(N'2017-04-15' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (16, 1, 1, N'C1.16', CAST(N'2017-04-16' AS Date), CAST(N'2017-04-22' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (17, 1, 1, N'C1.17', CAST(N'2017-04-23' AS Date), CAST(N'2017-04-29' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (18, 1, 1, N'C1.18', CAST(N'2017-04-30' AS Date), CAST(N'2017-05-06' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (19, 1, 1, N'C1.19', CAST(N'2017-05-07' AS Date), CAST(N'2017-05-13' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (20, 1, 1, N'C1.20', CAST(N'2017-05-14' AS Date), CAST(N'2017-05-20' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (21, 1, 1, N'C1.21', CAST(N'2017-05-21' AS Date), CAST(N'2017-05-27' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (22, 1, 1, N'C1.22', CAST(N'2017-05-28' AS Date), CAST(N'2017-06-03' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (23, 1, 1, N'C1.23', CAST(N'2017-06-04' AS Date), CAST(N'2017-06-10' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (24, 1, 1, N'C1.24', CAST(N'2017-06-11' AS Date), CAST(N'2017-06-17' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (25, 1, 1, N'C1.25', CAST(N'2017-06-18' AS Date), CAST(N'2017-06-24' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (26, 1, 1, N'C1.26', CAST(N'2017-06-25' AS Date), CAST(N'2017-07-01' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (27, 1, 1, N'C1.27', CAST(N'2017-07-02' AS Date), CAST(N'2017-07-08' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (28, 1, 1, N'C1.28', CAST(N'2017-07-09' AS Date), CAST(N'2017-07-15' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (29, 1, 1, N'C1.29', CAST(N'2017-07-16' AS Date), CAST(N'2017-07-22' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (30, 1, 1, N'C1.30', CAST(N'2017-07-23' AS Date), CAST(N'2017-07-29' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (31, 1, 1, N'C1.31', CAST(N'2017-07-30' AS Date), CAST(N'2017-08-05' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (32, 1, 1, N'C1.32', CAST(N'2017-08-06' AS Date), CAST(N'2017-08-12' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (33, 1, 1, N'C1.33', CAST(N'2017-08-13' AS Date), CAST(N'2017-08-19' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (34, 1, 1, N'C1.34', CAST(N'2017-08-20' AS Date), CAST(N'2017-08-26' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (35, 1, 1, N'C1.35', CAST(N'2017-08-27' AS Date), CAST(N'2017-09-02' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (36, 1, 1, N'C1.36', CAST(N'2017-09-03' AS Date), CAST(N'2017-09-09' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (37, 1, 1, N'C1.37', CAST(N'2017-09-10' AS Date), CAST(N'2017-09-16' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (38, 1, 1, N'C1.38', CAST(N'2017-09-17' AS Date), CAST(N'2017-09-23' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (39, 1, 1, N'C1.39', CAST(N'2017-09-24' AS Date), CAST(N'2017-09-30' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (40, 1, 1, N'C1.40', CAST(N'2017-10-01' AS Date), CAST(N'2017-10-07' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (41, 1, 1, N'C1.41', CAST(N'2017-10-08' AS Date), CAST(N'2017-10-14' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (42, 1, 1, N'C1.42', CAST(N'2017-10-15' AS Date), CAST(N'2017-10-21' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (43, 1, 1, N'C1.43', CAST(N'2017-10-22' AS Date), CAST(N'2017-10-28' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (44, 1, 1, N'C1.44', CAST(N'2017-10-29' AS Date), CAST(N'2017-11-04' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (45, 1, 1, N'C1.45', CAST(N'2017-11-05' AS Date), CAST(N'2017-11-11' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (46, 1, 1, N'C1.46', CAST(N'2017-11-12' AS Date), CAST(N'2017-11-18' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (47, 1, 1, N'C1.47', CAST(N'2017-11-19' AS Date), CAST(N'2017-11-25' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (48, 1, 1, N'C1.48', CAST(N'2017-11-26' AS Date), CAST(N'2017-12-02' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (49, 1, 1, N'C1.49', CAST(N'2017-12-03' AS Date), CAST(N'2017-12-09' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (50, 1, 1, N'C1.50', CAST(N'2017-12-10' AS Date), CAST(N'2017-12-16' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (51, 1, 1, N'C1.51', CAST(N'2017-12-17' AS Date), CAST(N'2017-12-23' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (52, 1, 1, N'C2.1', CAST(N'2017-12-24' AS Date), CAST(N'2017-12-30' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (53, 1, 1, N'C2.2', CAST(N'2017-12-31' AS Date), CAST(N'2018-01-06' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (54, 1, 1, N'C2.3', CAST(N'2018-01-07' AS Date), CAST(N'2018-01-13' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (55, 1, 1, N'C2.4', CAST(N'2018-01-14' AS Date), CAST(N'2018-01-20' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (56, 1, 1, N'C2.5', CAST(N'2018-01-21' AS Date), CAST(N'2018-01-27' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (57, 1, 1, N'C2.6', CAST(N'2018-01-28' AS Date), CAST(N'2018-02-03' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (58, 1, 1, N'C2.7', CAST(N'2018-02-04' AS Date), CAST(N'2018-02-10' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (59, 1, 1, N'C2.8', CAST(N'2018-02-11' AS Date), CAST(N'2018-02-17' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (60, 1, 1, N'C2.9', CAST(N'2018-02-18' AS Date), CAST(N'2018-02-24' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (61, 1, 1, N'C2.10', CAST(N'2018-02-25' AS Date), CAST(N'2018-03-03' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (62, 1, 1, N'C2.11', CAST(N'2018-03-04' AS Date), CAST(N'2018-03-10' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (63, 1, 1, N'C2.12', CAST(N'2018-03-11' AS Date), CAST(N'2018-03-17' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (64, 1, 1, N'C2.13', CAST(N'2018-03-18' AS Date), CAST(N'2018-03-24' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (65, 1, 1, N'C2.14', CAST(N'2018-03-25' AS Date), CAST(N'2018-03-31' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (66, 1, 1, N'C2.15', CAST(N'2018-04-01' AS Date), CAST(N'2018-04-07' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (67, 1, 1, N'C2.16', CAST(N'2018-04-08' AS Date), CAST(N'2018-04-14' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (68, 1, 1, N'C2.17', CAST(N'2018-04-15' AS Date), CAST(N'2018-04-21' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (69, 1, 1, N'C2.18', CAST(N'2018-04-22' AS Date), CAST(N'2018-04-28' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (70, 1, 1, N'C2.19', CAST(N'2018-04-29' AS Date), CAST(N'2018-05-05' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (71, 1, 1, N'C2.20', CAST(N'2018-05-06' AS Date), CAST(N'2018-05-12' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (72, 1, 1, N'C2.21', CAST(N'2018-05-13' AS Date), CAST(N'2018-05-19' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (73, 1, 1, N'C2.22', CAST(N'2018-05-20' AS Date), CAST(N'2018-05-26' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (74, 1, 1, N'C2.23', CAST(N'2018-05-27' AS Date), CAST(N'2018-06-02' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (75, 1, 1, N'C2.24', CAST(N'2018-06-03' AS Date), CAST(N'2018-06-09' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (76, 1, 1, N'C2.25', CAST(N'2018-06-10' AS Date), CAST(N'2018-06-16' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (77, 1, 1, N'C2.26', CAST(N'2018-06-17' AS Date), CAST(N'2018-06-23' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (78, 1, 1, N'C2.27', CAST(N'2018-06-24' AS Date), CAST(N'2018-06-30' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (79, 1, 1, N'C2.28', CAST(N'2018-07-01' AS Date), CAST(N'2018-07-07' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (80, 1, 1, N'C2.29', CAST(N'2018-07-08' AS Date), CAST(N'2018-07-14' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (81, 1, 1, N'C2.30', CAST(N'2018-07-15' AS Date), CAST(N'2018-07-21' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (82, 1, 1, N'C2.31', CAST(N'2018-07-22' AS Date), CAST(N'2018-07-28' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (83, 1, 1, N'C2.32', CAST(N'2018-07-29' AS Date), CAST(N'2018-08-04' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (84, 1, 1, N'C2.33', CAST(N'2018-08-05' AS Date), CAST(N'2018-08-11' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (85, 1, 1, N'C2.34', CAST(N'2018-08-12' AS Date), CAST(N'2018-08-18' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (86, 1, 1, N'C2.35', CAST(N'2018-08-19' AS Date), CAST(N'2018-08-25' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (87, 1, 1, N'C2.36', CAST(N'2018-08-26' AS Date), CAST(N'2018-09-01' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (88, 1, 1, N'C2.37', CAST(N'2018-09-02' AS Date), CAST(N'2018-09-08' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (89, 1, 1, N'C2.38', CAST(N'2018-09-09' AS Date), CAST(N'2018-09-15' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (90, 1, 1, N'C2.39', CAST(N'2018-09-16' AS Date), CAST(N'2018-09-22' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (91, 1, 1, N'C2.40', CAST(N'2018-09-23' AS Date), CAST(N'2018-09-29' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (92, 1, 1, N'C2.41', CAST(N'2018-09-30' AS Date), CAST(N'2018-10-06' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (93, 1, 1, N'C2.42', CAST(N'2018-10-07' AS Date), CAST(N'2018-10-13' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (94, 1, 1, N'C2.43', CAST(N'2018-10-14' AS Date), CAST(N'2018-10-20' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (95, 1, 1, N'C2.44', CAST(N'2018-10-21' AS Date), CAST(N'2018-10-27' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (96, 1, 1, N'C2.45', CAST(N'2018-10-28' AS Date), CAST(N'2018-11-03' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (97, 1, 1, N'C2.46', CAST(N'2018-11-04' AS Date), CAST(N'2018-11-10' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (98, 1, 1, N'C2.47', CAST(N'2018-11-11' AS Date), CAST(N'2018-11-17' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (99, 1, 1, N'C2.48', CAST(N'2018-11-18' AS Date), CAST(N'2018-11-24' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (100, 1, 1, N'C2.49', CAST(N'2018-11-25' AS Date), CAST(N'2018-12-01' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (101, 1, 1, N'C2.50', CAST(N'2018-12-02' AS Date), CAST(N'2018-12-08' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (102, 1, 1, N'C2.51', CAST(N'2018-12-09' AS Date), CAST(N'2018-12-15' AS Date))
SET IDENTITY_INSERT [dbo].[KanBan_Cycle_Period] OFF

/****** Insert data to  [dbo].[KanBan_Story] ******/
SET IDENTITY_INSERT [dbo].[KanBan_Story] ON 
INSERT [dbo].[KanBan_Story] ([ID], [Name], [Description], [DueDate], [StoryStatus], [StoryType], [TaskType], [SwimLane_ID], [KanBan_ID], [Prior], [Status], [StageDueDate]) VALUES (30, N'3815705', N'', CAST(N'2017-03-10' AS Date), 4, 10, 1, 108, 1, 3, 1, CAST(N'2017-03-10' AS Date))
INSERT [dbo].[KanBan_Story] ([ID], [Name], [Description], [DueDate], [StoryStatus], [StoryType], [TaskType], [SwimLane_ID], [KanBan_ID], [Prior], [Status], [StageDueDate]) VALUES (31, N'3815327', N'', CAST(N'2017-03-10' AS Date), 4, 10, 1, 108, 1, 3, 1, CAST(N'2017-03-10' AS Date))
INSERT [dbo].[KanBan_Story] ([ID], [Name], [Description], [DueDate], [StoryStatus], [StoryType], [TaskType], [SwimLane_ID], [KanBan_ID], [Prior], [Status], [StageDueDate]) VALUES (32, N'3809904', N'', CAST(N'2017-03-10' AS Date), 4, 10, 1, 108, 1, 3, 1, CAST(N'2017-03-10' AS Date))
INSERT [dbo].[KanBan_Story] ([ID], [Name], [Description], [DueDate], [StoryStatus], [StoryType], [TaskType], [SwimLane_ID], [KanBan_ID], [Prior], [Status], [StageDueDate]) VALUES (33, N'3810468', N'', CAST(N'2017-03-10' AS Date), 4, 10, 1, 108, 1, 3, 1, CAST(N'2017-03-10' AS Date))
INSERT [dbo].[KanBan_Story] ([ID], [Name], [Description], [DueDate], [StoryStatus], [StoryType], [TaskType], [SwimLane_ID], [KanBan_ID], [Prior], [Status], [StageDueDate]) VALUES (34, N'3813489', N'', CAST(N'2017-03-10' AS Date), 3, 2, 1, 107, 1, 2, 1, CAST(N'2017-03-10' AS Date))
INSERT [dbo].[KanBan_Story] ([ID], [Name], [Description], [DueDate], [StoryStatus], [StoryType], [TaskType], [SwimLane_ID], [KanBan_ID], [Prior], [Status], [StageDueDate]) VALUES (35, N'3811295', N'', CAST(N'2017-03-10' AS Date), 3, 2, 1, 107, 1, 3, 1, CAST(N'2017-03-10' AS Date))
INSERT [dbo].[KanBan_Story] ([ID], [Name], [Description], [DueDate], [StoryStatus], [StoryType], [TaskType], [SwimLane_ID], [KanBan_ID], [Prior], [Status], [StageDueDate]) VALUES (36, N'3808685', N'', CAST(N'2017-03-10' AS Date), 3, 2, 1, 107, 1, 3, 1, CAST(N'2017-03-10' AS Date))
INSERT [dbo].[KanBan_Story] ([ID], [Name], [Description], [DueDate], [StoryStatus], [StoryType], [TaskType], [SwimLane_ID], [KanBan_ID], [Prior], [Status], [StageDueDate]) VALUES (37, N'3794108', N'', CAST(N'2017-03-10' AS Date), 4, 10, 1, 107, 1, 3, 1, CAST(N'2017-03-10' AS Date))
INSERT [dbo].[KanBan_Story] ([ID], [Name], [Description], [DueDate], [StoryStatus], [StoryType], [TaskType], [SwimLane_ID], [KanBan_ID], [Prior], [Status], [StageDueDate]) VALUES (38, N'3812058', N'', CAST(N'2017-03-10' AS Date), 4, 10, 1, 107, 1, 3, 1, CAST(N'2017-03-10' AS Date))
INSERT [dbo].[KanBan_Story] ([ID], [Name], [Description], [DueDate], [StoryStatus], [StoryType], [TaskType], [SwimLane_ID], [KanBan_ID], [Prior], [Status], [StageDueDate]) VALUES (39, N'Project SO voucher testing', N'', CAST(N'2017-03-07' AS Date), 3, 1, 1, 106, 1, 1, 1, CAST(N'2017-03-07' AS Date))
INSERT [dbo].[KanBan_Story] ([ID], [Name], [Description], [DueDate], [StoryStatus], [StoryType], [TaskType], [SwimLane_ID], [KanBan_ID], [Prior], [Status], [StageDueDate]) VALUES (40, N'Project Expense voucher testing', N'', CAST(N'2017-03-07' AS Date), 2, 1, 1, 106, 1, 0, 1, CAST(N'2017-03-07' AS Date))
INSERT [dbo].[KanBan_Story] ([ID], [Name], [Description], [DueDate], [StoryStatus], [StoryType], [TaskType], [SwimLane_ID], [KanBan_ID], [Prior], [Status], [StageDueDate]) VALUES (41, N'PDF exporting', N'Fineline Shanghai', CAST(N'2017-03-08' AS Date), 1, 99, 1, 106, 1, 4, 1, CAST(N'2017-03-08' AS Date))
INSERT [dbo].[KanBan_Story] ([ID], [Name], [Description], [DueDate], [StoryStatus], [StoryType], [TaskType], [SwimLane_ID], [KanBan_ID], [Prior], [Status], [StageDueDate]) VALUES (42, N'3817013 Workflow REQ', N'', CAST(N'2017-03-10' AS Date), 1, 99, 1, 106, 1, 2, 1, CAST(N'2017-03-10' AS Date))
INSERT [dbo].[KanBan_Story] ([ID], [Name], [Description], [DueDate], [StoryStatus], [StoryType], [TaskType], [SwimLane_ID], [KanBan_ID], [Prior], [Status], [StageDueDate]) VALUES (43, N'3809208 RFQ line number', N'', CAST(N'2017-03-07' AS Date), 4, 10, 1, 106, 1, 2, 1, CAST(N'2017-03-07' AS Date))
INSERT [dbo].[KanBan_Story] ([ID], [Name], [Description], [DueDate], [StoryStatus], [StoryType], [TaskType], [SwimLane_ID], [KanBan_ID], [Prior], [Status], [StageDueDate]) VALUES (46, N'STO Automation in 2009', N'', CAST(N'2017-03-17' AS Date), 4, 1, 1, 112, 1, 2, 1, CAST(N'2017-03-17' AS Date))
INSERT [dbo].[KanBan_Story] ([ID], [Name], [Description], [DueDate], [StoryStatus], [StoryType], [TaskType], [SwimLane_ID], [KanBan_ID], [Prior], [Status], [StageDueDate]) VALUES (47, N'Transaction DP UT checkin', N'', CAST(N'1900-01-01' AS Date), 2, 1, 1, 112, 1, 3, 1, CAST(N'1900-01-01' AS Date))
INSERT [dbo].[KanBan_Story] ([ID], [Name], [Description], [DueDate], [StoryStatus], [StoryType], [TaskType], [SwimLane_ID], [KanBan_ID], [Prior], [Status], [StageDueDate]) VALUES (48, N'Transaction automation in R2 checkin', N'', CAST(N'1900-01-01' AS Date), 1, 99, 1, 112, 1, 3, 1, CAST(N'1900-01-01' AS Date))
INSERT [dbo].[KanBan_Story] ([ID], [Name], [Description], [DueDate], [StoryStatus], [StoryType], [TaskType], [SwimLane_ID], [KanBan_ID], [Prior], [Status], [StageDueDate]) VALUES (49, N'Misc charge test in 2009', N'', CAST(N'2017-03-06' AS Date), 4, 1, 1, 113, 1, 2, 1, CAST(N'2017-03-06' AS Date))
INSERT [dbo].[KanBan_Story] ([ID], [Name], [Description], [DueDate], [StoryStatus], [StoryType], [TaskType], [SwimLane_ID], [KanBan_ID], [Prior], [Status], [StageDueDate]) VALUES (50, N'Automation for Tax Settlement', N'', CAST(N'2017-03-24' AS Date), 2, 1, 1, 114, 1, 2, 1, CAST(N'2017-03-24' AS Date))
INSERT [dbo].[KanBan_Story] ([ID], [Name], [Description], [DueDate], [StoryStatus], [StoryType], [TaskType], [SwimLane_ID], [KanBan_ID], [Prior], [Status], [StageDueDate]) VALUES (51, N'Projects downport to 2009', N'', CAST(N'2017-03-17' AS Date), 2, 1, 1, 115, 1, 2, 1, CAST(N'2017-03-17' AS Date))
INSERT [dbo].[KanBan_Story] ([ID], [Name], [Description], [DueDate], [StoryStatus], [StoryType], [TaskType], [SwimLane_ID], [KanBan_ID], [Prior], [Status], [StageDueDate]) VALUES (52, N'Projects DB UT downport to 2009', N'', CAST(N'1900-01-01' AS Date), 1, 99, 1, 115, 1, 3, 1, CAST(N'1900-01-01' AS Date))
INSERT [dbo].[KanBan_Story] ([ID], [Name], [Description], [DueDate], [StoryStatus], [StoryType], [TaskType], [SwimLane_ID], [KanBan_ID], [Prior], [Status], [StageDueDate]) VALUES (53, N'63 Regression to 62', N'Validate&Down porting 11 regression bug in DAX63 to DAX62
Code defect:3812770/ 3809235
TAE Test Issue: 3808863/ 3809131/ 3808847/ 3809208/ 3810021
UTC Test Issue: 3808584/ 3806145/ 3811004/ 3809118', CAST(N'2017-03-08' AS Date), 2, 1, 1, 117, 1, 1, 1, CAST(N'2017-03-08' AS Date))
INSERT [dbo].[KanBan_Story] ([ID], [Name], [Description], [DueDate], [StoryStatus], [StoryType], [TaskType], [SwimLane_ID], [KanBan_ID], [Prior], [Status], [StageDueDate]) VALUES (56, N'Fix R3 rebase merge issue', N'', CAST(N'2017-03-03' AS Date), 2, 1, 1, 124, 1, 2, 1, CAST(N'2017-03-03' AS Date))
INSERT [dbo].[KanBan_Story] ([ID], [Name], [Description], [DueDate], [StoryStatus], [StoryType], [TaskType], [SwimLane_ID], [KanBan_ID], [Prior], [Status], [StageDueDate]) VALUES (58, N'WHT bug fix for AX2009- PO, SO，FTI, Journal.', N'', CAST(N'2017-03-08' AS Date), 3, 1, 1, 126, 1, 2, 1, CAST(N'2017-03-08' AS Date))
INSERT [dbo].[KanBan_Story] ([ID], [Name], [Description], [DueDate], [StoryStatus], [StoryType], [TaskType], [SwimLane_ID], [KanBan_ID], [Prior], [Status], [StageDueDate]) VALUES (59, N'WHT for AX2009- Project', N'Pending on Gray''s Projects', CAST(N'2017-03-10' AS Date), 1, 2, 1, 126, 1, 2, 1, CAST(N'2017-03-10' AS Date))
INSERT [dbo].[KanBan_Story] ([ID], [Name], [Description], [DueDate], [StoryStatus], [StoryType], [TaskType], [SwimLane_ID], [KanBan_ID], [Prior], [Status], [StageDueDate]) VALUES (60, N'WHT Automation for AX2009 ', N'', CAST(N'2017-03-10' AS Date), 2, 1, 1, 126, 1, 0, 1, CAST(N'2017-03-10' AS Date))
INSERT [dbo].[KanBan_Story] ([ID], [Name], [Description], [DueDate], [StoryStatus], [StoryType], [TaskType], [SwimLane_ID], [KanBan_ID], [Prior], [Status], [StageDueDate]) VALUES (61, N'WHT Automation for AX63 - Project', N'Pending on Tommy''s automation', CAST(N'1900-01-01' AS Date), 1, 2, 1, 126, 1, 2, 1, CAST(N'1900-01-01' AS Date))
INSERT [dbo].[KanBan_Story] ([ID], [Name], [Description], [DueDate], [StoryStatus], [StoryType], [TaskType], [SwimLane_ID], [KanBan_ID], [Prior], [Status], [StageDueDate]) VALUES (62, N'WHT Testing for R3, R2, AX2009', N'', CAST(N'2017-03-17' AS Date), 2, 1, 1, 126, 1, 3, 1, CAST(N'2017-03-17' AS Date))
INSERT [dbo].[KanBan_Story] ([ID], [Name], [Description], [DueDate], [StoryStatus], [StoryType], [TaskType], [SwimLane_ID], [KanBan_ID], [Prior], [Status], [StageDueDate]) VALUES (63, N'Rebase R2 GST code', N'', CAST(N'2017-03-06' AS Date), 2, 1, 1, 127, 1, 0, 1, CAST(N'2017-03-06' AS Date))
INSERT [dbo].[KanBan_Story] ([ID], [Name], [Description], [DueDate], [StoryStatus], [StoryType], [TaskType], [SwimLane_ID], [KanBan_ID], [Prior], [Status], [StageDueDate]) VALUES (64, N'5 Packages for AX2012 R2', N'Blocking by environment', CAST(N'1900-01-01' AS Date), 4, 3, 1, 123, 1, 1, 1, CAST(N'1900-01-01' AS Date))
INSERT [dbo].[KanBan_Story] ([ID], [Name], [Description], [DueDate], [StoryStatus], [StoryType], [TaskType], [SwimLane_ID], [KanBan_ID], [Prior], [Status], [StageDueDate]) VALUES (65, N'CFL - Environmen Issue', N'', CAST(N'1900-01-01' AS Date), 2, 3, 1, 123, 1, 3, 1, CAST(N'1900-01-01' AS Date))
INSERT [dbo].[KanBan_Story] ([ID], [Name], [Description], [DueDate], [StoryStatus], [StoryType], [TaskType], [SwimLane_ID], [KanBan_ID], [Prior], [Status], [StageDueDate]) VALUES (70, N'R3 Transaction Validation: Quality order', N'', CAST(N'2017-03-10' AS Date), 1, 99, 1, 125, 1, 2, 1, CAST(N'2017-03-10' AS Date))
INSERT [dbo].[KanBan_Story] ([ID], [Name], [Description], [DueDate], [StoryStatus], [StoryType], [TaskType], [SwimLane_ID], [KanBan_ID], [Prior], [Status], [StageDueDate]) VALUES (71, N'Machine Maintain R2 deploy on Terry-PC3', N'', CAST(N'2017-03-03' AS Date), 2, 1, 1, 125, 1, 2, 1, CAST(N'2017-03-03' AS Date))
INSERT [dbo].[KanBan_Story] ([ID], [Name], [Description], [DueDate], [StoryStatus], [StoryType], [TaskType], [SwimLane_ID], [KanBan_ID], [Prior], [Status], [StageDueDate]) VALUES (74, N'R2 Package Testing - Environment Setup', N'', CAST(N'2017-03-03' AS Date), 4, 1, 1, 123, 1, 0, 1, CAST(N'2017-03-03' AS Date))
INSERT [dbo].[KanBan_Story] ([ID], [Name], [Description], [DueDate], [StoryStatus], [StoryType], [TaskType], [SwimLane_ID], [KanBan_ID], [Prior], [Status], [StageDueDate]) VALUES (75, N'Tax solution Configuration management – R3', N'', CAST(N'1900-01-01' AS Date), 2, 3, 1, 131, 1, 2, 1, CAST(N'1900-01-01' AS Date))
INSERT [dbo].[KanBan_Story] ([ID], [Name], [Description], [DueDate], [StoryStatus], [StoryType], [TaskType], [SwimLane_ID], [KanBan_ID], [Prior], [Status], [StageDueDate]) VALUES (76, N'Tax solution Tax Configuration management – R2', N'', CAST(N'1900-01-01' AS Date), 1, 99, 1, 131, 1, 2, 1, CAST(N'1900-01-01' AS Date))
INSERT [dbo].[KanBan_Story] ([ID], [Name], [Description], [DueDate], [StoryStatus], [StoryType], [TaskType], [SwimLane_ID], [KanBan_ID], [Prior], [Status], [StageDueDate]) VALUES (77, N'Tax solution Tax Configuration management – AX2009', N'', CAST(N'1900-01-01' AS Date), 1, 99, 1, 131, 1, 2, 1, CAST(N'1900-01-01' AS Date))
INSERT [dbo].[KanBan_Story] ([ID], [Name], [Description], [DueDate], [StoryStatus], [StoryType], [TaskType], [SwimLane_ID], [KanBan_ID], [Prior], [Status], [StageDueDate]) VALUES (78, N'3813490', N'', CAST(N'1900-01-01' AS Date), 4, 10, 1, 107, 1, 0, 1, CAST(N'1900-01-01' AS Date))
INSERT [dbo].[KanBan_Story] ([ID], [Name], [Description], [DueDate], [StoryStatus], [StoryType], [TaskType], [SwimLane_ID], [KanBan_ID], [Prior], [Status], [StageDueDate]) VALUES (79, N'3816458', N'', CAST(N'2017-03-10' AS Date), 2, 1, 1, 107, 1, 0, 1, CAST(N'2017-03-10' AS Date))
INSERT [dbo].[KanBan_Story] ([ID], [Name], [Description], [DueDate], [StoryStatus], [StoryType], [TaskType], [SwimLane_ID], [KanBan_ID], [Prior], [Status], [StageDueDate]) VALUES (80, N'3811815', N'', CAST(N'2017-03-10' AS Date), 1, 99, 1, 108, 1, 0, 1, CAST(N'2017-03-10' AS Date))
INSERT [dbo].[KanBan_Story] ([ID], [Name], [Description], [DueDate], [StoryStatus], [StoryType], [TaskType], [SwimLane_ID], [KanBan_ID], [Prior], [Status], [StageDueDate]) VALUES (81, N'3816105', N'Not repro', CAST(N'1900-01-01' AS Date), 3, 2, 1, 108, 1, 0, 1, CAST(N'1900-01-01' AS Date))
INSERT [dbo].[KanBan_Story] ([ID], [Name], [Description], [DueDate], [StoryStatus], [StoryType], [TaskType], [SwimLane_ID], [KanBan_ID], [Prior], [Status], [StageDueDate]) VALUES (26, N'3805726', N'', CAST(N'2017-03-10' AS Date), 2, 1, 1, 109, 1, 2, 1, CAST(N'2017-03-10' AS Date))
INSERT [dbo].[KanBan_Story] ([ID], [Name], [Description], [DueDate], [StoryStatus], [StoryType], [TaskType], [SwimLane_ID], [KanBan_ID], [Prior], [Status], [StageDueDate]) VALUES (27, N'Inventory Turnover', N'Hog slat redesign', CAST(N'2017-03-03' AS Date), 4, 10, 1, 109, 1, 0, 1, CAST(N'2017-03-03' AS Date))
INSERT [dbo].[KanBan_Story] ([ID], [Name], [Description], [DueDate], [StoryStatus], [StoryType], [TaskType], [SwimLane_ID], [KanBan_ID], [Prior], [Status], [StageDueDate]) VALUES (28, N'PO tracking report', N'Hog slat report bug fix', CAST(N'2017-03-03' AS Date), 4, 10, 1, 109, 1, 0, 1, CAST(N'2017-03-03' AS Date))
INSERT [dbo].[KanBan_Story] ([ID], [Name], [Description], [DueDate], [StoryStatus], [StoryType], [TaskType], [SwimLane_ID], [KanBan_ID], [Prior], [Status], [StageDueDate]) VALUES (29, N'3810955', N'', CAST(N'2017-03-10' AS Date), 2, 1, 1, 108, 1, 2, 1, CAST(N'2017-03-10' AS Date))
INSERT [dbo].[KanBan_Story] ([ID], [Name], [Description], [DueDate], [StoryStatus], [StoryType], [TaskType], [SwimLane_ID], [KanBan_ID], [Prior], [Status], [StageDueDate]) VALUES (44, N'Tax Settlement downport to 2009', N'', CAST(N'2017-03-24' AS Date), 4, 1, 1, 110, 1, 2, 1, CAST(N'2017-03-24' AS Date))
INSERT [dbo].[KanBan_Story] ([ID], [Name], [Description], [DueDate], [StoryStatus], [StoryType], [TaskType], [SwimLane_ID], [KanBan_ID], [Prior], [Status], [StageDueDate]) VALUES (45, N'Tax document display issue fix', N'', CAST(N'2017-03-17' AS Date), 2, 1, 1, 111, 1, 2, 1, CAST(N'2017-03-17' AS Date))
INSERT [dbo].[KanBan_Story] ([ID], [Name], [Description], [DueDate], [StoryStatus], [StoryType], [TaskType], [SwimLane_ID], [KanBan_ID], [Prior], [Status], [StageDueDate]) VALUES (54, N'Bug 3816980 GST R3: Bug fix - Unmarked transaction can''t be found when settle advanced sales tax payment', N'This bug is for fixing regression of bug 3806621.
Need to rerun 13 test cases', CAST(N'2017-03-06' AS Date), 4, 1, 1, 117, 1, 1, 1, CAST(N'2017-03-06' AS Date))
INSERT [dbo].[KanBan_Story] ([ID], [Name], [Description], [DueDate], [StoryStatus], [StoryType], [TaskType], [SwimLane_ID], [KanBan_ID], [Prior], [Status], [StageDueDate]) VALUES (55, N'Cassie Setup validation in R3 latest build', N'', CAST(N'1900-01-01' AS Date), 1, 99, 1, 117, 1, 2, 1, CAST(N'1900-01-01' AS Date))
INSERT [dbo].[KanBan_Story] ([ID], [Name], [Description], [DueDate], [StoryStatus], [StoryType], [TaskType], [SwimLane_ID], [KanBan_ID], [Prior], [Status], [StageDueDate]) VALUES (57, N'AX2009 Rebase', N'', CAST(N'2017-03-10' AS Date), 1, 99, 1, 124, 1, 2, 1, CAST(N'2017-03-10' AS Date))
INSERT [dbo].[KanBan_Story] ([ID], [Name], [Description], [DueDate], [StoryStatus], [StoryType], [TaskType], [SwimLane_ID], [KanBan_ID], [Prior], [Status], [StageDueDate]) VALUES (66, N'R3 Transaction Validation: REQ multiple line + default logic ', N'', CAST(N'2017-03-03' AS Date), 4, 1, 1, 125, 1, 2, 1, CAST(N'2017-03-03' AS Date))
INSERT [dbo].[KanBan_Story] ([ID], [Name], [Description], [DueDate], [StoryStatus], [StoryType], [TaskType], [SwimLane_ID], [KanBan_ID], [Prior], [Status], [StageDueDate]) VALUES (67, N'R3 Transaction Validation: RFQ', N'', CAST(N'2017-03-10' AS Date), 1, 99, 1, 125, 1, 2, 1, CAST(N'2017-03-10' AS Date))
INSERT [dbo].[KanBan_Story] ([ID], [Name], [Description], [DueDate], [StoryStatus], [StoryType], [TaskType], [SwimLane_ID], [KanBan_ID], [Prior], [Status], [StageDueDate]) VALUES (68, N'R3 Transaction Validation: Sales quotation', N'', CAST(N'2017-03-10' AS Date), 1, 99, 1, 125, 1, 2, 1, CAST(N'2017-03-10' AS Date))
INSERT [dbo].[KanBan_Story] ([ID], [Name], [Description], [DueDate], [StoryStatus], [StoryType], [TaskType], [SwimLane_ID], [KanBan_ID], [Prior], [Status], [StageDueDate]) VALUES (69, N'R3 Transaction Validation: Misc chargs', N'', CAST(N'2017-03-10' AS Date), 1, 99, 1, 125, 1, 2, 1, CAST(N'2017-03-10' AS Date))
INSERT [dbo].[KanBan_Story] ([ID], [Name], [Description], [DueDate], [StoryStatus], [StoryType], [TaskType], [SwimLane_ID], [KanBan_ID], [Prior], [Status], [StageDueDate]) VALUES (72, N'R2 transaction base check in', N'Tracking Id v-rywang.105', CAST(N'2017-03-06' AS Date), 3, 1, 1, 125, 1, 1, 1, CAST(N'2017-03-06' AS Date))
INSERT [dbo].[KanBan_Story] ([ID], [Name], [Description], [DueDate], [StoryStatus], [StoryType], [TaskType], [SwimLane_ID], [KanBan_ID], [Prior], [Status], [StageDueDate]) VALUES (73, N'R3 tax settlement labels check in', N'', CAST(N'2017-03-06' AS Date), 3, 1, 1, 125, 1, 1, 1, CAST(N'2017-03-06' AS Date))
SET IDENTITY_INSERT [dbo].[KanBan_Story] OFF

/****** Insert data to  [dbo].[KanBan_SwimLane] ******/
SET IDENTITY_INSERT [dbo].[KanBan_SwimLane] ON 
INSERT [dbo].[KanBan_SwimLane] ([ID], [Name], [KanBan_ID], [Status], [Type]) VALUES (106, N'Tommy Wang', 1, 1, 1)
INSERT [dbo].[KanBan_SwimLane] ([ID], [Name], [KanBan_ID], [Status], [Type]) VALUES (107, N'Luna Hou', 1, 1, 1)
INSERT [dbo].[KanBan_SwimLane] ([ID], [Name], [KanBan_ID], [Status], [Type]) VALUES (108, N'Wendy Wang', 1, 1, 1)
INSERT [dbo].[KanBan_SwimLane] ([ID], [Name], [KanBan_ID], [Status], [Type]) VALUES (109, N'Tiana Gao', 1, 1, 1)
INSERT [dbo].[KanBan_SwimLane] ([ID], [Name], [KanBan_ID], [Status], [Type]) VALUES (110, N'Neil Lv', 1, 1, 1)
INSERT [dbo].[KanBan_SwimLane] ([ID], [Name], [KanBan_ID], [Status], [Type]) VALUES (111, N'Angelo Liu', 1, 1, 1)
INSERT [dbo].[KanBan_SwimLane] ([ID], [Name], [KanBan_ID], [Status], [Type]) VALUES (112, N'Eric Jia', 1, 1, 1)
INSERT [dbo].[KanBan_SwimLane] ([ID], [Name], [KanBan_ID], [Status], [Type]) VALUES (113, N'Allen Liang', 1, 1, 1)
INSERT [dbo].[KanBan_SwimLane] ([ID], [Name], [KanBan_ID], [Status], [Type]) VALUES (114, N'Clark Wang', 1, 1, 1)
INSERT [dbo].[KanBan_SwimLane] ([ID], [Name], [KanBan_ID], [Status], [Type]) VALUES (115, N'Gray Zhang', 1, 1, 1)
INSERT [dbo].[KanBan_SwimLane] ([ID], [Name], [KanBan_ID], [Status], [Type]) VALUES (117, N'Daniel Bai', 1, 1, 1)
INSERT [dbo].[KanBan_SwimLane] ([ID], [Name], [KanBan_ID], [Status], [Type]) VALUES (123, N'Vicky Feng', 1, 1, 1)
INSERT [dbo].[KanBan_SwimLane] ([ID], [Name], [KanBan_ID], [Status], [Type]) VALUES (124, N'Steven Zhao', 1, 1, 1)
INSERT [dbo].[KanBan_SwimLane] ([ID], [Name], [KanBan_ID], [Status], [Type]) VALUES (125, N'Ryan Wang', 1, 1, 1)
INSERT [dbo].[KanBan_SwimLane] ([ID], [Name], [KanBan_ID], [Status], [Type]) VALUES (126, N'Paul Jiang', 1, 1, 1)
INSERT [dbo].[KanBan_SwimLane] ([ID], [Name], [KanBan_ID], [Status], [Type]) VALUES (127, N'Peter Xu', 1, 1, 1)
INSERT [dbo].[KanBan_SwimLane] ([ID], [Name], [KanBan_ID], [Status], [Type]) VALUES (131, N'Kevin Yang', 1, 1, 1)
INSERT [dbo].[KanBan_SwimLane] ([ID], [Name], [KanBan_ID], [Status], [Type]) VALUES (132, N'KanBan', 1, 1, 1)
SET IDENTITY_INSERT [dbo].[KanBan_SwimLane] OFF

/****** Insert data to  [dbo].[KanBan_User] ******/
SET IDENTITY_INSERT [dbo].[KanBan_User] ON 
INSERT [dbo].[KanBan_User] ([ID], [Alias], [FirstName], [LastName], [Role], [Status], [KanBan_ID]) VALUES (121, N'AllenL', N'Allen', N'Liang', 5, 1, 1)
INSERT [dbo].[KanBan_User] ([ID], [Alias], [FirstName], [LastName], [Role], [Status], [KanBan_ID]) VALUES (122, N'AngeloL', N'Angelo', N'Liu', 5, 1, 1)
INSERT [dbo].[KanBan_User] ([ID], [Alias], [FirstName], [LastName], [Role], [Status], [KanBan_ID]) VALUES (123, N'ClarkW', N'Clark', N'Wang', 5, 1, 1)
INSERT [dbo].[KanBan_User] ([ID], [Alias], [FirstName], [LastName], [Role], [Status], [KanBan_ID]) VALUES (124, N'DanielB', N'Daniel', N'Bai', 5, 1, 1)
INSERT [dbo].[KanBan_User] ([ID], [Alias], [FirstName], [LastName], [Role], [Status], [KanBan_ID]) VALUES (125, N'EricJ', N'Eric', N'Jia', 5, 1, 1)
INSERT [dbo].[KanBan_User] ([ID], [Alias], [FirstName], [LastName], [Role], [Status], [KanBan_ID]) VALUES (126, N'GrayZ', N'Gray', N'Zhang', 5, 1, 1)
INSERT [dbo].[KanBan_User] ([ID], [Alias], [FirstName], [LastName], [Role], [Status], [KanBan_ID]) VALUES (127, N'JulianZ', N'Julian', N'Zhang', 5, 1, 1)
INSERT [dbo].[KanBan_User] ([ID], [Alias], [FirstName], [LastName], [Role], [Status], [KanBan_ID]) VALUES (128, N'KevinY', N'Kevin', N'Yang', 5, 1, 1)
INSERT [dbo].[KanBan_User] ([ID], [Alias], [FirstName], [LastName], [Role], [Status], [KanBan_ID]) VALUES (129, N'LunaH', N'Luna', N'Hou', 5, 1, 1)
INSERT [dbo].[KanBan_User] ([ID], [Alias], [FirstName], [LastName], [Role], [Status], [KanBan_ID]) VALUES (130, N'NeilL', N'Neil', N'Lv', 5, 1, 1)
INSERT [dbo].[KanBan_User] ([ID], [Alias], [FirstName], [LastName], [Role], [Status], [KanBan_ID]) VALUES (131, N'PaulJ', N'Paul', N'Jiang', 5, 1, 1)
INSERT [dbo].[KanBan_User] ([ID], [Alias], [FirstName], [LastName], [Role], [Status], [KanBan_ID]) VALUES (132, N'PeterX', N'Peter', N'Xu', 5, 1, 1)
INSERT [dbo].[KanBan_User] ([ID], [Alias], [FirstName], [LastName], [Role], [Status], [KanBan_ID]) VALUES (133, N'RyanW', N'Ryan', N'Wang', 5, 1, 1)
INSERT [dbo].[KanBan_User] ([ID], [Alias], [FirstName], [LastName], [Role], [Status], [KanBan_ID]) VALUES (134, N'SamS', N'Sam', N'Shi', 5, 1, 1)
INSERT [dbo].[KanBan_User] ([ID], [Alias], [FirstName], [LastName], [Role], [Status], [KanBan_ID]) VALUES (135, N'SamuelT', N'Samuel', N'Tan', 5, 1, 1)
INSERT [dbo].[KanBan_User] ([ID], [Alias], [FirstName], [LastName], [Role], [Status], [KanBan_ID]) VALUES (136, N'StevenZ', N'Steven', N'Zhao', 5, 1, 1)
INSERT [dbo].[KanBan_User] ([ID], [Alias], [FirstName], [LastName], [Role], [Status], [KanBan_ID]) VALUES (137, N'TianaG', N'Tiana', N'Gao', 5, 1, 1)
INSERT [dbo].[KanBan_User] ([ID], [Alias], [FirstName], [LastName], [Role], [Status], [KanBan_ID]) VALUES (138, N'TommyW', N'Tommy', N'Wang', 5, 1, 1)
INSERT [dbo].[KanBan_User] ([ID], [Alias], [FirstName], [LastName], [Role], [Status], [KanBan_ID]) VALUES (139, N'VickyF', N'Vicky', N'Feng', 5, 1, 1)
INSERT [dbo].[KanBan_User] ([ID], [Alias], [FirstName], [LastName], [Role], [Status], [KanBan_ID]) VALUES (140, N'WendyW', N'Wendy', N'Wang', 5, 1, 1)
SET IDENTITY_INSERT [dbo].[KanBan_User] OFF

/****** Insert data to  [dbo].[KanBan_Story] ******/
SET IDENTITY_INSERT [dbo].[SYS_User] ON 
INSERT [dbo].[SYS_User] ([ID], [Alias], [Status], [Config_TicketColor]) VALUES (1, N'', 1, 1)
SET IDENTITY_INSERT [dbo].[SYS_User] OFF

ALTER TABLE [dbo].[KanBan] ADD  CONSTRAINT [DF_KanBan_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[KanBan_Column] ADD  CONSTRAINT [DF_KanBan_Column_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[KanBan_Column] ADD  CONSTRAINT [DF_KanBan_Column_Type]  DEFAULT ((1)) FOR [Type]
GO
ALTER TABLE [dbo].[KanBan_Cycle_Period_Status] ADD  CONSTRAINT [DF_KanBan_Cycle_Period_Status_Inventory_Num]  DEFAULT ((0)) FOR [Inventory_Num]
GO
ALTER TABLE [dbo].[KanBan_Cycle_Period_Status] ADD  CONSTRAINT [DF_KanBan_Cycle_Period_Status_Income_Num]  DEFAULT ((0)) FOR [Income_Num]
GO
ALTER TABLE [dbo].[KanBan_Cycle_Period_Status] ADD  CONSTRAINT [DF_KanBan_Cycle_Period_Status_Outcome_Num]  DEFAULT ((0)) FOR [Outcome_Num]
GO
ALTER TABLE [dbo].[KanBan_Cycle_Period_Status] ADD  CONSTRAINT [DF_KanBan_Cycle_Period_Status_Fire_Num]  DEFAULT ((0)) FOR [Fire_Num]
GO
ALTER TABLE [dbo].[KanBan_Cycle_Period_Status] ADD  CONSTRAINT [DF_KanBan_Cycle_Period_Status_Resolve_Num]  DEFAULT ((0)) FOR [Resolve_Num]
GO
ALTER TABLE [dbo].[KanBan_Story] ADD  CONSTRAINT [DF_KanBan_Story_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[KanBan_SwimLane] ADD  CONSTRAINT [DF_KanBan_SwimLane_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[KanBan_User] ADD  CONSTRAINT [DF_KanBan_User_Status]  DEFAULT ((1)) FOR [Status]
GO
