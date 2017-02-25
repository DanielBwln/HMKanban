USE [KanBan]
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_KanBan_User_Status]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[KanBan_User] DROP CONSTRAINT [DF_KanBan_User_Status]
END

GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_KanBan_SwimLane_Status]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[KanBan_SwimLane] DROP CONSTRAINT [DF_KanBan_SwimLane_Status]
END

GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_KanBan_Story_Check_Checked]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[KanBan_Story_Check] DROP CONSTRAINT [DF_KanBan_Story_Check_Checked]
END

GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_KanBan_Story_Status]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[KanBan_Story] DROP CONSTRAINT [DF_KanBan_Story_Status]
END

GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_KanBan_Cycle_Period_Status_Resolve_Num]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[KanBan_Cycle_Period_Status] DROP CONSTRAINT [DF_KanBan_Cycle_Period_Status_Resolve_Num]
END

GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_KanBan_Cycle_Period_Status_Fire_Num]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[KanBan_Cycle_Period_Status] DROP CONSTRAINT [DF_KanBan_Cycle_Period_Status_Fire_Num]
END

GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_KanBan_Cycle_Period_Status_Outcome_Num]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[KanBan_Cycle_Period_Status] DROP CONSTRAINT [DF_KanBan_Cycle_Period_Status_Outcome_Num]
END

GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_KanBan_Cycle_Period_Status_Income_Num]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[KanBan_Cycle_Period_Status] DROP CONSTRAINT [DF_KanBan_Cycle_Period_Status_Income_Num]
END

GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_KanBan_Cycle_Period_Status_Inventory_Num]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[KanBan_Cycle_Period_Status] DROP CONSTRAINT [DF_KanBan_Cycle_Period_Status_Inventory_Num]
END

GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_KanBan_Column_Checklist_Status]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[KanBan_Column_Checklist] DROP CONSTRAINT [DF_KanBan_Column_Checklist_Status]
END

GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_KanBan_Column_Type]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[KanBan_Column] DROP CONSTRAINT [DF_KanBan_Column_Type]
END

GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_KanBan_Column_Status]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[KanBan_Column] DROP CONSTRAINT [DF_KanBan_Column_Status]
END

GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_KanBan_Status]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[KanBan] DROP CONSTRAINT [DF_KanBan_Status]
END

GO
/****** Object:  Table [dbo].[SYS_User]    Script Date: 8/24/2016 1:40:34 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SYS_User]') AND type in (N'U'))
DROP TABLE [dbo].[SYS_User]
GO
/****** Object:  Table [dbo].[KanBan_User]    Script Date: 8/24/2016 1:40:34 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[KanBan_User]') AND type in (N'U'))
DROP TABLE [dbo].[KanBan_User]
GO
/****** Object:  Table [dbo].[KanBan_TFS_WIQ]    Script Date: 8/24/2016 1:40:34 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[KanBan_TFS_WIQ]') AND type in (N'U'))
DROP TABLE [dbo].[KanBan_TFS_WIQ]
GO
/****** Object:  Table [dbo].[KanBan_TFS_Server]    Script Date: 8/24/2016 1:40:34 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[KanBan_TFS_Server]') AND type in (N'U'))
DROP TABLE [dbo].[KanBan_TFS_Server]
GO
/****** Object:  Table [dbo].[KanBan_SwimLane_StatusLog]    Script Date: 8/24/2016 1:40:34 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[KanBan_SwimLane_StatusLog]') AND type in (N'U'))
DROP TABLE [dbo].[KanBan_SwimLane_StatusLog]
GO
/****** Object:  Table [dbo].[KanBan_SwimLane]    Script Date: 8/24/2016 1:40:34 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[KanBan_SwimLane]') AND type in (N'U'))
DROP TABLE [dbo].[KanBan_SwimLane]
GO
/****** Object:  Table [dbo].[KanBan_Story_StatusLog]    Script Date: 8/24/2016 1:40:34 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[KanBan_Story_StatusLog]') AND type in (N'U'))
DROP TABLE [dbo].[KanBan_Story_StatusLog]
GO
/****** Object:  Table [dbo].[KanBan_Story_ColumnLog]    Script Date: 8/24/2016 1:40:34 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[KanBan_Story_ColumnLog]') AND type in (N'U'))
DROP TABLE [dbo].[KanBan_Story_ColumnLog]
GO
/****** Object:  Table [dbo].[KanBan_Story_Check]    Script Date: 8/24/2016 1:40:34 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[KanBan_Story_Check]') AND type in (N'U'))
DROP TABLE [dbo].[KanBan_Story_Check]
GO
/****** Object:  Table [dbo].[KanBan_Story_ChangeLog]    Script Date: 8/24/2016 1:40:34 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[KanBan_Story_ChangeLog]') AND type in (N'U'))
DROP TABLE [dbo].[KanBan_Story_ChangeLog]
GO
/****** Object:  Table [dbo].[KanBan_Story]    Script Date: 8/24/2016 1:40:34 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[KanBan_Story]') AND type in (N'U'))
DROP TABLE [dbo].[KanBan_Story]
GO
/****** Object:  Table [dbo].[KanBan_Cycle_Period_Status]    Script Date: 8/24/2016 1:40:34 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[KanBan_Cycle_Period_Status]') AND type in (N'U'))
DROP TABLE [dbo].[KanBan_Cycle_Period_Status]
GO
/****** Object:  Table [dbo].[KanBan_Cycle_Period]    Script Date: 8/24/2016 1:40:34 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[KanBan_Cycle_Period]') AND type in (N'U'))
DROP TABLE [dbo].[KanBan_Cycle_Period]
GO
/****** Object:  Table [dbo].[KanBan_Cycle]    Script Date: 8/24/2016 1:40:34 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[KanBan_Cycle]') AND type in (N'U'))
DROP TABLE [dbo].[KanBan_Cycle]
GO
/****** Object:  Table [dbo].[KanBan_ColumnGroup_Mapping]    Script Date: 8/24/2016 1:40:34 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[KanBan_ColumnGroup_Mapping]') AND type in (N'U'))
DROP TABLE [dbo].[KanBan_ColumnGroup_Mapping]
GO
/****** Object:  Table [dbo].[KanBan_ColumnGroup]    Script Date: 8/24/2016 1:40:34 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[KanBan_ColumnGroup]') AND type in (N'U'))
DROP TABLE [dbo].[KanBan_ColumnGroup]
GO
/****** Object:  Table [dbo].[KanBan_Column_Checklist_Mapping]    Script Date: 8/24/2016 1:40:34 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[KanBan_Column_Checklist_Mapping]') AND type in (N'U'))
DROP TABLE [dbo].[KanBan_Column_Checklist_Mapping]
GO
/****** Object:  Table [dbo].[KanBan_Column_Checklist]    Script Date: 8/24/2016 1:40:34 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[KanBan_Column_Checklist]') AND type in (N'U'))
DROP TABLE [dbo].[KanBan_Column_Checklist]
GO
/****** Object:  Table [dbo].[KanBan_Column_Check]    Script Date: 8/24/2016 1:40:34 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[KanBan_Column_Check]') AND type in (N'U'))
DROP TABLE [dbo].[KanBan_Column_Check]
GO
/****** Object:  Table [dbo].[KanBan_Column]    Script Date: 8/24/2016 1:40:34 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[KanBan_Column]') AND type in (N'U'))
DROP TABLE [dbo].[KanBan_Column]
GO
/****** Object:  Table [dbo].[KanBan_Assignment]    Script Date: 8/24/2016 1:40:34 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[KanBan_Assignment]') AND type in (N'U'))
DROP TABLE [dbo].[KanBan_Assignment]
GO
/****** Object:  Table [dbo].[KanBan]    Script Date: 8/24/2016 1:40:34 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[KanBan]') AND type in (N'U'))
DROP TABLE [dbo].[KanBan]
GO
/****** Object:  Table [dbo].[KanBan]    Script Date: 8/24/2016 1:40:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[KanBan]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[KanBan](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Status] [smallint] NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[KanBan_Assignment]    Script Date: 8/24/2016 1:40:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[KanBan_Assignment]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[KanBan_Assignment](
	[StoryID] [bigint] NOT NULL,
	[UserID] [bigint] NOT NULL,
	[AssignType] [smallint] NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[KanBan_Column]    Script Date: 8/24/2016 1:40:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[KanBan_Column]') AND type in (N'U'))
BEGIN
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
END
GO
/****** Object:  Table [dbo].[KanBan_Column_Check]    Script Date: 8/24/2016 1:40:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[KanBan_Column_Check]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[KanBan_Column_Check](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Type] [smallint] NOT NULL,
	[Column_Checklist_ID] [bigint] NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[KanBan_Column_Checklist]    Script Date: 8/24/2016 1:40:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[KanBan_Column_Checklist]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[KanBan_Column_Checklist](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Column_ID] [bigint] NOT NULL,
	[Status] [smallint] NOT NULL,
	[Name] [nvarchar](255) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[KanBan_Column_Checklist_Mapping]    Script Date: 8/24/2016 1:40:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[KanBan_Column_Checklist_Mapping]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[KanBan_Column_Checklist_Mapping](
	[Checklist_ID] [bigint] NOT NULL,
	[CheckItem_ID] [bigint] NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[KanBan_ColumnGroup]    Script Date: 8/24/2016 1:40:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[KanBan_ColumnGroup]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[KanBan_ColumnGroup](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[KanBan_ID] [bigint] NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Seq] [int] NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[KanBan_ColumnGroup_Mapping]    Script Date: 8/24/2016 1:40:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[KanBan_ColumnGroup_Mapping]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[KanBan_ColumnGroup_Mapping](
	[ColumnGroup_ID] [bigint] NOT NULL,
	[Column_ID] [bigint] NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[KanBan_Cycle]    Script Date: 8/24/2016 1:40:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[KanBan_Cycle]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[KanBan_Cycle](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[KanBan_ID] [bigint] NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[IsDefault] [bit] NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[KanBan_Cycle_Period]    Script Date: 8/24/2016 1:40:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[KanBan_Cycle_Period]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[KanBan_Cycle_Period](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Cycle_ID] [bigint] NOT NULL,
	[KanBan_ID] [bigint] NOT NULL,
	[Name] [nvarchar](127) NOT NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[KanBan_Cycle_Period_Status]    Script Date: 8/24/2016 1:40:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[KanBan_Cycle_Period_Status]') AND type in (N'U'))
BEGIN
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
END
GO
/****** Object:  Table [dbo].[KanBan_Story]    Script Date: 8/24/2016 1:40:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[KanBan_Story]') AND type in (N'U'))
BEGIN
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
END
GO
/****** Object:  Table [dbo].[KanBan_Story_ChangeLog]    Script Date: 8/24/2016 1:40:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[KanBan_Story_ChangeLog]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[KanBan_Story_ChangeLog](
	[Alias] [nvarchar](50) NOT NULL,
	[CurDateTime] [datetime] NOT NULL,
	[Story_ID] [bigint] NOT NULL,
	[Field] [nvarchar](50) NOT NULL,
	[Value_Prev] [nvarchar](255) NULL,
	[Value_New] [nvarchar](255) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[KanBan_Story_Check]    Script Date: 8/24/2016 1:40:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[KanBan_Story_Check]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[KanBan_Story_Check](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Story_ID] [bigint] NOT NULL,
	[Column_Check_ID] [bigint] NOT NULL,
	[Checked] [bit] NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[KanBan_Story_ColumnLog]    Script Date: 8/24/2016 1:40:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[KanBan_Story_ColumnLog]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[KanBan_Story_ColumnLog](
	[Alias] [nvarchar](31) NOT NULL,
	[CurDatetime] [datetime] NOT NULL,
	[Story_ID] [bigint] NOT NULL,
	[Column_ID_Prev] [bigint] NOT NULL,
	[Column_ID_New] [bigint] NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[KanBan_Story_StatusLog]    Script Date: 8/24/2016 1:40:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[KanBan_Story_StatusLog]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[KanBan_Story_StatusLog](
	[Alias] [nvarchar](31) NOT NULL,
	[CurDatetime] [datetime] NOT NULL,
	[Story_ID] [bigint] NOT NULL,
	[Status_Prev] [bigint] NOT NULL,
	[Status_New] [bigint] NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[KanBan_SwimLane]    Script Date: 8/24/2016 1:40:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[KanBan_SwimLane]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[KanBan_SwimLane](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[KanBan_ID] [bigint] NOT NULL,
	[Status] [smallint] NOT NULL,
	[Type] [smallint] NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[KanBan_SwimLane_StatusLog]    Script Date: 8/24/2016 1:40:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[KanBan_SwimLane_StatusLog]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[KanBan_SwimLane_StatusLog](
	[Alias] [nvarchar](31) NOT NULL,
	[CurDatetime] [datetime] NOT NULL,
	[Lane_ID] [bigint] NOT NULL,
	[Status_Prev] [smallint] NOT NULL,
	[Status_New] [smallint] NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[KanBan_TFS_Server]    Script Date: 8/24/2016 1:40:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[KanBan_TFS_Server]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[KanBan_TFS_Server](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Server] [nvarchar](255) NOT NULL,
	[Collection] [nvarchar](63) NOT NULL,
	[Project] [nvarchar](63) NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[KanBan_TFS_WIQ]    Script Date: 8/24/2016 1:40:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[KanBan_TFS_WIQ]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[KanBan_TFS_WIQ](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[KanBan_ID] [bigint] NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[WIQ] [ntext] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[KanBan_User]    Script Date: 8/24/2016 1:40:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[KanBan_User]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[KanBan_User](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Alias] [nvarchar](31) NOT NULL,
	[FirstName] [nvarchar](63) NOT NULL,
	[LastName] [nvarchar](63) NOT NULL,
	[Role] [smallint] NOT NULL,
	[Status] [smallint] NOT NULL,
	[KanBan_ID] [bigint] NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[SYS_User]    Script Date: 8/24/2016 1:40:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SYS_User]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SYS_User](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Alias] [nvarchar](255) NOT NULL,
	[Status] [smallint] NOT NULL,
	[Config_TicketColor] [smallint] NOT NULL
) ON [PRIMARY]
END
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

INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (430, 1, 1, N'C1.1', CAST(0x78340B00 AS Date), CAST(0x7E340B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (431, 1, 1, N'C1.2', CAST(0x7F340B00 AS Date), CAST(0x85340B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (432, 1, 1, N'C1.3', CAST(0x86340B00 AS Date), CAST(0x8C340B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (433, 1, 1, N'C1.4', CAST(0x8D340B00 AS Date), CAST(0x93340B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (434, 1, 1, N'C2.1', CAST(0x94340B00 AS Date), CAST(0x9A340B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (435, 1, 1, N'C2.2', CAST(0x9B340B00 AS Date), CAST(0xA1340B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (436, 1, 1, N'C2.3', CAST(0xA2340B00 AS Date), CAST(0xA8340B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (437, 1, 1, N'C2.4', CAST(0xA9340B00 AS Date), CAST(0xAF340B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (438, 1, 1, N'C3.1', CAST(0xB0340B00 AS Date), CAST(0xB6340B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (439, 1, 1, N'C3.2', CAST(0xB7340B00 AS Date), CAST(0xBD340B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (440, 1, 1, N'C3.3', CAST(0xBE340B00 AS Date), CAST(0xC4340B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (441, 1, 1, N'C3.4', CAST(0xC5340B00 AS Date), CAST(0xCB340B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (442, 1, 1, N'C4.1', CAST(0xCC340B00 AS Date), CAST(0xD2340B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (443, 1, 1, N'C4.2', CAST(0xD3340B00 AS Date), CAST(0xD9340B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (444, 1, 1, N'C4.3', CAST(0xDA340B00 AS Date), CAST(0xE0340B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (445, 1, 1, N'C4.4', CAST(0xE1340B00 AS Date), CAST(0xE7340B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (446, 1, 1, N'C5.1', CAST(0xE8340B00 AS Date), CAST(0xEE340B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (447, 1, 1, N'C5.2', CAST(0xEF340B00 AS Date), CAST(0xF5340B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (448, 1, 1, N'C5.3', CAST(0xF6340B00 AS Date), CAST(0xFC340B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (449, 1, 1, N'C5.4', CAST(0xFD340B00 AS Date), CAST(0x03350B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (450, 1, 1, N'C6.1', CAST(0x04350B00 AS Date), CAST(0x0A350B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (451, 1, 1, N'C6.2', CAST(0x0B350B00 AS Date), CAST(0x11350B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (452, 1, 1, N'C6.3', CAST(0x12350B00 AS Date), CAST(0x18350B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (453, 1, 1, N'C6.4', CAST(0x19350B00 AS Date), CAST(0x1F350B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (454, 1, 1, N'C7.1', CAST(0x20350B00 AS Date), CAST(0x26350B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (455, 1, 1, N'C7.2', CAST(0x27350B00 AS Date), CAST(0x2D350B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (456, 1, 1, N'C7.3', CAST(0x2E350B00 AS Date), CAST(0x34350B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (457, 1, 1, N'C7.4', CAST(0x35350B00 AS Date), CAST(0x3B350B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (458, 1, 1, N'C8.1', CAST(0x3C350B00 AS Date), CAST(0x42350B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (459, 1, 1, N'C8.2', CAST(0x43350B00 AS Date), CAST(0x49350B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (460, 1, 1, N'C8.3', CAST(0x4A350B00 AS Date), CAST(0x50350B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (461, 1, 1, N'C8.4', CAST(0x51350B00 AS Date), CAST(0x57350B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (462, 1, 1, N'C9.1', CAST(0x58350B00 AS Date), CAST(0x5E350B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (463, 1, 1, N'C9.2', CAST(0x5F350B00 AS Date), CAST(0x65350B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (464, 1, 1, N'C9.3', CAST(0x66350B00 AS Date), CAST(0x6C350B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (465, 1, 1, N'C9.4', CAST(0x6D350B00 AS Date), CAST(0x73350B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (466, 1, 1, N'C10.1', CAST(0x74350B00 AS Date), CAST(0x7A350B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (467, 1, 1, N'C10.2', CAST(0x7B350B00 AS Date), CAST(0x81350B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (468, 1, 1, N'C10.3', CAST(0x82350B00 AS Date), CAST(0x88350B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (469, 1, 1, N'C10.4', CAST(0x89350B00 AS Date), CAST(0x8F350B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (470, 1, 1, N'C11.1', CAST(0x90350B00 AS Date), CAST(0x96350B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (471, 1, 1, N'C11.2', CAST(0x97350B00 AS Date), CAST(0x9D350B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (472, 1, 1, N'C11.3', CAST(0x9E350B00 AS Date), CAST(0xA4350B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (473, 1, 1, N'C11.4', CAST(0xA5350B00 AS Date), CAST(0xAB350B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (474, 1, 1, N'C12.1', CAST(0xAC350B00 AS Date), CAST(0xB2350B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (475, 1, 1, N'C12.2', CAST(0xB3350B00 AS Date), CAST(0xB9350B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (476, 1, 1, N'C12.3', CAST(0xBA350B00 AS Date), CAST(0xC0350B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (477, 1, 1, N'C12.4', CAST(0xC1350B00 AS Date), CAST(0xC7350B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (478, 1, 1, N'C13.1', CAST(0xC8350B00 AS Date), CAST(0xCE350B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (479, 1, 1, N'C13.2', CAST(0xCF350B00 AS Date), CAST(0xD5350B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (480, 1, 1, N'C13.3', CAST(0xD6350B00 AS Date), CAST(0xDC350B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (481, 1, 1, N'C13.4', CAST(0xDD350B00 AS Date), CAST(0xE3350B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (482, 1, 1, N'C14.1', CAST(0xE4350B00 AS Date), CAST(0xEA350B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (483, 1, 1, N'C14.2', CAST(0xEB350B00 AS Date), CAST(0xF1350B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (484, 1, 1, N'C14.3', CAST(0xF2350B00 AS Date), CAST(0xF8350B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (485, 1, 1, N'C14.4', CAST(0xF9350B00 AS Date), CAST(0xFF350B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (486, 1, 1, N'C15.1', CAST(0x00360B00 AS Date), CAST(0x06360B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (487, 1, 1, N'C15.2', CAST(0x07360B00 AS Date), CAST(0x0D360B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (488, 1, 1, N'C15.3', CAST(0x0E360B00 AS Date), CAST(0x14360B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (489, 1, 1, N'C15.4', CAST(0x15360B00 AS Date), CAST(0x1B360B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (490, 1, 1, N'C16.1', CAST(0x1C360B00 AS Date), CAST(0x22360B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (491, 1, 1, N'C16.2', CAST(0x23360B00 AS Date), CAST(0x29360B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (492, 1, 1, N'C16.3', CAST(0x2A360B00 AS Date), CAST(0x30360B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (493, 1, 1, N'C16.4', CAST(0x31360B00 AS Date), CAST(0x37360B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (494, 1, 1, N'C17.1', CAST(0x38360B00 AS Date), CAST(0x3E360B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (495, 1, 1, N'C17.2', CAST(0x3F360B00 AS Date), CAST(0x45360B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (496, 1, 1, N'C17.3', CAST(0x46360B00 AS Date), CAST(0x4C360B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (497, 1, 1, N'C17.4', CAST(0x4D360B00 AS Date), CAST(0x53360B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (498, 1, 1, N'C18.1', CAST(0x54360B00 AS Date), CAST(0x5A360B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (499, 1, 1, N'C18.2', CAST(0x5B360B00 AS Date), CAST(0x61360B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (500, 1, 1, N'C18.3', CAST(0x62360B00 AS Date), CAST(0x68360B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (501, 1, 1, N'C18.4', CAST(0x69360B00 AS Date), CAST(0x6F360B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (502, 1, 1, N'C19.1', CAST(0x70360B00 AS Date), CAST(0x76360B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (503, 1, 1, N'C19.2', CAST(0x77360B00 AS Date), CAST(0x7D360B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (504, 1, 1, N'C19.3', CAST(0x7E360B00 AS Date), CAST(0x84360B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (505, 1, 1, N'C19.4', CAST(0x85360B00 AS Date), CAST(0x8B360B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (506, 1, 1, N'C20.1', CAST(0x8C360B00 AS Date), CAST(0x92360B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (507, 1, 1, N'C20.2', CAST(0x93360B00 AS Date), CAST(0x99360B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (508, 1, 1, N'C20.3', CAST(0x9A360B00 AS Date), CAST(0xA0360B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (509, 1, 1, N'C20.4', CAST(0xA1360B00 AS Date), CAST(0xA7360B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (510, 1, 1, N'C21.1', CAST(0xA8360B00 AS Date), CAST(0xAE360B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (511, 1, 1, N'C21.2', CAST(0xAF360B00 AS Date), CAST(0xB5360B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (512, 1, 1, N'C21.3', CAST(0xB6360B00 AS Date), CAST(0xBC360B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (513, 1, 1, N'C21.4', CAST(0xBD360B00 AS Date), CAST(0xC3360B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (514, 1, 1, N'C22.1', CAST(0xC4360B00 AS Date), CAST(0xCA360B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (515, 1, 1, N'C22.2', CAST(0xCB360B00 AS Date), CAST(0xD1360B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (516, 1, 1, N'C22.3', CAST(0xD2360B00 AS Date), CAST(0xD8360B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (517, 1, 1, N'C22.4', CAST(0xD9360B00 AS Date), CAST(0xDF360B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (518, 1, 1, N'C23.1', CAST(0xE0360B00 AS Date), CAST(0xE6360B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (519, 1, 1, N'C23.2', CAST(0xE7360B00 AS Date), CAST(0xED360B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (520, 1, 1, N'C23.3', CAST(0xEE360B00 AS Date), CAST(0xF4360B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (521, 1, 1, N'C23.4', CAST(0xF5360B00 AS Date), CAST(0xFB360B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (522, 1, 1, N'C24.1', CAST(0xFC360B00 AS Date), CAST(0x02370B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (523, 1, 1, N'C24.2', CAST(0x03370B00 AS Date), CAST(0x09370B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (524, 1, 1, N'C24.3', CAST(0x0A370B00 AS Date), CAST(0x10370B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (525, 1, 1, N'C24.4', CAST(0x11370B00 AS Date), CAST(0x17370B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (526, 1, 1, N'C25.1', CAST(0x18370B00 AS Date), CAST(0x1E370B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (527, 1, 1, N'C25.2', CAST(0x1F370B00 AS Date), CAST(0x25370B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (528, 1, 1, N'C25.3', CAST(0x26370B00 AS Date), CAST(0x2C370B00 AS Date))
GO
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (529, 1, 1, N'C25.4', CAST(0x2D370B00 AS Date), CAST(0x33370B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (530, 1, 1, N'C26.1', CAST(0x34370B00 AS Date), CAST(0x3A370B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (531, 1, 1, N'C26.2', CAST(0x3B370B00 AS Date), CAST(0x41370B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (532, 1, 1, N'C26.3', CAST(0x42370B00 AS Date), CAST(0x48370B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (533, 1, 1, N'C26.4', CAST(0x49370B00 AS Date), CAST(0x4F370B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (534, 1, 1, N'C27.1', CAST(0x50370B00 AS Date), CAST(0x56370B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (535, 1, 1, N'C27.2', CAST(0x57370B00 AS Date), CAST(0x5D370B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (536, 1, 1, N'C27.3', CAST(0x5E370B00 AS Date), CAST(0x64370B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (537, 1, 1, N'C27.4', CAST(0x65370B00 AS Date), CAST(0x6B370B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (538, 1, 1, N'C28.1', CAST(0x6C370B00 AS Date), CAST(0x72370B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (539, 1, 1, N'C28.2', CAST(0x73370B00 AS Date), CAST(0x79370B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (540, 1, 1, N'C28.3', CAST(0x7A370B00 AS Date), CAST(0x80370B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (541, 1, 1, N'C28.4', CAST(0x81370B00 AS Date), CAST(0x87370B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (542, 1, 1, N'C29.1', CAST(0x88370B00 AS Date), CAST(0x8E370B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (543, 1, 1, N'C29.2', CAST(0x8F370B00 AS Date), CAST(0x95370B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (544, 1, 1, N'C29.3', CAST(0x96370B00 AS Date), CAST(0x9C370B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (545, 1, 1, N'C29.4', CAST(0x9D370B00 AS Date), CAST(0xA3370B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (546, 1, 1, N'C30.1', CAST(0xA4370B00 AS Date), CAST(0xAA370B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (547, 1, 1, N'C30.2', CAST(0xAB370B00 AS Date), CAST(0xB1370B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (548, 1, 1, N'C30.3', CAST(0xB2370B00 AS Date), CAST(0xB8370B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (549, 1, 1, N'C30.4', CAST(0xB9370B00 AS Date), CAST(0xBF370B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (550, 1, 1, N'C31.1', CAST(0xC0370B00 AS Date), CAST(0xC6370B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (551, 1, 1, N'C31.2', CAST(0xC7370B00 AS Date), CAST(0xCD370B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (552, 1, 1, N'C31.3', CAST(0xCE370B00 AS Date), CAST(0xD4370B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (553, 1, 1, N'C31.4', CAST(0xD5370B00 AS Date), CAST(0xDB370B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (554, 1, 1, N'C32.1', CAST(0xDC370B00 AS Date), CAST(0xE2370B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (555, 1, 1, N'C32.2', CAST(0xE3370B00 AS Date), CAST(0xE9370B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (556, 1, 1, N'C32.3', CAST(0xEA370B00 AS Date), CAST(0xF0370B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (557, 1, 1, N'C32.4', CAST(0xF1370B00 AS Date), CAST(0xF7370B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (558, 1, 1, N'C33.1', CAST(0xF8370B00 AS Date), CAST(0xFE370B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (559, 1, 1, N'C33.2', CAST(0xFF370B00 AS Date), CAST(0x05380B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (560, 1, 1, N'C33.3', CAST(0x06380B00 AS Date), CAST(0x0C380B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (561, 1, 1, N'C33.4', CAST(0x0D380B00 AS Date), CAST(0x13380B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (562, 1, 1, N'C34.1', CAST(0x14380B00 AS Date), CAST(0x1A380B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (563, 1, 1, N'C34.2', CAST(0x1B380B00 AS Date), CAST(0x21380B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (564, 1, 1, N'C34.3', CAST(0x22380B00 AS Date), CAST(0x28380B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (565, 1, 1, N'C34.4', CAST(0x29380B00 AS Date), CAST(0x2F380B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (566, 1, 1, N'C35.1', CAST(0x30380B00 AS Date), CAST(0x36380B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (567, 1, 1, N'C35.2', CAST(0x37380B00 AS Date), CAST(0x3D380B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (568, 1, 1, N'C35.3', CAST(0x3E380B00 AS Date), CAST(0x44380B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (569, 1, 1, N'C35.4', CAST(0x45380B00 AS Date), CAST(0x4B380B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (570, 1, 1, N'C36.1', CAST(0x4C380B00 AS Date), CAST(0x52380B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (571, 1, 1, N'C36.2', CAST(0x53380B00 AS Date), CAST(0x59380B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (572, 1, 1, N'C36.3', CAST(0x5A380B00 AS Date), CAST(0x60380B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (573, 1, 1, N'C36.4', CAST(0x61380B00 AS Date), CAST(0x67380B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (574, 1, 1, N'C37.1', CAST(0x68380B00 AS Date), CAST(0x6E380B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (575, 1, 1, N'C37.2', CAST(0x6F380B00 AS Date), CAST(0x75380B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (576, 1, 1, N'C37.3', CAST(0x76380B00 AS Date), CAST(0x7C380B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (577, 1, 1, N'C37.4', CAST(0x7D380B00 AS Date), CAST(0x83380B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (578, 1, 1, N'C38.1', CAST(0x84380B00 AS Date), CAST(0x8A380B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (580, 1, 1, N'C38.3', CAST(0x92380B00 AS Date), CAST(0x98380B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (581, 1, 1, N'C38.4', CAST(0x99380B00 AS Date), CAST(0x9F380B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (582, 1, 1, N'C39.1', CAST(0xA0380B00 AS Date), CAST(0xA6380B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (583, 1, 1, N'C39.2', CAST(0xA7380B00 AS Date), CAST(0xAD380B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (584, 1, 1, N'C39.3', CAST(0xAE380B00 AS Date), CAST(0xB4380B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (585, 1, 1, N'C39.4', CAST(0xB5380B00 AS Date), CAST(0xBB380B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (586, 1, 1, N'C40.1', CAST(0xBC380B00 AS Date), CAST(0xC2380B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (587, 1, 1, N'C40.2', CAST(0xC3380B00 AS Date), CAST(0xC9380B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (588, 1, 1, N'C40.3', CAST(0xCA380B00 AS Date), CAST(0xD0380B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (589, 1, 1, N'C40.4', CAST(0xD1380B00 AS Date), CAST(0xD7380B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (590, 1, 1, N'C41.1', CAST(0xD8380B00 AS Date), CAST(0xDE380B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (591, 1, 1, N'C41.2', CAST(0xDF380B00 AS Date), CAST(0xE5380B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (592, 1, 1, N'C41.3', CAST(0xE6380B00 AS Date), CAST(0xEC380B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (593, 1, 1, N'C41.4', CAST(0xED380B00 AS Date), CAST(0xF3380B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (594, 1, 1, N'C42.1', CAST(0xF4380B00 AS Date), CAST(0xFA380B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (595, 1, 1, N'C42.2', CAST(0xFB380B00 AS Date), CAST(0x01390B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (596, 1, 1, N'C42.3', CAST(0x02390B00 AS Date), CAST(0x08390B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (597, 1, 1, N'C42.4', CAST(0x09390B00 AS Date), CAST(0x0F390B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (598, 1, 1, N'C43.1', CAST(0x10390B00 AS Date), CAST(0x16390B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (599, 1, 1, N'C43.2', CAST(0x17390B00 AS Date), CAST(0x1D390B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (600, 1, 1, N'C43.3', CAST(0x1E390B00 AS Date), CAST(0x24390B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (601, 1, 1, N'C43.4', CAST(0x25390B00 AS Date), CAST(0x2B390B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (602, 1, 1, N'C44.1', CAST(0x2C390B00 AS Date), CAST(0x32390B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (603, 1, 1, N'C44.2', CAST(0x33390B00 AS Date), CAST(0x39390B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (604, 1, 1, N'C44.3', CAST(0x3A390B00 AS Date), CAST(0x40390B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (605, 1, 1, N'C44.4', CAST(0x41390B00 AS Date), CAST(0x47390B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (606, 1, 1, N'C45.1', CAST(0x48390B00 AS Date), CAST(0x4E390B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (607, 1, 1, N'C45.2', CAST(0x4F390B00 AS Date), CAST(0x55390B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (608, 1, 1, N'C45.3', CAST(0x56390B00 AS Date), CAST(0x5C390B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (609, 1, 1, N'C45.4', CAST(0x5D390B00 AS Date), CAST(0x63390B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (610, 1, 1, N'C46.1', CAST(0x64390B00 AS Date), CAST(0x6A390B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (611, 1, 1, N'C46.2', CAST(0x6B390B00 AS Date), CAST(0x71390B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (612, 1, 1, N'C46.3', CAST(0x72390B00 AS Date), CAST(0x78390B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (613, 1, 1, N'C46.4', CAST(0x79390B00 AS Date), CAST(0x7F390B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (614, 1, 1, N'C47.1', CAST(0x80390B00 AS Date), CAST(0x86390B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (615, 1, 1, N'C47.2', CAST(0x87390B00 AS Date), CAST(0x8D390B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (616, 1, 1, N'C47.3', CAST(0x8E390B00 AS Date), CAST(0x94390B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (617, 1, 1, N'C47.4', CAST(0x95390B00 AS Date), CAST(0x9B390B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (618, 1, 1, N'C48.1', CAST(0x9C390B00 AS Date), CAST(0xA2390B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (619, 1, 1, N'C48.2', CAST(0xA3390B00 AS Date), CAST(0xA9390B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (620, 1, 1, N'C48.3', CAST(0xAA390B00 AS Date), CAST(0xB0390B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (621, 1, 1, N'C48.4', CAST(0xB1390B00 AS Date), CAST(0xB7390B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (622, 1, 1, N'C49.1', CAST(0xB8390B00 AS Date), CAST(0xBE390B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (623, 1, 1, N'C49.2', CAST(0xBF390B00 AS Date), CAST(0xC5390B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (624, 1, 1, N'C49.3', CAST(0xC6390B00 AS Date), CAST(0xCC390B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (625, 1, 1, N'C49.4', CAST(0xCD390B00 AS Date), CAST(0xD3390B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (626, 1, 1, N'C50.1', CAST(0xD4390B00 AS Date), CAST(0xDA390B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (627, 1, 1, N'C50.2', CAST(0xDB390B00 AS Date), CAST(0xE1390B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (628, 1, 1, N'C50.3', CAST(0xE2390B00 AS Date), CAST(0xE8390B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (629, 1, 1, N'C50.4', CAST(0xE9390B00 AS Date), CAST(0xEF390B00 AS Date))
GO
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (630, 1, 1, N'C51.1', CAST(0xF0390B00 AS Date), CAST(0xF6390B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (631, 1, 1, N'C51.2', CAST(0xF7390B00 AS Date), CAST(0xFD390B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (632, 1, 1, N'C51.3', CAST(0xFE390B00 AS Date), CAST(0x043A0B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (633, 1, 1, N'C51.4', CAST(0x053A0B00 AS Date), CAST(0x0B3A0B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (634, 1, 1, N'C52.1', CAST(0x0C3A0B00 AS Date), CAST(0x123A0B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (635, 1, 1, N'C52.2', CAST(0x133A0B00 AS Date), CAST(0x193A0B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (636, 1, 1, N'C52.3', CAST(0x1A3A0B00 AS Date), CAST(0x203A0B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (637, 1, 1, N'C52.4', CAST(0x213A0B00 AS Date), CAST(0x273A0B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (638, 1, 1, N'C53.1', CAST(0x283A0B00 AS Date), CAST(0x2E3A0B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (639, 1, 1, N'C53.2', CAST(0x2F3A0B00 AS Date), CAST(0x353A0B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (640, 1, 1, N'C53.3', CAST(0x363A0B00 AS Date), CAST(0x3C3A0B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (641, 1, 1, N'C53.4', CAST(0x3D3A0B00 AS Date), CAST(0x433A0B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (642, 1, 1, N'C54.1', CAST(0x443A0B00 AS Date), CAST(0x4A3A0B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (643, 1, 1, N'C54.2', CAST(0x4B3A0B00 AS Date), CAST(0x513A0B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (644, 1, 1, N'C54.3', CAST(0x523A0B00 AS Date), CAST(0x583A0B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (645, 1, 1, N'C54.4', CAST(0x593A0B00 AS Date), CAST(0x5F3A0B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (646, 1, 1, N'C55.1', CAST(0x603A0B00 AS Date), CAST(0x663A0B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (647, 1, 1, N'C55.2', CAST(0x673A0B00 AS Date), CAST(0x6D3A0B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (648, 1, 1, N'C55.3', CAST(0x6E3A0B00 AS Date), CAST(0x743A0B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (649, 1, 1, N'C55.4', CAST(0x753A0B00 AS Date), CAST(0x7B3A0B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (650, 1, 1, N'C56.1', CAST(0x7C3A0B00 AS Date), CAST(0x823A0B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (651, 1, 1, N'C56.2', CAST(0x833A0B00 AS Date), CAST(0x893A0B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (652, 1, 1, N'C56.3', CAST(0x8A3A0B00 AS Date), CAST(0x903A0B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (653, 1, 1, N'C56.4', CAST(0x913A0B00 AS Date), CAST(0x973A0B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (654, 1, 1, N'C57.1', CAST(0x983A0B00 AS Date), CAST(0x9E3A0B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (655, 1, 1, N'C57.2', CAST(0x9F3A0B00 AS Date), CAST(0xA53A0B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (656, 1, 1, N'C57.3', CAST(0xA63A0B00 AS Date), CAST(0xAC3A0B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (657, 1, 1, N'C57.4', CAST(0xAD3A0B00 AS Date), CAST(0xB33A0B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (658, 1, 1, N'C58.1', CAST(0xB43A0B00 AS Date), CAST(0xBA3A0B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (659, 1, 1, N'C58.2', CAST(0xBB3A0B00 AS Date), CAST(0xC13A0B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (660, 1, 1, N'C58.3', CAST(0xC23A0B00 AS Date), CAST(0xC83A0B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (661, 1, 1, N'C58.4', CAST(0xC93A0B00 AS Date), CAST(0xCF3A0B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (662, 1, 1, N'C59.1', CAST(0xD03A0B00 AS Date), CAST(0xD63A0B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (663, 1, 1, N'C59.2', CAST(0xD73A0B00 AS Date), CAST(0xDD3A0B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (664, 1, 1, N'C59.3', CAST(0xDE3A0B00 AS Date), CAST(0xE43A0B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (665, 1, 1, N'C59.4', CAST(0xE53A0B00 AS Date), CAST(0xEB3A0B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (666, 1, 1, N'C60.1', CAST(0xEC3A0B00 AS Date), CAST(0xF23A0B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (667, 1, 1, N'C60.2', CAST(0xF33A0B00 AS Date), CAST(0xF93A0B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (668, 1, 1, N'C60.3', CAST(0xFA3A0B00 AS Date), CAST(0x003B0B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (669, 1, 1, N'C60.4', CAST(0x013B0B00 AS Date), CAST(0x073B0B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (670, 1, 1, N'C61.1', CAST(0x083B0B00 AS Date), CAST(0x0E3B0B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (671, 1, 1, N'C61.2', CAST(0x0F3B0B00 AS Date), CAST(0x153B0B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (672, 1, 1, N'C61.3', CAST(0x163B0B00 AS Date), CAST(0x1C3B0B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (673, 1, 1, N'C61.4', CAST(0x1D3B0B00 AS Date), CAST(0x233B0B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (674, 1, 1, N'C62.1', CAST(0x243B0B00 AS Date), CAST(0x2A3B0B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (675, 1, 1, N'C62.2', CAST(0x2B3B0B00 AS Date), CAST(0x313B0B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (676, 1, 1, N'C62.3', CAST(0x323B0B00 AS Date), CAST(0x383B0B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (677, 1, 1, N'C62.4', CAST(0x393B0B00 AS Date), CAST(0x3F3B0B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (678, 1, 1, N'C63.1', CAST(0x403B0B00 AS Date), CAST(0x463B0B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (679, 1, 1, N'C63.2', CAST(0x473B0B00 AS Date), CAST(0x4D3B0B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (680, 1, 1, N'C63.3', CAST(0x4E3B0B00 AS Date), CAST(0x543B0B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (681, 1, 1, N'C63.4', CAST(0x553B0B00 AS Date), CAST(0x5B3B0B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (682, 1, 1, N'C64.1', CAST(0x5C3B0B00 AS Date), CAST(0x623B0B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (683, 1, 1, N'C64.2', CAST(0x633B0B00 AS Date), CAST(0x693B0B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (684, 1, 1, N'C64.3', CAST(0x6A3B0B00 AS Date), CAST(0x703B0B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (685, 1, 1, N'C64.4', CAST(0x713B0B00 AS Date), CAST(0x773B0B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (686, 1, 1, N'C65.1', CAST(0x783B0B00 AS Date), CAST(0x7E3B0B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (687, 1, 1, N'C65.2', CAST(0x7F3B0B00 AS Date), CAST(0x853B0B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (688, 1, 1, N'C65.3', CAST(0x863B0B00 AS Date), CAST(0x8C3B0B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (689, 1, 1, N'C65.4', CAST(0x8D3B0B00 AS Date), CAST(0x933B0B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (690, 1, 1, N'C66.1', CAST(0x943B0B00 AS Date), CAST(0x9A3B0B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (691, 1, 1, N'C66.2', CAST(0x9B3B0B00 AS Date), CAST(0xA13B0B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (692, 1, 1, N'C66.3', CAST(0xA23B0B00 AS Date), CAST(0xA83B0B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (693, 1, 1, N'C66.4', CAST(0xA93B0B00 AS Date), CAST(0xAF3B0B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (694, 1, 1, N'C67.1', CAST(0xB03B0B00 AS Date), CAST(0xB63B0B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (695, 1, 1, N'C67.2', CAST(0xB73B0B00 AS Date), CAST(0xBD3B0B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (696, 1, 1, N'C67.3', CAST(0xBE3B0B00 AS Date), CAST(0xC43B0B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (697, 1, 1, N'C67.4', CAST(0xC53B0B00 AS Date), CAST(0xCB3B0B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (698, 1, 1, N'C68.1', CAST(0xCC3B0B00 AS Date), CAST(0xD23B0B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (699, 1, 1, N'C68.2', CAST(0xD33B0B00 AS Date), CAST(0xD93B0B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (700, 1, 1, N'C68.3', CAST(0xDA3B0B00 AS Date), CAST(0xE03B0B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (701, 1, 1, N'C68.4', CAST(0xE13B0B00 AS Date), CAST(0xE73B0B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (702, 1, 1, N'C69.1', CAST(0xE83B0B00 AS Date), CAST(0xEE3B0B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (703, 1, 1, N'C69.2', CAST(0xEF3B0B00 AS Date), CAST(0xF53B0B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (704, 1, 1, N'C69.3', CAST(0xF63B0B00 AS Date), CAST(0xFC3B0B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (705, 1, 1, N'C69.4', CAST(0xFD3B0B00 AS Date), CAST(0x033C0B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (706, 1, 1, N'C70.1', CAST(0x043C0B00 AS Date), CAST(0x0A3C0B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (707, 1, 1, N'C70.2', CAST(0x0B3C0B00 AS Date), CAST(0x113C0B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (708, 1, 1, N'C70.3', CAST(0x123C0B00 AS Date), CAST(0x183C0B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (709, 1, 1, N'C70.4', CAST(0x193C0B00 AS Date), CAST(0x1F3C0B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (710, 1, 1, N'C71.1', CAST(0x203C0B00 AS Date), CAST(0x263C0B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (711, 1, 1, N'C71.2', CAST(0x273C0B00 AS Date), CAST(0x2D3C0B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (712, 1, 1, N'C71.3', CAST(0x2E3C0B00 AS Date), CAST(0x343C0B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (713, 1, 1, N'C71.4', CAST(0x353C0B00 AS Date), CAST(0x3B3C0B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (714, 1, 1, N'C72.1', CAST(0x3C3C0B00 AS Date), CAST(0x423C0B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (715, 1, 1, N'C72.2', CAST(0x433C0B00 AS Date), CAST(0x493C0B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (716, 1, 1, N'C72.3', CAST(0x4A3C0B00 AS Date), CAST(0x503C0B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (717, 1, 1, N'C72.4', CAST(0x513C0B00 AS Date), CAST(0x573C0B00 AS Date))
INSERT [dbo].[KanBan_Cycle_Period] ([ID], [Cycle_ID], [KanBan_ID], [Name], [StartDate], [EndDate]) VALUES (579, 1, 1, N'C38.2', CAST(0x8B380B00 AS Date), CAST(0x91380B00 AS Date))
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

INSERT [dbo].[KanBan_Story] ([ID], [Name], [TFS], [TFS_Server], [Description], [DueDate], [PMWork], [TestWork], [DevWork], [PMWorkEst], [TestWorkEst], [DevWorkEst], [StoryStatus], [StoryType], [TaskType], [SwimLane_ID], [KanBan_ID], [Prior], [Status], [StageDueDate]) VALUES (1, N'Common data', 0, 1, N'Test1', CAST(0xC83B0B00 AS Date), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(1.0 AS Decimal(6, 1)), CAST(1.0 AS Decimal(6, 1)), CAST(2.0 AS Decimal(6, 1)), 4, 1, 1, 90, 1, 2, 1, CAST(0xC83B0B00 AS Date))
INSERT [dbo].[KanBan_Story] ([ID], [Name], [TFS], [TFS_Server], [Description], [DueDate], [PMWork], [TestWork], [DevWork], [PMWorkEst], [TestWorkEst], [DevWorkEst], [StoryStatus], [StoryType], [TaskType], [SwimLane_ID], [KanBan_ID], [Prior], [Status], [StageDueDate]) VALUES (2, N'GL data', 0, 1, N'Test', CAST(0x5B950A00 AS Date), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), 4, 99, 1, 90, 1, 0, 10, CAST(0x5B950A00 AS Date))
INSERT [dbo].[KanBan_Story] ([ID], [Name], [TFS], [TFS_Server], [Description], [DueDate], [PMWork], [TestWork], [DevWork], [PMWorkEst], [TestWorkEst], [DevWorkEst], [StoryStatus], [StoryType], [TaskType], [SwimLane_ID], [KanBan_ID], [Prior], [Status], [StageDueDate]) VALUES (3, N'Test1', 0, 1, N'Test', CAST(0x5B950A00 AS Date), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(3.0 AS Decimal(6, 1)), CAST(1.0 AS Decimal(6, 1)), CAST(4.0 AS Decimal(6, 1)), 4, 99, 1, 90, 1, 0, 99, CAST(0x5B950A00 AS Date))
INSERT [dbo].[KanBan_Story] ([ID], [Name], [TFS], [TFS_Server], [Description], [DueDate], [PMWork], [TestWork], [DevWork], [PMWorkEst], [TestWorkEst], [DevWorkEst], [StoryStatus], [StoryType], [TaskType], [SwimLane_ID], [KanBan_ID], [Prior], [Status], [StageDueDate]) VALUES (4, N'Task1', 0, 1, N'', CAST(0xCA3B0B00 AS Date), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(1.0 AS Decimal(6, 1)), CAST(1.0 AS Decimal(6, 1)), CAST(2.0 AS Decimal(6, 1)), 62, 1, 2, 90, 1, 0, 1, CAST(0xCA3B0B00 AS Date))
INSERT [dbo].[KanBan_Story] ([ID], [Name], [TFS], [TFS_Server], [Description], [DueDate], [PMWork], [TestWork], [DevWork], [PMWorkEst], [TestWorkEst], [DevWorkEst], [StoryStatus], [StoryType], [TaskType], [SwimLane_ID], [KanBan_ID], [Prior], [Status], [StageDueDate]) VALUES (5, N'Task1', 0, 1, N'', CAST(0x5B950A00 AS Date), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), 62, 1, 2, 91, 1, 0, 1, CAST(0x5B950A00 AS Date))
INSERT [dbo].[KanBan_Story] ([ID], [Name], [TFS], [TFS_Server], [Description], [DueDate], [PMWork], [TestWork], [DevWork], [PMWorkEst], [TestWorkEst], [DevWorkEst], [StoryStatus], [StoryType], [TaskType], [SwimLane_ID], [KanBan_ID], [Prior], [Status], [StageDueDate]) VALUES (6, N'Task2', 0, 1, N'', CAST(0x5B950A00 AS Date), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), 10, 99, 1, 91, 1, 0, 1, CAST(0x5B950A00 AS Date))
INSERT [dbo].[KanBan_Story] ([ID], [Name], [TFS], [TFS_Server], [Description], [DueDate], [PMWork], [TestWork], [DevWork], [PMWorkEst], [TestWorkEst], [DevWorkEst], [StoryStatus], [StoryType], [TaskType], [SwimLane_ID], [KanBan_ID], [Prior], [Status], [StageDueDate]) VALUES (7, N'Task3', 0, 1, N'', CAST(0x5B950A00 AS Date), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), 4, 99, 1, 91, 1, 0, 1, CAST(0x5B950A00 AS Date))
INSERT [dbo].[KanBan_Story] ([ID], [Name], [TFS], [TFS_Server], [Description], [DueDate], [PMWork], [TestWork], [DevWork], [PMWorkEst], [TestWorkEst], [DevWorkEst], [StoryStatus], [StoryType], [TaskType], [SwimLane_ID], [KanBan_ID], [Prior], [Status], [StageDueDate]) VALUES (8, N'Form 1', 0, 1, N'', CAST(0x5B950A00 AS Date), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), 8, 3, 1, 92, 1, 0, 1, CAST(0x5B950A00 AS Date))
INSERT [dbo].[KanBan_Story] ([ID], [Name], [TFS], [TFS_Server], [Description], [DueDate], [PMWork], [TestWork], [DevWork], [PMWorkEst], [TestWorkEst], [DevWorkEst], [StoryStatus], [StoryType], [TaskType], [SwimLane_ID], [KanBan_ID], [Prior], [Status], [StageDueDate]) VALUES (9, N'Form 2', 0, 1, N'', CAST(0x5B950A00 AS Date), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), CAST(0.0 AS Decimal(6, 1)), 8, 1, 1, 92, 1, 0, 1, CAST(0x5B950A00 AS Date))
SET IDENTITY_INSERT [dbo].[KanBan_Story] OFF
INSERT [dbo].[KanBan_Story_ChangeLog] ([Alias], [CurDateTime], [Story_ID], [Field], [Value_Prev], [Value_New]) VALUES (N'v-petxu', CAST(0x0000A64300DA6455 AS DateTime), 0, N'StoryStatus', N'99', N'2')
INSERT [dbo].[KanBan_Story_ChangeLog] ([Alias], [CurDateTime], [Story_ID], [Field], [Value_Prev], [Value_New]) VALUES (N'v-petxu', CAST(0x0000A64300E39E40 AS DateTime), 0, N'StoryStatus', N'99', N'2')
INSERT [dbo].[KanBan_Story_ChangeLog] ([Alias], [CurDateTime], [Story_ID], [Field], [Value_Prev], [Value_New]) VALUES (N'v-petxu', CAST(0x0000A64300E45F64 AS DateTime), 0, N'StoryStatus', N'99', N'2')
INSERT [dbo].[KanBan_Story_ChangeLog] ([Alias], [CurDateTime], [Story_ID], [Field], [Value_Prev], [Value_New]) VALUES (N'v-petxu', CAST(0x0000A64300EADD2F AS DateTime), 1, N'StoryStatus', N'99', N'2')
INSERT [dbo].[KanBan_Story_ChangeLog] ([Alias], [CurDateTime], [Story_ID], [Field], [Value_Prev], [Value_New]) VALUES (N'v-petxu', CAST(0x0000A64300EAF128 AS DateTime), 1, N'StoryStatus', N'2', N'1')
INSERT [dbo].[KanBan_Story_ChangeLog] ([Alias], [CurDateTime], [Story_ID], [Field], [Value_Prev], [Value_New]) VALUES (N'', CAST(0x0000A66C00C2883B AS DateTime), 4, N'StoryStatus', N'99', N'1')
INSERT [dbo].[KanBan_Story_ChangeLog] ([Alias], [CurDateTime], [Story_ID], [Field], [Value_Prev], [Value_New]) VALUES (N'v-petxu', CAST(0x0000A66C00DDB832 AS DateTime), 9, N'StoryStatus', N'99', N'1')
INSERT [dbo].[KanBan_Story_ChangeLog] ([Alias], [CurDateTime], [Story_ID], [Field], [Value_Prev], [Value_New]) VALUES (N'v-petxu', CAST(0x0000A66C00DDE2B9 AS DateTime), 8, N'StoryStatus', N'99', N'3')
INSERT [dbo].[KanBan_Story_ChangeLog] ([Alias], [CurDateTime], [Story_ID], [Field], [Value_Prev], [Value_New]) VALUES (N'v-petxu', CAST(0x0000A66C00D79D6A AS DateTime), 5, N'StoryStatus', N'99', N'1')
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'v-petxu', CAST(0x0000A66C009E4E2F AS DateTime), 3, 4, 62)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'v-petxu', CAST(0x0000A66C009E54E0 AS DateTime), 1, 5, 8)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'v-petxu', CAST(0x0000A66C009E6E91 AS DateTime), 3, 62, 10)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'v-petxu', CAST(0x0000A66C009E6FE9 AS DateTime), 3, 10, 62)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'v-petxu', CAST(0x0000A66C009E7181 AS DateTime), 3, 62, 5)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'v-petxu', CAST(0x0000A66C009E8779 AS DateTime), 1, 8, 62)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'v-petxu', CAST(0x0000A66C00A7848B AS DateTime), 1, 62, 8)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'', CAST(0x0000A66C00C07BD3 AS DateTime), 3, 5, 4)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'', CAST(0x0000A66C00C0A220 AS DateTime), 3, 4, 5)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'', CAST(0x0000A66C00C0BCFA AS DateTime), 4, 0, 4)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'', CAST(0x0000A66C00C0D5B2 AS DateTime), 4, 4, 5)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'v-petxu', CAST(0x0000A64300D15ADA AS DateTime), 0, 0, 4)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'v-petxu', CAST(0x0000A64300D462C6 AS DateTime), 0, 0, 4)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'v-petxu', CAST(0x0000A64300D8D9A9 AS DateTime), 0, 0, 4)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'v-petxu', CAST(0x0000A64300DA6456 AS DateTime), 0, 0, 4)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'v-petxu', CAST(0x0000A64300E39E40 AS DateTime), 0, 0, 4)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'v-petxu', CAST(0x0000A64300E45F65 AS DateTime), 0, 0, 4)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'v-petxu', CAST(0x0000A64300E575B5 AS DateTime), 0, 0, 4)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'v-petxu', CAST(0x0000A64300E6066C AS DateTime), 0, 0, 4)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'v-petxu', CAST(0x0000A64300E68A81 AS DateTime), 1, 0, 4)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'v-petxu', CAST(0x0000A64300E8A179 AS DateTime), 0, 0, 4)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'v-petxu', CAST(0x0000A64300E8F9BD AS DateTime), 2, 0, 4)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'v-petxu', CAST(0x0000A64300E98681 AS DateTime), 0, 0, 4)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'v-petxu', CAST(0x0000A64300EAD57F AS DateTime), 3, 0, 4)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'v-petxu', CAST(0x0000A64300EAE381 AS DateTime), 1, 4, 5)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'', CAST(0x0000A66C00C204EF AS DateTime), 3, 5, 4)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'', CAST(0x0000A66C00C20620 AS DateTime), 4, 5, 4)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'', CAST(0x0000A66C00C28BD1 AS DateTime), 4, 4, 5)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'', CAST(0x0000A66C00C28D9F AS DateTime), 4, 5, 4)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'', CAST(0x0000A66C00C291D4 AS DateTime), 1, 8, 62)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'', CAST(0x0000A66C00C296A1 AS DateTime), 1, 62, 8)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'v-petxu', CAST(0x0000A66C00D979C9 AS DateTime), 1, 8, 4)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'v-petxu', CAST(0x0000A66C00D9CED1 AS DateTime), 7, 8, 4)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'v-petxu', CAST(0x0000A66C00DD4CCC AS DateTime), 8, 0, 4)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'v-petxu', CAST(0x0000A66C00DD550E AS DateTime), 9, 0, 4)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'v-petxu', CAST(0x0000A66C00DDF97B AS DateTime), 9, 4, 5)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'v-petxu', CAST(0x0000A66C00DE00A6 AS DateTime), 8, 4, 5)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'v-petxu', CAST(0x0000A66C00DEE9FB AS DateTime), 9, 5, 8)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'v-petxu', CAST(0x0000A66C00DEEBAE AS DateTime), 8, 5, 8)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'v-petxu', CAST(0x0000A66C00D56DBC AS DateTime), 4, 4, 8)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'v-petxu', CAST(0x0000A66C00D59424 AS DateTime), 4, 8, 62)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'v-petxu', CAST(0x0000A66C00D79281 AS DateTime), 5, 0, 4)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'v-petxu', CAST(0x0000A66C00D7C4C1 AS DateTime), 5, 4, 5)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'v-petxu', CAST(0x0000A66C00D7CC57 AS DateTime), 5, 5, 4)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'v-petxu', CAST(0x0000A66C00D7D494 AS DateTime), 6, 0, 4)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'v-petxu', CAST(0x0000A66C00D7E2C6 AS DateTime), 7, 0, 4)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'v-petxu', CAST(0x0000A66C00D7E605 AS DateTime), 6, 4, 5)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'v-petxu', CAST(0x0000A66C00D7E9A0 AS DateTime), 5, 4, 5)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'v-petxu', CAST(0x0000A66C00D82362 AS DateTime), 5, 5, 8)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'v-petxu', CAST(0x0000A66C00D82632 AS DateTime), 6, 5, 8)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'v-petxu', CAST(0x0000A66C00D82E3E AS DateTime), 6, 8, 5)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'v-petxu', CAST(0x0000A66C00D84828 AS DateTime), 6, 5, 8)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'v-petxu', CAST(0x0000A66C00D8504E AS DateTime), 6, 8, 11)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'v-petxu', CAST(0x0000A66C00D8628F AS DateTime), 6, 11, 10)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'v-petxu', CAST(0x0000A66C00D8D069 AS DateTime), 5, 8, 62)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'v-petxu', CAST(0x0000A66C00D92853 AS DateTime), 7, 4, 5)
INSERT [dbo].[KanBan_Story_ColumnLog] ([Alias], [CurDatetime], [Story_ID], [Column_ID_Prev], [Column_ID_New]) VALUES (N'v-petxu', CAST(0x0000A66C00D93975 AS DateTime), 7, 5, 8)
INSERT [dbo].[KanBan_Story_StatusLog] ([Alias], [CurDatetime], [Story_ID], [Status_Prev], [Status_New]) VALUES (N'', CAST(0x0000A66C00C077D2 AS DateTime), 2, 1, 10)
INSERT [dbo].[KanBan_Story_StatusLog] ([Alias], [CurDatetime], [Story_ID], [Status_Prev], [Status_New]) VALUES (N'', CAST(0x0000A66C00C0BCFA AS DateTime), 4, 0, 1)
INSERT [dbo].[KanBan_Story_StatusLog] ([Alias], [CurDatetime], [Story_ID], [Status_Prev], [Status_New]) VALUES (N'', CAST(0x0000A66C00C22BF1 AS DateTime), 3, 1, 99)
INSERT [dbo].[KanBan_Story_StatusLog] ([Alias], [CurDatetime], [Story_ID], [Status_Prev], [Status_New]) VALUES (N'v-petxu', CAST(0x0000A66C00D79281 AS DateTime), 5, 0, 1)
INSERT [dbo].[KanBan_Story_StatusLog] ([Alias], [CurDatetime], [Story_ID], [Status_Prev], [Status_New]) VALUES (N'v-petxu', CAST(0x0000A66C00D7E2C6 AS DateTime), 7, 0, 1)
INSERT [dbo].[KanBan_Story_StatusLog] ([Alias], [CurDatetime], [Story_ID], [Status_Prev], [Status_New]) VALUES (N'v-petxu', CAST(0x0000A66C00DD4CCB AS DateTime), 8, 0, 1)
INSERT [dbo].[KanBan_Story_StatusLog] ([Alias], [CurDatetime], [Story_ID], [Status_Prev], [Status_New]) VALUES (N'v-petxu', CAST(0x0000A66C00DD550E AS DateTime), 9, 0, 1)
INSERT [dbo].[KanBan_Story_StatusLog] ([Alias], [CurDatetime], [Story_ID], [Status_Prev], [Status_New]) VALUES (N'v-petxu', CAST(0x0000A66C00D7D494 AS DateTime), 6, 0, 1)
INSERT [dbo].[KanBan_Story_StatusLog] ([Alias], [CurDatetime], [Story_ID], [Status_Prev], [Status_New]) VALUES (N'v-petxu', CAST(0x0000A64300D15AD9 AS DateTime), 0, 0, 1)
INSERT [dbo].[KanBan_Story_StatusLog] ([Alias], [CurDatetime], [Story_ID], [Status_Prev], [Status_New]) VALUES (N'v-petxu', CAST(0x0000A64300D462C6 AS DateTime), 0, 0, 1)
INSERT [dbo].[KanBan_Story_StatusLog] ([Alias], [CurDatetime], [Story_ID], [Status_Prev], [Status_New]) VALUES (N'v-petxu', CAST(0x0000A64300D8D9A9 AS DateTime), 0, 0, 1)
INSERT [dbo].[KanBan_Story_StatusLog] ([Alias], [CurDatetime], [Story_ID], [Status_Prev], [Status_New]) VALUES (N'v-petxu', CAST(0x0000A64300DA6456 AS DateTime), 0, 0, 1)
INSERT [dbo].[KanBan_Story_StatusLog] ([Alias], [CurDatetime], [Story_ID], [Status_Prev], [Status_New]) VALUES (N'v-petxu', CAST(0x0000A64300E39E40 AS DateTime), 0, 0, 1)
INSERT [dbo].[KanBan_Story_StatusLog] ([Alias], [CurDatetime], [Story_ID], [Status_Prev], [Status_New]) VALUES (N'v-petxu', CAST(0x0000A64300E45F65 AS DateTime), 0, 0, 1)
INSERT [dbo].[KanBan_Story_StatusLog] ([Alias], [CurDatetime], [Story_ID], [Status_Prev], [Status_New]) VALUES (N'v-petxu', CAST(0x0000A64300E575B4 AS DateTime), 0, 0, 1)
INSERT [dbo].[KanBan_Story_StatusLog] ([Alias], [CurDatetime], [Story_ID], [Status_Prev], [Status_New]) VALUES (N'v-petxu', CAST(0x0000A64300E6066C AS DateTime), 0, 0, 1)
INSERT [dbo].[KanBan_Story_StatusLog] ([Alias], [CurDatetime], [Story_ID], [Status_Prev], [Status_New]) VALUES (N'v-petxu', CAST(0x0000A64300E68A81 AS DateTime), 1, 0, 1)
INSERT [dbo].[KanBan_Story_StatusLog] ([Alias], [CurDatetime], [Story_ID], [Status_Prev], [Status_New]) VALUES (N'v-petxu', CAST(0x0000A64300E8A178 AS DateTime), 0, 0, 1)
INSERT [dbo].[KanBan_Story_StatusLog] ([Alias], [CurDatetime], [Story_ID], [Status_Prev], [Status_New]) VALUES (N'v-petxu', CAST(0x0000A64300E8F9BC AS DateTime), 2, 0, 1)
INSERT [dbo].[KanBan_Story_StatusLog] ([Alias], [CurDatetime], [Story_ID], [Status_Prev], [Status_New]) VALUES (N'v-petxu', CAST(0x0000A64300E98681 AS DateTime), 0, 0, 1)
INSERT [dbo].[KanBan_Story_StatusLog] ([Alias], [CurDatetime], [Story_ID], [Status_Prev], [Status_New]) VALUES (N'v-petxu', CAST(0x0000A64300EAD57E AS DateTime), 3, 0, 1)
SET IDENTITY_INSERT [dbo].[KanBan_SwimLane] ON 

INSERT [dbo].[KanBan_SwimLane] ([ID], [Name], [KanBan_ID], [Status], [Type]) VALUES (90, N'Preparing GBT Data', 1, 1, 1)
INSERT [dbo].[KanBan_SwimLane] ([ID], [Name], [KanBan_ID], [Status], [Type]) VALUES (91, N'GTW feature 01', 1, 1, 1)
INSERT [dbo].[KanBan_SwimLane] ([ID], [Name], [KanBan_ID], [Status], [Type]) VALUES (92, N'Feature 1', 1, 1, 1)
INSERT [dbo].[KanBan_SwimLane] ([ID], [Name], [KanBan_ID], [Status], [Type]) VALUES (93, N'Feature 1', 1, 1, 1)
SET IDENTITY_INSERT [dbo].[KanBan_SwimLane] OFF
INSERT [dbo].[KanBan_SwimLane_StatusLog] ([Alias], [CurDatetime], [Lane_ID], [Status_Prev], [Status_New]) VALUES (N'v-petxu', CAST(0x0000A64300D0A130 AS DateTime), 90, 0, 1)
INSERT [dbo].[KanBan_SwimLane_StatusLog] ([Alias], [CurDatetime], [Lane_ID], [Status_Prev], [Status_New]) VALUES (N'v-petxu', CAST(0x0000A64300EA572F AS DateTime), 91, 0, 1)
INSERT [dbo].[KanBan_SwimLane_StatusLog] ([Alias], [CurDatetime], [Lane_ID], [Status_Prev], [Status_New]) VALUES (N'v-petxu', CAST(0x0000A66C00D76262 AS DateTime), 92, 0, 1)
INSERT [dbo].[KanBan_SwimLane_StatusLog] ([Alias], [CurDatetime], [Lane_ID], [Status_Prev], [Status_New]) VALUES (N'v-petxu', CAST(0x0000A66C00DD283C AS DateTime), 93, 0, 1)
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
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_KanBan_Status]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[KanBan] ADD  CONSTRAINT [DF_KanBan_Status]  DEFAULT ((1)) FOR [Status]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_KanBan_Column_Status]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[KanBan_Column] ADD  CONSTRAINT [DF_KanBan_Column_Status]  DEFAULT ((1)) FOR [Status]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_KanBan_Column_Type]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[KanBan_Column] ADD  CONSTRAINT [DF_KanBan_Column_Type]  DEFAULT ((1)) FOR [Type]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_KanBan_Column_Checklist_Status]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[KanBan_Column_Checklist] ADD  CONSTRAINT [DF_KanBan_Column_Checklist_Status]  DEFAULT ((0)) FOR [Status]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_KanBan_Cycle_Period_Status_Inventory_Num]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[KanBan_Cycle_Period_Status] ADD  CONSTRAINT [DF_KanBan_Cycle_Period_Status_Inventory_Num]  DEFAULT ((0)) FOR [Inventory_Num]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_KanBan_Cycle_Period_Status_Income_Num]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[KanBan_Cycle_Period_Status] ADD  CONSTRAINT [DF_KanBan_Cycle_Period_Status_Income_Num]  DEFAULT ((0)) FOR [Income_Num]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_KanBan_Cycle_Period_Status_Outcome_Num]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[KanBan_Cycle_Period_Status] ADD  CONSTRAINT [DF_KanBan_Cycle_Period_Status_Outcome_Num]  DEFAULT ((0)) FOR [Outcome_Num]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_KanBan_Cycle_Period_Status_Fire_Num]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[KanBan_Cycle_Period_Status] ADD  CONSTRAINT [DF_KanBan_Cycle_Period_Status_Fire_Num]  DEFAULT ((0)) FOR [Fire_Num]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_KanBan_Cycle_Period_Status_Resolve_Num]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[KanBan_Cycle_Period_Status] ADD  CONSTRAINT [DF_KanBan_Cycle_Period_Status_Resolve_Num]  DEFAULT ((0)) FOR [Resolve_Num]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_KanBan_Story_Status]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[KanBan_Story] ADD  CONSTRAINT [DF_KanBan_Story_Status]  DEFAULT ((1)) FOR [Status]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_KanBan_Story_Check_Checked]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[KanBan_Story_Check] ADD  CONSTRAINT [DF_KanBan_Story_Check_Checked]  DEFAULT ((0)) FOR [Checked]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_KanBan_SwimLane_Status]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[KanBan_SwimLane] ADD  CONSTRAINT [DF_KanBan_SwimLane_Status]  DEFAULT ((1)) FOR [Status]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_KanBan_User_Status]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[KanBan_User] ADD  CONSTRAINT [DF_KanBan_User_Status]  DEFAULT ((1)) FOR [Status]
END

GO
