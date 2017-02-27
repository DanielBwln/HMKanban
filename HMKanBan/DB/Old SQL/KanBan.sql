USE [KanBan]
GO

IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[SYS_User]') AND name = N'IDX_SYS_User_Alias')
DROP INDEX [IDX_SYS_User_Alias] ON [dbo].[SYS_User] WITH ( ONLINE = OFF )
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SYS_User]') AND type in (N'U'))
DROP TABLE [dbo].[SYS_User]
GO
CREATE TABLE [dbo].[SYS_User](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Alias] [nvarchar](255) NOT NULL,
	[Status] [smallint] NOT NULL,
	[Config_TicketColor] [smallint] NOT NULL
) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IDX_SYS_User_Alias] ON [dbo].[SYS_User] 
(
	[Alias] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO



IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_KanBan_Status]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[KanBan] DROP CONSTRAINT [DF_KanBan_Status]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[KanBan]') AND type in (N'U'))
DROP TABLE [dbo].[KanBan]
GO
CREATE TABLE [dbo].[KanBan](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Status] [smallint] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[KanBan] ADD  CONSTRAINT [DF_KanBan_Status]  DEFAULT ((1)) FOR [Status]
GO

IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_KanBan_Column_Status]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[KanBan_Column] DROP CONSTRAINT [DF_KanBan_Column_Status]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[KanBan_Column]') AND type in (N'U'))
DROP TABLE [dbo].[KanBan_Column]
GO
CREATE TABLE [dbo].[KanBan_Column](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Seq] [int] NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[KanBan_ID] [bigint] NOT NULL,
	[Status] [smallint] NOT NULL,
	[Type] [smallint] NOT NULL,
	[RoleType] [smallint] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[KanBan_Column] ADD  CONSTRAINT [DF_KanBan_Column_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[KanBan_Column] ADD  CONSTRAINT [DF_KanBan_Column_Type]  DEFAULT ((1)) FOR [Type]
GO

IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_KanBan_Story_Status]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[KanBan_Story] DROP CONSTRAINT [DF_KanBan_Story_Status]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[KanBan_Story]') AND type in (N'U'))
DROP TABLE [dbo].[KanBan_Story]
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
	[Status] [smallint] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[KanBan_Story] ADD  CONSTRAINT [DF_KanBan_Story_Status]  DEFAULT ((1)) FOR [Status]
GO

IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_KanBan_SwimLane_Status]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[KanBan_SwimLane] DROP CONSTRAINT [DF_KanBan_SwimLane_Status]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[KanBan_SwimLane]') AND type in (N'U'))
DROP TABLE [dbo].[KanBan_SwimLane]
GO
CREATE TABLE [dbo].[KanBan_SwimLane](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[KanBan_ID] [bigint] NOT NULL,
	[Status] [smallint] NOT NULL,
	[Type] [smallint] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[KanBan_SwimLane] ADD  CONSTRAINT [DF_KanBan_SwimLane_Status]  DEFAULT ((1)) FOR [Status]
GO

IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_KanBan_User_Status]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[KanBan_User] DROP CONSTRAINT [DF_KanBan_User_Status]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[KanBan_User]') AND type in (N'U'))
DROP TABLE [dbo].[KanBan_User]
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
ALTER TABLE [dbo].[KanBan_User] ADD  CONSTRAINT [DF_KanBan_User_Status]  DEFAULT ((1)) FOR [Status]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[KanBan_Assignment]') AND type in (N'U'))
DROP TABLE [dbo].[KanBan_Assignment]
GO
CREATE TABLE [dbo].[KanBan_Assignment](
	[StoryID] [bigint] NOT NULL,
	[UserID] [bigint] NOT NULL,
	[AssignType] [smallint] NOT NULL
) ON [PRIMARY]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[KanBan_SwimLane_StatusLog]') AND type in (N'U'))
DROP TABLE [dbo].[KanBan_SwimLane_StatusLog]
GO
CREATE TABLE [dbo].[KanBan_SwimLane_StatusLog](
	[Alias] [nvarchar](31) NOT NULL,
	[CurDatetime] [datetime] NOT NULL,
	[Lane_ID] [bigint] NOT NULL,
	[Status_Prev] [smallint] NOT NULL,
	[Status_New] [smallint] NOT NULL
) ON [PRIMARY]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[KanBan_Story_StatusLog]') AND type in (N'U'))
DROP TABLE [dbo].[KanBan_Story_StatusLog]
GO
CREATE TABLE [dbo].[KanBan_Story_StatusLog](
	[Alias] [nvarchar](31) NOT NULL,
	[CurDatetime] [datetime] NOT NULL,
	[Story_ID] [bigint] NOT NULL,
	[Status_Prev] [bigint] NOT NULL,
	[Status_New] [bigint] NOT NULL
) ON [PRIMARY]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[KanBan_Story_ColumnLog]') AND type in (N'U'))
DROP TABLE [dbo].[KanBan_Story_ColumnLog]
GO
CREATE TABLE [dbo].[KanBan_Story_ColumnLog](
	[Alias] [nvarchar](31) NOT NULL,
	[CurDatetime] [datetime] NOT NULL,
	[Story_ID] [bigint] NOT NULL,
	[Column_ID_Prev] [bigint] NOT NULL,
	[Column_ID_New] [bigint] NOT NULL
) ON [PRIMARY]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[KanBan_TFS_Server]') AND type in (N'U'))
DROP TABLE [dbo].[KanBan_TFS_Server]
GO
CREATE TABLE [dbo].[KanBan_TFS_Server](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Server] [nvarchar](255) NOT NULL,
	[Collection] [nvarchar](63) NOT NULL,
	[Project] [nvarchar](63) NOT NULL
) ON [PRIMARY]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[KanBan_TFS_WIQ]') AND type in (N'U'))
DROP TABLE [dbo].[KanBan_TFS_WIQ]
GO
CREATE TABLE [dbo].[KanBan_TFS_WIQ](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[KanBan_ID] [bigint] NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[WIQ] [ntext] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[KanBan_ColumnGroup]') AND type in (N'U'))
DROP TABLE [dbo].[KanBan_ColumnGroup]
GO
CREATE TABLE [dbo].[KanBan_ColumnGroup](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[KanBan_ID] [bigint] NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Seq] [int] NOT NULL
) ON [PRIMARY]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[KanBan_ColumnGroup_Mapping]') AND type in (N'U'))
DROP TABLE [dbo].[KanBan_ColumnGroup_Mapping]
GO
CREATE TABLE [dbo].[KanBan_ColumnGroup_Mapping](
	[ColumnGroup_ID] [bigint] NOT NULL,
	[Column_ID] [bigint] NOT NULL
) ON [PRIMARY]
GO


SET IDENTITY_INSERT [dbo].[KanBan_TFS_Server] ON
INSERT [dbo].[KanBan_TFS_Server] ([ID], [Server], [Collection], [Project]) VALUES (1, N'http://vstfdax:8080/tfs/', N'MBS', N'AX6')
INSERT [dbo].[KanBan_TFS_Server] ([ID], [Server], [Collection], [Project]) VALUES (2, N'http://vstfdax:8080/tfs/', N'MBS', N'Compliance')
INSERT [dbo].[KanBan_TFS_Server] ([ID], [Server], [Collection], [Project]) VALUES (3, N'http://vstfdax:8080/tfs/', N'MBS', N'DAXSE')
SET IDENTITY_INSERT [dbo].[KanBan_TFS_Server] OFF

SET IDENTITY_INSERT [dbo].[KanBan] ON;
INSERT [dbo].[KanBan] ([ID], [Name], [Status]) VALUES (1, N'APAC KanBan', 1)
INSERT [dbo].[KanBan] ([ID], [Name], [Status]) VALUES (2, N'APAC KanBan Test', 1)
INSERT [dbo].[KanBan] ([ID], [Name], [Status]) VALUES (3, N'APAC KanBan 2', 1)
INSERT [dbo].[KanBan] ([ID], [Name], [Status]) VALUES (100, N'APAC KanBan Demo', 1)
SET IDENTITY_INSERT [dbo].[KanBan] OFF;

SET IDENTITY_INSERT [dbo].[KanBan_Column] ON;
INSERT [dbo].[KanBan_Column] ([ID], [Seq], [Name], [KanBan_ID], [Status], [Type]) VALUES (1, 1, N'Init. Req', 1, 1, 1)
INSERT [dbo].[KanBan_Column] ([ID], [Seq], [Name], [KanBan_ID], [Status], [Type]) VALUES (2, 2, N'Triage', 1, 1, 1)
INSERT [dbo].[KanBan_Column] ([ID], [Seq], [Name], [KanBan_ID], [Status], [Type]) VALUES (3, 3, N'Ramp Up', 1, 1, 1)
INSERT [dbo].[KanBan_Column] ([ID], [Seq], [Name], [KanBan_ID], [Status], [Type]) VALUES (4, 4, N'SFE', 1, 1, 1)
INSERT [dbo].[KanBan_Column] ([ID], [Seq], [Name], [KanBan_ID], [Status], [Type]) VALUES (5, 5, N'DESIGN', 1, 1, 1)
INSERT [dbo].[KanBan_Column] ([ID], [Seq], [Name], [KanBan_ID], [Status], [Type]) VALUES (6, 6, N'Global Review', 1, 1, 1)
INSERT [dbo].[KanBan_Column] ([ID], [Seq], [Name], [KanBan_ID], [Status], [Type]) VALUES (7, 7, N'Break Down', 1, 1, 1)
INSERT [dbo].[KanBan_Column] ([ID], [Seq], [Name], [KanBan_ID], [Status], [Type]) VALUES (8, 8, N'ATDD/Dev', 1, 1, 1)
INSERT [dbo].[KanBan_Column] ([ID], [Seq], [Name], [KanBan_ID], [Status], [Type]) VALUES (9, 9, N'Validation', 1, 1, 1)
INSERT [dbo].[KanBan_Column] ([ID], [Seq], [Name], [KanBan_ID], [Status], [Type]) VALUES (10, 10, N'Check In', 1, 1, 1)
INSERT [dbo].[KanBan_Column] ([ID], [Seq], [Name], [KanBan_ID], [Status], [Type]) VALUES (11, 11, N'Integration Test', 1, 1, 1)
INSERT [dbo].[KanBan_Column] ([ID], [Seq], [Name], [KanBan_ID], [Status], [Type]) VALUES (12, 12, N'PM Test', 1, 1, 1)
INSERT [dbo].[KanBan_Column] ([ID], [Seq], [Name], [KanBan_ID], [Status], [Type]) VALUES (13, 13, N'Demo', 1, 1, 1)
INSERT [dbo].[KanBan_Column] ([ID], [Seq], [Name], [KanBan_ID], [Status], [Type]) VALUES (14, 14, N'Ready to Release', 1, 1, 1)
INSERT [dbo].[KanBan_Column] ([ID], [Seq], [Name], [KanBan_ID], [Status], [Type]) VALUES (15, 1, N'Init. Req', 2, 1, 1)
INSERT [dbo].[KanBan_Column] ([ID], [Seq], [Name], [KanBan_ID], [Status], [Type]) VALUES (16, 2, N'Triage', 2, 1, 1)
INSERT [dbo].[KanBan_Column] ([ID], [Seq], [Name], [KanBan_ID], [Status], [Type]) VALUES (17, 3, N'Ramp Up', 2, 1, 1)
INSERT [dbo].[KanBan_Column] ([ID], [Seq], [Name], [KanBan_ID], [Status], [Type]) VALUES (18, 4, N'SFE', 2, 1, 1)
INSERT [dbo].[KanBan_Column] ([ID], [Seq], [Name], [KanBan_ID], [Status], [Type]) VALUES (19, 5, N'DESIGN', 2, 1, 1)
INSERT [dbo].[KanBan_Column] ([ID], [Seq], [Name], [KanBan_ID], [Status], [Type]) VALUES (20, 6, N'Global Review', 2, 1, 1)
INSERT [dbo].[KanBan_Column] ([ID], [Seq], [Name], [KanBan_ID], [Status], [Type]) VALUES (21, 7, N'Break Down', 2, 1, 1)
INSERT [dbo].[KanBan_Column] ([ID], [Seq], [Name], [KanBan_ID], [Status], [Type]) VALUES (22, 8, N'ATDD/Dev', 2, 1, 1)
INSERT [dbo].[KanBan_Column] ([ID], [Seq], [Name], [KanBan_ID], [Status], [Type]) VALUES (23, 9, N'Validation', 2, 1, 1)
INSERT [dbo].[KanBan_Column] ([ID], [Seq], [Name], [KanBan_ID], [Status], [Type]) VALUES (24, 10, N'Check In', 2, 1, 1)
INSERT [dbo].[KanBan_Column] ([ID], [Seq], [Name], [KanBan_ID], [Status], [Type]) VALUES (25, 11, N'Integration Test', 2, 1, 1)
INSERT [dbo].[KanBan_Column] ([ID], [Seq], [Name], [KanBan_ID], [Status], [Type]) VALUES (26, 12, N'PM Test', 2, 1, 1)
INSERT [dbo].[KanBan_Column] ([ID], [Seq], [Name], [KanBan_ID], [Status], [Type]) VALUES (27, 13, N'Demo', 2, 1, 1)
INSERT [dbo].[KanBan_Column] ([ID], [Seq], [Name], [KanBan_ID], [Status], [Type]) VALUES (28, 14, N'Ready to Release', 2, 1, 1)
INSERT [dbo].[KanBan_Column] ([ID], [Seq], [Name], [KanBan_ID], [Status], [Type]) VALUES (29, 1, N'Init. Req', 100, 1, 1)
INSERT [dbo].[KanBan_Column] ([ID], [Seq], [Name], [KanBan_ID], [Status], [Type]) VALUES (30, 2, N'Triage', 100, 1, 1)
INSERT [dbo].[KanBan_Column] ([ID], [Seq], [Name], [KanBan_ID], [Status], [Type]) VALUES (31, 3, N'Ramp Up', 100, 1, 1)
INSERT [dbo].[KanBan_Column] ([ID], [Seq], [Name], [KanBan_ID], [Status], [Type]) VALUES (32, 4, N'SFE', 100, 1, 1)
INSERT [dbo].[KanBan_Column] ([ID], [Seq], [Name], [KanBan_ID], [Status], [Type]) VALUES (33, 5, N'DESIGN', 100, 1, 1)
INSERT [dbo].[KanBan_Column] ([ID], [Seq], [Name], [KanBan_ID], [Status], [Type]) VALUES (34, 6, N'Global Review', 100, 1, 1)
INSERT [dbo].[KanBan_Column] ([ID], [Seq], [Name], [KanBan_ID], [Status], [Type]) VALUES (35, 7, N'Break Down', 100, 1, 1)
INSERT [dbo].[KanBan_Column] ([ID], [Seq], [Name], [KanBan_ID], [Status], [Type]) VALUES (36, 8, N'ATDD/Dev', 100, 1, 1)
INSERT [dbo].[KanBan_Column] ([ID], [Seq], [Name], [KanBan_ID], [Status], [Type]) VALUES (37, 9, N'Validation', 100, 1, 1)
INSERT [dbo].[KanBan_Column] ([ID], [Seq], [Name], [KanBan_ID], [Status], [Type]) VALUES (38, 10, N'Check In', 100, 1, 1)
INSERT [dbo].[KanBan_Column] ([ID], [Seq], [Name], [KanBan_ID], [Status], [Type]) VALUES (39, 11, N'Integration Test', 100, 1, 1)
INSERT [dbo].[KanBan_Column] ([ID], [Seq], [Name], [KanBan_ID], [Status], [Type]) VALUES (40, 12, N'PM Test', 100, 1, 1)
INSERT [dbo].[KanBan_Column] ([ID], [Seq], [Name], [KanBan_ID], [Status], [Type]) VALUES (41, 13, N'Demo', 100, 1, 1)
INSERT [dbo].[KanBan_Column] ([ID], [Seq], [Name], [KanBan_ID], [Status], [Type]) VALUES (42, 14, N'Ready to Release', 100, 1, 1)
INSERT [dbo].[KanBan_Column] ([ID], [Seq], [Name], [KanBan_ID], [Status], [Type]) VALUES (43, 1, N'Init', 3, 1, 1)
INSERT [dbo].[KanBan_Column] ([ID], [Seq], [Name], [KanBan_ID], [Status], [Type]) VALUES (44, 2, N'Active', 3, 1, 1)
INSERT [dbo].[KanBan_Column] ([ID], [Seq], [Name], [KanBan_ID], [Status], [Type]) VALUES (45, 3, N'Done', 3, 1, 1)
INSERT [dbo].[KanBan_Column] ([ID], [Seq], [Name], [KanBan_ID], [Status], [Type]) VALUES (46, 4, N'Cancel', 3, 1, 1)
SET IDENTITY_INSERT [dbo].[KanBan_Column] OFF;

SET IDENTITY_INSERT [dbo].[KanBan_User] ON;
INSERT [dbo].[KanBan_User] ([ID], [Alias], [FirstName], [LastName], [Role], [Status], [KanBan_ID]) VALUES (1, N'bennety', N'Bennet', N'Yen', 1, 1,1)
INSERT [dbo].[KanBan_User] ([ID], [Alias], [FirstName], [LastName], [Role], [Status], [KanBan_ID]) VALUES (2, N'i-bowgu', N'Bowbow', N'Gu', 2, 1,1)
INSERT [dbo].[KanBan_User] ([ID], [Alias], [FirstName], [LastName], [Role], [Status], [KanBan_ID]) VALUES (3, N'haofan', N'Hao', N'Fan', 3, 1,1)
INSERT [dbo].[KanBan_User] ([ID], [Alias], [FirstName], [LastName], [Role], [Status], [KanBan_ID]) VALUES (4, N'jwong', N'Jimmy', N'Wong', 3, 1,1)
INSERT [dbo].[KanBan_User] ([ID], [Alias], [FirstName], [LastName], [Role], [Status], [KanBan_ID]) VALUES (5, N'ralin', N'Rake', N'Gui', 3, 1,1)
INSERT [dbo].[KanBan_User] ([ID], [Alias], [FirstName], [LastName], [Role], [Status], [KanBan_ID]) VALUES (9, N'coyan', N'Cobbie', N'Yang', 4, 1,1)
INSERT [dbo].[KanBan_User] ([ID], [Alias], [FirstName], [LastName], [Role], [Status], [KanBan_ID]) VALUES (10, N'frankg', N'Frank', N'Gao', 4, 1,1)
INSERT [dbo].[KanBan_User] ([ID], [Alias], [FirstName], [LastName], [Role], [Status], [KanBan_ID]) VALUES (11, N'khurraz', N'Khurram', N'Zaki', 4, 1,1)
INSERT [dbo].[KanBan_User] ([ID], [Alias], [FirstName], [LastName], [Role], [Status], [KanBan_ID]) VALUES (12, N'prabhatb', N'Prabhat', N'Bhargava', 4, 1,1)
INSERT [dbo].[KanBan_User] ([ID], [Alias], [FirstName], [LastName], [Role], [Status], [KanBan_ID]) VALUES (13, N'vihuang', N'Vivian', N'Huang', 4, 1,1)
INSERT [dbo].[KanBan_User] ([ID], [Alias], [FirstName], [LastName], [Role], [Status], [KanBan_ID]) VALUES (14, N'ykirwan', N'Yvette', N'Kirwan', 4, 1,1)
INSERT [dbo].[KanBan_User] ([ID], [Alias], [FirstName], [LastName], [Role], [Status], [KanBan_ID]) VALUES (15, N'naiketer', N'Naoki', N'Iketeru', 4, 99,1)
INSERT [dbo].[KanBan_User] ([ID], [Alias], [FirstName], [LastName], [Role], [Status], [KanBan_ID]) VALUES (16, N'adzhang', N'Adrian', N'Zhang', 5, 1,1)
INSERT [dbo].[KanBan_User] ([ID], [Alias], [FirstName], [LastName], [Role], [Status], [KanBan_ID]) VALUES (17, N'apsong', N'Apo', N'Song', 5, 1,1)
INSERT [dbo].[KanBan_User] ([ID], [Alias], [FirstName], [LastName], [Role], [Status], [KanBan_ID]) VALUES (18, N'bryanlaw', N'Bryan', N'Law', 5, 1,1)
INSERT [dbo].[KanBan_User] ([ID], [Alias], [FirstName], [LastName], [Role], [Status], [KanBan_ID]) VALUES (19, N'cawan', N'Cannon', N'Wang', 5, 1,1)
INSERT [dbo].[KanBan_User] ([ID], [Alias], [FirstName], [LastName], [Role], [Status], [KanBan_ID]) VALUES (20, N'hongch', N'Hong', N'Cheng', 5, 1,1)
INSERT [dbo].[KanBan_User] ([ID], [Alias], [FirstName], [LastName], [Role], [Status], [KanBan_ID]) VALUES (21, N'jeyao', N'Jessie', N'Yao', 5, 1,1)
INSERT [dbo].[KanBan_User] ([ID], [Alias], [FirstName], [LastName], [Role], [Status], [KanBan_ID]) VALUES (23, N'kaili', N'Kai', N'Li', 5, 1,1)
INSERT [dbo].[KanBan_User] ([ID], [Alias], [FirstName], [LastName], [Role], [Status], [KanBan_ID]) VALUES (24, N'lingzha', N'Ling', N'Zhang', 5, 1,1)
INSERT [dbo].[KanBan_User] ([ID], [Alias], [FirstName], [LastName], [Role], [Status], [KanBan_ID]) VALUES (25, N'lison', N'Linjie', N'Song', 5, 1,1)
INSERT [dbo].[KanBan_User] ([ID], [Alias], [FirstName], [LastName], [Role], [Status], [KanBan_ID]) VALUES (26, N'liushi', N'Liu', N'Shi', 5, 1,1)
INSERT [dbo].[KanBan_User] ([ID], [Alias], [FirstName], [LastName], [Role], [Status], [KanBan_ID]) VALUES (27, N'maplnan', N'Maple', N'Nan', 5, 1,1)
INSERT [dbo].[KanBan_User] ([ID], [Alias], [FirstName], [LastName], [Role], [Status], [KanBan_ID]) VALUES (28, N'niwang', N'Miki', N'Wang', 5, 1,1)
INSERT [dbo].[KanBan_User] ([ID], [Alias], [FirstName], [LastName], [Role], [Status], [KanBan_ID]) VALUES (29, N'chenl', N'Solomon', N'Li', 5, 1,1)
INSERT [dbo].[KanBan_User] ([ID], [Alias], [FirstName], [LastName], [Role], [Status], [KanBan_ID]) VALUES (30, N'summerli', N'Summer', N'Liu', 5, 1,1)
INSERT [dbo].[KanBan_User] ([ID], [Alias], [FirstName], [LastName], [Role], [Status], [KanBan_ID]) VALUES (31, N'suzhen', N'Suzhen', N'Zheng', 5, 1,1)
INSERT [dbo].[KanBan_User] ([ID], [Alias], [FirstName], [LastName], [Role], [Status], [KanBan_ID]) VALUES (32, N'xiaomzh', N'Xiaoming', N'Zhu', 5, 1,1)
INSERT [dbo].[KanBan_User] ([ID], [Alias], [FirstName], [LastName], [Role], [Status], [KanBan_ID]) VALUES (33, N't-jihu', N'Jiajun', N'Hu', 6, 1,1)
INSERT [dbo].[KanBan_User] ([ID], [Alias], [FirstName], [LastName], [Role], [Status], [KanBan_ID]) VALUES (34, N't-minjuz', N'Minjun', N'Zhu', 6, 1,1)
INSERT [dbo].[KanBan_User] ([ID], [Alias], [FirstName], [LastName], [Role], [Status], [KanBan_ID]) VALUES (35, N't-yanl', N'Yan', N'Li', 6, 1,1)
INSERT [dbo].[KanBan_User] ([ID], [Alias], [FirstName], [LastName], [Role], [Status], [KanBan_ID]) VALUES (101, N'v-strliu', N'Strawberry', N'Liu', 7, 1,1)
INSERT [dbo].[KanBan_User] ([ID], [Alias], [FirstName], [LastName], [Role], [Status], [KanBan_ID]) VALUES (102, N'v-jadeli', N'Jade', N'Liu', 7, 1,1)
INSERT [dbo].[KanBan_User] ([ID], [Alias], [FirstName], [LastName], [Role], [Status], [KanBan_ID]) VALUES (103, N'v-jinjg', N'Jinjin', N'Gao', 7, 1,1)
INSERT [dbo].[KanBan_User] ([ID], [Alias], [FirstName], [LastName], [Role], [Status], [KanBan_ID]) VALUES (104, N'v-pejia', N'Peiqing', N'Jia', 7, 1,1)
INSERT [dbo].[KanBan_User] ([ID], [Alias], [FirstName], [LastName], [Role], [Status], [KanBan_ID]) VALUES (107, N'v-aarmet', N'Aarthi', N'Shah', 7, 1,1)
INSERT [dbo].[KanBan_User] ([ID], [Alias], [FirstName], [LastName], [Role], [Status], [KanBan_ID]) VALUES (108, N'v-sakros', N'Sai', N'Syam', 7, 1,1)
INSERT [dbo].[KanBan_User] ([ID], [Alias], [FirstName], [LastName], [Role], [Status], [KanBan_ID]) VALUES (109, N'v-keyan', N'Kevin', N'Yang', 7, 1,1)
INSERT [dbo].[KanBan_User] ([ID], [Alias], [FirstName], [LastName], [Role], [Status], [KanBan_ID]) VALUES (110, N'v-elyan', N'Elvis', N'Yang', 7, 1,1)
INSERT [dbo].[KanBan_User] ([ID], [Alias], [FirstName], [LastName], [Role], [Status], [KanBan_ID]) VALUES (111, N'v-daba', N'Daniel', N'Bai', 7, 1,1)
INSERT [dbo].[KanBan_User] ([ID], [Alias], [FirstName], [LastName], [Role], [Status], [KanBan_ID]) VALUES (112, N'v-srajan', N'Sailendran', N'Rajan', 7, 1,1)
INSERT [dbo].[KanBan_User] ([ID], [Alias], [FirstName], [LastName], [Role], [Status], [KanBan_ID]) VALUES (114, N'v-rsuvar', N'Rajesh', N'Suvarana', 7, 1,1)
INSERT [dbo].[KanBan_User] ([ID], [Alias], [FirstName], [LastName], [Role], [Status], [KanBan_ID]) VALUES (115, N'v-udkman', N'Uday', N'Kumar', 7, 1,1)

INSERT [dbo].[KanBan_User] ([ID], [Alias], [FirstName], [LastName], [Role], [Status], [KanBan_ID]) VALUES (10001, N'apsong', N'Apo', N'Song', 5, 1,2)
INSERT [dbo].[KanBan_User] ([ID], [Alias], [FirstName], [LastName], [Role], [Status], [KanBan_ID]) VALUES (20001, N'apsong', N'Apo', N'Song', 5, 1,3)
INSERT [dbo].[KanBan_User] ([ID], [Alias], [FirstName], [LastName], [Role], [Status], [KanBan_ID]) VALUES (30001, N'apsong', N'Apo', N'Song', 5, 1,100)
SET IDENTITY_INSERT [dbo].[KanBan_User] OFF;

SET IDENTITY_INSERT [dbo].[KanBan_TFS_WIQ] ON
INSERT [dbo].[KanBan_TFS_WIQ] ([ID], [KanBan_ID], [Name], [WIQ]) VALUES (2, 1, N'China Compliance Features', N'SELECT [System.Id], [System.WorkItemType], [System.Title], [System.AssignedTo], [System.State], [System.NodeName], [Microsoft.Dynamics.PMAssigned], [Microsoft.Dynamics.DevAssigned], [Microsoft.Dynamics.TestAssigned], [Microsoft.Dynamics.PMSize], [Microsoft.Dynamics.DevSize], [Microsoft.Dynamics.TestSize], [System.Description], [Microsoft.VSTS.CMMI.StepsToReproduce] FROM WorkItems WHERE [System.TeamProject] = ''compliance''  AND  [System.State] = ''Active''  AND  [System.AreaPath] UNDER ''Compliance\APAC\China'' ORDER BY [System.Id] ')
INSERT [dbo].[KanBan_TFS_WIQ] ([ID], [KanBan_ID], [Name], [WIQ]) VALUES (4, 1, N'India Compliance Features', N'SELECT [System.Id], [System.WorkItemType], [System.Title], [System.AssignedTo], [System.State], [System.NodeName], [Microsoft.Dynamics.PMAssigned], [Microsoft.Dynamics.DevAssigned], [Microsoft.Dynamics.TestAssigned], [Microsoft.Dynamics.PMSize], [Microsoft.Dynamics.DevSize], [Microsoft.Dynamics.TestSize], [System.Description], [Microsoft.VSTS.CMMI.StepsToReproduce] FROM WorkItems WHERE [System.TeamProject] = ''compliance''  AND  [System.State] = ''Active''  AND  [System.AreaPath] UNDER ''Compliance\APAC\India'' ORDER BY [System.Id] ')
INSERT [dbo].[KanBan_TFS_WIQ] ([ID], [KanBan_ID], [Name], [WIQ]) VALUES (5, 1, N'Japan Compliance Features', N'SELECT [System.Id], [System.WorkItemType], [System.Title], [System.AssignedTo], [System.State], [System.NodeName], [Microsoft.Dynamics.PMAssigned], [Microsoft.Dynamics.DevAssigned], [Microsoft.Dynamics.TestAssigned], [Microsoft.Dynamics.PMSize], [Microsoft.Dynamics.DevSize], [Microsoft.Dynamics.TestSize], [System.Description], [Microsoft.VSTS.CMMI.StepsToReproduce] FROM WorkItems WHERE [System.TeamProject] = ''compliance''  AND  [System.State] = ''Active''  AND  [System.AreaPath] UNDER ''Compliance\APAC\Japan'' ORDER BY [System.Id] ')
INSERT [dbo].[KanBan_TFS_WIQ] ([ID], [KanBan_ID], [Name], [WIQ]) VALUES (6, 2, N'China Compliance Features', N'SELECT [System.Id], [System.WorkItemType], [System.Title], [System.AssignedTo], [System.State], [System.NodeName], [Microsoft.Dynamics.PMAssigned], [Microsoft.Dynamics.DevAssigned], [Microsoft.Dynamics.TestAssigned], [Microsoft.Dynamics.PMSize], [Microsoft.Dynamics.DevSize], [Microsoft.Dynamics.TestSize], [System.Description], [Microsoft.VSTS.CMMI.StepsToReproduce] FROM WorkItems WHERE [System.TeamProject] = ''compliance''  AND  [System.State] = ''Active''  AND  [System.AreaPath] UNDER ''Compliance\APAC\China'' ORDER BY [System.Id] ')
INSERT [dbo].[KanBan_TFS_WIQ] ([ID], [KanBan_ID], [Name], [WIQ]) VALUES (7, 2, N'India Compliance Features', N'SELECT [System.Id], [System.WorkItemType], [System.Title], [System.AssignedTo], [System.State], [System.NodeName], [Microsoft.Dynamics.PMAssigned], [Microsoft.Dynamics.DevAssigned], [Microsoft.Dynamics.TestAssigned], [Microsoft.Dynamics.PMSize], [Microsoft.Dynamics.DevSize], [Microsoft.Dynamics.TestSize], [System.Description], [Microsoft.VSTS.CMMI.StepsToReproduce] FROM WorkItems WHERE [System.TeamProject] = ''compliance''  AND  [System.State] = ''Active''  AND  [System.AreaPath] UNDER ''Compliance\APAC\India'' ORDER BY [System.Id] ')
INSERT [dbo].[KanBan_TFS_WIQ] ([ID], [KanBan_ID], [Name], [WIQ]) VALUES (8, 2, N'Japan Compliance Features', N'SELECT [System.Id], [System.WorkItemType], [System.Title], [System.AssignedTo], [System.State], [System.NodeName], [Microsoft.Dynamics.PMAssigned], [Microsoft.Dynamics.DevAssigned], [Microsoft.Dynamics.TestAssigned], [Microsoft.Dynamics.PMSize], [Microsoft.Dynamics.DevSize], [Microsoft.Dynamics.TestSize], [System.Description], [Microsoft.VSTS.CMMI.StepsToReproduce] FROM WorkItems WHERE [System.TeamProject] = ''compliance''  AND  [System.State] = ''Active''  AND  [System.AreaPath] UNDER ''Compliance\APAC\Japan'' ORDER BY [System.Id] ')
INSERT [dbo].[KanBan_TFS_WIQ] ([ID], [KanBan_ID], [Name], [WIQ]) VALUES (9, 100, N'China Compliance Features', N'SELECT [System.Id], [System.WorkItemType], [System.Title], [System.AssignedTo], [System.State], [System.NodeName], [Microsoft.Dynamics.PMAssigned], [Microsoft.Dynamics.DevAssigned], [Microsoft.Dynamics.TestAssigned], [Microsoft.Dynamics.PMSize], [Microsoft.Dynamics.DevSize], [Microsoft.Dynamics.TestSize], [System.Description], [Microsoft.VSTS.CMMI.StepsToReproduce] FROM WorkItems WHERE [System.TeamProject] = ''compliance''  AND  [System.State] = ''Active''  AND  [System.AreaPath] UNDER ''Compliance\APAC\China'' ORDER BY [System.Id] ')
INSERT [dbo].[KanBan_TFS_WIQ] ([ID], [KanBan_ID], [Name], [WIQ]) VALUES (10, 100, N'India Compliance Features', N'SELECT [System.Id], [System.WorkItemType], [System.Title], [System.AssignedTo], [System.State], [System.NodeName], [Microsoft.Dynamics.PMAssigned], [Microsoft.Dynamics.DevAssigned], [Microsoft.Dynamics.TestAssigned], [Microsoft.Dynamics.PMSize], [Microsoft.Dynamics.DevSize], [Microsoft.Dynamics.TestSize], [System.Description], [Microsoft.VSTS.CMMI.StepsToReproduce] FROM WorkItems WHERE [System.TeamProject] = ''compliance''  AND  [System.State] = ''Active''  AND  [System.AreaPath] UNDER ''Compliance\APAC\India'' ORDER BY [System.Id] ')
INSERT [dbo].[KanBan_TFS_WIQ] ([ID], [KanBan_ID], [Name], [WIQ]) VALUES (11, 100, N'Japan Compliance Features', N'SELECT [System.Id], [System.WorkItemType], [System.Title], [System.AssignedTo], [System.State], [System.NodeName], [Microsoft.Dynamics.PMAssigned], [Microsoft.Dynamics.DevAssigned], [Microsoft.Dynamics.TestAssigned], [Microsoft.Dynamics.PMSize], [Microsoft.Dynamics.DevSize], [Microsoft.Dynamics.TestSize], [System.Description], [Microsoft.VSTS.CMMI.StepsToReproduce] FROM WorkItems WHERE [System.TeamProject] = ''compliance''  AND  [System.State] = ''Active''  AND  [System.AreaPath] UNDER ''Compliance\APAC\Japan'' ORDER BY [System.Id] ')
SET IDENTITY_INSERT [dbo].[KanBan_TFS_WIQ] OFF

SET IDENTITY_INSERT [dbo].[KanBan_ColumnGroup] ON
INSERT [dbo].[KanBan_ColumnGroup] ([ID], [KanBan_ID], [Name], [Seq]) VALUES (1, 1, N'Initialization', 1)
INSERT [dbo].[KanBan_ColumnGroup] ([ID], [KanBan_ID], [Name], [Seq]) VALUES (2, 1, N'Design', 2)
INSERT [dbo].[KanBan_ColumnGroup] ([ID], [KanBan_ID], [Name], [Seq]) VALUES (3, 1, N'Implementation', 3)
INSERT [dbo].[KanBan_ColumnGroup] ([ID], [KanBan_ID], [Name], [Seq]) VALUES (4, 1, N'Stabilization', 4)
INSERT [dbo].[KanBan_ColumnGroup] ([ID], [KanBan_ID], [Name], [Seq]) VALUES (5, 1, N'Completion', 5)
INSERT [dbo].[KanBan_ColumnGroup] ([ID], [KanBan_ID], [Name], [Seq]) VALUES (6, 2, N'Initialization', 1)
INSERT [dbo].[KanBan_ColumnGroup] ([ID], [KanBan_ID], [Name], [Seq]) VALUES (7, 2, N'Design', 2)
INSERT [dbo].[KanBan_ColumnGroup] ([ID], [KanBan_ID], [Name], [Seq]) VALUES (8, 2, N'Implementation', 3)
INSERT [dbo].[KanBan_ColumnGroup] ([ID], [KanBan_ID], [Name], [Seq]) VALUES (9, 2, N'Stabilization', 4)
INSERT [dbo].[KanBan_ColumnGroup] ([ID], [KanBan_ID], [Name], [Seq]) VALUES (10, 2, N'Completion', 5)
INSERT [dbo].[KanBan_ColumnGroup] ([ID], [KanBan_ID], [Name], [Seq]) VALUES (11, 100, N'Initialization', 1)
INSERT [dbo].[KanBan_ColumnGroup] ([ID], [KanBan_ID], [Name], [Seq]) VALUES (12, 100, N'Design', 2)
INSERT [dbo].[KanBan_ColumnGroup] ([ID], [KanBan_ID], [Name], [Seq]) VALUES (13, 100, N'Implementation', 3)
INSERT [dbo].[KanBan_ColumnGroup] ([ID], [KanBan_ID], [Name], [Seq]) VALUES (14, 100, N'Stabilization', 4)
INSERT [dbo].[KanBan_ColumnGroup] ([ID], [KanBan_ID], [Name], [Seq]) VALUES (15, 100, N'Completion', 5)
INSERT [dbo].[KanBan_ColumnGroup] ([ID], [KanBan_ID], [Name], [Seq]) VALUES (16, 3, N'Init', 1)
INSERT [dbo].[KanBan_ColumnGroup] ([ID], [KanBan_ID], [Name], [Seq]) VALUES (17, 3, N'In Progress', 2)
INSERT [dbo].[KanBan_ColumnGroup] ([ID], [KanBan_ID], [Name], [Seq]) VALUES (18, 3, N'End', 3)
SET IDENTITY_INSERT [dbo].[KanBan_ColumnGroup] OFF

INSERT [dbo].[KanBan_ColumnGroup_Mapping] ([ColumnGroup_ID], [Column_ID]) VALUES (1, 1)
INSERT [dbo].[KanBan_ColumnGroup_Mapping] ([ColumnGroup_ID], [Column_ID]) VALUES (1, 2)
INSERT [dbo].[KanBan_ColumnGroup_Mapping] ([ColumnGroup_ID], [Column_ID]) VALUES (1, 3)
INSERT [dbo].[KanBan_ColumnGroup_Mapping] ([ColumnGroup_ID], [Column_ID]) VALUES (2, 4)
INSERT [dbo].[KanBan_ColumnGroup_Mapping] ([ColumnGroup_ID], [Column_ID]) VALUES (2, 5)
INSERT [dbo].[KanBan_ColumnGroup_Mapping] ([ColumnGroup_ID], [Column_ID]) VALUES (2, 6)
INSERT [dbo].[KanBan_ColumnGroup_Mapping] ([ColumnGroup_ID], [Column_ID]) VALUES (2, 7)
INSERT [dbo].[KanBan_ColumnGroup_Mapping] ([ColumnGroup_ID], [Column_ID]) VALUES (3, 8)
INSERT [dbo].[KanBan_ColumnGroup_Mapping] ([ColumnGroup_ID], [Column_ID]) VALUES (3, 9)
INSERT [dbo].[KanBan_ColumnGroup_Mapping] ([ColumnGroup_ID], [Column_ID]) VALUES (3, 10)
INSERT [dbo].[KanBan_ColumnGroup_Mapping] ([ColumnGroup_ID], [Column_ID]) VALUES (4, 11)
INSERT [dbo].[KanBan_ColumnGroup_Mapping] ([ColumnGroup_ID], [Column_ID]) VALUES (4, 12)
INSERT [dbo].[KanBan_ColumnGroup_Mapping] ([ColumnGroup_ID], [Column_ID]) VALUES (4, 13)
INSERT [dbo].[KanBan_ColumnGroup_Mapping] ([ColumnGroup_ID], [Column_ID]) VALUES (5, 14)
INSERT [dbo].[KanBan_ColumnGroup_Mapping] ([ColumnGroup_ID], [Column_ID]) VALUES (6, 15)
INSERT [dbo].[KanBan_ColumnGroup_Mapping] ([ColumnGroup_ID], [Column_ID]) VALUES (6, 16)
INSERT [dbo].[KanBan_ColumnGroup_Mapping] ([ColumnGroup_ID], [Column_ID]) VALUES (6, 17)
INSERT [dbo].[KanBan_ColumnGroup_Mapping] ([ColumnGroup_ID], [Column_ID]) VALUES (7, 18)
INSERT [dbo].[KanBan_ColumnGroup_Mapping] ([ColumnGroup_ID], [Column_ID]) VALUES (7, 19)
INSERT [dbo].[KanBan_ColumnGroup_Mapping] ([ColumnGroup_ID], [Column_ID]) VALUES (7, 20)
INSERT [dbo].[KanBan_ColumnGroup_Mapping] ([ColumnGroup_ID], [Column_ID]) VALUES (7, 21)
INSERT [dbo].[KanBan_ColumnGroup_Mapping] ([ColumnGroup_ID], [Column_ID]) VALUES (8, 22)
INSERT [dbo].[KanBan_ColumnGroup_Mapping] ([ColumnGroup_ID], [Column_ID]) VALUES (8, 23)
INSERT [dbo].[KanBan_ColumnGroup_Mapping] ([ColumnGroup_ID], [Column_ID]) VALUES (8, 24)
INSERT [dbo].[KanBan_ColumnGroup_Mapping] ([ColumnGroup_ID], [Column_ID]) VALUES (9, 25)
INSERT [dbo].[KanBan_ColumnGroup_Mapping] ([ColumnGroup_ID], [Column_ID]) VALUES (9, 26)
INSERT [dbo].[KanBan_ColumnGroup_Mapping] ([ColumnGroup_ID], [Column_ID]) VALUES (9, 27)
INSERT [dbo].[KanBan_ColumnGroup_Mapping] ([ColumnGroup_ID], [Column_ID]) VALUES (10, 28)
INSERT [dbo].[KanBan_ColumnGroup_Mapping] ([ColumnGroup_ID], [Column_ID]) VALUES (11, 29)
INSERT [dbo].[KanBan_ColumnGroup_Mapping] ([ColumnGroup_ID], [Column_ID]) VALUES (11, 30)
INSERT [dbo].[KanBan_ColumnGroup_Mapping] ([ColumnGroup_ID], [Column_ID]) VALUES (11, 31)
INSERT [dbo].[KanBan_ColumnGroup_Mapping] ([ColumnGroup_ID], [Column_ID]) VALUES (12, 32)
INSERT [dbo].[KanBan_ColumnGroup_Mapping] ([ColumnGroup_ID], [Column_ID]) VALUES (12, 33)
INSERT [dbo].[KanBan_ColumnGroup_Mapping] ([ColumnGroup_ID], [Column_ID]) VALUES (12, 34)
INSERT [dbo].[KanBan_ColumnGroup_Mapping] ([ColumnGroup_ID], [Column_ID]) VALUES (12, 35)
INSERT [dbo].[KanBan_ColumnGroup_Mapping] ([ColumnGroup_ID], [Column_ID]) VALUES (13, 36)
INSERT [dbo].[KanBan_ColumnGroup_Mapping] ([ColumnGroup_ID], [Column_ID]) VALUES (13, 37)
INSERT [dbo].[KanBan_ColumnGroup_Mapping] ([ColumnGroup_ID], [Column_ID]) VALUES (13, 38)
INSERT [dbo].[KanBan_ColumnGroup_Mapping] ([ColumnGroup_ID], [Column_ID]) VALUES (14, 39)
INSERT [dbo].[KanBan_ColumnGroup_Mapping] ([ColumnGroup_ID], [Column_ID]) VALUES (14, 40)
INSERT [dbo].[KanBan_ColumnGroup_Mapping] ([ColumnGroup_ID], [Column_ID]) VALUES (14, 41)
INSERT [dbo].[KanBan_ColumnGroup_Mapping] ([ColumnGroup_ID], [Column_ID]) VALUES (15, 42)
INSERT [dbo].[KanBan_ColumnGroup_Mapping] ([ColumnGroup_ID], [Column_ID]) VALUES (16, 43)
INSERT [dbo].[KanBan_ColumnGroup_Mapping] ([ColumnGroup_ID], [Column_ID]) VALUES (17, 44)
INSERT [dbo].[KanBan_ColumnGroup_Mapping] ([ColumnGroup_ID], [Column_ID]) VALUES (18, 45)
INSERT [dbo].[KanBan_ColumnGroup_Mapping] ([ColumnGroup_ID], [Column_ID]) VALUES (18, 46)
