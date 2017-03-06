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
/****** Object:  Table [dbo].[SYS_User]    Script Date: 3/6/2017 2:57:13 PM ******/
DROP TABLE [dbo].[SYS_User]
GO
/****** Object:  Table [dbo].[KanBan_User]    Script Date: 3/6/2017 2:57:13 PM ******/
DROP TABLE [dbo].[KanBan_User]
GO
/****** Object:  Table [dbo].[KanBan_TFS_WIQ]    Script Date: 3/6/2017 2:57:13 PM ******/
DROP TABLE [dbo].[KanBan_TFS_WIQ]
GO
/****** Object:  Table [dbo].[KanBan_TFS_Server]    Script Date: 3/6/2017 2:57:13 PM ******/
DROP TABLE [dbo].[KanBan_TFS_Server]
GO
/****** Object:  Table [dbo].[KanBan_SwimLane_StatusLog]    Script Date: 3/6/2017 2:57:13 PM ******/
DROP TABLE [dbo].[KanBan_SwimLane_StatusLog]
GO
/****** Object:  Index [ClusteredIndex-20170303-170033]    Script Date: 3/6/2017 2:57:13 PM ******/
DROP INDEX [ClusteredIndex-20170303-170033] ON [dbo].[KanBan_SwimLane] WITH ( ONLINE = OFF )
GO
/****** Object:  Table [dbo].[KanBan_SwimLane]    Script Date: 3/6/2017 2:57:13 PM ******/
DROP TABLE [dbo].[KanBan_SwimLane]
GO
/****** Object:  Table [dbo].[KanBan_Story_StatusLog]    Script Date: 3/6/2017 2:57:13 PM ******/
DROP TABLE [dbo].[KanBan_Story_StatusLog]
GO
/****** Object:  Table [dbo].[KanBan_Story_ColumnLog]    Script Date: 3/6/2017 2:57:13 PM ******/
DROP TABLE [dbo].[KanBan_Story_ColumnLog]
GO
/****** Object:  Table [dbo].[KanBan_Story_Check]    Script Date: 3/6/2017 2:57:13 PM ******/
DROP TABLE [dbo].[KanBan_Story_Check]
GO
/****** Object:  Table [dbo].[KanBan_Story_ChangeLog]    Script Date: 3/6/2017 2:57:13 PM ******/
DROP TABLE [dbo].[KanBan_Story_ChangeLog]
GO
/****** Object:  Table [dbo].[KanBan_Story]    Script Date: 3/6/2017 2:57:13 PM ******/
DROP TABLE [dbo].[KanBan_Story]
GO
/****** Object:  Table [dbo].[KanBan_Cycle_Period_Status]    Script Date: 3/6/2017 2:57:13 PM ******/
DROP TABLE [dbo].[KanBan_Cycle_Period_Status]
GO
/****** Object:  Table [dbo].[KanBan_Cycle_Period]    Script Date: 3/6/2017 2:57:13 PM ******/
DROP TABLE [dbo].[KanBan_Cycle_Period]
GO
/****** Object:  Table [dbo].[KanBan_Cycle]    Script Date: 3/6/2017 2:57:13 PM ******/
DROP TABLE [dbo].[KanBan_Cycle]
GO
/****** Object:  Table [dbo].[KanBan_ColumnGroup_Mapping]    Script Date: 3/6/2017 2:57:13 PM ******/
DROP TABLE [dbo].[KanBan_ColumnGroup_Mapping]
GO
/****** Object:  Table [dbo].[KanBan_ColumnGroup]    Script Date: 3/6/2017 2:57:13 PM ******/
DROP TABLE [dbo].[KanBan_ColumnGroup]
GO
/****** Object:  Table [dbo].[KanBan_Column_Checklist_Mapping]    Script Date: 3/6/2017 2:57:13 PM ******/
DROP TABLE [dbo].[KanBan_Column_Checklist_Mapping]
GO
/****** Object:  Table [dbo].[KanBan_Column_Checklist]    Script Date: 3/6/2017 2:57:14 PM ******/
DROP TABLE [dbo].[KanBan_Column_Checklist]
GO
/****** Object:  Table [dbo].[KanBan_Column_Check]    Script Date: 3/6/2017 2:57:14 PM ******/
DROP TABLE [dbo].[KanBan_Column_Check]
GO
/****** Object:  Table [dbo].[KanBan_Column]    Script Date: 3/6/2017 2:57:14 PM ******/
DROP TABLE [dbo].[KanBan_Column]
GO
/****** Object:  Table [dbo].[KanBan_Assignment]    Script Date: 3/6/2017 2:57:14 PM ******/
DROP TABLE [dbo].[KanBan_Assignment]
GO
/****** Object:  Table [dbo].[KanBan]    Script Date: 3/6/2017 2:57:14 PM ******/
DROP TABLE [dbo].[KanBan]
GO
/****** Object:  User [KanBan_User]    Script Date: 3/6/2017 2:57:14 PM ******/
DROP USER [KanBan_User]
GO
/****** Object:  User [KanBan_User]    Script Date: 3/6/2017 2:57:14 PM ******/
CREATE USER [KanBan_User] FOR LOGIN [KanBan_User] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [KanBan_User]
GO
ALTER ROLE [db_datareader] ADD MEMBER [KanBan_User]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [KanBan_User]
GO
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
	[StoryID] [bigint] NOT NULL,
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
/****** Object:  Table [dbo].[KanBan_Column_Checklist]    Script Date: 3/6/2017 2:57:14 PM ******/
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
/****** Object:  Table [dbo].[KanBan_Column_Checklist_Mapping]    Script Date: 3/6/2017 2:57:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KanBan_Column_Checklist_Mapping](
	[Checklist_ID] [bigint] NOT NULL,
	[CheckItem_ID] [bigint] NOT NULL
) ON [PRIMARY]

GO
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
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KanBan_ColumnGroup_Mapping](
	[ColumnGroup_ID] [bigint] NOT NULL,
	[Column_ID] [bigint] NOT NULL
) ON [PRIMARY]

GO
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
/****** Object:  Table [dbo].[KanBan_Story_ChangeLog]    Script Date: 3/6/2017 2:57:15 PM ******/
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
/****** Object:  Table [dbo].[KanBan_Story_Check]    Script Date: 3/6/2017 2:57:15 PM ******/
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
/****** Object:  Table [dbo].[KanBan_Story_ColumnLog]    Script Date: 3/6/2017 2:57:15 PM ******/
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
/****** Object:  Table [dbo].[KanBan_Story_StatusLog]    Script Date: 3/6/2017 2:57:15 PM ******/
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
/****** Object:  Table [dbo].[KanBan_TFS_Server]    Script Date: 3/6/2017 2:57:15 PM ******/
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
/****** Object:  Table [dbo].[KanBan_TFS_WIQ]    Script Date: 3/6/2017 2:57:15 PM ******/
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
SET IDENTITY_INSERT [dbo].[KanBan] ON 

INSERT [dbo].[KanBan] ([ID], [Name], [Status]) VALUES (1, N'Huamei Dept.II KanBan', 1)
SET IDENTITY_INSERT [dbo].[KanBan] OFF
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
SET IDENTITY_INSERT [dbo].[KanBan_Column] ON 

INSERT [dbo].[KanBan_Column] ([ID], [Seq], [Name], [KanBan_ID], [Status], [Type], [RoleType], [TraceType], [Link]) VALUES (1, 1, N'To Do', 1, 1, 1, 1, 0, N'')
INSERT [dbo].[KanBan_Column] ([ID], [Seq], [Name], [KanBan_ID], [Status], [Type], [RoleType], [TraceType], [Link]) VALUES (2, 2, N'Coding', 1, 1, 1, 1, 0, N'')
INSERT [dbo].[KanBan_Column] ([ID], [Seq], [Name], [KanBan_ID], [Status], [Type], [RoleType], [TraceType], [Link]) VALUES (3, 3, N'Review', 1, 1, 1, 1, 0, N'')
INSERT [dbo].[KanBan_Column] ([ID], [Seq], [Name], [KanBan_ID], [Status], [Type], [RoleType], [TraceType], [Link]) VALUES (4, 4, N'Testing', 1, 1, 1, 1, 0, N'')
INSERT [dbo].[KanBan_Column] ([ID], [Seq], [Name], [KanBan_ID], [Status], [Type], [RoleType], [TraceType], [Link]) VALUES (5, 5, N'Done', 1, 1, 1, 1, 0, N'')
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

INSERT [dbo].[KanBan_ColumnGroup] ([ID], [KanBan_ID], [Name], [Seq]) VALUES (24, 1, N'To Do', 1)
INSERT [dbo].[KanBan_ColumnGroup] ([ID], [KanBan_ID], [Name], [Seq]) VALUES (25, 1, N'Coding', 2)
INSERT [dbo].[KanBan_ColumnGroup] ([ID], [KanBan_ID], [Name], [Seq]) VALUES (26, 1, N'Review', 3)
INSERT [dbo].[KanBan_ColumnGroup] ([ID], [KanBan_ID], [Name], [Seq]) VALUES (27, 1, N'Testing', 4)
INSERT [dbo].[KanBan_ColumnGroup] ([ID], [KanBan_ID], [Name], [Seq]) VALUES (28, 1, N'Done', 5)
SET IDENTITY_INSERT [dbo].[KanBan_ColumnGroup] OFF
INSERT [dbo].[KanBan_ColumnGroup_Mapping] ([ColumnGroup_ID], [Column_ID]) VALUES (24, 1)
INSERT [dbo].[KanBan_ColumnGroup_Mapping] ([ColumnGroup_ID], [Column_ID]) VALUES (25, 2)
INSERT [dbo].[KanBan_ColumnGroup_Mapping] ([ColumnGroup_ID], [Column_ID]) VALUES (26, 3)
INSERT [dbo].[KanBan_ColumnGroup_Mapping] ([ColumnGroup_ID], [Column_ID]) VALUES (27, 4)
INSERT [dbo].[KanBan_ColumnGroup_Mapping] ([ColumnGroup_ID], [Column_ID]) VALUES (28, 5)
SET IDENTITY_INSERT [dbo].[KanBan_Cycle] ON 

INSERT [dbo].[KanBan_Cycle] ([ID], [KanBan_ID], [Name], [IsDefault]) VALUES (1, 1, N'Default Calendar', 1)
SET IDENTITY_INSERT [dbo].[KanBan_Cycle] OFF
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
GO
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (100, 1, 1, N'C2.49', CAST(N'2018-11-25' AS Date), CAST(N'2018-12-01' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (101, 1, 1, N'C2.50', CAST(N'2018-12-02' AS Date), CAST(N'2018-12-08' AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (102, 1, 1, N'C2.51', CAST(N'2018-12-09' AS Date), CAST(N'2018-12-15' AS Date))
SET IDENTITY_INSERT [dbo].[KanBan_Cycle_Period] OFF
SET IDENTITY_INSERT [dbo].[KanBan_Story] ON 

INSERT [dbo].[KanBan_Story] ([ID], [Name], [TFS], [TFS_Server], [Description], [DueDate], [PMWork], [TestWork], [DevWork], [PMWorkEst], [TestWorkEst], [DevWorkEst], [StoryStatus], [StoryType], [TaskType], [SwimLane_ID], [KanBan_ID], [Prior], [Status], [StageDueDate]) VALUES (30, N'3815705', 0, 1, N'', CAST(N'2017-03-10' AS Date), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), 4, 10, 1, 108, 1, 3, 1, CAST(N'2017-03-10' AS Date))
INSERT [dbo].[KanBan_Story] ([ID], [Name], [TFS], [TFS_Server], [Description], [DueDate], [PMWork], [TestWork], [DevWork], [PMWorkEst], [TestWorkEst], [DevWorkEst], [StoryStatus], [StoryType], [TaskType], [SwimLane_ID], [KanBan_ID], [Prior], [Status], [StageDueDate]) VALUES (31, N'3815327', 0, 1, N'', CAST(N'2017-03-10' AS Date), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), 4, 10, 1, 108, 1, 3, 1, CAST(N'2017-03-10' AS Date))
INSERT [dbo].[KanBan_Story] ([ID], [Name], [TFS], [TFS_Server], [Description], [DueDate], [PMWork], [TestWork], [DevWork], [PMWorkEst], [TestWorkEst], [DevWorkEst], [StoryStatus], [StoryType], [TaskType], [SwimLane_ID], [KanBan_ID], [Prior], [Status], [StageDueDate]) VALUES (32, N'3809904', 0, 1, N'', CAST(N'2017-03-10' AS Date), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), 4, 10, 1, 108, 1, 3, 1, CAST(N'2017-03-10' AS Date))
INSERT [dbo].[KanBan_Story] ([ID], [Name], [TFS], [TFS_Server], [Description], [DueDate], [PMWork], [TestWork], [DevWork], [PMWorkEst], [TestWorkEst], [DevWorkEst], [StoryStatus], [StoryType], [TaskType], [SwimLane_ID], [KanBan_ID], [Prior], [Status], [StageDueDate]) VALUES (33, N'3810468', 0, 1, N'', CAST(N'2017-03-10' AS Date), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), 4, 10, 1, 108, 1, 3, 1, CAST(N'2017-03-10' AS Date))
INSERT [dbo].[KanBan_Story] ([ID], [Name], [TFS], [TFS_Server], [Description], [DueDate], [PMWork], [TestWork], [DevWork], [PMWorkEst], [TestWorkEst], [DevWorkEst], [StoryStatus], [StoryType], [TaskType], [SwimLane_ID], [KanBan_ID], [Prior], [Status], [StageDueDate]) VALUES (34, N'3813489', 0, 1, N'', CAST(N'2017-03-10' AS Date), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), 3, 2, 1, 107, 1, 2, 1, CAST(N'2017-03-10' AS Date))
INSERT [dbo].[KanBan_Story] ([ID], [Name], [TFS], [TFS_Server], [Description], [DueDate], [PMWork], [TestWork], [DevWork], [PMWorkEst], [TestWorkEst], [DevWorkEst], [StoryStatus], [StoryType], [TaskType], [SwimLane_ID], [KanBan_ID], [Prior], [Status], [StageDueDate]) VALUES (35, N'3811295', 0, 1, N'', CAST(N'2017-03-10' AS Date), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), 3, 2, 1, 107, 1, 3, 1, CAST(N'2017-03-10' AS Date))
INSERT [dbo].[KanBan_Story] ([ID], [Name], [TFS], [TFS_Server], [Description], [DueDate], [PMWork], [TestWork], [DevWork], [PMWorkEst], [TestWorkEst], [DevWorkEst], [StoryStatus], [StoryType], [TaskType], [SwimLane_ID], [KanBan_ID], [Prior], [Status], [StageDueDate]) VALUES (36, N'3808685', 0, 1, N'', CAST(N'2017-03-10' AS Date), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), 3, 2, 1, 107, 1, 3, 1, CAST(N'2017-03-10' AS Date))
INSERT [dbo].[KanBan_Story] ([ID], [Name], [TFS], [TFS_Server], [Description], [DueDate], [PMWork], [TestWork], [DevWork], [PMWorkEst], [TestWorkEst], [DevWorkEst], [StoryStatus], [StoryType], [TaskType], [SwimLane_ID], [KanBan_ID], [Prior], [Status], [StageDueDate]) VALUES (37, N'3794108', 0, 1, N'', CAST(N'2017-03-10' AS Date), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), 4, 10, 1, 107, 1, 3, 1, CAST(N'2017-03-10' AS Date))
INSERT [dbo].[KanBan_Story] ([ID], [Name], [TFS], [TFS_Server], [Description], [DueDate], [PMWork], [TestWork], [DevWork], [PMWorkEst], [TestWorkEst], [DevWorkEst], [StoryStatus], [StoryType], [TaskType], [SwimLane_ID], [KanBan_ID], [Prior], [Status], [StageDueDate]) VALUES (38, N'3812058', 0, 1, N'', CAST(N'2017-03-10' AS Date), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), 4, 10, 1, 107, 1, 3, 1, CAST(N'2017-03-10' AS Date))
INSERT [dbo].[KanBan_Story] ([ID], [Name], [TFS], [TFS_Server], [Description], [DueDate], [PMWork], [TestWork], [DevWork], [PMWorkEst], [TestWorkEst], [DevWorkEst], [StoryStatus], [StoryType], [TaskType], [SwimLane_ID], [KanBan_ID], [Prior], [Status], [StageDueDate]) VALUES (39, N'Project SO voucher testing', 0, 1, N'', CAST(N'2017-03-07' AS Date), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), 3, 1, 1, 106, 1, 1, 1, CAST(N'2017-03-07' AS Date))
INSERT [dbo].[KanBan_Story] ([ID], [Name], [TFS], [TFS_Server], [Description], [DueDate], [PMWork], [TestWork], [DevWork], [PMWorkEst], [TestWorkEst], [DevWorkEst], [StoryStatus], [StoryType], [TaskType], [SwimLane_ID], [KanBan_ID], [Prior], [Status], [StageDueDate]) VALUES (40, N'Project Expense voucher testing', 0, 1, N'', CAST(N'2017-03-07' AS Date), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), 2, 1, 1, 106, 1, 0, 1, CAST(N'2017-03-07' AS Date))
INSERT [dbo].[KanBan_Story] ([ID], [Name], [TFS], [TFS_Server], [Description], [DueDate], [PMWork], [TestWork], [DevWork], [PMWorkEst], [TestWorkEst], [DevWorkEst], [StoryStatus], [StoryType], [TaskType], [SwimLane_ID], [KanBan_ID], [Prior], [Status], [StageDueDate]) VALUES (41, N'PDF exporting', 0, 1, N'Fineline Shanghai', CAST(N'2017-03-08' AS Date), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), 1, 99, 1, 106, 1, 4, 1, CAST(N'2017-03-08' AS Date))
INSERT [dbo].[KanBan_Story] ([ID], [Name], [TFS], [TFS_Server], [Description], [DueDate], [PMWork], [TestWork], [DevWork], [PMWorkEst], [TestWorkEst], [DevWorkEst], [StoryStatus], [StoryType], [TaskType], [SwimLane_ID], [KanBan_ID], [Prior], [Status], [StageDueDate]) VALUES (42, N'3817013 Workflow REQ', 0, 1, N'', CAST(N'2017-03-10' AS Date), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), 1, 99, 1, 106, 1, 2, 1, CAST(N'2017-03-10' AS Date))
INSERT [dbo].[KanBan_Story] ([ID], [Name], [TFS], [TFS_Server], [Description], [DueDate], [PMWork], [TestWork], [DevWork], [PMWorkEst], [TestWorkEst], [DevWorkEst], [StoryStatus], [StoryType], [TaskType], [SwimLane_ID], [KanBan_ID], [Prior], [Status], [StageDueDate]) VALUES (43, N'3809208 RFQ line number', 0, 1, N'', CAST(N'2017-03-07' AS Date), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), 4, 10, 1, 106, 1, 2, 1, CAST(N'2017-03-07' AS Date))
INSERT [dbo].[KanBan_Story] ([ID], [Name], [TFS], [TFS_Server], [Description], [DueDate], [PMWork], [TestWork], [DevWork], [PMWorkEst], [TestWorkEst], [DevWorkEst], [StoryStatus], [StoryType], [TaskType], [SwimLane_ID], [KanBan_ID], [Prior], [Status], [StageDueDate]) VALUES (46, N'STO Automation in 2009', 0, 1, N'', CAST(N'2017-03-17' AS Date), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), 4, 1, 1, 112, 1, 2, 1, CAST(N'2017-03-17' AS Date))
INSERT [dbo].[KanBan_Story] ([ID], [Name], [TFS], [TFS_Server], [Description], [DueDate], [PMWork], [TestWork], [DevWork], [PMWorkEst], [TestWorkEst], [DevWorkEst], [StoryStatus], [StoryType], [TaskType], [SwimLane_ID], [KanBan_ID], [Prior], [Status], [StageDueDate]) VALUES (47, N'Transaction DP UT checkin', 0, 1, N'', CAST(N'1900-01-01' AS Date), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), 2, 1, 1, 112, 1, 3, 1, CAST(N'1900-01-01' AS Date))
INSERT [dbo].[KanBan_Story] ([ID], [Name], [TFS], [TFS_Server], [Description], [DueDate], [PMWork], [TestWork], [DevWork], [PMWorkEst], [TestWorkEst], [DevWorkEst], [StoryStatus], [StoryType], [TaskType], [SwimLane_ID], [KanBan_ID], [Prior], [Status], [StageDueDate]) VALUES (48, N'Transaction automation in R2 checkin', 0, 1, N'', CAST(N'1900-01-01' AS Date), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), 1, 99, 1, 112, 1, 3, 1, CAST(N'1900-01-01' AS Date))
INSERT [dbo].[KanBan_Story] ([ID], [Name], [TFS], [TFS_Server], [Description], [DueDate], [PMWork], [TestWork], [DevWork], [PMWorkEst], [TestWorkEst], [DevWorkEst], [StoryStatus], [StoryType], [TaskType], [SwimLane_ID], [KanBan_ID], [Prior], [Status], [StageDueDate]) VALUES (49, N'Misc charge test in 2009', 0, 1, N'', CAST(N'2017-03-06' AS Date), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), 4, 1, 1, 113, 1, 2, 1, CAST(N'2017-03-06' AS Date))
INSERT [dbo].[KanBan_Story] ([ID], [Name], [TFS], [TFS_Server], [Description], [DueDate], [PMWork], [TestWork], [DevWork], [PMWorkEst], [TestWorkEst], [DevWorkEst], [StoryStatus], [StoryType], [TaskType], [SwimLane_ID], [KanBan_ID], [Prior], [Status], [StageDueDate]) VALUES (50, N'Automation for Tax Settlement', 0, 1, N'', CAST(N'2017-03-24' AS Date), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), 2, 1, 1, 114, 1, 2, 1, CAST(N'2017-03-24' AS Date))
INSERT [dbo].[KanBan_Story] ([ID], [Name], [TFS], [TFS_Server], [Description], [DueDate], [PMWork], [TestWork], [DevWork], [PMWorkEst], [TestWorkEst], [DevWorkEst], [StoryStatus], [StoryType], [TaskType], [SwimLane_ID], [KanBan_ID], [Prior], [Status], [StageDueDate]) VALUES (51, N'Projects downport to 2009', 0, 1, N'', CAST(N'2017-03-17' AS Date), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), 2, 1, 1, 115, 1, 2, 1, CAST(N'2017-03-17' AS Date))
INSERT [dbo].[KanBan_Story] ([ID], [Name], [TFS], [TFS_Server], [Description], [DueDate], [PMWork], [TestWork], [DevWork], [PMWorkEst], [TestWorkEst], [DevWorkEst], [StoryStatus], [StoryType], [TaskType], [SwimLane_ID], [KanBan_ID], [Prior], [Status], [StageDueDate]) VALUES (52, N'Projects DB UT downport to 2009', 0, 1, N'', CAST(N'1900-01-01' AS Date), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), 1, 99, 1, 115, 1, 3, 1, CAST(N'1900-01-01' AS Date))
INSERT [dbo].[KanBan_Story] ([ID], [Name], [TFS], [TFS_Server], [Description], [DueDate], [PMWork], [TestWork], [DevWork], [PMWorkEst], [TestWorkEst], [DevWorkEst], [StoryStatus], [StoryType], [TaskType], [SwimLane_ID], [KanBan_ID], [Prior], [Status], [StageDueDate]) VALUES (53, N'63 Regression to 62', 1, 3, N'Validate&Down porting 11 regression bug in DAX63 to DAX62
Code defect:3812770/ 3809235
TAE Test Issue: 3808863/ 3809131/ 3808847/ 3809208/ 3810021
UTC Test Issue: 3808584/ 3806145/ 3811004/ 3809118', CAST(N'2017-03-08' AS Date), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), 2, 1, 1, 117, 1, 1, 1, CAST(N'2017-03-08' AS Date))
INSERT [dbo].[KanBan_Story] ([ID], [Name], [TFS], [TFS_Server], [Description], [DueDate], [PMWork], [TestWork], [DevWork], [PMWorkEst], [TestWorkEst], [DevWorkEst], [StoryStatus], [StoryType], [TaskType], [SwimLane_ID], [KanBan_ID], [Prior], [Status], [StageDueDate]) VALUES (56, N'Fix R3 rebase merge issue', 0, 1, N'', CAST(N'2017-03-03' AS Date), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), 2, 1, 1, 124, 1, 2, 1, CAST(N'2017-03-03' AS Date))
INSERT [dbo].[KanBan_Story] ([ID], [Name], [TFS], [TFS_Server], [Description], [DueDate], [PMWork], [TestWork], [DevWork], [PMWorkEst], [TestWorkEst], [DevWorkEst], [StoryStatus], [StoryType], [TaskType], [SwimLane_ID], [KanBan_ID], [Prior], [Status], [StageDueDate]) VALUES (58, N'WHT bug fix for AX2009- PO, SO，FTI, Journal.', 0, 1, N'', CAST(N'2017-03-08' AS Date), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), 3, 1, 1, 126, 1, 2, 1, CAST(N'2017-03-08' AS Date))
INSERT [dbo].[KanBan_Story] ([ID], [Name], [TFS], [TFS_Server], [Description], [DueDate], [PMWork], [TestWork], [DevWork], [PMWorkEst], [TestWorkEst], [DevWorkEst], [StoryStatus], [StoryType], [TaskType], [SwimLane_ID], [KanBan_ID], [Prior], [Status], [StageDueDate]) VALUES (59, N'WHT for AX2009- Project', 0, 1, N'Pending on Gray''s Projects', CAST(N'2017-03-10' AS Date), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), 1, 2, 1, 126, 1, 2, 1, CAST(N'2017-03-10' AS Date))
INSERT [dbo].[KanBan_Story] ([ID], [Name], [TFS], [TFS_Server], [Description], [DueDate], [PMWork], [TestWork], [DevWork], [PMWorkEst], [TestWorkEst], [DevWorkEst], [StoryStatus], [StoryType], [TaskType], [SwimLane_ID], [KanBan_ID], [Prior], [Status], [StageDueDate]) VALUES (60, N'WHT Automation for AX2009 ', 0, 1, N'', CAST(N'2017-03-10' AS Date), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), 2, 1, 1, 126, 1, 0, 1, CAST(N'2017-03-10' AS Date))
INSERT [dbo].[KanBan_Story] ([ID], [Name], [TFS], [TFS_Server], [Description], [DueDate], [PMWork], [TestWork], [DevWork], [PMWorkEst], [TestWorkEst], [DevWorkEst], [StoryStatus], [StoryType], [TaskType], [SwimLane_ID], [KanBan_ID], [Prior], [Status], [StageDueDate]) VALUES (61, N'WHT Automation for AX63 - Project', 0, 1, N'Pending on Tommy''s automation', CAST(N'1900-01-01' AS Date), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), 1, 2, 1, 126, 1, 2, 1, CAST(N'1900-01-01' AS Date))
INSERT [dbo].[KanBan_Story] ([ID], [Name], [TFS], [TFS_Server], [Description], [DueDate], [PMWork], [TestWork], [DevWork], [PMWorkEst], [TestWorkEst], [DevWorkEst], [StoryStatus], [StoryType], [TaskType], [SwimLane_ID], [KanBan_ID], [Prior], [Status], [StageDueDate]) VALUES (62, N'WHT Testing for R3, R2, AX2009', 0, 1, N'', CAST(N'2017-03-17' AS Date), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), 2, 1, 1, 126, 1, 3, 1, CAST(N'2017-03-17' AS Date))
INSERT [dbo].[KanBan_Story] ([ID], [Name], [TFS], [TFS_Server], [Description], [DueDate], [PMWork], [TestWork], [DevWork], [PMWorkEst], [TestWorkEst], [DevWorkEst], [StoryStatus], [StoryType], [TaskType], [SwimLane_ID], [KanBan_ID], [Prior], [Status], [StageDueDate]) VALUES (63, N'Rebase R2 GST code', 0, 1, N'', CAST(N'2017-03-06' AS Date), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), 2, 1, 1, 127, 1, 0, 1, CAST(N'2017-03-06' AS Date))
INSERT [dbo].[KanBan_Story] ([ID], [Name], [TFS], [TFS_Server], [Description], [DueDate], [PMWork], [TestWork], [DevWork], [PMWorkEst], [TestWorkEst], [DevWorkEst], [StoryStatus], [StoryType], [TaskType], [SwimLane_ID], [KanBan_ID], [Prior], [Status], [StageDueDate]) VALUES (64, N'5 Packages for AX2012 R2', 0, 1, N'Blocking by environment', CAST(N'1900-01-01' AS Date), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), 4, 3, 1, 123, 1, 1, 1, CAST(N'1900-01-01' AS Date))
INSERT [dbo].[KanBan_Story] ([ID], [Name], [TFS], [TFS_Server], [Description], [DueDate], [PMWork], [TestWork], [DevWork], [PMWorkEst], [TestWorkEst], [DevWorkEst], [StoryStatus], [StoryType], [TaskType], [SwimLane_ID], [KanBan_ID], [Prior], [Status], [StageDueDate]) VALUES (65, N'CFL - Environmen Issue', 0, 1, N'', CAST(N'1900-01-01' AS Date), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), 2, 3, 1, 123, 1, 3, 1, CAST(N'1900-01-01' AS Date))
INSERT [dbo].[KanBan_Story] ([ID], [Name], [TFS], [TFS_Server], [Description], [DueDate], [PMWork], [TestWork], [DevWork], [PMWorkEst], [TestWorkEst], [DevWorkEst], [StoryStatus], [StoryType], [TaskType], [SwimLane_ID], [KanBan_ID], [Prior], [Status], [StageDueDate]) VALUES (70, N'R3 Transaction Validation: Quality order', 0, 1, N'', CAST(N'2017-03-10' AS Date), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), 1, 99, 1, 125, 1, 2, 1, CAST(N'2017-03-10' AS Date))
INSERT [dbo].[KanBan_Story] ([ID], [Name], [TFS], [TFS_Server], [Description], [DueDate], [PMWork], [TestWork], [DevWork], [PMWorkEst], [TestWorkEst], [DevWorkEst], [StoryStatus], [StoryType], [TaskType], [SwimLane_ID], [KanBan_ID], [Prior], [Status], [StageDueDate]) VALUES (71, N'Machine Maintain R2 deploy on Terry-PC3', 0, 1, N'', CAST(N'2017-03-03' AS Date), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), 2, 1, 1, 125, 1, 2, 1, CAST(N'2017-03-03' AS Date))
INSERT [dbo].[KanBan_Story] ([ID], [Name], [TFS], [TFS_Server], [Description], [DueDate], [PMWork], [TestWork], [DevWork], [PMWorkEst], [TestWorkEst], [DevWorkEst], [StoryStatus], [StoryType], [TaskType], [SwimLane_ID], [KanBan_ID], [Prior], [Status], [StageDueDate]) VALUES (74, N'R2 Package Testing - Environment Setup', 0, 1, N'', CAST(N'2017-03-03' AS Date), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), 4, 1, 1, 123, 1, 0, 1, CAST(N'2017-03-03' AS Date))
INSERT [dbo].[KanBan_Story] ([ID], [Name], [TFS], [TFS_Server], [Description], [DueDate], [PMWork], [TestWork], [DevWork], [PMWorkEst], [TestWorkEst], [DevWorkEst], [StoryStatus], [StoryType], [TaskType], [SwimLane_ID], [KanBan_ID], [Prior], [Status], [StageDueDate]) VALUES (75, N'Tax solution Configuration management – R3', 0, 1, N'', CAST(N'1900-01-01' AS Date), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), 2, 3, 1, 131, 1, 2, 1, CAST(N'1900-01-01' AS Date))
INSERT [dbo].[KanBan_Story] ([ID], [Name], [TFS], [TFS_Server], [Description], [DueDate], [PMWork], [TestWork], [DevWork], [PMWorkEst], [TestWorkEst], [DevWorkEst], [StoryStatus], [StoryType], [TaskType], [SwimLane_ID], [KanBan_ID], [Prior], [Status], [StageDueDate]) VALUES (76, N'Tax solution Tax Configuration management – R2', 0, 1, N'', CAST(N'1900-01-01' AS Date), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), 1, 99, 1, 131, 1, 2, 1, CAST(N'1900-01-01' AS Date))
INSERT [dbo].[KanBan_Story] ([ID], [Name], [TFS], [TFS_Server], [Description], [DueDate], [PMWork], [TestWork], [DevWork], [PMWorkEst], [TestWorkEst], [DevWorkEst], [StoryStatus], [StoryType], [TaskType], [SwimLane_ID], [KanBan_ID], [Prior], [Status], [StageDueDate]) VALUES (77, N'Tax solution Tax Configuration management – AX2009', 0, 1, N'', CAST(N'1900-01-01' AS Date), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), 1, 99, 1, 131, 1, 2, 1, CAST(N'1900-01-01' AS Date))
INSERT [dbo].[KanBan_Story] ([ID], [Name], [TFS], [TFS_Server], [Description], [DueDate], [PMWork], [TestWork], [DevWork], [PMWorkEst], [TestWorkEst], [DevWorkEst], [StoryStatus], [StoryType], [TaskType], [SwimLane_ID], [KanBan_ID], [Prior], [Status], [StageDueDate]) VALUES (78, N'3813490', 0, 1, N'', CAST(N'1900-01-01' AS Date), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), 4, 10, 1, 107, 1, 0, 1, CAST(N'1900-01-01' AS Date))
INSERT [dbo].[KanBan_Story] ([ID], [Name], [TFS], [TFS_Server], [Description], [DueDate], [PMWork], [TestWork], [DevWork], [PMWorkEst], [TestWorkEst], [DevWorkEst], [StoryStatus], [StoryType], [TaskType], [SwimLane_ID], [KanBan_ID], [Prior], [Status], [StageDueDate]) VALUES (79, N'3816458', 0, 1, N'', CAST(N'2017-03-10' AS Date), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), 2, 1, 1, 107, 1, 0, 1, CAST(N'2017-03-10' AS Date))
INSERT [dbo].[KanBan_Story] ([ID], [Name], [TFS], [TFS_Server], [Description], [DueDate], [PMWork], [TestWork], [DevWork], [PMWorkEst], [TestWorkEst], [DevWorkEst], [StoryStatus], [StoryType], [TaskType], [SwimLane_ID], [KanBan_ID], [Prior], [Status], [StageDueDate]) VALUES (80, N'3811815', 0, 1, N'', CAST(N'2017-03-10' AS Date), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), 1, 99, 1, 108, 1, 0, 1, CAST(N'2017-03-10' AS Date))
INSERT [dbo].[KanBan_Story] ([ID], [Name], [TFS], [TFS_Server], [Description], [DueDate], [PMWork], [TestWork], [DevWork], [PMWorkEst], [TestWorkEst], [DevWorkEst], [StoryStatus], [StoryType], [TaskType], [SwimLane_ID], [KanBan_ID], [Prior], [Status], [StageDueDate]) VALUES (81, N'3816105', 0, 1, N'Not repro', CAST(N'1900-01-01' AS Date), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), 3, 2, 1, 108, 1, 0, 1, CAST(N'1900-01-01' AS Date))
INSERT [dbo].[KanBan_Story] ([ID], [Name], [TFS], [TFS_Server], [Description], [DueDate], [PMWork], [TestWork], [DevWork], [PMWorkEst], [TestWorkEst], [DevWorkEst], [StoryStatus], [StoryType], [TaskType], [SwimLane_ID], [KanBan_ID], [Prior], [Status], [StageDueDate]) VALUES (26, N'3805726', 0, 1, N'', CAST(N'2017-03-10' AS Date), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), 2, 1, 1, 109, 1, 2, 1, CAST(N'2017-03-10' AS Date))
INSERT [dbo].[KanBan_Story] ([ID], [Name], [TFS], [TFS_Server], [Description], [DueDate], [PMWork], [TestWork], [DevWork], [PMWorkEst], [TestWorkEst], [DevWorkEst], [StoryStatus], [StoryType], [TaskType], [SwimLane_ID], [KanBan_ID], [Prior], [Status], [StageDueDate]) VALUES (27, N'Inventory Turnover', 0, 1, N'Hog slat redesign', CAST(N'2017-03-03' AS Date), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), 4, 10, 1, 109, 1, 0, 1, CAST(N'2017-03-03' AS Date))
INSERT [dbo].[KanBan_Story] ([ID], [Name], [TFS], [TFS_Server], [Description], [DueDate], [PMWork], [TestWork], [DevWork], [PMWorkEst], [TestWorkEst], [DevWorkEst], [StoryStatus], [StoryType], [TaskType], [SwimLane_ID], [KanBan_ID], [Prior], [Status], [StageDueDate]) VALUES (28, N'PO tracking report', 0, 1, N'Hog slat report bug fix', CAST(N'2017-03-03' AS Date), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), 4, 10, 1, 109, 1, 0, 1, CAST(N'2017-03-03' AS Date))
INSERT [dbo].[KanBan_Story] ([ID], [Name], [TFS], [TFS_Server], [Description], [DueDate], [PMWork], [TestWork], [DevWork], [PMWorkEst], [TestWorkEst], [DevWorkEst], [StoryStatus], [StoryType], [TaskType], [SwimLane_ID], [KanBan_ID], [Prior], [Status], [StageDueDate]) VALUES (29, N'3810955', 0, 1, N'', CAST(N'2017-03-10' AS Date), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), 2, 1, 1, 108, 1, 2, 1, CAST(N'2017-03-10' AS Date))
INSERT [dbo].[KanBan_Story] ([ID], [Name], [TFS], [TFS_Server], [Description], [DueDate], [PMWork], [TestWork], [DevWork], [PMWorkEst], [TestWorkEst], [DevWorkEst], [StoryStatus], [StoryType], [TaskType], [SwimLane_ID], [KanBan_ID], [Prior], [Status], [StageDueDate]) VALUES (44, N'Tax Settlement downport to 2009', 0, 1, N'', CAST(N'2017-03-24' AS Date), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(12.0 AS Decimal(6, 1)), 4, 1, 1, 110, 1, 2, 1, CAST(N'2017-03-24' AS Date))
INSERT [dbo].[KanBan_Story] ([ID], [Name], [TFS], [TFS_Server], [Description], [DueDate], [PMWork], [TestWork], [DevWork], [PMWorkEst], [TestWorkEst], [DevWorkEst], [StoryStatus], [StoryType], [TaskType], [SwimLane_ID], [KanBan_ID], [Prior], [Status], [StageDueDate]) VALUES (45, N'Tax document display issue fix', 0, 1, N'', CAST(N'2017-03-17' AS Date), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), 2, 1, 1, 111, 1, 2, 1, CAST(N'2017-03-17' AS Date))
INSERT [dbo].[KanBan_Story] ([ID], [Name], [TFS], [TFS_Server], [Description], [DueDate], [PMWork], [TestWork], [DevWork], [PMWorkEst], [TestWorkEst], [DevWorkEst], [StoryStatus], [StoryType], [TaskType], [SwimLane_ID], [KanBan_ID], [Prior], [Status], [StageDueDate]) VALUES (54, N'Bug 3816980 GST R3: Bug fix - Unmarked transaction can''t be found when settle advanced sales tax payment', 0, 1, N'This bug is for fixing regression of bug 3806621.
Need to rerun 13 test cases', CAST(N'2017-03-06' AS Date), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), 4, 1, 1, 117, 1, 1, 1, CAST(N'2017-03-06' AS Date))
INSERT [dbo].[KanBan_Story] ([ID], [Name], [TFS], [TFS_Server], [Description], [DueDate], [PMWork], [TestWork], [DevWork], [PMWorkEst], [TestWorkEst], [DevWorkEst], [StoryStatus], [StoryType], [TaskType], [SwimLane_ID], [KanBan_ID], [Prior], [Status], [StageDueDate]) VALUES (55, N'Cassie Setup validation in R3 latest build', 0, 1, N'', CAST(N'1900-01-01' AS Date), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), 1, 99, 1, 117, 1, 2, 1, CAST(N'1900-01-01' AS Date))
INSERT [dbo].[KanBan_Story] ([ID], [Name], [TFS], [TFS_Server], [Description], [DueDate], [PMWork], [TestWork], [DevWork], [PMWorkEst], [TestWorkEst], [DevWorkEst], [StoryStatus], [StoryType], [TaskType], [SwimLane_ID], [KanBan_ID], [Prior], [Status], [StageDueDate]) VALUES (57, N'AX2009 Rebase', 0, 1, N'', CAST(N'2017-03-10' AS Date), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), 1, 99, 1, 124, 1, 2, 1, CAST(N'2017-03-10' AS Date))
INSERT [dbo].[KanBan_Story] ([ID], [Name], [TFS], [TFS_Server], [Description], [DueDate], [PMWork], [TestWork], [DevWork], [PMWorkEst], [TestWorkEst], [DevWorkEst], [StoryStatus], [StoryType], [TaskType], [SwimLane_ID], [KanBan_ID], [Prior], [Status], [StageDueDate]) VALUES (66, N'R3 Transaction Validation: REQ multiple line + default logic ', 0, 1, N'', CAST(N'2017-03-03' AS Date), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), 4, 1, 1, 125, 1, 2, 1, CAST(N'2017-03-03' AS Date))
INSERT [dbo].[KanBan_Story] ([ID], [Name], [TFS], [TFS_Server], [Description], [DueDate], [PMWork], [TestWork], [DevWork], [PMWorkEst], [TestWorkEst], [DevWorkEst], [StoryStatus], [StoryType], [TaskType], [SwimLane_ID], [KanBan_ID], [Prior], [Status], [StageDueDate]) VALUES (67, N'R3 Transaction Validation: RFQ', 0, 1, N'', CAST(N'2017-03-10' AS Date), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), 1, 99, 1, 125, 1, 2, 1, CAST(N'2017-03-10' AS Date))
INSERT [dbo].[KanBan_Story] ([ID], [Name], [TFS], [TFS_Server], [Description], [DueDate], [PMWork], [TestWork], [DevWork], [PMWorkEst], [TestWorkEst], [DevWorkEst], [StoryStatus], [StoryType], [TaskType], [SwimLane_ID], [KanBan_ID], [Prior], [Status], [StageDueDate]) VALUES (68, N'R3 Transaction Validation: Sales quotation', 0, 1, N'', CAST(N'2017-03-10' AS Date), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), 1, 99, 1, 125, 1, 2, 1, CAST(N'2017-03-10' AS Date))
INSERT [dbo].[KanBan_Story] ([ID], [Name], [TFS], [TFS_Server], [Description], [DueDate], [PMWork], [TestWork], [DevWork], [PMWorkEst], [TestWorkEst], [DevWorkEst], [StoryStatus], [StoryType], [TaskType], [SwimLane_ID], [KanBan_ID], [Prior], [Status], [StageDueDate]) VALUES (69, N'R3 Transaction Validation: Misc chargs', 0, 1, N'', CAST(N'2017-03-10' AS Date), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), 1, 99, 1, 125, 1, 2, 1, CAST(N'2017-03-10' AS Date))
INSERT [dbo].[KanBan_Story] ([ID], [Name], [TFS], [TFS_Server], [Description], [DueDate], [PMWork], [TestWork], [DevWork], [PMWorkEst], [TestWorkEst], [DevWorkEst], [StoryStatus], [StoryType], [TaskType], [SwimLane_ID], [KanBan_ID], [Prior], [Status], [StageDueDate]) VALUES (72, N'R2 transaction base check in', 0, 1, N'Tracking Id v-rywang.105', CAST(N'2017-03-06' AS Date), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), 3, 1, 1, 125, 1, 1, 1, CAST(N'2017-03-06' AS Date))
INSERT [dbo].[KanBan_Story] ([ID], [Name], [TFS], [TFS_Server], [Description], [DueDate], [PMWork], [TestWork], [DevWork], [PMWorkEst], [TestWorkEst], [DevWorkEst], [StoryStatus], [StoryType], [TaskType], [SwimLane_ID], [KanBan_ID], [Prior], [Status], [StageDueDate]) VALUES (73, N'R3 tax settlement labels check in', 0, 1, N'', CAST(N'2017-03-06' AS Date), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), 3, 1, 1, 125, 1, 1, 1, CAST(N'2017-03-06' AS Date))
SET IDENTITY_INSERT [dbo].[KanBan_Story] OFF
INSERT [dbo].[KanBan_Story_ChangeLog] ([Alias], [CurDateTime], [Story_ID], [Field], [Value_Prev], [Value_New]) VALUES (N'', CAST(N'2017-03-03T10:57:06.720' AS DateTime), 30, N'StoryStatus', N'99', N'3')
INSERT [dbo].[KanBan_Story_ChangeLog] ([Alias], [CurDateTime], [Story_ID], [Field], [Value_Prev], [Value_New]) VALUES (N'', CAST(N'2017-03-03T10:57:18.737' AS DateTime), 31, N'StoryStatus', N'99', N'3')
INSERT [dbo].[KanBan_Story_ChangeLog] ([Alias], [CurDateTime], [Story_ID], [Field], [Value_Prev], [Value_New]) VALUES (N'', CAST(N'2017-03-03T10:57:30.373' AS DateTime), 32, N'StoryStatus', N'99', N'3')
INSERT [dbo].[KanBan_Story_ChangeLog] ([Alias], [CurDateTime], [Story_ID], [Field], [Value_Prev], [Value_New]) VALUES (N'', CAST(N'2017-03-03T10:57:45.813' AS DateTime), 33, N'StoryStatus', N'99', N'10')
INSERT [dbo].[KanBan_Story_ChangeLog] ([Alias], [CurDateTime], [Story_ID], [Field], [Value_Prev], [Value_New]) VALUES (N'', CAST(N'2017-03-03T10:57:52.450' AS DateTime), 31, N'StoryStatus', N'3', N'10')
INSERT [dbo].[KanBan_Story_ChangeLog] ([Alias], [CurDateTime], [Story_ID], [Field], [Value_Prev], [Value_New]) VALUES (N'', CAST(N'2017-03-03T10:57:56.917' AS DateTime), 32, N'StoryStatus', N'3', N'10')
INSERT [dbo].[KanBan_Story_ChangeLog] ([Alias], [CurDateTime], [Story_ID], [Field], [Value_Prev], [Value_New]) VALUES (N'', CAST(N'2017-03-03T10:58:00.010' AS DateTime), 30, N'StoryStatus', N'3', N'10')
INSERT [dbo].[KanBan_Story_ChangeLog] ([Alias], [CurDateTime], [Story_ID], [Field], [Value_Prev], [Value_New]) VALUES (N'', CAST(N'2017-03-03T10:58:04.270' AS DateTime), 30, N'StoryStatus', N'10', N'3')
INSERT [dbo].[KanBan_Story_ChangeLog] ([Alias], [CurDateTime], [Story_ID], [Field], [Value_Prev], [Value_New]) VALUES (N'', CAST(N'2017-03-03T10:58:50.657' AS DateTime), 34, N'StoryStatus', N'99', N'1')
INSERT [dbo].[KanBan_Story_ChangeLog] ([Alias], [CurDateTime], [Story_ID], [Field], [Value_Prev], [Value_New]) VALUES (N'', CAST(N'2017-03-03T10:59:06.740' AS DateTime), 35, N'StoryStatus', N'99', N'3')
INSERT [dbo].[KanBan_Story_ChangeLog] ([Alias], [CurDateTime], [Story_ID], [Field], [Value_Prev], [Value_New]) VALUES (N'', CAST(N'2017-03-03T10:59:18.487' AS DateTime), 36, N'StoryStatus', N'99', N'3')
INSERT [dbo].[KanBan_Story_ChangeLog] ([Alias], [CurDateTime], [Story_ID], [Field], [Value_Prev], [Value_New]) VALUES (N'', CAST(N'2017-03-03T11:00:35.640' AS DateTime), 37, N'StoryStatus', N'99', N'10')
INSERT [dbo].[KanBan_Story_ChangeLog] ([Alias], [CurDateTime], [Story_ID], [Field], [Value_Prev], [Value_New]) VALUES (N'', CAST(N'2017-03-03T11:00:50.103' AS DateTime), 38, N'StoryStatus', N'99', N'10')
INSERT [dbo].[KanBan_Story_ChangeLog] ([Alias], [CurDateTime], [Story_ID], [Field], [Value_Prev], [Value_New]) VALUES (N'', CAST(N'2017-03-03T11:03:50.527' AS DateTime), 39, N'StoryStatus', N'99', N'1')
INSERT [dbo].[KanBan_Story_ChangeLog] ([Alias], [CurDateTime], [Story_ID], [Field], [Value_Prev], [Value_New]) VALUES (N'', CAST(N'2017-03-03T11:04:05.543' AS DateTime), 40, N'StoryStatus', N'99', N'2')
INSERT [dbo].[KanBan_Story_ChangeLog] ([Alias], [CurDateTime], [Story_ID], [Field], [Value_Prev], [Value_New]) VALUES (N'', CAST(N'2017-03-03T11:04:58.513' AS DateTime), 40, N'StoryStatus', N'2', N'99')
INSERT [dbo].[KanBan_Story_ChangeLog] ([Alias], [CurDateTime], [Story_ID], [Field], [Value_Prev], [Value_New]) VALUES (N'', CAST(N'2017-03-03T11:16:51.083' AS DateTime), 43, N'StoryStatus', N'99', N'10')
INSERT [dbo].[KanBan_Story_ChangeLog] ([Alias], [CurDateTime], [Story_ID], [Field], [Value_Prev], [Value_New]) VALUES (N'', CAST(N'2017-03-03T13:34:35.580' AS DateTime), 46, N'StoryStatus', N'99', N'1')
INSERT [dbo].[KanBan_Story_ChangeLog] ([Alias], [CurDateTime], [Story_ID], [Field], [Value_Prev], [Value_New]) VALUES (N'', CAST(N'2017-03-03T13:38:52.753' AS DateTime), 49, N'StoryStatus', N'99', N'1')
INSERT [dbo].[KanBan_Story_ChangeLog] ([Alias], [CurDateTime], [Story_ID], [Field], [Value_Prev], [Value_New]) VALUES (N'', CAST(N'2017-03-03T13:39:38.023' AS DateTime), 50, N'StoryStatus', N'99', N'1')
INSERT [dbo].[KanBan_Story_ChangeLog] ([Alias], [CurDateTime], [Story_ID], [Field], [Value_Prev], [Value_New]) VALUES (N'', CAST(N'2017-03-03T13:40:11.080' AS DateTime), 51, N'StoryStatus', N'99', N'1')
INSERT [dbo].[KanBan_Story_ChangeLog] ([Alias], [CurDateTime], [Story_ID], [Field], [Value_Prev], [Value_New]) VALUES (N'', CAST(N'2017-03-03T16:14:51.430' AS DateTime), 59, N'StoryStatus', N'99', N'2')
INSERT [dbo].[KanBan_Story_ChangeLog] ([Alias], [CurDateTime], [Story_ID], [Field], [Value_Prev], [Value_New]) VALUES (N'', CAST(N'2017-03-03T16:15:03.350' AS DateTime), 58, N'StoryStatus', N'99', N'1')
INSERT [dbo].[KanBan_Story_ChangeLog] ([Alias], [CurDateTime], [Story_ID], [Field], [Value_Prev], [Value_New]) VALUES (N'', CAST(N'2017-03-03T16:15:14.683' AS DateTime), 56, N'StoryStatus', N'99', N'1')
INSERT [dbo].[KanBan_Story_ChangeLog] ([Alias], [CurDateTime], [Story_ID], [Field], [Value_Prev], [Value_New]) VALUES (N'', CAST(N'2017-03-03T16:16:34.327' AS DateTime), 60, N'StoryStatus', N'99', N'1')
INSERT [dbo].[KanBan_Story_ChangeLog] ([Alias], [CurDateTime], [Story_ID], [Field], [Value_Prev], [Value_New]) VALUES (N'', CAST(N'2017-03-03T16:17:12.387' AS DateTime), 61, N'StoryStatus', N'99', N'2')
INSERT [dbo].[KanBan_Story_ChangeLog] ([Alias], [CurDateTime], [Story_ID], [Field], [Value_Prev], [Value_New]) VALUES (N'', CAST(N'2017-03-03T16:17:39.287' AS DateTime), 62, N'StoryStatus', N'99', N'1')
INSERT [dbo].[KanBan_Story_ChangeLog] ([Alias], [CurDateTime], [Story_ID], [Field], [Value_Prev], [Value_New]) VALUES (N'', CAST(N'2017-03-03T16:18:34.030' AS DateTime), 63, N'StoryStatus', N'99', N'1')
INSERT [dbo].[KanBan_Story_ChangeLog] ([Alias], [CurDateTime], [Story_ID], [Field], [Value_Prev], [Value_New]) VALUES (N'', CAST(N'2017-03-03T16:21:57.437' AS DateTime), 64, N'StoryStatus', N'99', N'1')
INSERT [dbo].[KanBan_Story_ChangeLog] ([Alias], [CurDateTime], [Story_ID], [Field], [Value_Prev], [Value_New]) VALUES (N'', CAST(N'2017-03-03T16:22:55.597' AS DateTime), 65, N'StoryStatus', N'99', N'1')
INSERT [dbo].[KanBan_Story_ChangeLog] ([Alias], [CurDateTime], [Story_ID], [Field], [Value_Prev], [Value_New]) VALUES (N'', CAST(N'2017-03-03T16:23:06.003' AS DateTime), 65, N'StoryStatus', N'1', N'3')
INSERT [dbo].[KanBan_Story_ChangeLog] ([Alias], [CurDateTime], [Story_ID], [Field], [Value_Prev], [Value_New]) VALUES (N'', CAST(N'2017-03-03T16:45:31.970' AS DateTime), 71, N'StoryStatus', N'99', N'1')
INSERT [dbo].[KanBan_Story_ChangeLog] ([Alias], [CurDateTime], [Story_ID], [Field], [Value_Prev], [Value_New]) VALUES (N'', CAST(N'2017-03-03T16:53:31.033' AS DateTime), 74, N'StoryStatus', N'99', N'1')
INSERT [dbo].[KanBan_Story_ChangeLog] ([Alias], [CurDateTime], [Story_ID], [Field], [Value_Prev], [Value_New]) VALUES (N'', CAST(N'2017-03-03T16:53:59.457' AS DateTime), 64, N'StoryStatus', N'1', N'3')
INSERT [dbo].[KanBan_Story_ChangeLog] ([Alias], [CurDateTime], [Story_ID], [Field], [Value_Prev], [Value_New]) VALUES (N'', CAST(N'2017-03-03T17:11:04.100' AS DateTime), 75, N'StoryStatus', N'99', N'3')
INSERT [dbo].[KanBan_Story_ChangeLog] ([Alias], [CurDateTime], [Story_ID], [Field], [Value_Prev], [Value_New]) VALUES (N'', CAST(N'2017-03-03T17:21:06.513' AS DateTime), 35, N'StoryStatus', N'3', N'2')
INSERT [dbo].[KanBan_Story_ChangeLog] ([Alias], [CurDateTime], [Story_ID], [Field], [Value_Prev], [Value_New]) VALUES (N'', CAST(N'2017-03-03T17:21:12.253' AS DateTime), 36, N'StoryStatus', N'3', N'2')
INSERT [dbo].[KanBan_Story_ChangeLog] ([Alias], [CurDateTime], [Story_ID], [Field], [Value_Prev], [Value_New]) VALUES (N'', CAST(N'2017-03-03T17:21:17.193' AS DateTime), 30, N'StoryStatus', N'3', N'2')
INSERT [dbo].[KanBan_Story_ChangeLog] ([Alias], [CurDateTime], [Story_ID], [Field], [Value_Prev], [Value_New]) VALUES (N'', CAST(N'2017-03-06T10:40:04.690' AS DateTime), 34, N'StoryStatus', N'1', N'2')
INSERT [dbo].[KanBan_Story_ChangeLog] ([Alias], [CurDateTime], [Story_ID], [Field], [Value_Prev], [Value_New]) VALUES (N'', CAST(N'2017-03-06T10:40:22.587' AS DateTime), 78, N'StoryStatus', N'99', N'10')
INSERT [dbo].[KanBan_Story_ChangeLog] ([Alias], [CurDateTime], [Story_ID], [Field], [Value_Prev], [Value_New]) VALUES (N'', CAST(N'2017-03-06T10:41:06.893' AS DateTime), 79, N'StoryStatus', N'99', N'1')
INSERT [dbo].[KanBan_Story_ChangeLog] ([Alias], [CurDateTime], [Story_ID], [Field], [Value_Prev], [Value_New]) VALUES (N'', CAST(N'2017-03-06T10:41:45.150' AS DateTime), 40, N'StoryStatus', N'99', N'1')
INSERT [dbo].[KanBan_Story_ChangeLog] ([Alias], [CurDateTime], [Story_ID], [Field], [Value_Prev], [Value_New]) VALUES (N'', CAST(N'2017-03-06T11:14:57.657' AS DateTime), 27, N'StoryStatus', N'1', N'10')
INSERT [dbo].[KanBan_Story_ChangeLog] ([Alias], [CurDateTime], [Story_ID], [Field], [Value_Prev], [Value_New]) VALUES (N'', CAST(N'2017-03-06T11:16:45.497' AS DateTime), 30, N'StoryStatus', N'2', N'10')
INSERT [dbo].[KanBan_Story_ChangeLog] ([Alias], [CurDateTime], [Story_ID], [Field], [Value_Prev], [Value_New]) VALUES (N'', CAST(N'2017-03-06T11:17:52.177' AS DateTime), 81, N'StoryStatus', N'99', N'2')
INSERT [dbo].[KanBan_Story_ChangeLog] ([Alias], [CurDateTime], [Story_ID], [Field], [Value_Prev], [Value_New]) VALUES (N'', CAST(N'2017-03-06T11:44:23.880' AS DateTime), 47, N'StoryStatus', N'99', N'1')
INSERT [dbo].[KanBan_Story_ChangeLog] ([Alias], [CurDateTime], [Story_ID], [Field], [Value_Prev], [Value_New]) VALUES (N'', CAST(N'2017-03-03T10:53:48.680' AS DateTime), 26, N'StoryStatus', N'99', N'1')
INSERT [dbo].[KanBan_Story_ChangeLog] ([Alias], [CurDateTime], [Story_ID], [Field], [Value_Prev], [Value_New]) VALUES (N'', CAST(N'2017-03-03T10:54:19.537' AS DateTime), 27, N'StoryStatus', N'99', N'1')
INSERT [dbo].[KanBan_Story_ChangeLog] ([Alias], [CurDateTime], [Story_ID], [Field], [Value_Prev], [Value_New]) VALUES (N'', CAST(N'2017-03-03T10:55:01.870' AS DateTime), 28, N'StoryStatus', N'99', N'10')
INSERT [dbo].[KanBan_Story_ChangeLog] ([Alias], [CurDateTime], [Story_ID], [Field], [Value_Prev], [Value_New]) VALUES (N'', CAST(N'2017-03-03T10:56:40.393' AS DateTime), 29, N'StoryStatus', N'99', N'1')
INSERT [dbo].[KanBan_Story_ChangeLog] ([Alias], [CurDateTime], [Story_ID], [Field], [Value_Prev], [Value_New]) VALUES (N'', CAST(N'2017-03-03T13:30:47.593' AS DateTime), 44, N'StoryStatus', N'99', N'1')
INSERT [dbo].[KanBan_Story_ChangeLog] ([Alias], [CurDateTime], [Story_ID], [Field], [Value_Prev], [Value_New]) VALUES (N'', CAST(N'2017-03-03T13:31:39.763' AS DateTime), 45, N'StoryStatus', N'99', N'1')
INSERT [dbo].[KanBan_Story_ChangeLog] ([Alias], [CurDateTime], [Story_ID], [Field], [Value_Prev], [Value_New]) VALUES (N'', CAST(N'2017-03-03T15:42:37.990' AS DateTime), 54, N'StoryStatus', N'99', N'1')
INSERT [dbo].[KanBan_Story_ChangeLog] ([Alias], [CurDateTime], [Story_ID], [Field], [Value_Prev], [Value_New]) VALUES (N'', CAST(N'2017-03-03T16:41:22.810' AS DateTime), 66, N'StoryStatus', N'99', N'1')
INSERT [dbo].[KanBan_Story_ChangeLog] ([Alias], [CurDateTime], [Story_ID], [Field], [Value_Prev], [Value_New]) VALUES (N'', CAST(N'2017-03-03T16:47:37.427' AS DateTime), 72, N'StoryStatus', N'99', N'1')
INSERT [dbo].[KanBan_Story_ChangeLog] ([Alias], [CurDateTime], [Story_ID], [Field], [Value_Prev], [Value_New]) VALUES (N'', CAST(N'2017-03-03T16:49:22.760' AS DateTime), 73, N'StoryStatus', N'99', N'1')
INSERT [dbo].[KanBan_Story_ChangeLog] ([Alias], [CurDateTime], [Story_ID], [Field], [Value_Prev], [Value_New]) VALUES (N'', CAST(N'2017-03-06T13:27:25.930' AS DateTime), 53, N'StoryStatus', N'99', N'1')
INSERT [dbo].[KanBan_Story_ChangeLog] ([Alias], [CurDateTime], [Story_ID], [Field], [Value_Prev], [Value_New]) VALUES (N'', CAST(N'2017-03-06T13:29:41.363' AS DateTime), 53, N'StoryStatus', N'1', N'2')
INSERT [dbo].[KanBan_Story_ChangeLog] ([Alias], [CurDateTime], [Story_ID], [Field], [Value_Prev], [Value_New]) VALUES (N'', CAST(N'2017-03-06T13:32:28.297' AS DateTime), 53, N'StoryStatus', N'2', N'10')
INSERT [dbo].[KanBan_Story_ChangeLog] ([Alias], [CurDateTime], [Story_ID], [Field], [Value_Prev], [Value_New]) VALUES (N'', CAST(N'2017-03-06T13:32:56.183' AS DateTime), 53, N'StoryStatus', N'10', N'1')
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'', CAST(N'2017-03-03T10:57:06.720' AS DateTime), 30, 0, 1)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'', CAST(N'2017-03-03T10:57:09.630' AS DateTime), 30, 1, 3)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'', CAST(N'2017-03-03T10:57:18.737' AS DateTime), 31, 0, 1)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'', CAST(N'2017-03-03T10:57:21.337' AS DateTime), 31, 1, 4)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'', CAST(N'2017-03-03T10:57:30.377' AS DateTime), 32, 0, 1)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'', CAST(N'2017-03-03T10:57:32.827' AS DateTime), 32, 1, 4)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'', CAST(N'2017-03-03T10:57:45.817' AS DateTime), 33, 0, 1)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'', CAST(N'2017-03-03T10:57:48.640' AS DateTime), 33, 1, 4)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'', CAST(N'2017-03-03T10:58:50.657' AS DateTime), 34, 0, 1)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'', CAST(N'2017-03-03T10:58:52.150' AS DateTime), 34, 1, 2)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'', CAST(N'2017-03-03T10:59:06.743' AS DateTime), 35, 0, 1)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'', CAST(N'2017-03-03T10:59:08.967' AS DateTime), 35, 1, 3)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'', CAST(N'2017-03-03T10:59:18.490' AS DateTime), 36, 0, 1)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'', CAST(N'2017-03-03T10:59:20.647' AS DateTime), 36, 1, 3)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'', CAST(N'2017-03-03T11:00:35.640' AS DateTime), 37, 0, 1)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'', CAST(N'2017-03-03T11:00:38.447' AS DateTime), 37, 1, 4)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'', CAST(N'2017-03-03T11:00:50.107' AS DateTime), 38, 0, 1)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'', CAST(N'2017-03-03T11:00:52.213' AS DateTime), 38, 1, 4)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'', CAST(N'2017-03-03T11:03:50.530' AS DateTime), 39, 0, 1)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'', CAST(N'2017-03-03T11:04:05.547' AS DateTime), 40, 0, 1)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'', CAST(N'2017-03-03T11:04:10.900' AS DateTime), 39, 1, 2)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'', CAST(N'2017-03-03T11:04:50.063' AS DateTime), 41, 0, 1)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'', CAST(N'2017-03-03T11:05:59.227' AS DateTime), 42, 0, 1)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'', CAST(N'2017-03-03T11:16:51.087' AS DateTime), 43, 0, 1)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'', CAST(N'2017-03-03T11:16:53.920' AS DateTime), 43, 1, 4)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'', CAST(N'2017-03-03T13:34:35.583' AS DateTime), 46, 0, 1)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'', CAST(N'2017-03-03T13:34:38.790' AS DateTime), 46, 1, 2)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'', CAST(N'2017-03-03T13:35:21.870' AS DateTime), 47, 0, 1)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'', CAST(N'2017-03-03T13:36:02.100' AS DateTime), 48, 0, 1)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'', CAST(N'2017-03-03T13:38:52.757' AS DateTime), 49, 0, 1)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'', CAST(N'2017-03-03T13:39:00.533' AS DateTime), 49, 1, 4)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'', CAST(N'2017-03-03T13:39:38.027' AS DateTime), 50, 0, 1)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'', CAST(N'2017-03-03T13:39:40.807' AS DateTime), 50, 1, 2)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'', CAST(N'2017-03-03T13:40:11.080' AS DateTime), 51, 0, 1)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'', CAST(N'2017-03-03T13:41:51.513' AS DateTime), 51, 1, 2)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'', CAST(N'2017-03-03T13:42:18.533' AS DateTime), 52, 0, 1)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'', CAST(N'2017-03-03T14:04:53.880' AS DateTime), 48, 1, 2)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'', CAST(N'2017-03-03T14:04:54.793' AS DateTime), 48, 2, 1)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'', CAST(N'2017-03-03T15:38:10.977' AS DateTime), 53, 0, 1)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'', CAST(N'2017-03-03T16:07:09.103' AS DateTime), 56, 0, 1)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'', CAST(N'2017-03-03T16:07:14.590' AS DateTime), 56, 1, 2)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'', CAST(N'2017-03-03T16:13:53.687' AS DateTime), 58, 0, 1)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'', CAST(N'2017-03-03T16:14:02.333' AS DateTime), 58, 1, 3)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'', CAST(N'2017-03-03T16:14:51.433' AS DateTime), 59, 0, 1)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'', CAST(N'2017-03-03T16:16:34.330' AS DateTime), 60, 0, 1)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'', CAST(N'2017-03-03T16:16:39.053' AS DateTime), 60, 1, 2)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'', CAST(N'2017-03-03T16:17:12.390' AS DateTime), 61, 0, 1)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'', CAST(N'2017-03-03T16:17:39.290' AS DateTime), 62, 0, 1)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'', CAST(N'2017-03-03T16:17:43.843' AS DateTime), 62, 1, 2)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'', CAST(N'2017-03-03T16:18:34.030' AS DateTime), 63, 0, 1)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'', CAST(N'2017-03-03T16:18:38.033' AS DateTime), 63, 1, 2)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'', CAST(N'2017-03-03T16:21:57.440' AS DateTime), 64, 0, 1)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'', CAST(N'2017-03-03T16:22:01.893' AS DateTime), 64, 1, 2)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'', CAST(N'2017-03-03T16:22:07.757' AS DateTime), 64, 2, 4)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'', CAST(N'2017-03-03T16:22:55.600' AS DateTime), 65, 0, 1)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'', CAST(N'2017-03-03T16:23:00.260' AS DateTime), 65, 1, 2)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'', CAST(N'2017-03-03T16:43:30.697' AS DateTime), 70, 0, 1)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'', CAST(N'2017-03-03T16:45:31.973' AS DateTime), 71, 0, 1)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'', CAST(N'2017-03-03T16:45:37.257' AS DateTime), 71, 1, 2)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'', CAST(N'2017-03-03T16:53:31.033' AS DateTime), 74, 0, 1)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'', CAST(N'2017-03-03T16:53:35.570' AS DateTime), 74, 1, 4)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'', CAST(N'2017-03-03T17:11:04.103' AS DateTime), 75, 0, 1)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'', CAST(N'2017-03-03T17:11:23.960' AS DateTime), 75, 1, 2)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'', CAST(N'2017-03-03T17:12:16.573' AS DateTime), 76, 0, 1)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'', CAST(N'2017-03-03T17:12:50.767' AS DateTime), 77, 0, 1)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'', CAST(N'2017-03-06T09:24:01.620' AS DateTime), 27, 2, 3)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'', CAST(N'2017-03-06T11:43:59.317' AS DateTime), 46, 2, 4)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'', CAST(N'2017-03-06T11:44:25.647' AS DateTime), 47, 1, 2)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'', CAST(N'2017-03-03T10:53:24.077' AS DateTime), 26, 0, 1)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'', CAST(N'2017-03-03T10:53:52.887' AS DateTime), 26, 1, 2)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'', CAST(N'2017-03-03T10:54:19.540' AS DateTime), 27, 0, 1)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'', CAST(N'2017-03-03T10:54:22.443' AS DateTime), 27, 1, 2)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'', CAST(N'2017-03-03T10:55:01.870' AS DateTime), 28, 0, 1)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'', CAST(N'2017-03-03T10:55:19.923' AS DateTime), 28, 1, 3)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'', CAST(N'2017-03-03T10:56:40.393' AS DateTime), 29, 0, 1)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'', CAST(N'2017-03-03T10:56:42.927' AS DateTime), 29, 1, 2)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'', CAST(N'2017-03-03T13:30:47.600' AS DateTime), 44, 0, 1)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'', CAST(N'2017-03-03T13:30:57.430' AS DateTime), 44, 1, 4)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'', CAST(N'2017-03-03T13:31:39.767' AS DateTime), 45, 0, 1)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'', CAST(N'2017-03-03T13:31:43.900' AS DateTime), 45, 1, 2)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'', CAST(N'2017-03-03T15:42:37.993' AS DateTime), 54, 0, 1)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'', CAST(N'2017-03-03T15:43:17.370' AS DateTime), 54, 1, 4)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'', CAST(N'2017-03-03T15:44:30.810' AS DateTime), 55, 0, 1)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'', CAST(N'2017-03-03T16:09:42.070' AS DateTime), 57, 0, 1)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'', CAST(N'2017-03-03T16:41:22.810' AS DateTime), 66, 0, 1)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'', CAST(N'2017-03-03T16:41:27.983' AS DateTime), 66, 1, 4)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'', CAST(N'2017-03-03T16:41:54.510' AS DateTime), 67, 0, 1)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'', CAST(N'2017-03-03T16:42:31.623' AS DateTime), 68, 0, 1)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'', CAST(N'2017-03-03T16:42:55.907' AS DateTime), 69, 0, 1)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'', CAST(N'2017-03-03T16:47:37.427' AS DateTime), 72, 0, 1)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'', CAST(N'2017-03-03T16:47:55.150' AS DateTime), 72, 1, 4)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'', CAST(N'2017-03-03T16:48:00.753' AS DateTime), 72, 4, 3)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'', CAST(N'2017-03-03T16:49:22.763' AS DateTime), 73, 0, 1)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'', CAST(N'2017-03-03T16:49:26.413' AS DateTime), 73, 1, 3)
INSERT [dbo].[KanBan_Story_StatusLog] ([Alias], [CurDatetime], [Story_ID], [Status_Prev], [Status_New]) VALUES (N'', CAST(N'2017-03-02T19:25:21.550' AS DateTime), 21, 0, 1)
INSERT [dbo].[KanBan_Story_StatusLog] ([Alias], [CurDatetime], [Story_ID], [Status_Prev], [Status_New]) VALUES (N'', CAST(N'2017-03-02T19:25:41.833' AS DateTime), 22, 0, 1)
INSERT [dbo].[KanBan_Story_StatusLog] ([Alias], [CurDatetime], [Story_ID], [Status_Prev], [Status_New]) VALUES (N'', CAST(N'2017-03-02T19:25:56.493' AS DateTime), 23, 0, 1)
INSERT [dbo].[KanBan_Story_StatusLog] ([Alias], [CurDatetime], [Story_ID], [Status_Prev], [Status_New]) VALUES (N'', CAST(N'2017-03-02T19:26:28.227' AS DateTime), 24, 0, 1)
INSERT [dbo].[KanBan_Story_StatusLog] ([Alias], [CurDatetime], [Story_ID], [Status_Prev], [Status_New]) VALUES (N'', CAST(N'2017-03-02T19:26:48.480' AS DateTime), 25, 0, 1)
INSERT [dbo].[KanBan_Story_StatusLog] ([Alias], [CurDatetime], [Story_ID], [Status_Prev], [Status_New]) VALUES (N'', CAST(N'2017-03-03T10:57:06.720' AS DateTime), 30, 0, 1)
INSERT [dbo].[KanBan_Story_StatusLog] ([Alias], [CurDatetime], [Story_ID], [Status_Prev], [Status_New]) VALUES (N'', CAST(N'2017-03-03T10:57:18.737' AS DateTime), 31, 0, 1)
INSERT [dbo].[KanBan_Story_StatusLog] ([Alias], [CurDatetime], [Story_ID], [Status_Prev], [Status_New]) VALUES (N'', CAST(N'2017-03-03T10:57:30.377' AS DateTime), 32, 0, 1)
INSERT [dbo].[KanBan_Story_StatusLog] ([Alias], [CurDatetime], [Story_ID], [Status_Prev], [Status_New]) VALUES (N'', CAST(N'2017-03-03T10:57:45.817' AS DateTime), 33, 0, 1)
INSERT [dbo].[KanBan_Story_StatusLog] ([Alias], [CurDatetime], [Story_ID], [Status_Prev], [Status_New]) VALUES (N'', CAST(N'2017-03-03T10:58:50.657' AS DateTime), 34, 0, 1)
INSERT [dbo].[KanBan_Story_StatusLog] ([Alias], [CurDatetime], [Story_ID], [Status_Prev], [Status_New]) VALUES (N'', CAST(N'2017-03-03T10:59:06.740' AS DateTime), 35, 0, 1)
INSERT [dbo].[KanBan_Story_StatusLog] ([Alias], [CurDatetime], [Story_ID], [Status_Prev], [Status_New]) VALUES (N'', CAST(N'2017-03-03T10:59:18.490' AS DateTime), 36, 0, 1)
INSERT [dbo].[KanBan_Story_StatusLog] ([Alias], [CurDatetime], [Story_ID], [Status_Prev], [Status_New]) VALUES (N'', CAST(N'2017-03-03T11:00:35.640' AS DateTime), 37, 0, 1)
INSERT [dbo].[KanBan_Story_StatusLog] ([Alias], [CurDatetime], [Story_ID], [Status_Prev], [Status_New]) VALUES (N'', CAST(N'2017-03-03T11:00:50.103' AS DateTime), 38, 0, 1)
INSERT [dbo].[KanBan_Story_StatusLog] ([Alias], [CurDatetime], [Story_ID], [Status_Prev], [Status_New]) VALUES (N'', CAST(N'2017-03-03T11:03:50.530' AS DateTime), 39, 0, 1)
INSERT [dbo].[KanBan_Story_StatusLog] ([Alias], [CurDatetime], [Story_ID], [Status_Prev], [Status_New]) VALUES (N'', CAST(N'2017-03-03T11:04:05.543' AS DateTime), 40, 0, 1)
INSERT [dbo].[KanBan_Story_StatusLog] ([Alias], [CurDatetime], [Story_ID], [Status_Prev], [Status_New]) VALUES (N'', CAST(N'2017-03-03T11:04:50.063' AS DateTime), 41, 0, 1)
INSERT [dbo].[KanBan_Story_StatusLog] ([Alias], [CurDatetime], [Story_ID], [Status_Prev], [Status_New]) VALUES (N'', CAST(N'2017-03-03T11:05:59.227' AS DateTime), 42, 0, 1)
INSERT [dbo].[KanBan_Story_StatusLog] ([Alias], [CurDatetime], [Story_ID], [Status_Prev], [Status_New]) VALUES (N'', CAST(N'2017-03-03T11:16:51.087' AS DateTime), 43, 0, 1)
INSERT [dbo].[KanBan_Story_StatusLog] ([Alias], [CurDatetime], [Story_ID], [Status_Prev], [Status_New]) VALUES (N'', CAST(N'2017-03-03T13:34:35.583' AS DateTime), 46, 0, 1)
INSERT [dbo].[KanBan_Story_StatusLog] ([Alias], [CurDatetime], [Story_ID], [Status_Prev], [Status_New]) VALUES (N'', CAST(N'2017-03-03T13:35:21.870' AS DateTime), 47, 0, 1)
INSERT [dbo].[KanBan_Story_StatusLog] ([Alias], [CurDatetime], [Story_ID], [Status_Prev], [Status_New]) VALUES (N'', CAST(N'2017-03-03T13:36:02.100' AS DateTime), 48, 0, 1)
INSERT [dbo].[KanBan_Story_StatusLog] ([Alias], [CurDatetime], [Story_ID], [Status_Prev], [Status_New]) VALUES (N'', CAST(N'2017-03-03T13:38:52.757' AS DateTime), 49, 0, 1)
INSERT [dbo].[KanBan_Story_StatusLog] ([Alias], [CurDatetime], [Story_ID], [Status_Prev], [Status_New]) VALUES (N'', CAST(N'2017-03-03T13:39:38.027' AS DateTime), 50, 0, 1)
INSERT [dbo].[KanBan_Story_StatusLog] ([Alias], [CurDatetime], [Story_ID], [Status_Prev], [Status_New]) VALUES (N'', CAST(N'2017-03-03T13:40:11.080' AS DateTime), 51, 0, 1)
INSERT [dbo].[KanBan_Story_StatusLog] ([Alias], [CurDatetime], [Story_ID], [Status_Prev], [Status_New]) VALUES (N'', CAST(N'2017-03-03T13:42:18.533' AS DateTime), 52, 0, 1)
INSERT [dbo].[KanBan_Story_StatusLog] ([Alias], [CurDatetime], [Story_ID], [Status_Prev], [Status_New]) VALUES (N'', CAST(N'2017-03-03T15:38:10.977' AS DateTime), 53, 0, 1)
INSERT [dbo].[KanBan_Story_StatusLog] ([Alias], [CurDatetime], [Story_ID], [Status_Prev], [Status_New]) VALUES (N'', CAST(N'2017-03-03T16:07:09.100' AS DateTime), 56, 0, 1)
INSERT [dbo].[KanBan_Story_StatusLog] ([Alias], [CurDatetime], [Story_ID], [Status_Prev], [Status_New]) VALUES (N'', CAST(N'2017-03-03T16:13:53.683' AS DateTime), 58, 0, 1)
INSERT [dbo].[KanBan_Story_StatusLog] ([Alias], [CurDatetime], [Story_ID], [Status_Prev], [Status_New]) VALUES (N'', CAST(N'2017-03-03T16:14:51.430' AS DateTime), 59, 0, 1)
INSERT [dbo].[KanBan_Story_StatusLog] ([Alias], [CurDatetime], [Story_ID], [Status_Prev], [Status_New]) VALUES (N'', CAST(N'2017-03-03T16:16:34.327' AS DateTime), 60, 0, 1)
INSERT [dbo].[KanBan_Story_StatusLog] ([Alias], [CurDatetime], [Story_ID], [Status_Prev], [Status_New]) VALUES (N'', CAST(N'2017-03-03T16:17:12.390' AS DateTime), 61, 0, 1)
INSERT [dbo].[KanBan_Story_StatusLog] ([Alias], [CurDatetime], [Story_ID], [Status_Prev], [Status_New]) VALUES (N'', CAST(N'2017-03-03T16:17:39.290' AS DateTime), 62, 0, 1)
INSERT [dbo].[KanBan_Story_StatusLog] ([Alias], [CurDatetime], [Story_ID], [Status_Prev], [Status_New]) VALUES (N'', CAST(N'2017-03-03T16:18:34.030' AS DateTime), 63, 0, 1)
INSERT [dbo].[KanBan_Story_StatusLog] ([Alias], [CurDatetime], [Story_ID], [Status_Prev], [Status_New]) VALUES (N'', CAST(N'2017-03-03T16:21:57.437' AS DateTime), 64, 0, 1)
INSERT [dbo].[KanBan_Story_StatusLog] ([Alias], [CurDatetime], [Story_ID], [Status_Prev], [Status_New]) VALUES (N'', CAST(N'2017-03-03T16:22:55.600' AS DateTime), 65, 0, 1)
INSERT [dbo].[KanBan_Story_StatusLog] ([Alias], [CurDatetime], [Story_ID], [Status_Prev], [Status_New]) VALUES (N'', CAST(N'2017-03-03T16:43:30.693' AS DateTime), 70, 0, 1)
INSERT [dbo].[KanBan_Story_StatusLog] ([Alias], [CurDatetime], [Story_ID], [Status_Prev], [Status_New]) VALUES (N'', CAST(N'2017-03-03T16:45:31.973' AS DateTime), 71, 0, 1)
INSERT [dbo].[KanBan_Story_StatusLog] ([Alias], [CurDatetime], [Story_ID], [Status_Prev], [Status_New]) VALUES (N'', CAST(N'2017-03-03T16:53:31.033' AS DateTime), 74, 0, 1)
INSERT [dbo].[KanBan_Story_StatusLog] ([Alias], [CurDatetime], [Story_ID], [Status_Prev], [Status_New]) VALUES (N'', CAST(N'2017-03-03T17:11:04.100' AS DateTime), 75, 0, 1)
INSERT [dbo].[KanBan_Story_StatusLog] ([Alias], [CurDatetime], [Story_ID], [Status_Prev], [Status_New]) VALUES (N'', CAST(N'2017-03-03T17:12:16.573' AS DateTime), 76, 0, 1)
INSERT [dbo].[KanBan_Story_StatusLog] ([Alias], [CurDatetime], [Story_ID], [Status_Prev], [Status_New]) VALUES (N'', CAST(N'2017-03-03T17:12:50.763' AS DateTime), 77, 0, 1)
INSERT [dbo].[KanBan_Story_StatusLog] ([Alias], [CurDatetime], [Story_ID], [Status_Prev], [Status_New]) VALUES (N'', CAST(N'2017-03-03T10:53:24.077' AS DateTime), 26, 0, 1)
INSERT [dbo].[KanBan_Story_StatusLog] ([Alias], [CurDatetime], [Story_ID], [Status_Prev], [Status_New]) VALUES (N'', CAST(N'2017-03-03T10:54:19.540' AS DateTime), 27, 0, 1)
INSERT [dbo].[KanBan_Story_StatusLog] ([Alias], [CurDatetime], [Story_ID], [Status_Prev], [Status_New]) VALUES (N'', CAST(N'2017-03-03T10:55:01.870' AS DateTime), 28, 0, 1)
INSERT [dbo].[KanBan_Story_StatusLog] ([Alias], [CurDatetime], [Story_ID], [Status_Prev], [Status_New]) VALUES (N'', CAST(N'2017-03-03T10:56:40.393' AS DateTime), 29, 0, 1)
INSERT [dbo].[KanBan_Story_StatusLog] ([Alias], [CurDatetime], [Story_ID], [Status_Prev], [Status_New]) VALUES (N'', CAST(N'2017-03-03T13:30:47.597' AS DateTime), 44, 0, 1)
INSERT [dbo].[KanBan_Story_StatusLog] ([Alias], [CurDatetime], [Story_ID], [Status_Prev], [Status_New]) VALUES (N'', CAST(N'2017-03-03T13:31:39.763' AS DateTime), 45, 0, 1)
INSERT [dbo].[KanBan_Story_StatusLog] ([Alias], [CurDatetime], [Story_ID], [Status_Prev], [Status_New]) VALUES (N'', CAST(N'2017-03-03T15:42:37.990' AS DateTime), 54, 0, 1)
INSERT [dbo].[KanBan_Story_StatusLog] ([Alias], [CurDatetime], [Story_ID], [Status_Prev], [Status_New]) VALUES (N'', CAST(N'2017-03-03T15:44:30.810' AS DateTime), 55, 0, 1)
INSERT [dbo].[KanBan_Story_StatusLog] ([Alias], [CurDatetime], [Story_ID], [Status_Prev], [Status_New]) VALUES (N'', CAST(N'2017-03-03T16:09:42.070' AS DateTime), 57, 0, 1)
INSERT [dbo].[KanBan_Story_StatusLog] ([Alias], [CurDatetime], [Story_ID], [Status_Prev], [Status_New]) VALUES (N'', CAST(N'2017-03-03T16:41:22.810' AS DateTime), 66, 0, 1)
INSERT [dbo].[KanBan_Story_StatusLog] ([Alias], [CurDatetime], [Story_ID], [Status_Prev], [Status_New]) VALUES (N'', CAST(N'2017-03-03T16:41:54.510' AS DateTime), 67, 0, 1)
INSERT [dbo].[KanBan_Story_StatusLog] ([Alias], [CurDatetime], [Story_ID], [Status_Prev], [Status_New]) VALUES (N'', CAST(N'2017-03-03T16:42:31.623' AS DateTime), 68, 0, 1)
INSERT [dbo].[KanBan_Story_StatusLog] ([Alias], [CurDatetime], [Story_ID], [Status_Prev], [Status_New]) VALUES (N'', CAST(N'2017-03-03T16:42:55.907' AS DateTime), 69, 0, 1)
INSERT [dbo].[KanBan_Story_StatusLog] ([Alias], [CurDatetime], [Story_ID], [Status_Prev], [Status_New]) VALUES (N'', CAST(N'2017-03-03T16:47:37.427' AS DateTime), 72, 0, 1)
INSERT [dbo].[KanBan_Story_StatusLog] ([Alias], [CurDatetime], [Story_ID], [Status_Prev], [Status_New]) VALUES (N'', CAST(N'2017-03-03T16:49:22.763' AS DateTime), 73, 0, 1)
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
INSERT [dbo].[KanBan_SwimLane_StatusLog] ([Alias], [CurDatetime], [Lane_ID], [Status_Prev], [Status_New]) VALUES (N'', CAST(N'2017-03-02T19:24:33.183' AS DateTime), 106, 0, 1)
INSERT [dbo].[KanBan_SwimLane_StatusLog] ([Alias], [CurDatetime], [Lane_ID], [Status_Prev], [Status_New]) VALUES (N'', CAST(N'2017-03-02T19:24:41.350' AS DateTime), 107, 0, 1)
INSERT [dbo].[KanBan_SwimLane_StatusLog] ([Alias], [CurDatetime], [Lane_ID], [Status_Prev], [Status_New]) VALUES (N'', CAST(N'2017-03-02T19:24:50.457' AS DateTime), 108, 0, 1)
INSERT [dbo].[KanBan_SwimLane_StatusLog] ([Alias], [CurDatetime], [Lane_ID], [Status_Prev], [Status_New]) VALUES (N'', CAST(N'2017-03-02T19:25:01.147' AS DateTime), 109, 0, 1)
INSERT [dbo].[KanBan_SwimLane_StatusLog] ([Alias], [CurDatetime], [Lane_ID], [Status_Prev], [Status_New]) VALUES (N'', CAST(N'2017-03-03T13:23:40.033' AS DateTime), 110, 0, 1)
INSERT [dbo].[KanBan_SwimLane_StatusLog] ([Alias], [CurDatetime], [Lane_ID], [Status_Prev], [Status_New]) VALUES (N'', CAST(N'2017-03-03T13:23:52.427' AS DateTime), 111, 0, 1)
INSERT [dbo].[KanBan_SwimLane_StatusLog] ([Alias], [CurDatetime], [Lane_ID], [Status_Prev], [Status_New]) VALUES (N'', CAST(N'2017-03-03T13:24:01.457' AS DateTime), 112, 0, 1)
INSERT [dbo].[KanBan_SwimLane_StatusLog] ([Alias], [CurDatetime], [Lane_ID], [Status_Prev], [Status_New]) VALUES (N'', CAST(N'2017-03-03T13:24:14.077' AS DateTime), 113, 0, 1)
INSERT [dbo].[KanBan_SwimLane_StatusLog] ([Alias], [CurDatetime], [Lane_ID], [Status_Prev], [Status_New]) VALUES (N'', CAST(N'2017-03-03T13:24:20.727' AS DateTime), 114, 0, 1)
INSERT [dbo].[KanBan_SwimLane_StatusLog] ([Alias], [CurDatetime], [Lane_ID], [Status_Prev], [Status_New]) VALUES (N'', CAST(N'2017-03-03T13:24:27.003' AS DateTime), 115, 0, 1)
INSERT [dbo].[KanBan_SwimLane_StatusLog] ([Alias], [CurDatetime], [Lane_ID], [Status_Prev], [Status_New]) VALUES (N'', CAST(N'2017-03-03T15:32:45.820' AS DateTime), 117, 0, 1)
INSERT [dbo].[KanBan_SwimLane_StatusLog] ([Alias], [CurDatetime], [Lane_ID], [Status_Prev], [Status_New]) VALUES (N'', CAST(N'2017-03-03T16:02:44.653' AS DateTime), 123, 0, 1)
INSERT [dbo].[KanBan_SwimLane_StatusLog] ([Alias], [CurDatetime], [Lane_ID], [Status_Prev], [Status_New]) VALUES (N'', CAST(N'2017-03-03T16:03:12.953' AS DateTime), 124, 0, 1)
INSERT [dbo].[KanBan_SwimLane_StatusLog] ([Alias], [CurDatetime], [Lane_ID], [Status_Prev], [Status_New]) VALUES (N'', CAST(N'2017-03-03T16:03:31.933' AS DateTime), 125, 0, 1)
INSERT [dbo].[KanBan_SwimLane_StatusLog] ([Alias], [CurDatetime], [Lane_ID], [Status_Prev], [Status_New]) VALUES (N'', CAST(N'2017-03-03T16:03:53.190' AS DateTime), 126, 0, 1)
INSERT [dbo].[KanBan_SwimLane_StatusLog] ([Alias], [CurDatetime], [Lane_ID], [Status_Prev], [Status_New]) VALUES (N'', CAST(N'2017-03-03T16:04:07.557' AS DateTime), 127, 0, 1)
INSERT [dbo].[KanBan_SwimLane_StatusLog] ([Alias], [CurDatetime], [Lane_ID], [Status_Prev], [Status_New]) VALUES (N'', CAST(N'2017-03-03T16:56:26.053' AS DateTime), 131, 0, 1)
INSERT [dbo].[KanBan_SwimLane_StatusLog] ([Alias], [CurDatetime], [Lane_ID], [Status_Prev], [Status_New]) VALUES (N'', CAST(N'2017-03-03T17:30:17.680' AS DateTime), 132, 0, 1)
INSERT [dbo].[KanBan_SwimLane_StatusLog] ([Alias], [CurDatetime], [Lane_ID], [Status_Prev], [Status_New]) VALUES (N'', CAST(N'2017-03-03T15:31:37.853' AS DateTime), 116, 0, 1)
INSERT [dbo].[KanBan_SwimLane_StatusLog] ([Alias], [CurDatetime], [Lane_ID], [Status_Prev], [Status_New]) VALUES (N'', CAST(N'2017-03-03T15:32:24.470' AS DateTime), 116, 1, 99)
INSERT [dbo].[KanBan_SwimLane_StatusLog] ([Alias], [CurDatetime], [Lane_ID], [Status_Prev], [Status_New]) VALUES (N'', CAST(N'2017-03-03T15:50:56.190' AS DateTime), 118, 0, 1)
INSERT [dbo].[KanBan_SwimLane_StatusLog] ([Alias], [CurDatetime], [Lane_ID], [Status_Prev], [Status_New]) VALUES (N'', CAST(N'2017-03-03T15:53:47.560' AS DateTime), 118, 1, 99)
INSERT [dbo].[KanBan_SwimLane_StatusLog] ([Alias], [CurDatetime], [Lane_ID], [Status_Prev], [Status_New]) VALUES (N'', CAST(N'2017-03-03T15:53:59.773' AS DateTime), 119, 0, 1)
INSERT [dbo].[KanBan_SwimLane_StatusLog] ([Alias], [CurDatetime], [Lane_ID], [Status_Prev], [Status_New]) VALUES (N'', CAST(N'2017-03-03T15:59:08.750' AS DateTime), 119, 1, 99)
INSERT [dbo].[KanBan_SwimLane_StatusLog] ([Alias], [CurDatetime], [Lane_ID], [Status_Prev], [Status_New]) VALUES (N'', CAST(N'2017-03-03T15:59:17.150' AS DateTime), 120, 0, 1)
INSERT [dbo].[KanBan_SwimLane_StatusLog] ([Alias], [CurDatetime], [Lane_ID], [Status_Prev], [Status_New]) VALUES (N'', CAST(N'2017-03-03T15:59:54.203' AS DateTime), 120, 1, 99)
INSERT [dbo].[KanBan_SwimLane_StatusLog] ([Alias], [CurDatetime], [Lane_ID], [Status_Prev], [Status_New]) VALUES (N'', CAST(N'2017-03-03T16:00:07.667' AS DateTime), 121, 0, 1)
INSERT [dbo].[KanBan_SwimLane_StatusLog] ([Alias], [CurDatetime], [Lane_ID], [Status_Prev], [Status_New]) VALUES (N'', CAST(N'2017-03-03T16:00:25.160' AS DateTime), 121, 1, 99)
INSERT [dbo].[KanBan_SwimLane_StatusLog] ([Alias], [CurDatetime], [Lane_ID], [Status_Prev], [Status_New]) VALUES (N'', CAST(N'2017-03-03T16:00:40.080' AS DateTime), 122, 0, 1)
INSERT [dbo].[KanBan_SwimLane_StatusLog] ([Alias], [CurDatetime], [Lane_ID], [Status_Prev], [Status_New]) VALUES (N'', CAST(N'2017-03-03T16:01:13.800' AS DateTime), 122, 1, 99)
INSERT [dbo].[KanBan_SwimLane_StatusLog] ([Alias], [CurDatetime], [Lane_ID], [Status_Prev], [Status_New]) VALUES (N'', CAST(N'2017-03-03T16:54:25.000' AS DateTime), 128, 0, 1)
INSERT [dbo].[KanBan_SwimLane_StatusLog] ([Alias], [CurDatetime], [Lane_ID], [Status_Prev], [Status_New]) VALUES (N'', CAST(N'2017-03-03T16:54:44.663' AS DateTime), 128, 1, 99)
INSERT [dbo].[KanBan_SwimLane_StatusLog] ([Alias], [CurDatetime], [Lane_ID], [Status_Prev], [Status_New]) VALUES (N'', CAST(N'2017-03-03T16:55:06.567' AS DateTime), 129, 0, 1)
INSERT [dbo].[KanBan_SwimLane_StatusLog] ([Alias], [CurDatetime], [Lane_ID], [Status_Prev], [Status_New]) VALUES (N'', CAST(N'2017-03-03T16:55:35.110' AS DateTime), 130, 0, 1)
INSERT [dbo].[KanBan_SwimLane_StatusLog] ([Alias], [CurDatetime], [Lane_ID], [Status_Prev], [Status_New]) VALUES (N'', CAST(N'2017-03-03T16:56:00.880' AS DateTime), 130, 1, 99)
INSERT [dbo].[KanBan_SwimLane_StatusLog] ([Alias], [CurDatetime], [Lane_ID], [Status_Prev], [Status_New]) VALUES (N'', CAST(N'2017-03-03T16:56:04.133' AS DateTime), 129, 1, 99)
SET IDENTITY_INSERT [dbo].[KanBan_TFS_Server] ON 

INSERT [dbo].[KanBan_TFS_Server] ([ID], [Server], [Collection], [Project]) VALUES (1, N'http://vstfmbs:8080/tfs/', N'MBS', N'AX6')
INSERT [dbo].[KanBan_TFS_Server] ([ID], [Server], [Collection], [Project]) VALUES (2, N'http://vstfmbs:8080/tfs/', N'MBS', N'Compliance')
INSERT [dbo].[KanBan_TFS_Server] ([ID], [Server], [Collection], [Project]) VALUES (3, N'http://vstfmbs:8080/tfs/', N'MBS', N'DAXSE')
INSERT [dbo].[KanBan_TFS_Server] ([ID], [Server], [Collection], [Project]) VALUES (4, N'http://vstfmbs:8080/tfs/', N'MBS', N'Dynamics')
SET IDENTITY_INSERT [dbo].[KanBan_TFS_Server] OFF
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
SET IDENTITY_INSERT [dbo].[SYS_User] ON 

INSERT [dbo].[SYS_User] ([ID], [Alias], [Status], [Config_TicketColor]) VALUES (1, N'', 1, 1)
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
