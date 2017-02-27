USE [KanBan]
GO
ALTER TABLE [dbo].[KanBan_User] DROP CONSTRAINT [DF_KanBan_User_Status]
GO
ALTER TABLE [dbo].[KanBan_SwimLane] DROP CONSTRAINT [DF_KanBan_SwimLane_Status]
GO
ALTER TABLE [dbo].[KanBan_Story_Check] DROP CONSTRAINT [DF_KanBan_Story_Check_Checked]
GO
ALTER TABLE [dbo].[KanBan_Story] DROP CONSTRAINT [DF_KanBan_Story_Status]
GO
ALTER TABLE [dbo].[KanBan_Cycle_Period_Status] DROP CONSTRAINT [DF_KanBan_Cycle_Period_Status_Resolve_Num]
GO
ALTER TABLE [dbo].[KanBan_Cycle_Period_Status] DROP CONSTRAINT [DF_KanBan_Cycle_Period_Status_Fire_Num]
GO
ALTER TABLE [dbo].[KanBan_Cycle_Period_Status] DROP CONSTRAINT [DF_KanBan_Cycle_Period_Status_Outcome_Num]
GO
ALTER TABLE [dbo].[KanBan_Cycle_Period_Status] DROP CONSTRAINT [DF_KanBan_Cycle_Period_Status_Income_Num]
GO
ALTER TABLE [dbo].[KanBan_Cycle_Period_Status] DROP CONSTRAINT [DF_KanBan_Cycle_Period_Status_Inventory_Num]
GO
ALTER TABLE [dbo].[KanBan_Column_Checklist] DROP CONSTRAINT [DF_KanBan_Column_Checklist_Status]
GO
ALTER TABLE [dbo].[KanBan_Column] DROP CONSTRAINT [DF_KanBan_Column_Type]
GO
ALTER TABLE [dbo].[KanBan_Column] DROP CONSTRAINT [DF_KanBan_Column_Status]
GO
ALTER TABLE [dbo].[KanBan] DROP CONSTRAINT [DF_KanBan_Status]
GO
/****** Object:  Table [dbo].[SYS_User]    Script Date: 2017/2/27 19:21:56 ******/
DROP TABLE [dbo].[SYS_User]
GO
/****** Object:  Table [dbo].[KanBan_User]    Script Date: 2017/2/27 19:21:56 ******/
DROP TABLE [dbo].[KanBan_User]
GO
/****** Object:  Table [dbo].[KanBan_TFS_WIQ]    Script Date: 2017/2/27 19:21:56 ******/
DROP TABLE [dbo].[KanBan_TFS_WIQ]
GO
/****** Object:  Table [dbo].[KanBan_TFS_Server]    Script Date: 2017/2/27 19:21:56 ******/
DROP TABLE [dbo].[KanBan_TFS_Server]
GO
/****** Object:  Table [dbo].[KanBan_SwimLane_StatusLog]    Script Date: 2017/2/27 19:21:56 ******/
DROP TABLE [dbo].[KanBan_SwimLane_StatusLog]
GO
/****** Object:  Table [dbo].[KanBan_SwimLane]    Script Date: 2017/2/27 19:21:56 ******/
DROP TABLE [dbo].[KanBan_SwimLane]
GO
/****** Object:  Table [dbo].[KanBan_Story_StatusLog]    Script Date: 2017/2/27 19:21:56 ******/
DROP TABLE [dbo].[KanBan_Story_StatusLog]
GO
/****** Object:  Table [dbo].[KanBan_Story_ColumnLog]    Script Date: 2017/2/27 19:21:56 ******/
DROP TABLE [dbo].[KanBan_Story_ColumnLog]
GO
/****** Object:  Table [dbo].[KanBan_Story_Check]    Script Date: 2017/2/27 19:21:56 ******/
DROP TABLE [dbo].[KanBan_Story_Check]
GO
/****** Object:  Table [dbo].[KanBan_Story_ChangeLog]    Script Date: 2017/2/27 19:21:57 ******/
DROP TABLE [dbo].[KanBan_Story_ChangeLog]
GO
/****** Object:  Table [dbo].[KanBan_Story]    Script Date: 2017/2/27 19:21:57 ******/
DROP TABLE [dbo].[KanBan_Story]
GO
/****** Object:  Table [dbo].[KanBan_Cycle_Period_Status]    Script Date: 2017/2/27 19:21:57 ******/
DROP TABLE [dbo].[KanBan_Cycle_Period_Status]
GO
/****** Object:  Table [dbo].[KanBan_Cycle_Period]    Script Date: 2017/2/27 19:21:57 ******/
DROP TABLE [dbo].[KanBan_Cycle_Period]
GO
/****** Object:  Table [dbo].[KanBan_Cycle]    Script Date: 2017/2/27 19:21:57 ******/
DROP TABLE [dbo].[KanBan_Cycle]
GO
/****** Object:  Table [dbo].[KanBan_ColumnGroup_Mapping]    Script Date: 2017/2/27 19:21:57 ******/
DROP TABLE [dbo].[KanBan_ColumnGroup_Mapping]
GO
/****** Object:  Table [dbo].[KanBan_ColumnGroup]    Script Date: 2017/2/27 19:21:57 ******/
DROP TABLE [dbo].[KanBan_ColumnGroup]
GO
/****** Object:  Table [dbo].[KanBan_Column_Checklist_Mapping]    Script Date: 2017/2/27 19:21:57 ******/
DROP TABLE [dbo].[KanBan_Column_Checklist_Mapping]
GO
/****** Object:  Table [dbo].[KanBan_Column_Checklist]    Script Date: 2017/2/27 19:21:57 ******/
DROP TABLE [dbo].[KanBan_Column_Checklist]
GO
/****** Object:  Table [dbo].[KanBan_Column_Check]    Script Date: 2017/2/27 19:21:57 ******/
DROP TABLE [dbo].[KanBan_Column_Check]
GO
/****** Object:  Table [dbo].[KanBan_Column]    Script Date: 2017/2/27 19:21:57 ******/
DROP TABLE [dbo].[KanBan_Column]
GO
/****** Object:  Table [dbo].[KanBan_Assignment]    Script Date: 2017/2/27 19:21:57 ******/
DROP TABLE [dbo].[KanBan_Assignment]
GO
/****** Object:  Table [dbo].[KanBan]    Script Date: 2017/2/27 19:21:57 ******/
DROP TABLE [dbo].[KanBan]
GO
USE [master]
GO
/****** Object:  Database [KanBan]    Script Date: 2017/2/27 19:21:57 ******/
DROP DATABASE [KanBan]
GO
/****** Object:  Database [KanBan]    Script Date: 2017/2/27 19:21:57 ******/
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
EXEC sys.sp_db_vardecimal_storage_format N'KanBan', N'ON'
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
USE [KanBan]
GO
/****** Object:  Table [dbo].[KanBan]    Script Date: 2017/2/27 19:21:57 ******/
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
/****** Object:  Table [dbo].[KanBan_Assignment]    Script Date: 2017/2/27 19:21:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KanBan_Assignment](
	[StoryID] [bigint] NOT NULL,
	[UserID] [bigint] NOT NULL,
	[AssignType] [smallint] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KanBan_Column]    Script Date: 2017/2/27 19:21:57 ******/
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
/****** Object:  Table [dbo].[KanBan_Column_Check]    Script Date: 2017/2/27 19:21:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KanBan_Column_Check](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Type] [smallint] NOT NULL,
	[Column_Checklist_ID] [bigint] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KanBan_Column_Checklist]    Script Date: 2017/2/27 19:21:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KanBan_Column_Checklist](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Column_ID] [bigint] NOT NULL,
	[Status] [smallint] NOT NULL,
	[Name] [nvarchar](255) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KanBan_Column_Checklist_Mapping]    Script Date: 2017/2/27 19:21:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KanBan_Column_Checklist_Mapping](
	[Checklist_ID] [bigint] NOT NULL,
	[CheckItem_ID] [bigint] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KanBan_ColumnGroup]    Script Date: 2017/2/27 19:21:58 ******/
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
/****** Object:  Table [dbo].[KanBan_ColumnGroup_Mapping]    Script Date: 2017/2/27 19:21:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KanBan_ColumnGroup_Mapping](
	[ColumnGroup_ID] [bigint] NOT NULL,
	[Column_ID] [bigint] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KanBan_Cycle]    Script Date: 2017/2/27 19:21:58 ******/
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
/****** Object:  Table [dbo].[KanBan_Cycle_Period]    Script Date: 2017/2/27 19:21:58 ******/
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
/****** Object:  Table [dbo].[KanBan_Cycle_Period_Status]    Script Date: 2017/2/27 19:21:58 ******/
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
/****** Object:  Table [dbo].[KanBan_Story]    Script Date: 2017/2/27 19:21:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KanBan_Story](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[TFS] [bigint] NOT NULL,
	[TFS_Server] [bigint] NOT NULL,
	[Description] [ntext] NULL,
	[DueDate] [date] NOT NULL,
	[PMWork] [decimal](6, 1) NOT NULL,
	[TestWork] [decimal](6, 1) NOT NULL,
	[DevWork] [decimal](6, 1) NOT NULL,
	[PMWorkEst] [decimal](6, 1) NOT NULL,
	[TestWorkEst] [decimal](6, 1) NOT NULL,
	[DevWorkEst] [decimal](6, 1) NOT NULL,
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
/****** Object:  Table [dbo].[KanBan_Story_ChangeLog]    Script Date: 2017/2/27 19:21:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KanBan_Story_ChangeLog](
	[Alias] [nvarchar](50) NOT NULL,
	[CurDateTime] [datetime] NOT NULL,
	[Story_ID] [bigint] NOT NULL,
	[Field] [nvarchar](50) NOT NULL,
	[Value_Prev] [nvarchar](255) NULL,
	[Value_New] [nvarchar](255) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KanBan_Story_Check]    Script Date: 2017/2/27 19:21:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KanBan_Story_Check](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Story_ID] [bigint] NOT NULL,
	[Column_Check_ID] [bigint] NOT NULL,
	[Checked] [bit] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KanBan_Story_ColumnLog]    Script Date: 2017/2/27 19:21:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KanBan_Story_ColumnLog](
	[Alias] [nvarchar](31) NOT NULL,
	[CurDatetime] [datetime] NOT NULL,
	[Story_ID] [bigint] NOT NULL,
	[Column_ID_Prev] [bigint] NOT NULL,
	[Column_ID_New] [bigint] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KanBan_Story_StatusLog]    Script Date: 2017/2/27 19:21:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KanBan_Story_StatusLog](
	[Alias] [nvarchar](31) NOT NULL,
	[CurDatetime] [datetime] NOT NULL,
	[Story_ID] [bigint] NOT NULL,
	[Status_Prev] [bigint] NOT NULL,
	[Status_New] [bigint] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KanBan_SwimLane]    Script Date: 2017/2/27 19:21:58 ******/
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
/****** Object:  Table [dbo].[KanBan_SwimLane_StatusLog]    Script Date: 2017/2/27 19:21:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KanBan_SwimLane_StatusLog](
	[Alias] [nvarchar](31) NOT NULL,
	[CurDatetime] [datetime] NOT NULL,
	[Lane_ID] [bigint] NOT NULL,
	[Status_Prev] [smallint] NOT NULL,
	[Status_New] [smallint] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KanBan_TFS_Server]    Script Date: 2017/2/27 19:21:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KanBan_TFS_Server](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Server] [nvarchar](255) NOT NULL,
	[Collection] [nvarchar](63) NOT NULL,
	[Project] [nvarchar](63) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KanBan_TFS_WIQ]    Script Date: 2017/2/27 19:21:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KanBan_TFS_WIQ](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[KanBan_ID] [bigint] NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[WIQ] [ntext] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KanBan_User]    Script Date: 2017/2/27 19:21:58 ******/
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
/****** Object:  Table [dbo].[SYS_User]    Script Date: 2017/2/27 19:21:58 ******/
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
SET IDENTITY_INSERT [dbo].[KanBan] ON 

INSERT [dbo].[KanBan] ([ID], [Name], [Status]) VALUES (1, N'Huamei DeptII KanBan', 1)
SET IDENTITY_INSERT [dbo].[KanBan] OFF
INSERT [dbo].[KanBan_Assignment] ([StoryID], [UserID], [AssignType]) VALUES (5, 1, 2)
INSERT [dbo].[KanBan_Assignment] ([StoryID], [UserID], [AssignType]) VALUES (5, 118, 1)
INSERT [dbo].[KanBan_Assignment] ([StoryID], [UserID], [AssignType]) VALUES (7, 1, 2)
INSERT [dbo].[KanBan_Assignment] ([StoryID], [UserID], [AssignType]) VALUES (1, 1, 2)
INSERT [dbo].[KanBan_Assignment] ([StoryID], [UserID], [AssignType]) VALUES (1, 118, 1)
INSERT [dbo].[KanBan_Assignment] ([StoryID], [UserID], [AssignType]) VALUES (9, 1, 2)
INSERT [dbo].[KanBan_Assignment] ([StoryID], [UserID], [AssignType]) VALUES (9, 118, 1)
INSERT [dbo].[KanBan_Assignment] ([StoryID], [UserID], [AssignType]) VALUES (2, 1, 2)
INSERT [dbo].[KanBan_Assignment] ([StoryID], [UserID], [AssignType]) VALUES (2, 118, 1)
SET IDENTITY_INSERT [dbo].[KanBan_Column] ON 

INSERT [dbo].[KanBan_Column] ([ID], [Seq], [Name], [KanBan_ID], [Status], [Type], [RoleType], [TraceType], [Link]) VALUES (1, 1, N'Init. Req', 1, 99, 1, 1, 0, N'')
INSERT [dbo].[KanBan_Column] ([ID], [Seq], [Name], [KanBan_ID], [Status], [Type], [RoleType], [TraceType], [Link]) VALUES (2, 2, N'Triage', 1, 99, 1, 1, 0, N'')
INSERT [dbo].[KanBan_Column] ([ID], [Seq], [Name], [KanBan_ID], [Status], [Type], [RoleType], [TraceType], [Link]) VALUES (3, 3, N'Ramp Up', 1, 99, 1, 1, 0, N'')
INSERT [dbo].[KanBan_Column] ([ID], [Seq], [Name], [KanBan_ID], [Status], [Type], [RoleType], [TraceType], [Link]) VALUES (4, 4, N'SFE', 1, 1, 1, 1, 0, N'')
INSERT [dbo].[KanBan_Column] ([ID], [Seq], [Name], [KanBan_ID], [Status], [Type], [RoleType], [TraceType], [Link]) VALUES (5, 5, N'DESIGN', 1, 1, 1, 1, 0, N'')
INSERT [dbo].[KanBan_Column] ([ID], [Seq], [Name], [KanBan_ID], [Status], [Type], [RoleType], [TraceType], [Link]) VALUES (6, 6, N'Global Review', 1, 99, 1, 1, 0, N'')
INSERT [dbo].[KanBan_Column] ([ID], [Seq], [Name], [KanBan_ID], [Status], [Type], [RoleType], [TraceType], [Link]) VALUES (7, 7, N'Break Down', 1, 99, 1, 1, 0, N'')
INSERT [dbo].[KanBan_Column] ([ID], [Seq], [Name], [KanBan_ID], [Status], [Type], [RoleType], [TraceType], [Link]) VALUES (8, 8, N'Implementation', 1, 1, 1, 3, 0, N'')
INSERT [dbo].[KanBan_Column] ([ID], [Seq], [Name], [KanBan_ID], [Status], [Type], [RoleType], [TraceType], [Link]) VALUES (9, 9, N'Validation', 1, 99, 1, 1, 0, N'')
INSERT [dbo].[KanBan_Column] ([ID], [Seq], [Name], [KanBan_ID], [Status], [Type], [RoleType], [TraceType], [Link]) VALUES (10, 10, N'Check In', 1, 1, 1, 3, 2, N'')
INSERT [dbo].[KanBan_Column] ([ID], [Seq], [Name], [KanBan_ID], [Status], [Type], [RoleType], [TraceType], [Link]) VALUES (11, 11, N'Package Test', 1, 1, 1, 3, 0, N'')
INSERT [dbo].[KanBan_Column] ([ID], [Seq], [Name], [KanBan_ID], [Status], [Type], [RoleType], [TraceType], [Link]) VALUES (12, 12, N'PM Test', 1, 99, 1, 1, 0, N'')
INSERT [dbo].[KanBan_Column] ([ID], [Seq], [Name], [KanBan_ID], [Status], [Type], [RoleType], [TraceType], [Link]) VALUES (13, 13, N'Demo', 1, 99, 1, 1, 0, N'')
INSERT [dbo].[KanBan_Column] ([ID], [Seq], [Name], [KanBan_ID], [Status], [Type], [RoleType], [TraceType], [Link]) VALUES (14, 14, N'Release Readiness', 1, 1, 10, 1, 0, N'')
INSERT [dbo].[KanBan_Column] ([ID], [Seq], [Name], [KanBan_ID], [Status], [Type], [RoleType], [TraceType], [Link]) VALUES (61, 7, N'Def. Test Scenario', 1, 99, 1, 1, 1, N'')
INSERT [dbo].[KanBan_Column] ([ID], [Seq], [Name], [KanBan_ID], [Status], [Type], [RoleType], [TraceType], [Link]) VALUES (62, 9, N'Manual E2E Test', 1, 1, 1, 1, 0, N'')
SET IDENTITY_INSERT [dbo].[KanBan_Column] OFF
SET IDENTITY_INSERT [dbo].[KanBan_Column_Check] ON 

INSERT [dbo].[KanBan_Column_Check] ([ID], [Name], [Type], [Column_Checklist_ID]) VALUES (1, N'Requirement validation with partner/customer', 1, 1)
INSERT [dbo].[KanBan_Column_Check] ([ID], [Name], [Type], [Column_Checklist_ID]) VALUES (2, N'Feature team SFE design and solution validation', 1, 1)
INSERT [dbo].[KanBan_Column_Check] ([ID], [Name], [Type], [Column_Checklist_ID]) VALUES (3, N'Solution validation with partner/customer', 1, 1)
INSERT [dbo].[KanBan_Column_Check] ([ID], [Name], [Type], [Column_Checklist_ID]) VALUES (4, N'Global review and validation', 1, 1)
INSERT [dbo].[KanBan_Column_Check] ([ID], [Name], [Type], [Column_Checklist_ID]) VALUES (5, N'SFE exit review meeting', 1, 1)
INSERT [dbo].[KanBan_Column_Check] ([ID], [Name], [Type], [Column_Checklist_ID]) VALUES (6, N'Function Spec in OneNote Spec', 2, 1)
INSERT [dbo].[KanBan_Column_Check] ([ID], [Name], [Type], [Column_Checklist_ID]) VALUES (7, N'Test Scenarios in OneNote Spec', 2, 1)
INSERT [dbo].[KanBan_Column_Check] ([ID], [Name], [Type], [Column_Checklist_ID]) VALUES (8, N'Team review', 1, 2)
INSERT [dbo].[KanBan_Column_Check] ([ID], [Name], [Type], [Column_Checklist_ID]) VALUES (9, N'Physical data model', 2, 2)
INSERT [dbo].[KanBan_Column_Check] ([ID], [Name], [Type], [Column_Checklist_ID]) VALUES (10, N'Object model', 2, 2)
INSERT [dbo].[KanBan_Column_Check] ([ID], [Name], [Type], [Column_Checklist_ID]) VALUES (11, N'Upgrade design', 2, 2)
INSERT [dbo].[KanBan_Column_Check] ([ID], [Name], [Type], [Column_Checklist_ID]) VALUES (12, N'Performance consideration', 2, 2)
INSERT [dbo].[KanBan_Column_Check] ([ID], [Name], [Type], [Column_Checklist_ID]) VALUES (13, N'Security/ThreadModel', 2, 2)
INSERT [dbo].[KanBan_Column_Check] ([ID], [Name], [Type], [Column_Checklist_ID]) VALUES (14, N'Implementation breakdown', 2, 2)
INSERT [dbo].[KanBan_Column_Check] ([ID], [Name], [Type], [Column_Checklist_ID]) VALUES (15, N'Label CP review', 1, 3)
INSERT [dbo].[KanBan_Column_Check] ([ID], [Name], [Type], [Column_Checklist_ID]) VALUES (16, N'Code review', 1, 3)
INSERT [dbo].[KanBan_Column_Check] ([ID], [Name], [Type], [Column_Checklist_ID]) VALUES (17, N'Label translation follow up', 1, 3)
INSERT [dbo].[KanBan_Column_Check] ([ID], [Name], [Type], [Column_Checklist_ID]) VALUES (18, N'Code', 2, 3)
INSERT [dbo].[KanBan_Column_Check] ([ID], [Name], [Type], [Column_Checklist_ID]) VALUES (19, N'UT', 2, 3)
INSERT [dbo].[KanBan_Column_Check] ([ID], [Name], [Type], [Column_Checklist_ID]) VALUES (20, N'Test automation', 2, 3)
INSERT [dbo].[KanBan_Column_Check] ([ID], [Name], [Type], [Column_Checklist_ID]) VALUES (21, N'Label check in', 2, 3)
INSERT [dbo].[KanBan_Column_Check] ([ID], [Name], [Type], [Column_Checklist_ID]) VALUES (22, N'Performance testing/Trace parser analysis', 2, 3)
INSERT [dbo].[KanBan_Column_Check] ([ID], [Name], [Type], [Column_Checklist_ID]) VALUES (23, N'Upgrade testing', 2, 3)
INSERT [dbo].[KanBan_Column_Check] ([ID], [Name], [Type], [Column_Checklist_ID]) VALUES (24, N'Team demo', 1, 4)
INSERT [dbo].[KanBan_Column_Check] ([ID], [Name], [Type], [Column_Checklist_ID]) VALUES (25, N'PM test and sign off the E2E scenarios', 2, 4)
INSERT [dbo].[KanBan_Column_Check] ([ID], [Name], [Type], [Column_Checklist_ID]) VALUES (26, N'E2E feature Demo Record', 2, 4)
INSERT [dbo].[KanBan_Column_Check] ([ID], [Name], [Type], [Column_Checklist_ID]) VALUES (27, N'Feature sizing re-validation', 2, 5)
INSERT [dbo].[KanBan_Column_Check] ([ID], [Name], [Type], [Column_Checklist_ID]) VALUES (1, N'Requirement validation with partner/customer', 1, 1)
INSERT [dbo].[KanBan_Column_Check] ([ID], [Name], [Type], [Column_Checklist_ID]) VALUES (2, N'Feature team SFE design and solution validation', 1, 1)
INSERT [dbo].[KanBan_Column_Check] ([ID], [Name], [Type], [Column_Checklist_ID]) VALUES (3, N'Solution validation with partner/customer', 1, 1)
INSERT [dbo].[KanBan_Column_Check] ([ID], [Name], [Type], [Column_Checklist_ID]) VALUES (4, N'Global review and validation', 1, 1)
INSERT [dbo].[KanBan_Column_Check] ([ID], [Name], [Type], [Column_Checklist_ID]) VALUES (5, N'SFE exit review meeting', 1, 1)
INSERT [dbo].[KanBan_Column_Check] ([ID], [Name], [Type], [Column_Checklist_ID]) VALUES (6, N'Function Spec in OneNote Spec', 2, 1)
INSERT [dbo].[KanBan_Column_Check] ([ID], [Name], [Type], [Column_Checklist_ID]) VALUES (7, N'Test Scenarios in OneNote Spec', 2, 1)
INSERT [dbo].[KanBan_Column_Check] ([ID], [Name], [Type], [Column_Checklist_ID]) VALUES (8, N'Team review', 1, 2)
INSERT [dbo].[KanBan_Column_Check] ([ID], [Name], [Type], [Column_Checklist_ID]) VALUES (9, N'Physical data model', 2, 2)
INSERT [dbo].[KanBan_Column_Check] ([ID], [Name], [Type], [Column_Checklist_ID]) VALUES (10, N'Object model', 2, 2)
INSERT [dbo].[KanBan_Column_Check] ([ID], [Name], [Type], [Column_Checklist_ID]) VALUES (11, N'Upgrade design', 2, 2)
INSERT [dbo].[KanBan_Column_Check] ([ID], [Name], [Type], [Column_Checklist_ID]) VALUES (12, N'Performance consideration', 2, 2)
INSERT [dbo].[KanBan_Column_Check] ([ID], [Name], [Type], [Column_Checklist_ID]) VALUES (13, N'Security/ThreadModel', 2, 2)
INSERT [dbo].[KanBan_Column_Check] ([ID], [Name], [Type], [Column_Checklist_ID]) VALUES (14, N'Implementation breakdown', 2, 2)
INSERT [dbo].[KanBan_Column_Check] ([ID], [Name], [Type], [Column_Checklist_ID]) VALUES (15, N'Label CP review', 1, 3)
INSERT [dbo].[KanBan_Column_Check] ([ID], [Name], [Type], [Column_Checklist_ID]) VALUES (16, N'Code review', 1, 3)
INSERT [dbo].[KanBan_Column_Check] ([ID], [Name], [Type], [Column_Checklist_ID]) VALUES (17, N'Label translation follow up', 1, 3)
INSERT [dbo].[KanBan_Column_Check] ([ID], [Name], [Type], [Column_Checklist_ID]) VALUES (18, N'Code', 2, 3)
INSERT [dbo].[KanBan_Column_Check] ([ID], [Name], [Type], [Column_Checklist_ID]) VALUES (19, N'UT', 2, 3)
INSERT [dbo].[KanBan_Column_Check] ([ID], [Name], [Type], [Column_Checklist_ID]) VALUES (20, N'Test automation', 2, 3)
INSERT [dbo].[KanBan_Column_Check] ([ID], [Name], [Type], [Column_Checklist_ID]) VALUES (21, N'Label check in', 2, 3)
INSERT [dbo].[KanBan_Column_Check] ([ID], [Name], [Type], [Column_Checklist_ID]) VALUES (22, N'Performance testing/Trace parser analysis', 2, 3)
INSERT [dbo].[KanBan_Column_Check] ([ID], [Name], [Type], [Column_Checklist_ID]) VALUES (23, N'Upgrade testing', 2, 3)
INSERT [dbo].[KanBan_Column_Check] ([ID], [Name], [Type], [Column_Checklist_ID]) VALUES (24, N'Team demo', 1, 4)
INSERT [dbo].[KanBan_Column_Check] ([ID], [Name], [Type], [Column_Checklist_ID]) VALUES (25, N'PM test and sign off the E2E scenarios', 2, 4)
INSERT [dbo].[KanBan_Column_Check] ([ID], [Name], [Type], [Column_Checklist_ID]) VALUES (26, N'E2E feature Demo Record', 2, 4)
INSERT [dbo].[KanBan_Column_Check] ([ID], [Name], [Type], [Column_Checklist_ID]) VALUES (27, N'Feature sizing re-validation', 2, 5)
SET IDENTITY_INSERT [dbo].[KanBan_Column_Check] OFF
SET IDENTITY_INSERT [dbo].[KanBan_Column_Checklist] ON 

INSERT [dbo].[KanBan_Column_Checklist] ([ID], [Column_ID], [Status], [Name]) VALUES (1, 4, 0, NULL)
INSERT [dbo].[KanBan_Column_Checklist] ([ID], [Column_ID], [Status], [Name]) VALUES (2, 5, 0, NULL)
INSERT [dbo].[KanBan_Column_Checklist] ([ID], [Column_ID], [Status], [Name]) VALUES (3, 8, 0, NULL)
INSERT [dbo].[KanBan_Column_Checklist] ([ID], [Column_ID], [Status], [Name]) VALUES (4, 9, 0, NULL)
INSERT [dbo].[KanBan_Column_Checklist] ([ID], [Column_ID], [Status], [Name]) VALUES (5, 10, 0, NULL)
SET IDENTITY_INSERT [dbo].[KanBan_Column_Checklist] OFF
INSERT [dbo].[KanBan_Column_Checklist_Mapping] ([Checklist_ID], [CheckItem_ID]) VALUES (1, 1)
INSERT [dbo].[KanBan_Column_Checklist_Mapping] ([Checklist_ID], [CheckItem_ID]) VALUES (1, 2)
INSERT [dbo].[KanBan_Column_Checklist_Mapping] ([Checklist_ID], [CheckItem_ID]) VALUES (1, 3)
INSERT [dbo].[KanBan_Column_Checklist_Mapping] ([Checklist_ID], [CheckItem_ID]) VALUES (1, 4)
INSERT [dbo].[KanBan_Column_Checklist_Mapping] ([Checklist_ID], [CheckItem_ID]) VALUES (1, 5)
INSERT [dbo].[KanBan_Column_Checklist_Mapping] ([Checklist_ID], [CheckItem_ID]) VALUES (1, 6)
INSERT [dbo].[KanBan_Column_Checklist_Mapping] ([Checklist_ID], [CheckItem_ID]) VALUES (1, 7)
INSERT [dbo].[KanBan_Column_Checklist_Mapping] ([Checklist_ID], [CheckItem_ID]) VALUES (2, 8)
INSERT [dbo].[KanBan_Column_Checklist_Mapping] ([Checklist_ID], [CheckItem_ID]) VALUES (2, 9)
INSERT [dbo].[KanBan_Column_Checklist_Mapping] ([Checklist_ID], [CheckItem_ID]) VALUES (2, 10)
INSERT [dbo].[KanBan_Column_Checklist_Mapping] ([Checklist_ID], [CheckItem_ID]) VALUES (2, 11)
INSERT [dbo].[KanBan_Column_Checklist_Mapping] ([Checklist_ID], [CheckItem_ID]) VALUES (2, 12)
INSERT [dbo].[KanBan_Column_Checklist_Mapping] ([Checklist_ID], [CheckItem_ID]) VALUES (2, 13)
INSERT [dbo].[KanBan_Column_Checklist_Mapping] ([Checklist_ID], [CheckItem_ID]) VALUES (2, 14)
INSERT [dbo].[KanBan_Column_Checklist_Mapping] ([Checklist_ID], [CheckItem_ID]) VALUES (3, 15)
INSERT [dbo].[KanBan_Column_Checklist_Mapping] ([Checklist_ID], [CheckItem_ID]) VALUES (3, 16)
INSERT [dbo].[KanBan_Column_Checklist_Mapping] ([Checklist_ID], [CheckItem_ID]) VALUES (3, 17)
INSERT [dbo].[KanBan_Column_Checklist_Mapping] ([Checklist_ID], [CheckItem_ID]) VALUES (3, 18)
INSERT [dbo].[KanBan_Column_Checklist_Mapping] ([Checklist_ID], [CheckItem_ID]) VALUES (3, 19)
INSERT [dbo].[KanBan_Column_Checklist_Mapping] ([Checklist_ID], [CheckItem_ID]) VALUES (3, 20)
INSERT [dbo].[KanBan_Column_Checklist_Mapping] ([Checklist_ID], [CheckItem_ID]) VALUES (3, 21)
INSERT [dbo].[KanBan_Column_Checklist_Mapping] ([Checklist_ID], [CheckItem_ID]) VALUES (3, 22)
INSERT [dbo].[KanBan_Column_Checklist_Mapping] ([Checklist_ID], [CheckItem_ID]) VALUES (3, 23)
INSERT [dbo].[KanBan_Column_Checklist_Mapping] ([Checklist_ID], [CheckItem_ID]) VALUES (4, 24)
INSERT [dbo].[KanBan_Column_Checklist_Mapping] ([Checklist_ID], [CheckItem_ID]) VALUES (4, 25)
INSERT [dbo].[KanBan_Column_Checklist_Mapping] ([Checklist_ID], [CheckItem_ID]) VALUES (4, 26)
INSERT [dbo].[KanBan_Column_Checklist_Mapping] ([Checklist_ID], [CheckItem_ID]) VALUES (5, 27)
INSERT [dbo].[KanBan_Column_Checklist_Mapping] ([Checklist_ID], [CheckItem_ID]) VALUES (1, 1)
INSERT [dbo].[KanBan_Column_Checklist_Mapping] ([Checklist_ID], [CheckItem_ID]) VALUES (1, 2)
INSERT [dbo].[KanBan_Column_Checklist_Mapping] ([Checklist_ID], [CheckItem_ID]) VALUES (1, 3)
INSERT [dbo].[KanBan_Column_Checklist_Mapping] ([Checklist_ID], [CheckItem_ID]) VALUES (1, 4)
INSERT [dbo].[KanBan_Column_Checklist_Mapping] ([Checklist_ID], [CheckItem_ID]) VALUES (1, 5)
INSERT [dbo].[KanBan_Column_Checklist_Mapping] ([Checklist_ID], [CheckItem_ID]) VALUES (1, 6)
INSERT [dbo].[KanBan_Column_Checklist_Mapping] ([Checklist_ID], [CheckItem_ID]) VALUES (1, 7)
INSERT [dbo].[KanBan_Column_Checklist_Mapping] ([Checklist_ID], [CheckItem_ID]) VALUES (2, 8)
INSERT [dbo].[KanBan_Column_Checklist_Mapping] ([Checklist_ID], [CheckItem_ID]) VALUES (2, 9)
INSERT [dbo].[KanBan_Column_Checklist_Mapping] ([Checklist_ID], [CheckItem_ID]) VALUES (2, 10)
INSERT [dbo].[KanBan_Column_Checklist_Mapping] ([Checklist_ID], [CheckItem_ID]) VALUES (2, 11)
INSERT [dbo].[KanBan_Column_Checklist_Mapping] ([Checklist_ID], [CheckItem_ID]) VALUES (2, 12)
INSERT [dbo].[KanBan_Column_Checklist_Mapping] ([Checklist_ID], [CheckItem_ID]) VALUES (2, 13)
INSERT [dbo].[KanBan_Column_Checklist_Mapping] ([Checklist_ID], [CheckItem_ID]) VALUES (2, 14)
INSERT [dbo].[KanBan_Column_Checklist_Mapping] ([Checklist_ID], [CheckItem_ID]) VALUES (3, 15)
INSERT [dbo].[KanBan_Column_Checklist_Mapping] ([Checklist_ID], [CheckItem_ID]) VALUES (3, 16)
INSERT [dbo].[KanBan_Column_Checklist_Mapping] ([Checklist_ID], [CheckItem_ID]) VALUES (3, 17)
INSERT [dbo].[KanBan_Column_Checklist_Mapping] ([Checklist_ID], [CheckItem_ID]) VALUES (3, 18)
INSERT [dbo].[KanBan_Column_Checklist_Mapping] ([Checklist_ID], [CheckItem_ID]) VALUES (3, 19)
INSERT [dbo].[KanBan_Column_Checklist_Mapping] ([Checklist_ID], [CheckItem_ID]) VALUES (3, 20)
INSERT [dbo].[KanBan_Column_Checklist_Mapping] ([Checklist_ID], [CheckItem_ID]) VALUES (3, 21)
INSERT [dbo].[KanBan_Column_Checklist_Mapping] ([Checklist_ID], [CheckItem_ID]) VALUES (3, 22)
INSERT [dbo].[KanBan_Column_Checklist_Mapping] ([Checklist_ID], [CheckItem_ID]) VALUES (3, 23)
INSERT [dbo].[KanBan_Column_Checklist_Mapping] ([Checklist_ID], [CheckItem_ID]) VALUES (4, 24)
INSERT [dbo].[KanBan_Column_Checklist_Mapping] ([Checklist_ID], [CheckItem_ID]) VALUES (4, 25)
INSERT [dbo].[KanBan_Column_Checklist_Mapping] ([Checklist_ID], [CheckItem_ID]) VALUES (4, 26)
INSERT [dbo].[KanBan_Column_Checklist_Mapping] ([Checklist_ID], [CheckItem_ID]) VALUES (5, 27)
SET IDENTITY_INSERT [dbo].[KanBan_ColumnGroup] ON 

INSERT [dbo].[KanBan_ColumnGroup] ([ID], [KanBan_ID], [Name], [Seq]) VALUES (24, 1, N'SFE', 1)
INSERT [dbo].[KanBan_ColumnGroup] ([ID], [KanBan_ID], [Name], [Seq]) VALUES (25, 1, N'DESIGN', 2)
INSERT [dbo].[KanBan_ColumnGroup] ([ID], [KanBan_ID], [Name], [Seq]) VALUES (26, 1, N'Global Review', 3)
INSERT [dbo].[KanBan_ColumnGroup] ([ID], [KanBan_ID], [Name], [Seq]) VALUES (27, 1, N'Def. Test Scenario', 4)
INSERT [dbo].[KanBan_ColumnGroup] ([ID], [KanBan_ID], [Name], [Seq]) VALUES (28, 1, N'Implementation', 5)
INSERT [dbo].[KanBan_ColumnGroup] ([ID], [KanBan_ID], [Name], [Seq]) VALUES (29, 1, N'Manual E2E Test', 6)
INSERT [dbo].[KanBan_ColumnGroup] ([ID], [KanBan_ID], [Name], [Seq]) VALUES (30, 1, N'Check In', 7)
INSERT [dbo].[KanBan_ColumnGroup] ([ID], [KanBan_ID], [Name], [Seq]) VALUES (31, 1, N'Package Test', 8)
INSERT [dbo].[KanBan_ColumnGroup] ([ID], [KanBan_ID], [Name], [Seq]) VALUES (32, 1, N'Release Readiness', 9)
SET IDENTITY_INSERT [dbo].[KanBan_ColumnGroup] OFF
INSERT [dbo].[KanBan_ColumnGroup_Mapping] ([ColumnGroup_ID], [Column_ID]) VALUES (24, 4)
INSERT [dbo].[KanBan_ColumnGroup_Mapping] ([ColumnGroup_ID], [Column_ID]) VALUES (25, 5)
INSERT [dbo].[KanBan_ColumnGroup_Mapping] ([ColumnGroup_ID], [Column_ID]) VALUES (26, 6)
INSERT [dbo].[KanBan_ColumnGroup_Mapping] ([ColumnGroup_ID], [Column_ID]) VALUES (27, 61)
INSERT [dbo].[KanBan_ColumnGroup_Mapping] ([ColumnGroup_ID], [Column_ID]) VALUES (28, 8)
INSERT [dbo].[KanBan_ColumnGroup_Mapping] ([ColumnGroup_ID], [Column_ID]) VALUES (29, 62)
INSERT [dbo].[KanBan_ColumnGroup_Mapping] ([ColumnGroup_ID], [Column_ID]) VALUES (30, 10)
INSERT [dbo].[KanBan_ColumnGroup_Mapping] ([ColumnGroup_ID], [Column_ID]) VALUES (31, 11)
INSERT [dbo].[KanBan_ColumnGroup_Mapping] ([ColumnGroup_ID], [Column_ID]) VALUES (32, 14)
SET IDENTITY_INSERT [dbo].[KanBan_Cycle] ON 

INSERT [dbo].[KanBan_Cycle] ([ID], [KanBan_ID], [Name], [IsDefault]) VALUES (1, 1, N'Default Calendar', 1)
SET IDENTITY_INSERT [dbo].[KanBan_Cycle] OFF
SET IDENTITY_INSERT [dbo].[KanBan_Cycle_Period] ON 

INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (917, 1, 1, N'C1.1', CAST(N'2011-07-11' AS Date), CAST(N'2011-07-17' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (918, 1, 1, N'C1.2', CAST(N'2011-07-18' AS Date), CAST(N'2011-07-24' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (919, 1, 1, N'C1.3', CAST(N'2011-07-25' AS Date), CAST(N'2011-07-31' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (920, 1, 1, N'C1.4', CAST(N'2011-08-01' AS Date), CAST(N'2011-08-07' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (921, 1, 1, N'C1.5', CAST(N'2011-08-08' AS Date), CAST(N'2011-08-14' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (922, 1, 1, N'C1.6', CAST(N'2011-08-15' AS Date), CAST(N'2011-08-21' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (923, 1, 1, N'C1.7', CAST(N'2011-08-22' AS Date), CAST(N'2011-08-28' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (924, 1, 1, N'C1.8', CAST(N'2011-08-29' AS Date), CAST(N'2011-09-04' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (925, 1, 1, N'C1.9', CAST(N'2011-09-05' AS Date), CAST(N'2011-09-11' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (926, 1, 1, N'C1.10', CAST(N'2011-09-12' AS Date), CAST(N'2011-09-18' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (927, 1, 1, N'C1.11', CAST(N'2011-09-19' AS Date), CAST(N'2011-09-25' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (928, 1, 1, N'C1.12', CAST(N'2011-09-26' AS Date), CAST(N'2011-10-02' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (929, 1, 1, N'C1.13', CAST(N'2011-10-03' AS Date), CAST(N'2011-10-09' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (930, 1, 1, N'C1.14', CAST(N'2011-10-10' AS Date), CAST(N'2011-10-16' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (931, 1, 1, N'C1.15', CAST(N'2011-10-17' AS Date), CAST(N'2011-10-23' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (932, 1, 1, N'C1.16', CAST(N'2011-10-24' AS Date), CAST(N'2011-10-30' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (933, 1, 1, N'C1.17', CAST(N'2011-10-31' AS Date), CAST(N'2011-11-06' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (934, 1, 1, N'C1.18', CAST(N'2011-11-07' AS Date), CAST(N'2011-11-13' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (935, 1, 1, N'C1.19', CAST(N'2011-11-14' AS Date), CAST(N'2011-11-20' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (936, 1, 1, N'C1.20', CAST(N'2011-11-21' AS Date), CAST(N'2011-11-27' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (937, 1, 1, N'C1.21', CAST(N'2011-11-28' AS Date), CAST(N'2011-12-04' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (938, 1, 1, N'C1.22', CAST(N'2011-12-05' AS Date), CAST(N'2011-12-11' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (939, 1, 1, N'C1.23', CAST(N'2011-12-12' AS Date), CAST(N'2011-12-18' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (940, 1, 1, N'C1.24', CAST(N'2011-12-19' AS Date), CAST(N'2011-12-25' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (941, 1, 1, N'C1.25', CAST(N'2011-12-26' AS Date), CAST(N'2012-01-01' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (942, 1, 1, N'C1.26', CAST(N'2012-01-02' AS Date), CAST(N'2012-01-08' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (943, 1, 1, N'C1.27', CAST(N'2012-01-09' AS Date), CAST(N'2012-01-15' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (944, 1, 1, N'C1.28', CAST(N'2012-01-16' AS Date), CAST(N'2012-01-22' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (945, 1, 1, N'C1.29', CAST(N'2012-01-23' AS Date), CAST(N'2012-01-29' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (946, 1, 1, N'C1.30', CAST(N'2012-01-30' AS Date), CAST(N'2012-02-05' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (947, 1, 1, N'C1.31', CAST(N'2012-02-06' AS Date), CAST(N'2012-02-12' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (948, 1, 1, N'C1.32', CAST(N'2012-02-13' AS Date), CAST(N'2012-02-19' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (949, 1, 1, N'C1.33', CAST(N'2012-02-20' AS Date), CAST(N'2012-02-26' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (950, 1, 1, N'C1.34', CAST(N'2012-02-27' AS Date), CAST(N'2012-03-04' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (951, 1, 1, N'C1.35', CAST(N'2012-03-05' AS Date), CAST(N'2012-03-11' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (952, 1, 1, N'C1.36', CAST(N'2012-03-12' AS Date), CAST(N'2012-03-18' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (953, 1, 1, N'C1.37', CAST(N'2012-03-19' AS Date), CAST(N'2012-03-25' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (954, 1, 1, N'C1.38', CAST(N'2012-03-26' AS Date), CAST(N'2012-04-01' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (955, 1, 1, N'C1.39', CAST(N'2012-04-02' AS Date), CAST(N'2012-04-08' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (956, 1, 1, N'C1.40', CAST(N'2012-04-09' AS Date), CAST(N'2012-04-15' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (957, 1, 1, N'C1.41', CAST(N'2012-04-16' AS Date), CAST(N'2012-04-22' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (958, 1, 1, N'C1.42', CAST(N'2012-04-23' AS Date), CAST(N'2012-04-29' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (959, 1, 1, N'C1.43', CAST(N'2012-04-30' AS Date), CAST(N'2012-05-06' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (960, 1, 1, N'C1.44', CAST(N'2012-05-07' AS Date), CAST(N'2012-05-13' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (961, 1, 1, N'C1.45', CAST(N'2012-05-14' AS Date), CAST(N'2012-05-20' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (962, 1, 1, N'C1.46', CAST(N'2012-05-21' AS Date), CAST(N'2012-05-27' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (963, 1, 1, N'C1.47', CAST(N'2012-05-28' AS Date), CAST(N'2012-06-03' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (964, 1, 1, N'C1.48', CAST(N'2012-06-04' AS Date), CAST(N'2012-06-10' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (965, 1, 1, N'C1.49', CAST(N'2012-06-11' AS Date), CAST(N'2012-06-17' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (966, 1, 1, N'C1.50', CAST(N'2012-06-18' AS Date), CAST(N'2012-06-24' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (967, 1, 1, N'C1.51', CAST(N'2012-06-25' AS Date), CAST(N'2012-07-01' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (968, 1, 1, N'C1.52', CAST(N'2012-07-02' AS Date), CAST(N'2012-07-08' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (969, 1, 1, N'C1.53', CAST(N'2012-07-09' AS Date), CAST(N'2012-07-15' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (970, 1, 1, N'C1.54', CAST(N'2012-07-16' AS Date), CAST(N'2012-07-22' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (971, 1, 1, N'C1.55', CAST(N'2012-07-23' AS Date), CAST(N'2012-07-29' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (972, 1, 1, N'C1.56', CAST(N'2012-07-30' AS Date), CAST(N'2012-08-05' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (973, 1, 1, N'C1.57', CAST(N'2012-08-06' AS Date), CAST(N'2012-08-12' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (974, 1, 1, N'C1.58', CAST(N'2012-08-13' AS Date), CAST(N'2012-08-19' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (975, 1, 1, N'C1.59', CAST(N'2012-08-20' AS Date), CAST(N'2012-08-26' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (976, 1, 1, N'C1.60', CAST(N'2012-08-27' AS Date), CAST(N'2012-09-02' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (977, 1, 1, N'C1.61', CAST(N'2012-09-03' AS Date), CAST(N'2012-09-09' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (978, 1, 1, N'C1.62', CAST(N'2012-09-10' AS Date), CAST(N'2012-09-16' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (979, 1, 1, N'C1.63', CAST(N'2012-09-17' AS Date), CAST(N'2012-09-23' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (980, 1, 1, N'C1.64', CAST(N'2012-09-24' AS Date), CAST(N'2012-09-30' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (981, 1, 1, N'C1.65', CAST(N'2012-10-01' AS Date), CAST(N'2012-10-07' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (982, 1, 1, N'C1.66', CAST(N'2012-10-08' AS Date), CAST(N'2012-10-14' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (983, 1, 1, N'C1.67', CAST(N'2012-10-15' AS Date), CAST(N'2012-10-21' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (984, 1, 1, N'C1.68', CAST(N'2012-10-22' AS Date), CAST(N'2012-10-28' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (985, 1, 1, N'C1.69', CAST(N'2012-10-29' AS Date), CAST(N'2012-11-04' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (986, 1, 1, N'C1.70', CAST(N'2012-11-05' AS Date), CAST(N'2012-11-11' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (987, 1, 1, N'C1.71', CAST(N'2012-11-12' AS Date), CAST(N'2012-11-18' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (988, 1, 1, N'C1.72', CAST(N'2012-11-19' AS Date), CAST(N'2012-11-25' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (989, 1, 1, N'C1.73', CAST(N'2012-11-26' AS Date), CAST(N'2012-12-02' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (990, 1, 1, N'C1.74', CAST(N'2012-12-03' AS Date), CAST(N'2012-12-09' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (991, 1, 1, N'C1.75', CAST(N'2012-12-10' AS Date), CAST(N'2012-12-16' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (992, 1, 1, N'C1.76', CAST(N'2012-12-17' AS Date), CAST(N'2012-12-23' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (993, 1, 1, N'C1.77', CAST(N'2012-12-24' AS Date), CAST(N'2012-12-30' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (994, 1, 1, N'C1.78', CAST(N'2012-12-31' AS Date), CAST(N'2013-01-06' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (995, 1, 1, N'C1.79', CAST(N'2013-01-07' AS Date), CAST(N'2013-01-13' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (996, 1, 1, N'C1.80', CAST(N'2013-01-14' AS Date), CAST(N'2013-01-20' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (997, 1, 1, N'C1.81', CAST(N'2013-01-21' AS Date), CAST(N'2013-01-27' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (998, 1, 1, N'C1.82', CAST(N'2013-01-28' AS Date), CAST(N'2013-02-03' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (999, 1, 1, N'C1.83', CAST(N'2013-02-04' AS Date), CAST(N'2013-02-10' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1000, 1, 1, N'C1.84', CAST(N'2013-02-11' AS Date), CAST(N'2013-02-17' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1001, 1, 1, N'C1.85', CAST(N'2013-02-18' AS Date), CAST(N'2013-02-24' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1002, 1, 1, N'C1.86', CAST(N'2013-02-25' AS Date), CAST(N'2013-03-03' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1003, 1, 1, N'C1.87', CAST(N'2013-03-04' AS Date), CAST(N'2013-03-10' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1004, 1, 1, N'C1.88', CAST(N'2013-03-11' AS Date), CAST(N'2013-03-17' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1005, 1, 1, N'C1.89', CAST(N'2013-03-18' AS Date), CAST(N'2013-03-24' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1006, 1, 1, N'C1.90', CAST(N'2013-03-25' AS Date), CAST(N'2013-03-31' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1007, 1, 1, N'C1.91', CAST(N'2013-04-01' AS Date), CAST(N'2013-04-07' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1008, 1, 1, N'C1.92', CAST(N'2013-04-08' AS Date), CAST(N'2013-04-14' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1009, 1, 1, N'C1.93', CAST(N'2013-04-15' AS Date), CAST(N'2013-04-21' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1010, 1, 1, N'C1.94', CAST(N'2013-04-22' AS Date), CAST(N'2013-04-28' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1011, 1, 1, N'C1.95', CAST(N'2013-04-29' AS Date), CAST(N'2013-05-05' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1012, 1, 1, N'C1.96', CAST(N'2013-05-06' AS Date), CAST(N'2013-05-12' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1013, 1, 1, N'C1.97', CAST(N'2013-05-13' AS Date), CAST(N'2013-05-19' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1014, 1, 1, N'C1.98', CAST(N'2013-05-20' AS Date), CAST(N'2013-05-26' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1015, 1, 1, N'C1.99', CAST(N'2013-05-27' AS Date), CAST(N'2013-06-02' AS Date))
GO
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1016, 1, 1, N'C1.100', CAST(N'2013-06-03' AS Date), CAST(N'2013-06-09' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1017, 1, 1, N'C1.101', CAST(N'2013-06-10' AS Date), CAST(N'2013-06-16' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1018, 1, 1, N'C1.102', CAST(N'2013-06-17' AS Date), CAST(N'2013-06-23' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1019, 1, 1, N'C1.103', CAST(N'2013-06-24' AS Date), CAST(N'2013-06-30' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1020, 1, 1, N'C1.104', CAST(N'2013-07-01' AS Date), CAST(N'2013-07-07' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1021, 1, 1, N'C1.105', CAST(N'2013-07-08' AS Date), CAST(N'2013-07-14' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1022, 1, 1, N'C1.106', CAST(N'2013-07-15' AS Date), CAST(N'2013-07-21' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1023, 1, 1, N'C1.107', CAST(N'2013-07-22' AS Date), CAST(N'2013-07-28' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1024, 1, 1, N'C1.108', CAST(N'2013-07-29' AS Date), CAST(N'2013-08-04' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1025, 1, 1, N'C1.109', CAST(N'2013-08-05' AS Date), CAST(N'2013-08-11' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1026, 1, 1, N'C1.110', CAST(N'2013-08-12' AS Date), CAST(N'2013-08-18' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1027, 1, 1, N'C1.111', CAST(N'2013-08-19' AS Date), CAST(N'2013-08-25' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1028, 1, 1, N'C1.112', CAST(N'2013-08-26' AS Date), CAST(N'2013-09-01' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1029, 1, 1, N'C1.113', CAST(N'2013-09-02' AS Date), CAST(N'2013-09-08' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1030, 1, 1, N'C1.114', CAST(N'2013-09-09' AS Date), CAST(N'2013-09-15' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1031, 1, 1, N'C1.115', CAST(N'2013-09-16' AS Date), CAST(N'2013-09-22' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1032, 1, 1, N'C1.116', CAST(N'2013-09-23' AS Date), CAST(N'2013-09-29' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1033, 1, 1, N'C1.117', CAST(N'2013-09-30' AS Date), CAST(N'2013-10-06' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1034, 1, 1, N'C1.118', CAST(N'2013-10-07' AS Date), CAST(N'2013-10-13' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1035, 1, 1, N'C1.119', CAST(N'2013-10-14' AS Date), CAST(N'2013-10-20' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1036, 1, 1, N'C1.120', CAST(N'2013-10-21' AS Date), CAST(N'2013-10-27' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1037, 1, 1, N'C1.121', CAST(N'2013-10-28' AS Date), CAST(N'2013-11-03' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1038, 1, 1, N'C1.122', CAST(N'2013-11-04' AS Date), CAST(N'2013-11-10' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1039, 1, 1, N'C1.123', CAST(N'2013-11-11' AS Date), CAST(N'2013-11-17' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1040, 1, 1, N'C1.124', CAST(N'2013-11-18' AS Date), CAST(N'2013-11-24' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1041, 1, 1, N'C1.125', CAST(N'2013-11-25' AS Date), CAST(N'2013-12-01' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1042, 1, 1, N'C1.126', CAST(N'2013-12-02' AS Date), CAST(N'2013-12-08' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1043, 1, 1, N'C1.127', CAST(N'2013-12-09' AS Date), CAST(N'2013-12-15' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1044, 1, 1, N'C1.128', CAST(N'2013-12-16' AS Date), CAST(N'2013-12-22' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1045, 1, 1, N'C1.129', CAST(N'2013-12-23' AS Date), CAST(N'2013-12-29' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1046, 1, 1, N'C1.130', CAST(N'2013-12-30' AS Date), CAST(N'2014-01-05' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1047, 1, 1, N'C1.131', CAST(N'2014-01-06' AS Date), CAST(N'2014-01-12' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1048, 1, 1, N'C1.132', CAST(N'2014-01-13' AS Date), CAST(N'2014-01-19' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1049, 1, 1, N'C1.133', CAST(N'2014-01-20' AS Date), CAST(N'2014-01-26' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1050, 1, 1, N'C1.134', CAST(N'2014-01-27' AS Date), CAST(N'2014-02-02' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1051, 1, 1, N'C1.135', CAST(N'2014-02-03' AS Date), CAST(N'2014-02-09' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1052, 1, 1, N'C1.136', CAST(N'2014-02-10' AS Date), CAST(N'2014-02-16' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1053, 1, 1, N'C1.137', CAST(N'2014-02-17' AS Date), CAST(N'2014-02-23' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1054, 1, 1, N'C1.138', CAST(N'2014-02-24' AS Date), CAST(N'2014-03-02' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1055, 1, 1, N'C1.139', CAST(N'2014-03-03' AS Date), CAST(N'2014-03-09' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1056, 1, 1, N'C1.140', CAST(N'2014-03-10' AS Date), CAST(N'2014-03-16' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1057, 1, 1, N'C1.141', CAST(N'2014-03-17' AS Date), CAST(N'2014-03-23' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1058, 1, 1, N'C1.142', CAST(N'2014-03-24' AS Date), CAST(N'2014-03-30' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1059, 1, 1, N'C1.143', CAST(N'2014-03-31' AS Date), CAST(N'2014-04-06' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1060, 1, 1, N'C1.144', CAST(N'2014-04-07' AS Date), CAST(N'2014-04-13' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1061, 1, 1, N'C1.145', CAST(N'2014-04-14' AS Date), CAST(N'2014-04-20' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1062, 1, 1, N'C1.146', CAST(N'2014-04-21' AS Date), CAST(N'2014-04-27' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1063, 1, 1, N'C1.147', CAST(N'2014-04-28' AS Date), CAST(N'2014-05-04' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1064, 1, 1, N'C1.148', CAST(N'2014-05-05' AS Date), CAST(N'2014-05-11' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1065, 1, 1, N'C1.149', CAST(N'2014-05-12' AS Date), CAST(N'2014-05-18' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1066, 1, 1, N'C1.150', CAST(N'2014-05-19' AS Date), CAST(N'2014-05-25' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1067, 1, 1, N'C1.151', CAST(N'2014-05-26' AS Date), CAST(N'2014-06-01' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1068, 1, 1, N'C1.152', CAST(N'2014-06-02' AS Date), CAST(N'2014-06-08' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1069, 1, 1, N'C1.153', CAST(N'2014-06-09' AS Date), CAST(N'2014-06-15' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1070, 1, 1, N'C1.154', CAST(N'2014-06-16' AS Date), CAST(N'2014-06-22' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1071, 1, 1, N'C1.155', CAST(N'2014-06-23' AS Date), CAST(N'2014-06-29' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1072, 1, 1, N'C1.156', CAST(N'2014-06-30' AS Date), CAST(N'2014-07-06' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1073, 1, 1, N'C1.157', CAST(N'2014-07-07' AS Date), CAST(N'2014-07-13' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1074, 1, 1, N'C1.158', CAST(N'2014-07-14' AS Date), CAST(N'2014-07-20' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1075, 1, 1, N'C1.159', CAST(N'2014-07-21' AS Date), CAST(N'2014-07-27' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1076, 1, 1, N'C1.160', CAST(N'2014-07-28' AS Date), CAST(N'2014-08-03' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1077, 1, 1, N'C1.161', CAST(N'2014-08-04' AS Date), CAST(N'2014-08-10' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1078, 1, 1, N'C1.162', CAST(N'2014-08-11' AS Date), CAST(N'2014-08-17' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1079, 1, 1, N'C1.163', CAST(N'2014-08-18' AS Date), CAST(N'2014-08-24' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1080, 1, 1, N'C1.164', CAST(N'2014-08-25' AS Date), CAST(N'2014-08-31' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1081, 1, 1, N'C1.165', CAST(N'2014-09-01' AS Date), CAST(N'2014-09-07' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1082, 1, 1, N'C1.166', CAST(N'2014-09-08' AS Date), CAST(N'2014-09-14' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1083, 1, 1, N'C1.167', CAST(N'2014-09-15' AS Date), CAST(N'2014-09-21' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1084, 1, 1, N'C1.168', CAST(N'2014-09-22' AS Date), CAST(N'2014-09-28' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1085, 1, 1, N'C1.169', CAST(N'2014-09-29' AS Date), CAST(N'2014-10-05' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1086, 1, 1, N'C1.170', CAST(N'2014-10-06' AS Date), CAST(N'2014-10-12' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1087, 1, 1, N'C1.171', CAST(N'2014-10-13' AS Date), CAST(N'2014-10-19' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1088, 1, 1, N'C1.172', CAST(N'2014-10-20' AS Date), CAST(N'2014-10-26' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1089, 1, 1, N'C1.173', CAST(N'2014-10-27' AS Date), CAST(N'2014-11-02' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1090, 1, 1, N'C1.174', CAST(N'2014-11-03' AS Date), CAST(N'2014-11-09' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1091, 1, 1, N'C1.175', CAST(N'2014-11-10' AS Date), CAST(N'2014-11-16' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1092, 1, 1, N'C1.176', CAST(N'2014-11-17' AS Date), CAST(N'2014-11-23' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1093, 1, 1, N'C1.177', CAST(N'2014-11-24' AS Date), CAST(N'2014-11-30' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1094, 1, 1, N'C1.178', CAST(N'2014-12-01' AS Date), CAST(N'2014-12-07' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1095, 1, 1, N'C1.179', CAST(N'2014-12-08' AS Date), CAST(N'2014-12-14' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1096, 1, 1, N'C1.180', CAST(N'2014-12-15' AS Date), CAST(N'2014-12-21' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1097, 1, 1, N'C1.181', CAST(N'2014-12-22' AS Date), CAST(N'2014-12-28' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1098, 1, 1, N'C1.182', CAST(N'2014-12-29' AS Date), CAST(N'2015-01-04' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1099, 1, 1, N'C1.183', CAST(N'2015-01-05' AS Date), CAST(N'2015-01-11' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1100, 1, 1, N'C1.184', CAST(N'2015-01-12' AS Date), CAST(N'2015-01-18' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1101, 1, 1, N'C1.185', CAST(N'2015-01-19' AS Date), CAST(N'2015-01-25' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1102, 1, 1, N'C1.186', CAST(N'2015-01-26' AS Date), CAST(N'2015-02-01' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1103, 1, 1, N'C1.187', CAST(N'2015-02-02' AS Date), CAST(N'2015-02-08' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1104, 1, 1, N'C1.188', CAST(N'2015-02-09' AS Date), CAST(N'2015-02-15' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1105, 1, 1, N'C1.189', CAST(N'2015-02-16' AS Date), CAST(N'2015-02-22' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1106, 1, 1, N'C1.190', CAST(N'2015-02-23' AS Date), CAST(N'2015-03-01' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1107, 1, 1, N'C1.191', CAST(N'2015-03-02' AS Date), CAST(N'2015-03-08' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1108, 1, 1, N'C1.192', CAST(N'2015-03-09' AS Date), CAST(N'2015-03-15' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1109, 1, 1, N'C1.193', CAST(N'2015-03-16' AS Date), CAST(N'2015-03-22' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1110, 1, 1, N'C1.194', CAST(N'2015-03-23' AS Date), CAST(N'2015-03-29' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1111, 1, 1, N'C1.195', CAST(N'2015-03-30' AS Date), CAST(N'2015-04-05' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1112, 1, 1, N'C1.196', CAST(N'2015-04-06' AS Date), CAST(N'2015-04-12' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1113, 1, 1, N'C1.197', CAST(N'2015-04-13' AS Date), CAST(N'2015-04-19' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1114, 1, 1, N'C1.198', CAST(N'2015-04-20' AS Date), CAST(N'2015-04-26' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1115, 1, 1, N'C1.199', CAST(N'2015-04-27' AS Date), CAST(N'2015-05-03' AS Date))
GO
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1116, 1, 1, N'C1.200', CAST(N'2015-05-04' AS Date), CAST(N'2015-05-10' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1117, 1, 1, N'C1.201', CAST(N'2015-05-11' AS Date), CAST(N'2015-05-17' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1118, 1, 1, N'C1.202', CAST(N'2015-05-18' AS Date), CAST(N'2015-05-24' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1119, 1, 1, N'C1.203', CAST(N'2015-05-25' AS Date), CAST(N'2015-05-31' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1120, 1, 1, N'C1.204', CAST(N'2015-06-01' AS Date), CAST(N'2015-06-07' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1121, 1, 1, N'C1.205', CAST(N'2015-06-08' AS Date), CAST(N'2015-06-14' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1122, 1, 1, N'C1.206', CAST(N'2015-06-15' AS Date), CAST(N'2015-06-21' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1123, 1, 1, N'C1.207', CAST(N'2015-06-22' AS Date), CAST(N'2015-06-28' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1124, 1, 1, N'C1.208', CAST(N'2015-06-29' AS Date), CAST(N'2015-07-05' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1125, 1, 1, N'C1.209', CAST(N'2015-07-06' AS Date), CAST(N'2015-07-12' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1126, 1, 1, N'C1.210', CAST(N'2015-07-13' AS Date), CAST(N'2015-07-19' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1127, 1, 1, N'C1.211', CAST(N'2015-07-20' AS Date), CAST(N'2015-07-26' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1128, 1, 1, N'C1.212', CAST(N'2015-07-27' AS Date), CAST(N'2015-08-02' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1129, 1, 1, N'C1.213', CAST(N'2015-08-03' AS Date), CAST(N'2015-08-09' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1130, 1, 1, N'C1.214', CAST(N'2015-08-10' AS Date), CAST(N'2015-08-16' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1131, 1, 1, N'C1.215', CAST(N'2015-08-17' AS Date), CAST(N'2015-08-23' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1132, 1, 1, N'C1.216', CAST(N'2015-08-24' AS Date), CAST(N'2015-08-30' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1133, 1, 1, N'C1.217', CAST(N'2015-08-31' AS Date), CAST(N'2015-09-06' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1134, 1, 1, N'C1.218', CAST(N'2015-09-07' AS Date), CAST(N'2015-09-13' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1135, 1, 1, N'C1.219', CAST(N'2015-09-14' AS Date), CAST(N'2015-09-20' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1136, 1, 1, N'C1.220', CAST(N'2015-09-21' AS Date), CAST(N'2015-09-27' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1137, 1, 1, N'C1.221', CAST(N'2015-09-28' AS Date), CAST(N'2015-10-04' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1138, 1, 1, N'C1.222', CAST(N'2015-10-05' AS Date), CAST(N'2015-10-11' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1139, 1, 1, N'C1.223', CAST(N'2015-10-12' AS Date), CAST(N'2015-10-18' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1140, 1, 1, N'C1.224', CAST(N'2015-10-19' AS Date), CAST(N'2015-10-25' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1141, 1, 1, N'C1.225', CAST(N'2015-10-26' AS Date), CAST(N'2015-11-01' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1142, 1, 1, N'C1.226', CAST(N'2015-11-02' AS Date), CAST(N'2015-11-08' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1143, 1, 1, N'C1.227', CAST(N'2015-11-09' AS Date), CAST(N'2015-11-15' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1144, 1, 1, N'C1.228', CAST(N'2015-11-16' AS Date), CAST(N'2015-11-22' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1145, 1, 1, N'C1.229', CAST(N'2015-11-23' AS Date), CAST(N'2015-11-29' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1146, 1, 1, N'C1.230', CAST(N'2015-11-30' AS Date), CAST(N'2015-12-06' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1147, 1, 1, N'C1.231', CAST(N'2015-12-07' AS Date), CAST(N'2015-12-13' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1148, 1, 1, N'C1.232', CAST(N'2015-12-14' AS Date), CAST(N'2015-12-20' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1149, 1, 1, N'C1.233', CAST(N'2015-12-21' AS Date), CAST(N'2015-12-27' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1150, 1, 1, N'C1.234', CAST(N'2015-12-28' AS Date), CAST(N'2016-01-03' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1151, 1, 1, N'C1.235', CAST(N'2016-01-04' AS Date), CAST(N'2016-01-10' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1152, 1, 1, N'C1.236', CAST(N'2016-01-11' AS Date), CAST(N'2016-01-17' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1153, 1, 1, N'C1.237', CAST(N'2016-01-18' AS Date), CAST(N'2016-01-24' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1154, 1, 1, N'C1.238', CAST(N'2016-01-25' AS Date), CAST(N'2016-01-31' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1155, 1, 1, N'C1.239', CAST(N'2016-02-01' AS Date), CAST(N'2016-02-07' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1156, 1, 1, N'C1.240', CAST(N'2016-02-08' AS Date), CAST(N'2016-02-14' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1157, 1, 1, N'C1.241', CAST(N'2016-02-15' AS Date), CAST(N'2016-02-21' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1158, 1, 1, N'C1.242', CAST(N'2016-02-22' AS Date), CAST(N'2016-02-28' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1159, 1, 1, N'C1.243', CAST(N'2016-02-29' AS Date), CAST(N'2016-03-06' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1160, 1, 1, N'C1.244', CAST(N'2016-03-07' AS Date), CAST(N'2016-03-13' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1161, 1, 1, N'C1.245', CAST(N'2016-03-14' AS Date), CAST(N'2016-03-20' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1162, 1, 1, N'C1.246', CAST(N'2016-03-21' AS Date), CAST(N'2016-03-27' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1163, 1, 1, N'C1.247', CAST(N'2016-03-28' AS Date), CAST(N'2016-04-03' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1164, 1, 1, N'C1.248', CAST(N'2016-04-04' AS Date), CAST(N'2016-04-10' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1165, 1, 1, N'C1.249', CAST(N'2016-04-11' AS Date), CAST(N'2016-04-17' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1166, 1, 1, N'C1.250', CAST(N'2016-04-18' AS Date), CAST(N'2016-04-24' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1167, 1, 1, N'C1.251', CAST(N'2016-04-25' AS Date), CAST(N'2016-05-01' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1168, 1, 1, N'C1.252', CAST(N'2016-05-02' AS Date), CAST(N'2016-05-08' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1169, 1, 1, N'C1.253', CAST(N'2016-05-09' AS Date), CAST(N'2016-05-15' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1170, 1, 1, N'C1.254', CAST(N'2016-05-16' AS Date), CAST(N'2016-05-22' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1171, 1, 1, N'C1.255', CAST(N'2016-05-23' AS Date), CAST(N'2016-05-29' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1172, 1, 1, N'C1.256', CAST(N'2016-05-30' AS Date), CAST(N'2016-06-05' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1173, 1, 1, N'C1.257', CAST(N'2016-06-06' AS Date), CAST(N'2016-06-12' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1174, 1, 1, N'C1.258', CAST(N'2016-06-13' AS Date), CAST(N'2016-06-19' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1175, 1, 1, N'C1.259', CAST(N'2016-06-20' AS Date), CAST(N'2016-06-26' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1176, 1, 1, N'C1.260', CAST(N'2016-06-27' AS Date), CAST(N'2016-07-03' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1177, 1, 1, N'C1.261', CAST(N'2016-07-04' AS Date), CAST(N'2016-07-10' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1178, 1, 1, N'C1.262', CAST(N'2016-07-11' AS Date), CAST(N'2016-07-17' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1179, 1, 1, N'C1.263', CAST(N'2016-07-18' AS Date), CAST(N'2016-07-24' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1180, 1, 1, N'C1.264', CAST(N'2016-07-25' AS Date), CAST(N'2016-07-31' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1181, 1, 1, N'C1.265', CAST(N'2016-08-01' AS Date), CAST(N'2016-08-07' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1182, 1, 1, N'C1.266', CAST(N'2016-08-08' AS Date), CAST(N'2016-08-14' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1183, 1, 1, N'C1.267', CAST(N'2016-08-15' AS Date), CAST(N'2016-08-21' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1184, 1, 1, N'C1.268', CAST(N'2016-08-22' AS Date), CAST(N'2016-08-28' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1185, 1, 1, N'C1.269', CAST(N'2016-08-29' AS Date), CAST(N'2016-09-04' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1186, 1, 1, N'C1.270', CAST(N'2016-09-05' AS Date), CAST(N'2016-09-11' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1187, 1, 1, N'C1.271', CAST(N'2016-09-12' AS Date), CAST(N'2016-09-18' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1188, 1, 1, N'C1.272', CAST(N'2016-09-19' AS Date), CAST(N'2016-09-25' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1189, 1, 1, N'C1.273', CAST(N'2016-09-26' AS Date), CAST(N'2016-10-02' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1190, 1, 1, N'C1.274', CAST(N'2016-10-03' AS Date), CAST(N'2016-10-09' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1191, 1, 1, N'C1.275', CAST(N'2016-10-10' AS Date), CAST(N'2016-10-16' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1192, 1, 1, N'C1.276', CAST(N'2016-10-17' AS Date), CAST(N'2016-10-23' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1193, 1, 1, N'C1.277', CAST(N'2016-10-24' AS Date), CAST(N'2016-10-30' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1194, 1, 1, N'C1.278', CAST(N'2016-10-31' AS Date), CAST(N'2016-11-06' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1195, 1, 1, N'C1.279', CAST(N'2016-11-07' AS Date), CAST(N'2016-11-13' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1196, 1, 1, N'C1.280', CAST(N'2016-11-14' AS Date), CAST(N'2016-11-20' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1197, 1, 1, N'C1.281', CAST(N'2016-11-21' AS Date), CAST(N'2016-11-27' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1198, 1, 1, N'C1.282', CAST(N'2016-11-28' AS Date), CAST(N'2016-12-04' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1199, 1, 1, N'C1.283', CAST(N'2016-12-05' AS Date), CAST(N'2016-12-11' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1200, 1, 1, N'C1.284', CAST(N'2016-12-12' AS Date), CAST(N'2016-12-18' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1201, 1, 1, N'C1.285', CAST(N'2016-12-19' AS Date), CAST(N'2016-12-25' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1202, 1, 1, N'C1.286', CAST(N'2016-12-26' AS Date), CAST(N'2017-01-01' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1203, 1, 1, N'C1.287', CAST(N'2017-01-02' AS Date), CAST(N'2017-01-08' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1204, 1, 1, N'C1.288', CAST(N'2017-01-09' AS Date), CAST(N'2017-01-15' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1205, 1, 1, N'C1.289', CAST(N'2017-01-16' AS Date), CAST(N'2017-01-22' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1206, 1, 1, N'C1.290', CAST(N'2017-01-23' AS Date), CAST(N'2017-01-29' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1207, 1, 1, N'C1.291', CAST(N'2017-01-30' AS Date), CAST(N'2017-02-05' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1208, 1, 1, N'C1.292', CAST(N'2017-02-06' AS Date), CAST(N'2017-02-12' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1209, 1, 1, N'C1.293', CAST(N'2017-02-13' AS Date), CAST(N'2017-02-19' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1210, 1, 1, N'C1.294', CAST(N'2017-02-20' AS Date), CAST(N'2017-02-26' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1211, 1, 1, N'C1.295', CAST(N'2017-02-27' AS Date), CAST(N'2017-03-05' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1212, 1, 1, N'C1.296', CAST(N'2017-03-06' AS Date), CAST(N'2017-03-12' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1213, 1, 1, N'C1.297', CAST(N'2017-03-13' AS Date), CAST(N'2017-03-19' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1214, 1, 1, N'C1.298', CAST(N'2017-03-20' AS Date), CAST(N'2017-03-26' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1215, 1, 1, N'C1.299', CAST(N'2017-03-27' AS Date), CAST(N'2017-04-02' AS Date))
GO
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1216, 1, 1, N'C1.300', CAST(N'2017-04-03' AS Date), CAST(N'2017-04-09' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1217, 1, 1, N'C1.301', CAST(N'2017-04-10' AS Date), CAST(N'2017-04-16' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1218, 1, 1, N'C1.302', CAST(N'2017-04-17' AS Date), CAST(N'2017-04-23' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1219, 1, 1, N'C1.303', CAST(N'2017-04-24' AS Date), CAST(N'2017-04-30' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1220, 1, 1, N'C1.304', CAST(N'2017-05-01' AS Date), CAST(N'2017-05-07' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1221, 1, 1, N'C1.305', CAST(N'2017-05-08' AS Date), CAST(N'2017-05-14' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1222, 1, 1, N'C1.306', CAST(N'2017-05-15' AS Date), CAST(N'2017-05-21' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1223, 1, 1, N'C1.307', CAST(N'2017-05-22' AS Date), CAST(N'2017-05-28' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1224, 1, 1, N'C1.308', CAST(N'2017-05-29' AS Date), CAST(N'2017-06-04' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1225, 1, 1, N'C1.309', CAST(N'2017-06-05' AS Date), CAST(N'2017-06-11' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1226, 1, 1, N'C1.310', CAST(N'2017-06-12' AS Date), CAST(N'2017-06-18' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1227, 1, 1, N'C1.311', CAST(N'2017-06-19' AS Date), CAST(N'2017-06-25' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1228, 1, 1, N'C1.312', CAST(N'2017-06-26' AS Date), CAST(N'2017-07-02' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1229, 1, 1, N'C1.313', CAST(N'2017-07-03' AS Date), CAST(N'2017-07-09' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1230, 1, 1, N'C1.314', CAST(N'2017-07-10' AS Date), CAST(N'2017-07-16' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1231, 1, 1, N'C1.315', CAST(N'2017-07-17' AS Date), CAST(N'2017-07-23' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1232, 1, 1, N'C1.316', CAST(N'2017-07-24' AS Date), CAST(N'2017-07-30' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1233, 1, 1, N'C1.317', CAST(N'2017-07-31' AS Date), CAST(N'2017-08-06' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1234, 1, 1, N'C1.318', CAST(N'2017-08-07' AS Date), CAST(N'2017-08-13' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1235, 1, 1, N'C1.319', CAST(N'2017-08-14' AS Date), CAST(N'2017-08-20' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1236, 1, 1, N'C1.320', CAST(N'2017-08-21' AS Date), CAST(N'2017-08-27' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1237, 1, 1, N'C1.321', CAST(N'2017-08-28' AS Date), CAST(N'2017-09-03' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1238, 1, 1, N'C1.322', CAST(N'2017-09-04' AS Date), CAST(N'2017-09-10' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1239, 1, 1, N'C1.323', CAST(N'2017-09-11' AS Date), CAST(N'2017-09-17' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1240, 1, 1, N'C1.324', CAST(N'2017-09-18' AS Date), CAST(N'2017-09-24' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1241, 1, 1, N'C1.325', CAST(N'2017-09-25' AS Date), CAST(N'2017-10-01' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1242, 1, 1, N'C1.326', CAST(N'2017-10-02' AS Date), CAST(N'2017-10-08' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1243, 1, 1, N'C1.327', CAST(N'2017-10-09' AS Date), CAST(N'2017-10-15' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1244, 1, 1, N'C1.328', CAST(N'2017-10-16' AS Date), CAST(N'2017-10-22' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1245, 1, 1, N'C1.329', CAST(N'2017-10-23' AS Date), CAST(N'2017-10-29' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1246, 1, 1, N'C1.330', CAST(N'2017-10-30' AS Date), CAST(N'2017-11-05' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1247, 1, 1, N'C1.331', CAST(N'2017-11-06' AS Date), CAST(N'2017-11-12' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1248, 1, 1, N'C1.332', CAST(N'2017-11-13' AS Date), CAST(N'2017-11-19' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1249, 1, 1, N'C1.333', CAST(N'2017-11-20' AS Date), CAST(N'2017-11-26' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1250, 1, 1, N'C1.334', CAST(N'2017-11-27' AS Date), CAST(N'2017-12-03' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1251, 1, 1, N'C1.335', CAST(N'2017-12-04' AS Date), CAST(N'2017-12-10' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1252, 1, 1, N'C1.336', CAST(N'2017-12-11' AS Date), CAST(N'2017-12-17' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1253, 1, 1, N'C1.337', CAST(N'2017-12-18' AS Date), CAST(N'2017-12-24' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1254, 1, 1, N'C1.338', CAST(N'2017-12-25' AS Date), CAST(N'2017-12-31' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1255, 1, 1, N'C1.339', CAST(N'2018-01-01' AS Date), CAST(N'2018-01-07' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1256, 1, 1, N'C1.340', CAST(N'2018-01-08' AS Date), CAST(N'2018-01-14' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1257, 1, 1, N'C1.341', CAST(N'2018-01-15' AS Date), CAST(N'2018-01-21' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1258, 1, 1, N'C1.342', CAST(N'2018-01-22' AS Date), CAST(N'2018-01-28' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1259, 1, 1, N'C1.343', CAST(N'2018-01-29' AS Date), CAST(N'2018-02-04' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1260, 1, 1, N'C1.344', CAST(N'2018-02-05' AS Date), CAST(N'2018-02-11' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1261, 1, 1, N'C1.345', CAST(N'2018-02-12' AS Date), CAST(N'2018-02-18' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1262, 1, 1, N'C1.346', CAST(N'2018-02-19' AS Date), CAST(N'2018-02-25' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1263, 1, 1, N'C1.347', CAST(N'2018-02-26' AS Date), CAST(N'2018-03-04' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1264, 1, 1, N'C1.348', CAST(N'2018-03-05' AS Date), CAST(N'2018-03-11' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1265, 1, 1, N'C1.349', CAST(N'2018-03-12' AS Date), CAST(N'2018-03-18' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1266, 1, 1, N'C1.350', CAST(N'2018-03-19' AS Date), CAST(N'2018-03-25' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1267, 1, 1, N'C1.351', CAST(N'2018-03-26' AS Date), CAST(N'2018-04-01' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1268, 1, 1, N'C1.352', CAST(N'2018-04-02' AS Date), CAST(N'2018-04-08' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1269, 1, 1, N'C1.353', CAST(N'2018-04-09' AS Date), CAST(N'2018-04-15' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1270, 1, 1, N'C1.354', CAST(N'2018-04-16' AS Date), CAST(N'2018-04-22' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1271, 1, 1, N'C1.355', CAST(N'2018-04-23' AS Date), CAST(N'2018-04-29' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1272, 1, 1, N'C1.356', CAST(N'2018-04-30' AS Date), CAST(N'2018-05-06' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1273, 1, 1, N'C1.357', CAST(N'2018-05-07' AS Date), CAST(N'2018-05-13' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1274, 1, 1, N'C1.358', CAST(N'2018-05-14' AS Date), CAST(N'2018-05-20' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1275, 1, 1, N'C1.359', CAST(N'2018-05-21' AS Date), CAST(N'2018-05-27' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1276, 1, 1, N'C1.360', CAST(N'2018-05-28' AS Date), CAST(N'2018-06-03' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1277, 1, 1, N'C1.361', CAST(N'2018-06-04' AS Date), CAST(N'2018-06-10' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1278, 1, 1, N'C1.362', CAST(N'2018-06-11' AS Date), CAST(N'2018-06-17' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1279, 1, 1, N'C1.363', CAST(N'2018-06-18' AS Date), CAST(N'2018-06-24' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1280, 1, 1, N'C1.364', CAST(N'2018-06-25' AS Date), CAST(N'2018-07-01' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1281, 1, 1, N'C1.365', CAST(N'2018-07-02' AS Date), CAST(N'2018-07-08' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1282, 1, 1, N'C1.366', CAST(N'2018-07-09' AS Date), CAST(N'2018-07-15' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1283, 1, 1, N'C1.367', CAST(N'2018-07-16' AS Date), CAST(N'2018-07-22' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1284, 1, 1, N'C1.368', CAST(N'2018-07-23' AS Date), CAST(N'2018-07-29' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1285, 1, 1, N'C1.369', CAST(N'2018-07-30' AS Date), CAST(N'2018-08-05' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1286, 1, 1, N'C1.370', CAST(N'2018-08-06' AS Date), CAST(N'2018-08-12' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1287, 1, 1, N'C1.371', CAST(N'2018-08-13' AS Date), CAST(N'2018-08-19' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1288, 1, 1, N'C1.372', CAST(N'2018-08-20' AS Date), CAST(N'2018-08-26' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1289, 1, 1, N'C1.373', CAST(N'2018-08-27' AS Date), CAST(N'2018-09-02' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1290, 1, 1, N'C1.374', CAST(N'2018-09-03' AS Date), CAST(N'2018-09-09' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1291, 1, 1, N'C1.375', CAST(N'2018-09-10' AS Date), CAST(N'2018-09-16' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1292, 1, 1, N'C1.376', CAST(N'2018-09-17' AS Date), CAST(N'2018-09-23' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1293, 1, 1, N'C1.377', CAST(N'2018-09-24' AS Date), CAST(N'2018-09-30' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1294, 1, 1, N'C1.378', CAST(N'2018-10-01' AS Date), CAST(N'2018-10-07' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1295, 1, 1, N'C1.379', CAST(N'2018-10-08' AS Date), CAST(N'2018-10-14' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1296, 1, 1, N'C1.380', CAST(N'2018-10-15' AS Date), CAST(N'2018-10-21' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1297, 1, 1, N'C1.381', CAST(N'2018-10-22' AS Date), CAST(N'2018-10-28' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1298, 1, 1, N'C1.382', CAST(N'2018-10-29' AS Date), CAST(N'2018-11-04' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1299, 1, 1, N'C1.383', CAST(N'2018-11-05' AS Date), CAST(N'2018-11-11' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1300, 1, 1, N'C1.384', CAST(N'2018-11-12' AS Date), CAST(N'2018-11-18' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1301, 1, 1, N'C1.385', CAST(N'2018-11-19' AS Date), CAST(N'2018-11-25' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1302, 1, 1, N'C1.386', CAST(N'2018-11-26' AS Date), CAST(N'2018-12-02' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1303, 1, 1, N'C1.387', CAST(N'2018-12-03' AS Date), CAST(N'2018-12-09' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1304, 1, 1, N'C1.388', CAST(N'2018-12-10' AS Date), CAST(N'2018-12-16' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1305, 1, 1, N'C1.389', CAST(N'2018-12-17' AS Date), CAST(N'2018-12-23' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1306, 1, 1, N'C1.390', CAST(N'2018-12-24' AS Date), CAST(N'2018-12-30' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1307, 1, 1, N'C1.391', CAST(N'2018-12-31' AS Date), CAST(N'2019-01-06' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1308, 1, 1, N'C1.392', CAST(N'2019-01-07' AS Date), CAST(N'2019-01-13' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1309, 1, 1, N'C1.393', CAST(N'2019-01-14' AS Date), CAST(N'2019-01-20' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1310, 1, 1, N'C1.394', CAST(N'2019-01-21' AS Date), CAST(N'2019-01-27' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1311, 1, 1, N'C1.395', CAST(N'2019-01-28' AS Date), CAST(N'2019-02-03' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1312, 1, 1, N'C1.396', CAST(N'2019-02-04' AS Date), CAST(N'2019-02-10' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1313, 1, 1, N'C1.397', CAST(N'2019-02-11' AS Date), CAST(N'2019-02-17' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1314, 1, 1, N'C1.398', CAST(N'2019-02-18' AS Date), CAST(N'2019-02-24' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (1315, 1, 1, N'C1.399', CAST(N'2019-02-25' AS Date), CAST(N'2019-03-03' AS Date))
GO
SET IDENTITY_INSERT [dbo].[KanBan_Cycle_Period] OFF
SET IDENTITY_INSERT [dbo].[KanBan_Cycle_Period_Status] ON 

INSERT [dbo].[KanBan_Cycle_Period_Status] ([ID], [KanBan_ID], [Cycle_Period_ID], [Inventory_Num], [Income_Num], [Outcome_Num], [Fire_Num], [Resolve_Num], [Income_Num_Cu], [Outcome_Num_Cu], [Fire_Num_Cu], [Resolve_Num_Cu]) VALUES (397, 1, 166, 0, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[KanBan_Cycle_Period_Status] ([ID], [KanBan_ID], [Cycle_Period_ID], [Inventory_Num], [Income_Num], [Outcome_Num], [Fire_Num], [Resolve_Num], [Income_Num_Cu], [Outcome_Num_Cu], [Fire_Num_Cu], [Resolve_Num_Cu]) VALUES (398, 1, 167, 0, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[KanBan_Cycle_Period_Status] ([ID], [KanBan_ID], [Cycle_Period_ID], [Inventory_Num], [Income_Num], [Outcome_Num], [Fire_Num], [Resolve_Num], [Income_Num_Cu], [Outcome_Num_Cu], [Fire_Num_Cu], [Resolve_Num_Cu]) VALUES (399, 1, 168, 0, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[KanBan_Cycle_Period_Status] ([ID], [KanBan_ID], [Cycle_Period_ID], [Inventory_Num], [Income_Num], [Outcome_Num], [Fire_Num], [Resolve_Num], [Income_Num_Cu], [Outcome_Num_Cu], [Fire_Num_Cu], [Resolve_Num_Cu]) VALUES (400, 1, 169, 0, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[KanBan_Cycle_Period_Status] ([ID], [KanBan_ID], [Cycle_Period_ID], [Inventory_Num], [Income_Num], [Outcome_Num], [Fire_Num], [Resolve_Num], [Income_Num_Cu], [Outcome_Num_Cu], [Fire_Num_Cu], [Resolve_Num_Cu]) VALUES (401, 1, 170, 0, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[KanBan_Cycle_Period_Status] ([ID], [KanBan_ID], [Cycle_Period_ID], [Inventory_Num], [Income_Num], [Outcome_Num], [Fire_Num], [Resolve_Num], [Income_Num_Cu], [Outcome_Num_Cu], [Fire_Num_Cu], [Resolve_Num_Cu]) VALUES (402, 1, 171, 0, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[KanBan_Cycle_Period_Status] ([ID], [KanBan_ID], [Cycle_Period_ID], [Inventory_Num], [Income_Num], [Outcome_Num], [Fire_Num], [Resolve_Num], [Income_Num_Cu], [Outcome_Num_Cu], [Fire_Num_Cu], [Resolve_Num_Cu]) VALUES (403, 1, 172, 0, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[KanBan_Cycle_Period_Status] ([ID], [KanBan_ID], [Cycle_Period_ID], [Inventory_Num], [Income_Num], [Outcome_Num], [Fire_Num], [Resolve_Num], [Income_Num_Cu], [Outcome_Num_Cu], [Fire_Num_Cu], [Resolve_Num_Cu]) VALUES (404, 1, 173, 0, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[KanBan_Cycle_Period_Status] ([ID], [KanBan_ID], [Cycle_Period_ID], [Inventory_Num], [Income_Num], [Outcome_Num], [Fire_Num], [Resolve_Num], [Income_Num_Cu], [Outcome_Num_Cu], [Fire_Num_Cu], [Resolve_Num_Cu]) VALUES (405, 1, 174, 0, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[KanBan_Cycle_Period_Status] ([ID], [KanBan_ID], [Cycle_Period_ID], [Inventory_Num], [Income_Num], [Outcome_Num], [Fire_Num], [Resolve_Num], [Income_Num_Cu], [Outcome_Num_Cu], [Fire_Num_Cu], [Resolve_Num_Cu]) VALUES (406, 1, 175, 0, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[KanBan_Cycle_Period_Status] ([ID], [KanBan_ID], [Cycle_Period_ID], [Inventory_Num], [Income_Num], [Outcome_Num], [Fire_Num], [Resolve_Num], [Income_Num_Cu], [Outcome_Num_Cu], [Fire_Num_Cu], [Resolve_Num_Cu]) VALUES (407, 1, 176, 0, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[KanBan_Cycle_Period_Status] ([ID], [KanBan_ID], [Cycle_Period_ID], [Inventory_Num], [Income_Num], [Outcome_Num], [Fire_Num], [Resolve_Num], [Income_Num_Cu], [Outcome_Num_Cu], [Fire_Num_Cu], [Resolve_Num_Cu]) VALUES (408, 1, 177, 0, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[KanBan_Cycle_Period_Status] ([ID], [KanBan_ID], [Cycle_Period_ID], [Inventory_Num], [Income_Num], [Outcome_Num], [Fire_Num], [Resolve_Num], [Income_Num_Cu], [Outcome_Num_Cu], [Fire_Num_Cu], [Resolve_Num_Cu]) VALUES (409, 1, 178, 0, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[KanBan_Cycle_Period_Status] ([ID], [KanBan_ID], [Cycle_Period_ID], [Inventory_Num], [Income_Num], [Outcome_Num], [Fire_Num], [Resolve_Num], [Income_Num_Cu], [Outcome_Num_Cu], [Fire_Num_Cu], [Resolve_Num_Cu]) VALUES (410, 1, 179, 0, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[KanBan_Cycle_Period_Status] ([ID], [KanBan_ID], [Cycle_Period_ID], [Inventory_Num], [Income_Num], [Outcome_Num], [Fire_Num], [Resolve_Num], [Income_Num_Cu], [Outcome_Num_Cu], [Fire_Num_Cu], [Resolve_Num_Cu]) VALUES (411, 1, 180, 0, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[KanBan_Cycle_Period_Status] ([ID], [KanBan_ID], [Cycle_Period_ID], [Inventory_Num], [Income_Num], [Outcome_Num], [Fire_Num], [Resolve_Num], [Income_Num_Cu], [Outcome_Num_Cu], [Fire_Num_Cu], [Resolve_Num_Cu]) VALUES (412, 1, 181, 0, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[KanBan_Cycle_Period_Status] ([ID], [KanBan_ID], [Cycle_Period_ID], [Inventory_Num], [Income_Num], [Outcome_Num], [Fire_Num], [Resolve_Num], [Income_Num_Cu], [Outcome_Num_Cu], [Fire_Num_Cu], [Resolve_Num_Cu]) VALUES (413, 1, 182, 0, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[KanBan_Cycle_Period_Status] ([ID], [KanBan_ID], [Cycle_Period_ID], [Inventory_Num], [Income_Num], [Outcome_Num], [Fire_Num], [Resolve_Num], [Income_Num_Cu], [Outcome_Num_Cu], [Fire_Num_Cu], [Resolve_Num_Cu]) VALUES (414, 1, 183, 0, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[KanBan_Cycle_Period_Status] ([ID], [KanBan_ID], [Cycle_Period_ID], [Inventory_Num], [Income_Num], [Outcome_Num], [Fire_Num], [Resolve_Num], [Income_Num_Cu], [Outcome_Num_Cu], [Fire_Num_Cu], [Resolve_Num_Cu]) VALUES (415, 1, 184, 0, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[KanBan_Cycle_Period_Status] ([ID], [KanBan_ID], [Cycle_Period_ID], [Inventory_Num], [Income_Num], [Outcome_Num], [Fire_Num], [Resolve_Num], [Income_Num_Cu], [Outcome_Num_Cu], [Fire_Num_Cu], [Resolve_Num_Cu]) VALUES (416, 1, 185, 0, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[KanBan_Cycle_Period_Status] ([ID], [KanBan_ID], [Cycle_Period_ID], [Inventory_Num], [Income_Num], [Outcome_Num], [Fire_Num], [Resolve_Num], [Income_Num_Cu], [Outcome_Num_Cu], [Fire_Num_Cu], [Resolve_Num_Cu]) VALUES (417, 1, 186, 0, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[KanBan_Cycle_Period_Status] ([ID], [KanBan_ID], [Cycle_Period_ID], [Inventory_Num], [Income_Num], [Outcome_Num], [Fire_Num], [Resolve_Num], [Income_Num_Cu], [Outcome_Num_Cu], [Fire_Num_Cu], [Resolve_Num_Cu]) VALUES (418, 1, 187, 0, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[KanBan_Cycle_Period_Status] ([ID], [KanBan_ID], [Cycle_Period_ID], [Inventory_Num], [Income_Num], [Outcome_Num], [Fire_Num], [Resolve_Num], [Income_Num_Cu], [Outcome_Num_Cu], [Fire_Num_Cu], [Resolve_Num_Cu]) VALUES (419, 1, 188, 0, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[KanBan_Cycle_Period_Status] ([ID], [KanBan_ID], [Cycle_Period_ID], [Inventory_Num], [Income_Num], [Outcome_Num], [Fire_Num], [Resolve_Num], [Income_Num_Cu], [Outcome_Num_Cu], [Fire_Num_Cu], [Resolve_Num_Cu]) VALUES (420, 1, 189, 0, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[KanBan_Cycle_Period_Status] ([ID], [KanBan_ID], [Cycle_Period_ID], [Inventory_Num], [Income_Num], [Outcome_Num], [Fire_Num], [Resolve_Num], [Income_Num_Cu], [Outcome_Num_Cu], [Fire_Num_Cu], [Resolve_Num_Cu]) VALUES (421, 1, 190, 0, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[KanBan_Cycle_Period_Status] ([ID], [KanBan_ID], [Cycle_Period_ID], [Inventory_Num], [Income_Num], [Outcome_Num], [Fire_Num], [Resolve_Num], [Income_Num_Cu], [Outcome_Num_Cu], [Fire_Num_Cu], [Resolve_Num_Cu]) VALUES (422, 1, 191, 0, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[KanBan_Cycle_Period_Status] ([ID], [KanBan_ID], [Cycle_Period_ID], [Inventory_Num], [Income_Num], [Outcome_Num], [Fire_Num], [Resolve_Num], [Income_Num_Cu], [Outcome_Num_Cu], [Fire_Num_Cu], [Resolve_Num_Cu]) VALUES (423, 1, 192, 0, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[KanBan_Cycle_Period_Status] ([ID], [KanBan_ID], [Cycle_Period_ID], [Inventory_Num], [Income_Num], [Outcome_Num], [Fire_Num], [Resolve_Num], [Income_Num_Cu], [Outcome_Num_Cu], [Fire_Num_Cu], [Resolve_Num_Cu]) VALUES (424, 1, 193, 0, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[KanBan_Cycle_Period_Status] ([ID], [KanBan_ID], [Cycle_Period_ID], [Inventory_Num], [Income_Num], [Outcome_Num], [Fire_Num], [Resolve_Num], [Income_Num_Cu], [Outcome_Num_Cu], [Fire_Num_Cu], [Resolve_Num_Cu]) VALUES (425, 1, 194, 0, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[KanBan_Cycle_Period_Status] ([ID], [KanBan_ID], [Cycle_Period_ID], [Inventory_Num], [Income_Num], [Outcome_Num], [Fire_Num], [Resolve_Num], [Income_Num_Cu], [Outcome_Num_Cu], [Fire_Num_Cu], [Resolve_Num_Cu]) VALUES (426, 1, 195, 0, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[KanBan_Cycle_Period_Status] ([ID], [KanBan_ID], [Cycle_Period_ID], [Inventory_Num], [Income_Num], [Outcome_Num], [Fire_Num], [Resolve_Num], [Income_Num_Cu], [Outcome_Num_Cu], [Fire_Num_Cu], [Resolve_Num_Cu]) VALUES (427, 1, 196, 0, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[KanBan_Cycle_Period_Status] ([ID], [KanBan_ID], [Cycle_Period_ID], [Inventory_Num], [Income_Num], [Outcome_Num], [Fire_Num], [Resolve_Num], [Income_Num_Cu], [Outcome_Num_Cu], [Fire_Num_Cu], [Resolve_Num_Cu]) VALUES (428, 1, 197, 0, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[KanBan_Cycle_Period_Status] ([ID], [KanBan_ID], [Cycle_Period_ID], [Inventory_Num], [Income_Num], [Outcome_Num], [Fire_Num], [Resolve_Num], [Income_Num_Cu], [Outcome_Num_Cu], [Fire_Num_Cu], [Resolve_Num_Cu]) VALUES (429, 1, 198, 0, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[KanBan_Cycle_Period_Status] ([ID], [KanBan_ID], [Cycle_Period_ID], [Inventory_Num], [Income_Num], [Outcome_Num], [Fire_Num], [Resolve_Num], [Income_Num_Cu], [Outcome_Num_Cu], [Fire_Num_Cu], [Resolve_Num_Cu]) VALUES (430, 1, 199, 0, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[KanBan_Cycle_Period_Status] ([ID], [KanBan_ID], [Cycle_Period_ID], [Inventory_Num], [Income_Num], [Outcome_Num], [Fire_Num], [Resolve_Num], [Income_Num_Cu], [Outcome_Num_Cu], [Fire_Num_Cu], [Resolve_Num_Cu]) VALUES (431, 1, 200, 0, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[KanBan_Cycle_Period_Status] ([ID], [KanBan_ID], [Cycle_Period_ID], [Inventory_Num], [Income_Num], [Outcome_Num], [Fire_Num], [Resolve_Num], [Income_Num_Cu], [Outcome_Num_Cu], [Fire_Num_Cu], [Resolve_Num_Cu]) VALUES (432, 1, 201, 0, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[KanBan_Cycle_Period_Status] ([ID], [KanBan_ID], [Cycle_Period_ID], [Inventory_Num], [Income_Num], [Outcome_Num], [Fire_Num], [Resolve_Num], [Income_Num_Cu], [Outcome_Num_Cu], [Fire_Num_Cu], [Resolve_Num_Cu]) VALUES (433, 1, 202, 0, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[KanBan_Cycle_Period_Status] ([ID], [KanBan_ID], [Cycle_Period_ID], [Inventory_Num], [Income_Num], [Outcome_Num], [Fire_Num], [Resolve_Num], [Income_Num_Cu], [Outcome_Num_Cu], [Fire_Num_Cu], [Resolve_Num_Cu]) VALUES (434, 1, 203, 0, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[KanBan_Cycle_Period_Status] ([ID], [KanBan_ID], [Cycle_Period_ID], [Inventory_Num], [Income_Num], [Outcome_Num], [Fire_Num], [Resolve_Num], [Income_Num_Cu], [Outcome_Num_Cu], [Fire_Num_Cu], [Resolve_Num_Cu]) VALUES (435, 1, 204, 0, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[KanBan_Cycle_Period_Status] ([ID], [KanBan_ID], [Cycle_Period_ID], [Inventory_Num], [Income_Num], [Outcome_Num], [Fire_Num], [Resolve_Num], [Income_Num_Cu], [Outcome_Num_Cu], [Fire_Num_Cu], [Resolve_Num_Cu]) VALUES (436, 1, 205, 0, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[KanBan_Cycle_Period_Status] ([ID], [KanBan_ID], [Cycle_Period_ID], [Inventory_Num], [Income_Num], [Outcome_Num], [Fire_Num], [Resolve_Num], [Income_Num_Cu], [Outcome_Num_Cu], [Fire_Num_Cu], [Resolve_Num_Cu]) VALUES (437, 1, 206, 0, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[KanBan_Cycle_Period_Status] ([ID], [KanBan_ID], [Cycle_Period_ID], [Inventory_Num], [Income_Num], [Outcome_Num], [Fire_Num], [Resolve_Num], [Income_Num_Cu], [Outcome_Num_Cu], [Fire_Num_Cu], [Resolve_Num_Cu]) VALUES (438, 1, 207, 0, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[KanBan_Cycle_Period_Status] ([ID], [KanBan_ID], [Cycle_Period_ID], [Inventory_Num], [Income_Num], [Outcome_Num], [Fire_Num], [Resolve_Num], [Income_Num_Cu], [Outcome_Num_Cu], [Fire_Num_Cu], [Resolve_Num_Cu]) VALUES (439, 1, 208, 0, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[KanBan_Cycle_Period_Status] ([ID], [KanBan_ID], [Cycle_Period_ID], [Inventory_Num], [Income_Num], [Outcome_Num], [Fire_Num], [Resolve_Num], [Income_Num_Cu], [Outcome_Num_Cu], [Fire_Num_Cu], [Resolve_Num_Cu]) VALUES (440, 1, 209, 0, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[KanBan_Cycle_Period_Status] ([ID], [KanBan_ID], [Cycle_Period_ID], [Inventory_Num], [Income_Num], [Outcome_Num], [Fire_Num], [Resolve_Num], [Income_Num_Cu], [Outcome_Num_Cu], [Fire_Num_Cu], [Resolve_Num_Cu]) VALUES (441, 1, 210, 0, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[KanBan_Cycle_Period_Status] ([ID], [KanBan_ID], [Cycle_Period_ID], [Inventory_Num], [Income_Num], [Outcome_Num], [Fire_Num], [Resolve_Num], [Income_Num_Cu], [Outcome_Num_Cu], [Fire_Num_Cu], [Resolve_Num_Cu]) VALUES (442, 1, 211, 0, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[KanBan_Cycle_Period_Status] ([ID], [KanBan_ID], [Cycle_Period_ID], [Inventory_Num], [Income_Num], [Outcome_Num], [Fire_Num], [Resolve_Num], [Income_Num_Cu], [Outcome_Num_Cu], [Fire_Num_Cu], [Resolve_Num_Cu]) VALUES (443, 1, 212, 0, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[KanBan_Cycle_Period_Status] ([ID], [KanBan_ID], [Cycle_Period_ID], [Inventory_Num], [Income_Num], [Outcome_Num], [Fire_Num], [Resolve_Num], [Income_Num_Cu], [Outcome_Num_Cu], [Fire_Num_Cu], [Resolve_Num_Cu]) VALUES (444, 1, 213, 0, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[KanBan_Cycle_Period_Status] ([ID], [KanBan_ID], [Cycle_Period_ID], [Inventory_Num], [Income_Num], [Outcome_Num], [Fire_Num], [Resolve_Num], [Income_Num_Cu], [Outcome_Num_Cu], [Fire_Num_Cu], [Resolve_Num_Cu]) VALUES (445, 1, 214, 0, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[KanBan_Cycle_Period_Status] ([ID], [KanBan_ID], [Cycle_Period_ID], [Inventory_Num], [Income_Num], [Outcome_Num], [Fire_Num], [Resolve_Num], [Income_Num_Cu], [Outcome_Num_Cu], [Fire_Num_Cu], [Resolve_Num_Cu]) VALUES (446, 1, 215, 0, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[KanBan_Cycle_Period_Status] ([ID], [KanBan_ID], [Cycle_Period_ID], [Inventory_Num], [Income_Num], [Outcome_Num], [Fire_Num], [Resolve_Num], [Income_Num_Cu], [Outcome_Num_Cu], [Fire_Num_Cu], [Resolve_Num_Cu]) VALUES (447, 1, 216, 0, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[KanBan_Cycle_Period_Status] ([ID], [KanBan_ID], [Cycle_Period_ID], [Inventory_Num], [Income_Num], [Outcome_Num], [Fire_Num], [Resolve_Num], [Income_Num_Cu], [Outcome_Num_Cu], [Fire_Num_Cu], [Resolve_Num_Cu]) VALUES (448, 1, 217, 0, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[KanBan_Cycle_Period_Status] ([ID], [KanBan_ID], [Cycle_Period_ID], [Inventory_Num], [Income_Num], [Outcome_Num], [Fire_Num], [Resolve_Num], [Income_Num_Cu], [Outcome_Num_Cu], [Fire_Num_Cu], [Resolve_Num_Cu]) VALUES (449, 1, 218, 0, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[KanBan_Cycle_Period_Status] ([ID], [KanBan_ID], [Cycle_Period_ID], [Inventory_Num], [Income_Num], [Outcome_Num], [Fire_Num], [Resolve_Num], [Income_Num_Cu], [Outcome_Num_Cu], [Fire_Num_Cu], [Resolve_Num_Cu]) VALUES (450, 1, 219, 0, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[KanBan_Cycle_Period_Status] ([ID], [KanBan_ID], [Cycle_Period_ID], [Inventory_Num], [Income_Num], [Outcome_Num], [Fire_Num], [Resolve_Num], [Income_Num_Cu], [Outcome_Num_Cu], [Fire_Num_Cu], [Resolve_Num_Cu]) VALUES (451, 1, 220, 0, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[KanBan_Cycle_Period_Status] ([ID], [KanBan_ID], [Cycle_Period_ID], [Inventory_Num], [Income_Num], [Outcome_Num], [Fire_Num], [Resolve_Num], [Income_Num_Cu], [Outcome_Num_Cu], [Fire_Num_Cu], [Resolve_Num_Cu]) VALUES (452, 1, 221, 0, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[KanBan_Cycle_Period_Status] ([ID], [KanBan_ID], [Cycle_Period_ID], [Inventory_Num], [Income_Num], [Outcome_Num], [Fire_Num], [Resolve_Num], [Income_Num_Cu], [Outcome_Num_Cu], [Fire_Num_Cu], [Resolve_Num_Cu]) VALUES (453, 1, 222, 0, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[KanBan_Cycle_Period_Status] ([ID], [KanBan_ID], [Cycle_Period_ID], [Inventory_Num], [Income_Num], [Outcome_Num], [Fire_Num], [Resolve_Num], [Income_Num_Cu], [Outcome_Num_Cu], [Fire_Num_Cu], [Resolve_Num_Cu]) VALUES (454, 1, 223, 0, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[KanBan_Cycle_Period_Status] ([ID], [KanBan_ID], [Cycle_Period_ID], [Inventory_Num], [Income_Num], [Outcome_Num], [Fire_Num], [Resolve_Num], [Income_Num_Cu], [Outcome_Num_Cu], [Fire_Num_Cu], [Resolve_Num_Cu]) VALUES (455, 1, 224, 0, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[KanBan_Cycle_Period_Status] ([ID], [KanBan_ID], [Cycle_Period_ID], [Inventory_Num], [Income_Num], [Outcome_Num], [Fire_Num], [Resolve_Num], [Income_Num_Cu], [Outcome_Num_Cu], [Fire_Num_Cu], [Resolve_Num_Cu]) VALUES (456, 1, 225, 0, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[KanBan_Cycle_Period_Status] ([ID], [KanBan_ID], [Cycle_Period_ID], [Inventory_Num], [Income_Num], [Outcome_Num], [Fire_Num], [Resolve_Num], [Income_Num_Cu], [Outcome_Num_Cu], [Fire_Num_Cu], [Resolve_Num_Cu]) VALUES (457, 1, 226, 0, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[KanBan_Cycle_Period_Status] ([ID], [KanBan_ID], [Cycle_Period_ID], [Inventory_Num], [Income_Num], [Outcome_Num], [Fire_Num], [Resolve_Num], [Income_Num_Cu], [Outcome_Num_Cu], [Fire_Num_Cu], [Resolve_Num_Cu]) VALUES (458, 1, 227, 0, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[KanBan_Cycle_Period_Status] ([ID], [KanBan_ID], [Cycle_Period_ID], [Inventory_Num], [Income_Num], [Outcome_Num], [Fire_Num], [Resolve_Num], [Income_Num_Cu], [Outcome_Num_Cu], [Fire_Num_Cu], [Resolve_Num_Cu]) VALUES (459, 1, 228, 0, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[KanBan_Cycle_Period_Status] ([ID], [KanBan_ID], [Cycle_Period_ID], [Inventory_Num], [Income_Num], [Outcome_Num], [Fire_Num], [Resolve_Num], [Income_Num_Cu], [Outcome_Num_Cu], [Fire_Num_Cu], [Resolve_Num_Cu]) VALUES (460, 1, 229, 0, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[KanBan_Cycle_Period_Status] ([ID], [KanBan_ID], [Cycle_Period_ID], [Inventory_Num], [Income_Num], [Outcome_Num], [Fire_Num], [Resolve_Num], [Income_Num_Cu], [Outcome_Num_Cu], [Fire_Num_Cu], [Resolve_Num_Cu]) VALUES (461, 1, 230, 0, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[KanBan_Cycle_Period_Status] ([ID], [KanBan_ID], [Cycle_Period_ID], [Inventory_Num], [Income_Num], [Outcome_Num], [Fire_Num], [Resolve_Num], [Income_Num_Cu], [Outcome_Num_Cu], [Fire_Num_Cu], [Resolve_Num_Cu]) VALUES (462, 1, 231, 0, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[KanBan_Cycle_Period_Status] ([ID], [KanBan_ID], [Cycle_Period_ID], [Inventory_Num], [Income_Num], [Outcome_Num], [Fire_Num], [Resolve_Num], [Income_Num_Cu], [Outcome_Num_Cu], [Fire_Num_Cu], [Resolve_Num_Cu]) VALUES (463, 1, 232, 0, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[KanBan_Cycle_Period_Status] ([ID], [KanBan_ID], [Cycle_Period_ID], [Inventory_Num], [Income_Num], [Outcome_Num], [Fire_Num], [Resolve_Num], [Income_Num_Cu], [Outcome_Num_Cu], [Fire_Num_Cu], [Resolve_Num_Cu]) VALUES (464, 1, 233, 0, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[KanBan_Cycle_Period_Status] ([ID], [KanBan_ID], [Cycle_Period_ID], [Inventory_Num], [Income_Num], [Outcome_Num], [Fire_Num], [Resolve_Num], [Income_Num_Cu], [Outcome_Num_Cu], [Fire_Num_Cu], [Resolve_Num_Cu]) VALUES (465, 1, 234, 0, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[KanBan_Cycle_Period_Status] ([ID], [KanBan_ID], [Cycle_Period_ID], [Inventory_Num], [Income_Num], [Outcome_Num], [Fire_Num], [Resolve_Num], [Income_Num_Cu], [Outcome_Num_Cu], [Fire_Num_Cu], [Resolve_Num_Cu]) VALUES (466, 1, 235, 0, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[KanBan_Cycle_Period_Status] ([ID], [KanBan_ID], [Cycle_Period_ID], [Inventory_Num], [Income_Num], [Outcome_Num], [Fire_Num], [Resolve_Num], [Income_Num_Cu], [Outcome_Num_Cu], [Fire_Num_Cu], [Resolve_Num_Cu]) VALUES (467, 1, 236, 0, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[KanBan_Cycle_Period_Status] ([ID], [KanBan_ID], [Cycle_Period_ID], [Inventory_Num], [Income_Num], [Outcome_Num], [Fire_Num], [Resolve_Num], [Income_Num_Cu], [Outcome_Num_Cu], [Fire_Num_Cu], [Resolve_Num_Cu]) VALUES (468, 1, 237, 0, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[KanBan_Cycle_Period_Status] ([ID], [KanBan_ID], [Cycle_Period_ID], [Inventory_Num], [Income_Num], [Outcome_Num], [Fire_Num], [Resolve_Num], [Income_Num_Cu], [Outcome_Num_Cu], [Fire_Num_Cu], [Resolve_Num_Cu]) VALUES (469, 1, 238, 0, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[KanBan_Cycle_Period_Status] ([ID], [KanBan_ID], [Cycle_Period_ID], [Inventory_Num], [Income_Num], [Outcome_Num], [Fire_Num], [Resolve_Num], [Income_Num_Cu], [Outcome_Num_Cu], [Fire_Num_Cu], [Resolve_Num_Cu]) VALUES (470, 1, 239, 0, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[KanBan_Cycle_Period_Status] ([ID], [KanBan_ID], [Cycle_Period_ID], [Inventory_Num], [Income_Num], [Outcome_Num], [Fire_Num], [Resolve_Num], [Income_Num_Cu], [Outcome_Num_Cu], [Fire_Num_Cu], [Resolve_Num_Cu]) VALUES (471, 1, 240, 0, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[KanBan_Cycle_Period_Status] ([ID], [KanBan_ID], [Cycle_Period_ID], [Inventory_Num], [Income_Num], [Outcome_Num], [Fire_Num], [Resolve_Num], [Income_Num_Cu], [Outcome_Num_Cu], [Fire_Num_Cu], [Resolve_Num_Cu]) VALUES (472, 1, 241, 0, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[KanBan_Cycle_Period_Status] ([ID], [KanBan_ID], [Cycle_Period_ID], [Inventory_Num], [Income_Num], [Outcome_Num], [Fire_Num], [Resolve_Num], [Income_Num_Cu], [Outcome_Num_Cu], [Fire_Num_Cu], [Resolve_Num_Cu]) VALUES (473, 1, 242, 47, 61, 14, 31, 13, 61, 14, 31, 13)
INSERT [dbo].[KanBan_Cycle_Period_Status] ([ID], [KanBan_ID], [Cycle_Period_ID], [Inventory_Num], [Income_Num], [Outcome_Num], [Fire_Num], [Resolve_Num], [Income_Num_Cu], [Outcome_Num_Cu], [Fire_Num_Cu], [Resolve_Num_Cu]) VALUES (474, 1, 243, 48, 13, 12, 11, 3, 74, 26, 42, 16)
INSERT [dbo].[KanBan_Cycle_Period_Status] ([ID], [KanBan_ID], [Cycle_Period_ID], [Inventory_Num], [Income_Num], [Outcome_Num], [Fire_Num], [Resolve_Num], [Income_Num_Cu], [Outcome_Num_Cu], [Fire_Num_Cu], [Resolve_Num_Cu]) VALUES (475, 1, 244, 56, 15, 7, 8, 2, 89, 33, 50, 18)
INSERT [dbo].[KanBan_Cycle_Period_Status] ([ID], [KanBan_ID], [Cycle_Period_ID], [Inventory_Num], [Income_Num], [Outcome_Num], [Fire_Num], [Resolve_Num], [Income_Num_Cu], [Outcome_Num_Cu], [Fire_Num_Cu], [Resolve_Num_Cu]) VALUES (476, 1, 245, 55, 2, 3, 6, 1, 91, 36, 56, 19)
INSERT [dbo].[KanBan_Cycle_Period_Status] ([ID], [KanBan_ID], [Cycle_Period_ID], [Inventory_Num], [Income_Num], [Outcome_Num], [Fire_Num], [Resolve_Num], [Income_Num_Cu], [Outcome_Num_Cu], [Fire_Num_Cu], [Resolve_Num_Cu]) VALUES (477, 1, 246, 53, 2, 4, 14, 5, 93, 40, 70, 24)
INSERT [dbo].[KanBan_Cycle_Period_Status] ([ID], [KanBan_ID], [Cycle_Period_ID], [Inventory_Num], [Income_Num], [Outcome_Num], [Fire_Num], [Resolve_Num], [Income_Num_Cu], [Outcome_Num_Cu], [Fire_Num_Cu], [Resolve_Num_Cu]) VALUES (478, 1, 247, 48, 2, 7, 2, 5, 95, 47, 72, 29)
INSERT [dbo].[KanBan_Cycle_Period_Status] ([ID], [KanBan_ID], [Cycle_Period_ID], [Inventory_Num], [Income_Num], [Outcome_Num], [Fire_Num], [Resolve_Num], [Income_Num_Cu], [Outcome_Num_Cu], [Fire_Num_Cu], [Resolve_Num_Cu]) VALUES (479, 1, 248, 49, 7, 6, 4, 0, 102, 53, 76, 29)
INSERT [dbo].[KanBan_Cycle_Period_Status] ([ID], [KanBan_ID], [Cycle_Period_ID], [Inventory_Num], [Income_Num], [Outcome_Num], [Fire_Num], [Resolve_Num], [Income_Num_Cu], [Outcome_Num_Cu], [Fire_Num_Cu], [Resolve_Num_Cu]) VALUES (480, 1, 249, 49, 1, 1, 1, 1, 103, 54, 77, 30)
INSERT [dbo].[KanBan_Cycle_Period_Status] ([ID], [KanBan_ID], [Cycle_Period_ID], [Inventory_Num], [Income_Num], [Outcome_Num], [Fire_Num], [Resolve_Num], [Income_Num_Cu], [Outcome_Num_Cu], [Fire_Num_Cu], [Resolve_Num_Cu]) VALUES (481, 1, 250, 51, 7, 5, 3, 9, 110, 59, 80, 39)
INSERT [dbo].[KanBan_Cycle_Period_Status] ([ID], [KanBan_ID], [Cycle_Period_ID], [Inventory_Num], [Income_Num], [Outcome_Num], [Fire_Num], [Resolve_Num], [Income_Num_Cu], [Outcome_Num_Cu], [Fire_Num_Cu], [Resolve_Num_Cu]) VALUES (482, 1, 251, 50, 3, 4, 2, 3, 113, 63, 82, 42)
INSERT [dbo].[KanBan_Cycle_Period_Status] ([ID], [KanBan_ID], [Cycle_Period_ID], [Inventory_Num], [Income_Num], [Outcome_Num], [Fire_Num], [Resolve_Num], [Income_Num_Cu], [Outcome_Num_Cu], [Fire_Num_Cu], [Resolve_Num_Cu]) VALUES (483, 1, 252, 43, 2, 9, 0, 6, 115, 72, 82, 48)
INSERT [dbo].[KanBan_Cycle_Period_Status] ([ID], [KanBan_ID], [Cycle_Period_ID], [Inventory_Num], [Income_Num], [Outcome_Num], [Fire_Num], [Resolve_Num], [Income_Num_Cu], [Outcome_Num_Cu], [Fire_Num_Cu], [Resolve_Num_Cu]) VALUES (484, 1, 253, 43, 10, 10, 6, 4, 125, 82, 88, 52)
INSERT [dbo].[KanBan_Cycle_Period_Status] ([ID], [KanBan_ID], [Cycle_Period_ID], [Inventory_Num], [Income_Num], [Outcome_Num], [Fire_Num], [Resolve_Num], [Income_Num_Cu], [Outcome_Num_Cu], [Fire_Num_Cu], [Resolve_Num_Cu]) VALUES (485, 1, 254, 44, 13, 12, 1, 2, 138, 94, 89, 54)
INSERT [dbo].[KanBan_Cycle_Period_Status] ([ID], [KanBan_ID], [Cycle_Period_ID], [Inventory_Num], [Income_Num], [Outcome_Num], [Fire_Num], [Resolve_Num], [Income_Num_Cu], [Outcome_Num_Cu], [Fire_Num_Cu], [Resolve_Num_Cu]) VALUES (486, 1, 255, 15, 5, 34, 5, 3, 143, 123, 94, 57)
INSERT [dbo].[KanBan_Cycle_Period_Status] ([ID], [KanBan_ID], [Cycle_Period_ID], [Inventory_Num], [Income_Num], [Outcome_Num], [Fire_Num], [Resolve_Num], [Income_Num_Cu], [Outcome_Num_Cu], [Fire_Num_Cu], [Resolve_Num_Cu]) VALUES (665, 1, 258, 25, 6, 3, 0, 0, 172, 142, 0, 0)
INSERT [dbo].[KanBan_Cycle_Period_Status] ([ID], [KanBan_ID], [Cycle_Period_ID], [Inventory_Num], [Income_Num], [Outcome_Num], [Fire_Num], [Resolve_Num], [Income_Num_Cu], [Outcome_Num_Cu], [Fire_Num_Cu], [Resolve_Num_Cu]) VALUES (490, 1, 259, 25, 0, 0, 0, 0, 172, 142, 94, 57)
INSERT [dbo].[KanBan_Cycle_Period_Status] ([ID], [KanBan_ID], [Cycle_Period_ID], [Inventory_Num], [Income_Num], [Outcome_Num], [Fire_Num], [Resolve_Num], [Income_Num_Cu], [Outcome_Num_Cu], [Fire_Num_Cu], [Resolve_Num_Cu]) VALUES (491, 1, 260, 25, 0, 0, 0, 0, 172, 142, 94, 57)
INSERT [dbo].[KanBan_Cycle_Period_Status] ([ID], [KanBan_ID], [Cycle_Period_ID], [Inventory_Num], [Income_Num], [Outcome_Num], [Fire_Num], [Resolve_Num], [Income_Num_Cu], [Outcome_Num_Cu], [Fire_Num_Cu], [Resolve_Num_Cu]) VALUES (492, 1, 261, 25, 0, 0, 0, 0, 172, 142, 94, 57)
INSERT [dbo].[KanBan_Cycle_Period_Status] ([ID], [KanBan_ID], [Cycle_Period_ID], [Inventory_Num], [Income_Num], [Outcome_Num], [Fire_Num], [Resolve_Num], [Income_Num_Cu], [Outcome_Num_Cu], [Fire_Num_Cu], [Resolve_Num_Cu]) VALUES (493, 1, 262, 25, 0, 0, 0, 0, 172, 142, 94, 57)
INSERT [dbo].[KanBan_Cycle_Period_Status] ([ID], [KanBan_ID], [Cycle_Period_ID], [Inventory_Num], [Income_Num], [Outcome_Num], [Fire_Num], [Resolve_Num], [Income_Num_Cu], [Outcome_Num_Cu], [Fire_Num_Cu], [Resolve_Num_Cu]) VALUES (494, 1, 263, 25, 0, 0, 0, 0, 172, 142, 94, 57)
INSERT [dbo].[KanBan_Cycle_Period_Status] ([ID], [KanBan_ID], [Cycle_Period_ID], [Inventory_Num], [Income_Num], [Outcome_Num], [Fire_Num], [Resolve_Num], [Income_Num_Cu], [Outcome_Num_Cu], [Fire_Num_Cu], [Resolve_Num_Cu]) VALUES (495, 1, 264, 25, 0, 0, 0, 0, 172, 142, 94, 57)
INSERT [dbo].[KanBan_Cycle_Period_Status] ([ID], [KanBan_ID], [Cycle_Period_ID], [Inventory_Num], [Income_Num], [Outcome_Num], [Fire_Num], [Resolve_Num], [Income_Num_Cu], [Outcome_Num_Cu], [Fire_Num_Cu], [Resolve_Num_Cu]) VALUES (496, 1, 265, 25, 0, 0, 0, 0, 172, 142, 94, 57)
INSERT [dbo].[KanBan_Cycle_Period_Status] ([ID], [KanBan_ID], [Cycle_Period_ID], [Inventory_Num], [Income_Num], [Outcome_Num], [Fire_Num], [Resolve_Num], [Income_Num_Cu], [Outcome_Num_Cu], [Fire_Num_Cu], [Resolve_Num_Cu]) VALUES (497, 1, 266, 25, 0, 0, 0, 0, 172, 142, 94, 57)
GO
INSERT [dbo].[KanBan_Cycle_Period_Status] ([ID], [KanBan_ID], [Cycle_Period_ID], [Inventory_Num], [Income_Num], [Outcome_Num], [Fire_Num], [Resolve_Num], [Income_Num_Cu], [Outcome_Num_Cu], [Fire_Num_Cu], [Resolve_Num_Cu]) VALUES (498, 1, 267, 25, 0, 0, 0, 0, 172, 142, 94, 57)
INSERT [dbo].[KanBan_Cycle_Period_Status] ([ID], [KanBan_ID], [Cycle_Period_ID], [Inventory_Num], [Income_Num], [Outcome_Num], [Fire_Num], [Resolve_Num], [Income_Num_Cu], [Outcome_Num_Cu], [Fire_Num_Cu], [Resolve_Num_Cu]) VALUES (499, 1, 268, 25, 0, 0, 0, 0, 172, 142, 94, 57)
INSERT [dbo].[KanBan_Cycle_Period_Status] ([ID], [KanBan_ID], [Cycle_Period_ID], [Inventory_Num], [Income_Num], [Outcome_Num], [Fire_Num], [Resolve_Num], [Income_Num_Cu], [Outcome_Num_Cu], [Fire_Num_Cu], [Resolve_Num_Cu]) VALUES (500, 1, 269, 25, 0, 0, 0, 0, 172, 142, 94, 57)
INSERT [dbo].[KanBan_Cycle_Period_Status] ([ID], [KanBan_ID], [Cycle_Period_ID], [Inventory_Num], [Income_Num], [Outcome_Num], [Fire_Num], [Resolve_Num], [Income_Num_Cu], [Outcome_Num_Cu], [Fire_Num_Cu], [Resolve_Num_Cu]) VALUES (501, 1, 270, 25, 0, 0, 0, 0, 172, 142, 94, 57)
INSERT [dbo].[KanBan_Cycle_Period_Status] ([ID], [KanBan_ID], [Cycle_Period_ID], [Inventory_Num], [Income_Num], [Outcome_Num], [Fire_Num], [Resolve_Num], [Income_Num_Cu], [Outcome_Num_Cu], [Fire_Num_Cu], [Resolve_Num_Cu]) VALUES (502, 1, 271, 25, 0, 0, 0, 0, 172, 142, 94, 57)
INSERT [dbo].[KanBan_Cycle_Period_Status] ([ID], [KanBan_ID], [Cycle_Period_ID], [Inventory_Num], [Income_Num], [Outcome_Num], [Fire_Num], [Resolve_Num], [Income_Num_Cu], [Outcome_Num_Cu], [Fire_Num_Cu], [Resolve_Num_Cu]) VALUES (503, 1, 272, 25, 0, 0, 0, 0, 172, 142, 94, 57)
INSERT [dbo].[KanBan_Cycle_Period_Status] ([ID], [KanBan_ID], [Cycle_Period_ID], [Inventory_Num], [Income_Num], [Outcome_Num], [Fire_Num], [Resolve_Num], [Income_Num_Cu], [Outcome_Num_Cu], [Fire_Num_Cu], [Resolve_Num_Cu]) VALUES (504, 1, 273, 25, 0, 0, 0, 0, 172, 142, 94, 57)
INSERT [dbo].[KanBan_Cycle_Period_Status] ([ID], [KanBan_ID], [Cycle_Period_ID], [Inventory_Num], [Income_Num], [Outcome_Num], [Fire_Num], [Resolve_Num], [Income_Num_Cu], [Outcome_Num_Cu], [Fire_Num_Cu], [Resolve_Num_Cu]) VALUES (505, 1, 274, 25, 0, 0, 0, 0, 172, 142, 94, 57)
INSERT [dbo].[KanBan_Cycle_Period_Status] ([ID], [KanBan_ID], [Cycle_Period_ID], [Inventory_Num], [Income_Num], [Outcome_Num], [Fire_Num], [Resolve_Num], [Income_Num_Cu], [Outcome_Num_Cu], [Fire_Num_Cu], [Resolve_Num_Cu]) VALUES (506, 1, 275, 25, 0, 0, 0, 0, 172, 142, 94, 57)
INSERT [dbo].[KanBan_Cycle_Period_Status] ([ID], [KanBan_ID], [Cycle_Period_ID], [Inventory_Num], [Income_Num], [Outcome_Num], [Fire_Num], [Resolve_Num], [Income_Num_Cu], [Outcome_Num_Cu], [Fire_Num_Cu], [Resolve_Num_Cu]) VALUES (663, 1, 256, 18, 18, 15, 0, 0, 161, 138, 0, 0)
INSERT [dbo].[KanBan_Cycle_Period_Status] ([ID], [KanBan_ID], [Cycle_Period_ID], [Inventory_Num], [Income_Num], [Outcome_Num], [Fire_Num], [Resolve_Num], [Income_Num_Cu], [Outcome_Num_Cu], [Fire_Num_Cu], [Resolve_Num_Cu]) VALUES (664, 1, 257, 22, 5, 1, 0, 0, 166, 139, 0, 0)
INSERT [dbo].[KanBan_Cycle_Period_Status] ([ID], [KanBan_ID], [Cycle_Period_ID], [Inventory_Num], [Income_Num], [Outcome_Num], [Fire_Num], [Resolve_Num], [Income_Num_Cu], [Outcome_Num_Cu], [Fire_Num_Cu], [Resolve_Num_Cu]) VALUES (507, 1, 276, 25, 0, 0, 0, 0, 172, 142, 94, 57)
INSERT [dbo].[KanBan_Cycle_Period_Status] ([ID], [KanBan_ID], [Cycle_Period_ID], [Inventory_Num], [Income_Num], [Outcome_Num], [Fire_Num], [Resolve_Num], [Income_Num_Cu], [Outcome_Num_Cu], [Fire_Num_Cu], [Resolve_Num_Cu]) VALUES (508, 1, 277, 25, 0, 0, 0, 0, 172, 142, 94, 57)
INSERT [dbo].[KanBan_Cycle_Period_Status] ([ID], [KanBan_ID], [Cycle_Period_ID], [Inventory_Num], [Income_Num], [Outcome_Num], [Fire_Num], [Resolve_Num], [Income_Num_Cu], [Outcome_Num_Cu], [Fire_Num_Cu], [Resolve_Num_Cu]) VALUES (509, 1, 278, 25, 0, 0, 0, 0, 172, 142, 94, 57)
INSERT [dbo].[KanBan_Cycle_Period_Status] ([ID], [KanBan_ID], [Cycle_Period_ID], [Inventory_Num], [Income_Num], [Outcome_Num], [Fire_Num], [Resolve_Num], [Income_Num_Cu], [Outcome_Num_Cu], [Fire_Num_Cu], [Resolve_Num_Cu]) VALUES (510, 1, 279, 25, 0, 0, 0, 0, 172, 142, 94, 57)
INSERT [dbo].[KanBan_Cycle_Period_Status] ([ID], [KanBan_ID], [Cycle_Period_ID], [Inventory_Num], [Income_Num], [Outcome_Num], [Fire_Num], [Resolve_Num], [Income_Num_Cu], [Outcome_Num_Cu], [Fire_Num_Cu], [Resolve_Num_Cu]) VALUES (511, 1, 280, 25, 0, 0, 0, 0, 172, 142, 94, 57)
INSERT [dbo].[KanBan_Cycle_Period_Status] ([ID], [KanBan_ID], [Cycle_Period_ID], [Inventory_Num], [Income_Num], [Outcome_Num], [Fire_Num], [Resolve_Num], [Income_Num_Cu], [Outcome_Num_Cu], [Fire_Num_Cu], [Resolve_Num_Cu]) VALUES (512, 1, 281, 25, 0, 0, 0, 0, 172, 142, 94, 57)
INSERT [dbo].[KanBan_Cycle_Period_Status] ([ID], [KanBan_ID], [Cycle_Period_ID], [Inventory_Num], [Income_Num], [Outcome_Num], [Fire_Num], [Resolve_Num], [Income_Num_Cu], [Outcome_Num_Cu], [Fire_Num_Cu], [Resolve_Num_Cu]) VALUES (513, 1, 282, 25, 0, 0, 0, 0, 172, 142, 94, 57)
INSERT [dbo].[KanBan_Cycle_Period_Status] ([ID], [KanBan_ID], [Cycle_Period_ID], [Inventory_Num], [Income_Num], [Outcome_Num], [Fire_Num], [Resolve_Num], [Income_Num_Cu], [Outcome_Num_Cu], [Fire_Num_Cu], [Resolve_Num_Cu]) VALUES (514, 1, 283, 25, 0, 0, 0, 0, 172, 142, 94, 57)
INSERT [dbo].[KanBan_Cycle_Period_Status] ([ID], [KanBan_ID], [Cycle_Period_ID], [Inventory_Num], [Income_Num], [Outcome_Num], [Fire_Num], [Resolve_Num], [Income_Num_Cu], [Outcome_Num_Cu], [Fire_Num_Cu], [Resolve_Num_Cu]) VALUES (515, 1, 284, 25, 0, 0, 0, 0, 172, 142, 94, 57)
INSERT [dbo].[KanBan_Cycle_Period_Status] ([ID], [KanBan_ID], [Cycle_Period_ID], [Inventory_Num], [Income_Num], [Outcome_Num], [Fire_Num], [Resolve_Num], [Income_Num_Cu], [Outcome_Num_Cu], [Fire_Num_Cu], [Resolve_Num_Cu]) VALUES (516, 1, 285, 25, 0, 0, 0, 0, 172, 142, 94, 57)
INSERT [dbo].[KanBan_Cycle_Period_Status] ([ID], [KanBan_ID], [Cycle_Period_ID], [Inventory_Num], [Income_Num], [Outcome_Num], [Fire_Num], [Resolve_Num], [Income_Num_Cu], [Outcome_Num_Cu], [Fire_Num_Cu], [Resolve_Num_Cu]) VALUES (517, 1, 286, 25, 0, 0, 0, 0, 172, 142, 94, 57)
INSERT [dbo].[KanBan_Cycle_Period_Status] ([ID], [KanBan_ID], [Cycle_Period_ID], [Inventory_Num], [Income_Num], [Outcome_Num], [Fire_Num], [Resolve_Num], [Income_Num_Cu], [Outcome_Num_Cu], [Fire_Num_Cu], [Resolve_Num_Cu]) VALUES (518, 1, 287, 25, 0, 0, 0, 0, 172, 142, 94, 57)
INSERT [dbo].[KanBan_Cycle_Period_Status] ([ID], [KanBan_ID], [Cycle_Period_ID], [Inventory_Num], [Income_Num], [Outcome_Num], [Fire_Num], [Resolve_Num], [Income_Num_Cu], [Outcome_Num_Cu], [Fire_Num_Cu], [Resolve_Num_Cu]) VALUES (519, 1, 288, 25, 0, 0, 0, 0, 172, 142, 94, 57)
INSERT [dbo].[KanBan_Cycle_Period_Status] ([ID], [KanBan_ID], [Cycle_Period_ID], [Inventory_Num], [Income_Num], [Outcome_Num], [Fire_Num], [Resolve_Num], [Income_Num_Cu], [Outcome_Num_Cu], [Fire_Num_Cu], [Resolve_Num_Cu]) VALUES (520, 1, 289, 25, 0, 0, 0, 0, 172, 142, 94, 57)
INSERT [dbo].[KanBan_Cycle_Period_Status] ([ID], [KanBan_ID], [Cycle_Period_ID], [Inventory_Num], [Income_Num], [Outcome_Num], [Fire_Num], [Resolve_Num], [Income_Num_Cu], [Outcome_Num_Cu], [Fire_Num_Cu], [Resolve_Num_Cu]) VALUES (521, 1, 290, 25, 0, 0, 0, 0, 172, 142, 94, 57)
INSERT [dbo].[KanBan_Cycle_Period_Status] ([ID], [KanBan_ID], [Cycle_Period_ID], [Inventory_Num], [Income_Num], [Outcome_Num], [Fire_Num], [Resolve_Num], [Income_Num_Cu], [Outcome_Num_Cu], [Fire_Num_Cu], [Resolve_Num_Cu]) VALUES (522, 1, 291, 25, 0, 0, 0, 0, 172, 142, 94, 57)
INSERT [dbo].[KanBan_Cycle_Period_Status] ([ID], [KanBan_ID], [Cycle_Period_ID], [Inventory_Num], [Income_Num], [Outcome_Num], [Fire_Num], [Resolve_Num], [Income_Num_Cu], [Outcome_Num_Cu], [Fire_Num_Cu], [Resolve_Num_Cu]) VALUES (523, 1, 292, 25, 0, 0, 0, 0, 172, 142, 94, 57)
INSERT [dbo].[KanBan_Cycle_Period_Status] ([ID], [KanBan_ID], [Cycle_Period_ID], [Inventory_Num], [Income_Num], [Outcome_Num], [Fire_Num], [Resolve_Num], [Income_Num_Cu], [Outcome_Num_Cu], [Fire_Num_Cu], [Resolve_Num_Cu]) VALUES (524, 1, 293, 25, 0, 0, 0, 0, 172, 142, 94, 57)
INSERT [dbo].[KanBan_Cycle_Period_Status] ([ID], [KanBan_ID], [Cycle_Period_ID], [Inventory_Num], [Income_Num], [Outcome_Num], [Fire_Num], [Resolve_Num], [Income_Num_Cu], [Outcome_Num_Cu], [Fire_Num_Cu], [Resolve_Num_Cu]) VALUES (525, 1, 294, 25, 0, 0, 0, 0, 172, 142, 94, 57)
INSERT [dbo].[KanBan_Cycle_Period_Status] ([ID], [KanBan_ID], [Cycle_Period_ID], [Inventory_Num], [Income_Num], [Outcome_Num], [Fire_Num], [Resolve_Num], [Income_Num_Cu], [Outcome_Num_Cu], [Fire_Num_Cu], [Resolve_Num_Cu]) VALUES (526, 1, 295, 25, 0, 0, 0, 0, 172, 142, 94, 57)
INSERT [dbo].[KanBan_Cycle_Period_Status] ([ID], [KanBan_ID], [Cycle_Period_ID], [Inventory_Num], [Income_Num], [Outcome_Num], [Fire_Num], [Resolve_Num], [Income_Num_Cu], [Outcome_Num_Cu], [Fire_Num_Cu], [Resolve_Num_Cu]) VALUES (527, 1, 296, 25, 0, 0, 0, 0, 172, 142, 94, 57)
INSERT [dbo].[KanBan_Cycle_Period_Status] ([ID], [KanBan_ID], [Cycle_Period_ID], [Inventory_Num], [Income_Num], [Outcome_Num], [Fire_Num], [Resolve_Num], [Income_Num_Cu], [Outcome_Num_Cu], [Fire_Num_Cu], [Resolve_Num_Cu]) VALUES (528, 1, 297, 25, 0, 0, 0, 0, 172, 142, 94, 57)
SET IDENTITY_INSERT [dbo].[KanBan_Cycle_Period_Status] OFF
SET IDENTITY_INSERT [dbo].[KanBan_Story] ON 

INSERT [dbo].[KanBan_Story] ([ID], [Name], [TFS], [TFS_Server], [Description], [DueDate], [PMWork], [TestWork], [DevWork], [PMWorkEst], [TestWorkEst], [DevWorkEst], [StoryStatus], [StoryType], [TaskType], [SwimLane_ID], [KanBan_ID], [Prior], [Status], [StageDueDate]) VALUES (1, N'Common data', 0, 1, N'Test1', CAST(N'2016-08-25' AS Date), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(1.0 AS Decimal(6, 1)), CAST(1.0 AS Decimal(6, 1)), CAST(2.0 AS Decimal(6, 1)), 5, 1, 1, 90, 1, 2, 1, CAST(N'2016-08-25' AS Date))
INSERT [dbo].[KanBan_Story] ([ID], [Name], [TFS], [TFS_Server], [Description], [DueDate], [PMWork], [TestWork], [DevWork], [PMWorkEst], [TestWorkEst], [DevWorkEst], [StoryStatus], [StoryType], [TaskType], [SwimLane_ID], [KanBan_ID], [Prior], [Status], [StageDueDate]) VALUES (2, N'GL data', 0, 1, N'Test', CAST(N'1900-01-01' AS Date), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), 4, 99, 1, 90, 1, 0, 10, CAST(N'1900-01-01' AS Date))
INSERT [dbo].[KanBan_Story] ([ID], [Name], [TFS], [TFS_Server], [Description], [DueDate], [PMWork], [TestWork], [DevWork], [PMWorkEst], [TestWorkEst], [DevWorkEst], [StoryStatus], [StoryType], [TaskType], [SwimLane_ID], [KanBan_ID], [Prior], [Status], [StageDueDate]) VALUES (3, N'Test1', 0, 1, N'Test', CAST(N'1900-01-01' AS Date), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(3.0 AS Decimal(6, 1)), CAST(1.0 AS Decimal(6, 1)), CAST(4.0 AS Decimal(6, 1)), 4, 99, 1, 90, 1, 0, 99, CAST(N'1900-01-01' AS Date))
INSERT [dbo].[KanBan_Story] ([ID], [Name], [TFS], [TFS_Server], [Description], [DueDate], [PMWork], [TestWork], [DevWork], [PMWorkEst], [TestWorkEst], [DevWorkEst], [StoryStatus], [StoryType], [TaskType], [SwimLane_ID], [KanBan_ID], [Prior], [Status], [StageDueDate]) VALUES (4, N'Task1', 0, 1, N'', CAST(N'2016-08-27' AS Date), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(1.0 AS Decimal(6, 1)), CAST(1.0 AS Decimal(6, 1)), CAST(2.0 AS Decimal(6, 1)), 62, 1, 2, 90, 1, 0, 1, CAST(N'2016-08-27' AS Date))
INSERT [dbo].[KanBan_Story] ([ID], [Name], [TFS], [TFS_Server], [Description], [DueDate], [PMWork], [TestWork], [DevWork], [PMWorkEst], [TestWorkEst], [DevWorkEst], [StoryStatus], [StoryType], [TaskType], [SwimLane_ID], [KanBan_ID], [Prior], [Status], [StageDueDate]) VALUES (5, N'Task1', 0, 1, N'', CAST(N'1900-01-01' AS Date), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), 62, 1, 2, 91, 1, 0, 1, CAST(N'1900-01-01' AS Date))
INSERT [dbo].[KanBan_Story] ([ID], [Name], [TFS], [TFS_Server], [Description], [DueDate], [PMWork], [TestWork], [DevWork], [PMWorkEst], [TestWorkEst], [DevWorkEst], [StoryStatus], [StoryType], [TaskType], [SwimLane_ID], [KanBan_ID], [Prior], [Status], [StageDueDate]) VALUES (6, N'Task2', 0, 1, N'', CAST(N'1900-01-01' AS Date), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), 10, 99, 1, 91, 1, 0, 1, CAST(N'1900-01-01' AS Date))
INSERT [dbo].[KanBan_Story] ([ID], [Name], [TFS], [TFS_Server], [Description], [DueDate], [PMWork], [TestWork], [DevWork], [PMWorkEst], [TestWorkEst], [DevWorkEst], [StoryStatus], [StoryType], [TaskType], [SwimLane_ID], [KanBan_ID], [Prior], [Status], [StageDueDate]) VALUES (7, N'Task3', 0, 1, N'', CAST(N'1900-01-01' AS Date), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), 4, 99, 1, 91, 1, 0, 1, CAST(N'1900-01-01' AS Date))
INSERT [dbo].[KanBan_Story] ([ID], [Name], [TFS], [TFS_Server], [Description], [DueDate], [PMWork], [TestWork], [DevWork], [PMWorkEst], [TestWorkEst], [DevWorkEst], [StoryStatus], [StoryType], [TaskType], [SwimLane_ID], [KanBan_ID], [Prior], [Status], [StageDueDate]) VALUES (8, N'Form 1', 0, 1, N'', CAST(N'1900-01-01' AS Date), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), 8, 3, 1, 92, 1, 0, 1, CAST(N'1900-01-01' AS Date))
INSERT [dbo].[KanBan_Story] ([ID], [Name], [TFS], [TFS_Server], [Description], [DueDate], [PMWork], [TestWork], [DevWork], [PMWorkEst], [TestWorkEst], [DevWorkEst], [StoryStatus], [StoryType], [TaskType], [SwimLane_ID], [KanBan_ID], [Prior], [Status], [StageDueDate]) VALUES (9, N'Form 2', 0, 1, N'', CAST(N'1900-01-01' AS Date), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), 8, 1, 1, 92, 1, 0, 1, CAST(N'1900-01-01' AS Date))
SET IDENTITY_INSERT [dbo].[KanBan_Story] OFF
INSERT [dbo].[KanBan_Story_ChangeLog] ([Alias], [CurDateTime], [Story_ID], [Field], [Value_Prev], [Value_New]) VALUES (N'v-petxu', CAST(N'2016-07-14T13:15:08.443' AS DateTime), 0, N'StoryStatus', N'99', N'2')
INSERT [dbo].[KanBan_Story_ChangeLog] ([Alias], [CurDateTime], [Story_ID], [Field], [Value_Prev], [Value_New]) VALUES (N'v-petxu', CAST(N'2016-07-14T13:48:43.947' AS DateTime), 0, N'StoryStatus', N'99', N'2')
INSERT [dbo].[KanBan_Story_ChangeLog] ([Alias], [CurDateTime], [Story_ID], [Field], [Value_Prev], [Value_New]) VALUES (N'v-petxu', CAST(N'2016-07-14T13:51:28.760' AS DateTime), 0, N'StoryStatus', N'99', N'2')
INSERT [dbo].[KanBan_Story_ChangeLog] ([Alias], [CurDateTime], [Story_ID], [Field], [Value_Prev], [Value_New]) VALUES (N'v-petxu', CAST(N'2016-07-14T14:15:06.823' AS DateTime), 1, N'StoryStatus', N'99', N'2')
INSERT [dbo].[KanBan_Story_ChangeLog] ([Alias], [CurDateTime], [Story_ID], [Field], [Value_Prev], [Value_New]) VALUES (N'v-petxu', CAST(N'2016-07-14T14:15:23.867' AS DateTime), 1, N'StoryStatus', N'2', N'1')
INSERT [dbo].[KanBan_Story_ChangeLog] ([Alias], [CurDateTime], [Story_ID], [Field], [Value_Prev], [Value_New]) VALUES (N'', CAST(N'2016-08-24T11:48:16.197' AS DateTime), 4, N'StoryStatus', N'99', N'1')
INSERT [dbo].[KanBan_Story_ChangeLog] ([Alias], [CurDateTime], [Story_ID], [Field], [Value_Prev], [Value_New]) VALUES (N'v-petxu', CAST(N'2016-08-24T13:27:15.367' AS DateTime), 9, N'StoryStatus', N'99', N'1')
INSERT [dbo].[KanBan_Story_ChangeLog] ([Alias], [CurDateTime], [Story_ID], [Field], [Value_Prev], [Value_New]) VALUES (N'v-petxu', CAST(N'2016-08-24T13:27:51.657' AS DateTime), 8, N'StoryStatus', N'99', N'3')
INSERT [dbo].[KanBan_Story_ChangeLog] ([Alias], [CurDateTime], [Story_ID], [Field], [Value_Prev], [Value_New]) VALUES (N'v-petxu', CAST(N'2016-08-24T13:05:01.793' AS DateTime), 5, N'StoryStatus', N'99', N'1')
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'v-petxu', CAST(N'2016-08-24T09:36:22.343' AS DateTime), 3, 4, 62)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'v-petxu', CAST(N'2016-08-24T09:36:28.053' AS DateTime), 1, 5, 8)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'v-petxu', CAST(N'2016-08-24T09:36:49.977' AS DateTime), 3, 62, 10)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'v-petxu', CAST(N'2016-08-24T09:36:51.123' AS DateTime), 3, 10, 62)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'v-petxu', CAST(N'2016-08-24T09:36:52.483' AS DateTime), 3, 62, 5)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'v-petxu', CAST(N'2016-08-24T09:37:11.230' AS DateTime), 1, 8, 62)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'v-petxu', CAST(N'2016-08-24T10:09:54.810' AS DateTime), 1, 62, 8)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'', CAST(N'2016-08-24T11:40:48.703' AS DateTime), 3, 5, 4)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'', CAST(N'2016-08-24T11:41:21.387' AS DateTime), 3, 4, 5)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'', CAST(N'2016-08-24T11:41:44.300' AS DateTime), 4, 0, 4)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'', CAST(N'2016-08-24T11:42:05.393' AS DateTime), 4, 4, 5)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'v-petxu', CAST(N'2016-07-14T12:42:14.273' AS DateTime), 0, 0, 4)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'v-petxu', CAST(N'2016-07-14T12:53:16.393' AS DateTime), 0, 0, 4)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'v-petxu', CAST(N'2016-07-14T13:09:31.657' AS DateTime), 0, 0, 4)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'v-petxu', CAST(N'2016-07-14T13:15:08.447' AS DateTime), 0, 0, 4)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'v-petxu', CAST(N'2016-07-14T13:48:43.947' AS DateTime), 0, 0, 4)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'v-petxu', CAST(N'2016-07-14T13:51:28.763' AS DateTime), 0, 0, 4)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'v-petxu', CAST(N'2016-07-14T13:55:26.257' AS DateTime), 0, 0, 4)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'v-petxu', CAST(N'2016-07-14T13:57:29.747' AS DateTime), 0, 0, 4)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'v-petxu', CAST(N'2016-07-14T13:59:22.457' AS DateTime), 1, 0, 4)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'v-petxu', CAST(N'2016-07-14T14:06:58.963' AS DateTime), 0, 0, 4)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'v-petxu', CAST(N'2016-07-14T14:08:14.283' AS DateTime), 2, 0, 4)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'v-petxu', CAST(N'2016-07-14T14:10:14.403' AS DateTime), 0, 0, 4)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'v-petxu', CAST(N'2016-07-14T14:15:00.263' AS DateTime), 3, 0, 4)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'v-petxu', CAST(N'2016-07-14T14:15:12.217' AS DateTime), 1, 4, 5)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'', CAST(N'2016-08-24T11:46:24.157' AS DateTime), 3, 5, 4)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'', CAST(N'2016-08-24T11:46:25.173' AS DateTime), 4, 5, 4)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'', CAST(N'2016-08-24T11:48:19.257' AS DateTime), 4, 4, 5)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'', CAST(N'2016-08-24T11:48:20.797' AS DateTime), 4, 5, 4)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'', CAST(N'2016-08-24T11:48:24.387' AS DateTime), 1, 8, 62)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'', CAST(N'2016-08-24T11:48:28.483' AS DateTime), 1, 62, 8)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'v-petxu', CAST(N'2016-08-24T13:11:48.297' AS DateTime), 1, 8, 4)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'v-petxu', CAST(N'2016-08-24T13:13:00.857' AS DateTime), 7, 8, 4)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'v-petxu', CAST(N'2016-08-24T13:25:43.720' AS DateTime), 8, 0, 4)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'v-petxu', CAST(N'2016-08-24T13:25:50.767' AS DateTime), 9, 0, 4)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'v-petxu', CAST(N'2016-08-24T13:28:11.077' AS DateTime), 9, 4, 5)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'v-petxu', CAST(N'2016-08-24T13:28:17.193' AS DateTime), 8, 4, 5)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'v-petxu', CAST(N'2016-08-24T13:31:36.303' AS DateTime), 9, 5, 8)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'v-petxu', CAST(N'2016-08-24T13:31:37.753' AS DateTime), 8, 5, 8)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'v-petxu', CAST(N'2016-08-24T12:57:04.200' AS DateTime), 4, 4, 8)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'v-petxu', CAST(N'2016-08-24T12:57:36.973' AS DateTime), 4, 8, 62)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'v-petxu', CAST(N'2016-08-24T13:04:52.483' AS DateTime), 5, 0, 4)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'v-petxu', CAST(N'2016-08-24T13:05:35.363' AS DateTime), 5, 4, 5)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'v-petxu', CAST(N'2016-08-24T13:05:41.837' AS DateTime), 5, 5, 4)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'v-petxu', CAST(N'2016-08-24T13:05:48.867' AS DateTime), 6, 0, 4)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'v-petxu', CAST(N'2016-08-24T13:06:00.980' AS DateTime), 7, 0, 4)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'v-petxu', CAST(N'2016-08-24T13:06:03.750' AS DateTime), 6, 4, 5)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'v-petxu', CAST(N'2016-08-24T13:06:06.827' AS DateTime), 5, 4, 5)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'v-petxu', CAST(N'2016-08-24T13:06:56.113' AS DateTime), 5, 5, 8)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'v-petxu', CAST(N'2016-08-24T13:06:58.513' AS DateTime), 6, 5, 8)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'v-petxu', CAST(N'2016-08-24T13:07:05.380' AS DateTime), 6, 8, 5)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'v-petxu', CAST(N'2016-08-24T13:07:27.493' AS DateTime), 6, 5, 8)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'v-petxu', CAST(N'2016-08-24T13:07:34.447' AS DateTime), 6, 8, 11)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'v-petxu', CAST(N'2016-08-24T13:07:50.023' AS DateTime), 6, 11, 10)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'v-petxu', CAST(N'2016-08-24T13:09:23.763' AS DateTime), 5, 8, 62)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'v-petxu', CAST(N'2016-08-24T13:10:38.783' AS DateTime), 7, 4, 5)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'v-petxu', CAST(N'2016-08-24T13:10:53.403' AS DateTime), 7, 5, 8)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'', CAST(N'2017-02-27T19:12:00.400' AS DateTime), 1, 4, 5)
INSERT [dbo].[KanBan_Story_StatusLog] ([Alias], [CurDatetime], [Story_ID], [Status_Prev], [Status_New]) VALUES (N'', CAST(N'2016-08-24T11:40:45.287' AS DateTime), 2, 1, 10)
INSERT [dbo].[KanBan_Story_StatusLog] ([Alias], [CurDatetime], [Story_ID], [Status_Prev], [Status_New]) VALUES (N'', CAST(N'2016-08-24T11:41:44.300' AS DateTime), 4, 0, 1)
INSERT [dbo].[KanBan_Story_StatusLog] ([Alias], [CurDatetime], [Story_ID], [Status_Prev], [Status_New]) VALUES (N'', CAST(N'2016-08-24T11:46:57.443' AS DateTime), 3, 1, 99)
INSERT [dbo].[KanBan_Story_StatusLog] ([Alias], [CurDatetime], [Story_ID], [Status_Prev], [Status_New]) VALUES (N'v-petxu', CAST(N'2016-08-24T13:04:52.483' AS DateTime), 5, 0, 1)
INSERT [dbo].[KanBan_Story_StatusLog] ([Alias], [CurDatetime], [Story_ID], [Status_Prev], [Status_New]) VALUES (N'v-petxu', CAST(N'2016-08-24T13:06:00.980' AS DateTime), 7, 0, 1)
INSERT [dbo].[KanBan_Story_StatusLog] ([Alias], [CurDatetime], [Story_ID], [Status_Prev], [Status_New]) VALUES (N'v-petxu', CAST(N'2016-08-24T13:25:43.717' AS DateTime), 8, 0, 1)
INSERT [dbo].[KanBan_Story_StatusLog] ([Alias], [CurDatetime], [Story_ID], [Status_Prev], [Status_New]) VALUES (N'v-petxu', CAST(N'2016-08-24T13:25:50.767' AS DateTime), 9, 0, 1)
INSERT [dbo].[KanBan_Story_StatusLog] ([Alias], [CurDatetime], [Story_ID], [Status_Prev], [Status_New]) VALUES (N'v-petxu', CAST(N'2016-08-24T13:05:48.867' AS DateTime), 6, 0, 1)
INSERT [dbo].[KanBan_Story_StatusLog] ([Alias], [CurDatetime], [Story_ID], [Status_Prev], [Status_New]) VALUES (N'v-petxu', CAST(N'2016-07-14T12:42:14.270' AS DateTime), 0, 0, 1)
INSERT [dbo].[KanBan_Story_StatusLog] ([Alias], [CurDatetime], [Story_ID], [Status_Prev], [Status_New]) VALUES (N'v-petxu', CAST(N'2016-07-14T12:53:16.393' AS DateTime), 0, 0, 1)
INSERT [dbo].[KanBan_Story_StatusLog] ([Alias], [CurDatetime], [Story_ID], [Status_Prev], [Status_New]) VALUES (N'v-petxu', CAST(N'2016-07-14T13:09:31.657' AS DateTime), 0, 0, 1)
INSERT [dbo].[KanBan_Story_StatusLog] ([Alias], [CurDatetime], [Story_ID], [Status_Prev], [Status_New]) VALUES (N'v-petxu', CAST(N'2016-07-14T13:15:08.447' AS DateTime), 0, 0, 1)
INSERT [dbo].[KanBan_Story_StatusLog] ([Alias], [CurDatetime], [Story_ID], [Status_Prev], [Status_New]) VALUES (N'v-petxu', CAST(N'2016-07-14T13:48:43.947' AS DateTime), 0, 0, 1)
INSERT [dbo].[KanBan_Story_StatusLog] ([Alias], [CurDatetime], [Story_ID], [Status_Prev], [Status_New]) VALUES (N'v-petxu', CAST(N'2016-07-14T13:51:28.763' AS DateTime), 0, 0, 1)
INSERT [dbo].[KanBan_Story_StatusLog] ([Alias], [CurDatetime], [Story_ID], [Status_Prev], [Status_New]) VALUES (N'v-petxu', CAST(N'2016-07-14T13:55:26.253' AS DateTime), 0, 0, 1)
INSERT [dbo].[KanBan_Story_StatusLog] ([Alias], [CurDatetime], [Story_ID], [Status_Prev], [Status_New]) VALUES (N'v-petxu', CAST(N'2016-07-14T13:57:29.747' AS DateTime), 0, 0, 1)
INSERT [dbo].[KanBan_Story_StatusLog] ([Alias], [CurDatetime], [Story_ID], [Status_Prev], [Status_New]) VALUES (N'v-petxu', CAST(N'2016-07-14T13:59:22.457' AS DateTime), 1, 0, 1)
INSERT [dbo].[KanBan_Story_StatusLog] ([Alias], [CurDatetime], [Story_ID], [Status_Prev], [Status_New]) VALUES (N'v-petxu', CAST(N'2016-07-14T14:06:58.960' AS DateTime), 0, 0, 1)
INSERT [dbo].[KanBan_Story_StatusLog] ([Alias], [CurDatetime], [Story_ID], [Status_Prev], [Status_New]) VALUES (N'v-petxu', CAST(N'2016-07-14T14:08:14.280' AS DateTime), 2, 0, 1)
INSERT [dbo].[KanBan_Story_StatusLog] ([Alias], [CurDatetime], [Story_ID], [Status_Prev], [Status_New]) VALUES (N'v-petxu', CAST(N'2016-07-14T14:10:14.403' AS DateTime), 0, 0, 1)
INSERT [dbo].[KanBan_Story_StatusLog] ([Alias], [CurDatetime], [Story_ID], [Status_Prev], [Status_New]) VALUES (N'v-petxu', CAST(N'2016-07-14T14:15:00.260' AS DateTime), 3, 0, 1)
SET IDENTITY_INSERT [dbo].[KanBan_SwimLane] ON 

INSERT [dbo].[KanBan_SwimLane] ([ID], [Name], [KanBan_ID], [Status], [Type]) VALUES (90, N'Preparing GBT Data', 1, 1, 1)
INSERT [dbo].[KanBan_SwimLane] ([ID], [Name], [KanBan_ID], [Status], [Type]) VALUES (91, N'GTW feature 01', 1, 1, 1)
INSERT [dbo].[KanBan_SwimLane] ([ID], [Name], [KanBan_ID], [Status], [Type]) VALUES (92, N'Feature 1', 1, 1, 1)
INSERT [dbo].[KanBan_SwimLane] ([ID], [Name], [KanBan_ID], [Status], [Type]) VALUES (93, N'Feature 1', 1, 1, 1)
SET IDENTITY_INSERT [dbo].[KanBan_SwimLane] OFF
INSERT [dbo].[KanBan_SwimLane_StatusLog] ([Alias], [CurDatetime], [Lane_ID], [Status_Prev], [Status_New]) VALUES (N'v-petxu', CAST(N'2016-07-14T12:39:35.840' AS DateTime), 90, 0, 1)
INSERT [dbo].[KanBan_SwimLane_StatusLog] ([Alias], [CurDatetime], [Lane_ID], [Status_Prev], [Status_New]) VALUES (N'v-petxu', CAST(N'2016-07-14T14:13:12.477' AS DateTime), 91, 0, 1)
INSERT [dbo].[KanBan_SwimLane_StatusLog] ([Alias], [CurDatetime], [Lane_ID], [Status_Prev], [Status_New]) VALUES (N'v-petxu', CAST(N'2016-08-24T13:04:11.420' AS DateTime), 92, 0, 1)
INSERT [dbo].[KanBan_SwimLane_StatusLog] ([Alias], [CurDatetime], [Lane_ID], [Status_Prev], [Status_New]) VALUES (N'v-petxu', CAST(N'2016-08-24T13:25:12.520' AS DateTime), 93, 0, 1)
SET IDENTITY_INSERT [dbo].[KanBan_TFS_Server] ON 

INSERT [dbo].[KanBan_TFS_Server] ([ID], [Server], [Collection], [Project]) VALUES (1, N'http://vstfmbs:8080/tfs/', N'MBS', N'AX6')
INSERT [dbo].[KanBan_TFS_Server] ([ID], [Server], [Collection], [Project]) VALUES (2, N'http://vstfmbs:8080/tfs/', N'MBS', N'Compliance')
INSERT [dbo].[KanBan_TFS_Server] ([ID], [Server], [Collection], [Project]) VALUES (3, N'http://vstfmbs:8080/tfs/', N'MBS', N'DAXSE')
INSERT [dbo].[KanBan_TFS_Server] ([ID], [Server], [Collection], [Project]) VALUES (4, N'http://vstfmbs:8080/tfs/', N'MBS', N'Dynamics')
SET IDENTITY_INSERT [dbo].[KanBan_TFS_Server] OFF
SET IDENTITY_INSERT [dbo].[KanBan_User] ON 

INSERT [dbo].[KanBan_User] ([ID], [Alias], [FirstName], [LastName], [Role], [Status], [KanBan_ID]) VALUES (1, N'v-petxu', N'Peter', N'Xu', 1, 1, 1)
INSERT [dbo].[KanBan_User] ([ID], [Alias], [FirstName], [LastName], [Role], [Status], [KanBan_ID]) VALUES (118, N'v-petxu', N'Peter', N'Xu', 7, 1, 1)
SET IDENTITY_INSERT [dbo].[KanBan_User] OFF
SET IDENTITY_INSERT [dbo].[SYS_User] ON 

INSERT [dbo].[SYS_User] ([ID], [Alias], [Status], [Config_TicketColor]) VALUES (2, N'v-petxu', 1, 1)
INSERT [dbo].[SYS_User] ([ID], [Alias], [Status], [Config_TicketColor]) VALUES (3, N'', 1, 1)
SET IDENTITY_INSERT [dbo].[SYS_User] OFF
ALTER TABLE [dbo].[KanBan] ADD  CONSTRAINT [DF_KanBan_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[KanBan_Column] ADD  CONSTRAINT [DF_KanBan_Column_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[KanBan_Column] ADD  CONSTRAINT [DF_KanBan_Column_Type]  DEFAULT ((1)) FOR [Type]
GO
ALTER TABLE [dbo].[KanBan_Column_Checklist] ADD  CONSTRAINT [DF_KanBan_Column_Checklist_Status]  DEFAULT ((0)) FOR [Status]
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
ALTER TABLE [dbo].[KanBan_Story_Check] ADD  CONSTRAINT [DF_KanBan_Story_Check_Checked]  DEFAULT ((0)) FOR [Checked]
GO
ALTER TABLE [dbo].[KanBan_SwimLane] ADD  CONSTRAINT [DF_KanBan_SwimLane_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[KanBan_User] ADD  CONSTRAINT [DF_KanBan_User_Status]  DEFAULT ((1)) FOR [Status]
GO
USE [master]
GO
ALTER DATABASE [KanBan] SET  READ_WRITE 
GO
