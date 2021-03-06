USE [WHQJGameMatchDB]
GO
/****** 对象:  Table [dbo].[GameScoreAttribute]    脚本日期: 03/17/2017 10:04:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GameScoreAttribute](
	[UserID] [int] NOT NULL,
	[KindID] [int] NOT NULL,
	[ServerID] [int] NOT NULL,
	[IntegralCount] [bigint] NOT NULL,
	[WinCount] [int] NOT NULL,
	[LostCount] [int] NOT NULL,
	[DrawCount] [int] NOT NULL,
	[FleeCount] [int] NOT NULL,
 CONSTRAINT [PK_GameScoreAttribute] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC,
	[KindID] ASC,
	[ServerID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameScoreAttribute', @level2type=N'COLUMN',@level2name=N'UserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'游戏标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameScoreAttribute', @level2type=N'COLUMN',@level2name=N'KindID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'房间标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameScoreAttribute', @level2type=N'COLUMN',@level2name=N'ServerID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'历史积分(单个房间)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameScoreAttribute', @level2type=N'COLUMN',@level2name=N'IntegralCount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'胜局数目(单个房间)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameScoreAttribute', @level2type=N'COLUMN',@level2name=N'WinCount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'输局数目(单个房间)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameScoreAttribute', @level2type=N'COLUMN',@level2name=N'LostCount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'和局数目(单个房间)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameScoreAttribute', @level2type=N'COLUMN',@level2name=N'DrawCount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'逃局数目(单个房间)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameScoreAttribute', @level2type=N'COLUMN',@level2name=N'FleeCount'
GO
/****** 对象:  Table [dbo].[SystemStreamInfo]    脚本日期: 03/17/2017 10:05:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SystemStreamInfo](
	[DateID] [int] NOT NULL,
	[KindID] [int] NOT NULL,
	[ServerID] [int] NOT NULL,
	[LogonCount] [int] NOT NULL CONSTRAINT [DF_TABLE1_LogonCount]  DEFAULT ((0)),
	[RegisterCount] [int] NOT NULL CONSTRAINT [DF_GameEnterInfo_LogonCount1]  DEFAULT ((0)),
	[CollectDate] [datetime] NOT NULL CONSTRAINT [DF_TABLE1_RecordDate]  DEFAULT (getdate()),
 CONSTRAINT [PK_SystemStreamInfo] PRIMARY KEY CLUSTERED 
(
	[DateID] ASC,
	[KindID] ASC,
	[ServerID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'日期标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SystemStreamInfo', @level2type=N'COLUMN',@level2name=N'DateID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'类型标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SystemStreamInfo', @level2type=N'COLUMN',@level2name=N'KindID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'房间标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SystemStreamInfo', @level2type=N'COLUMN',@level2name=N'ServerID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'进入数目' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SystemStreamInfo', @level2type=N'COLUMN',@level2name=N'LogonCount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'注册数目' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SystemStreamInfo', @level2type=N'COLUMN',@level2name=N'RegisterCount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'录入时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SystemStreamInfo', @level2type=N'COLUMN',@level2name=N'CollectDate'
GO
/****** 对象:  Table [dbo].[StreamMatchHistory]    脚本日期: 03/17/2017 10:05:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StreamMatchHistory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[MatchID] [int] NOT NULL,
	[MatchNo] [bigint] NOT NULL CONSTRAINT [DF_StreamMatchHistory_TypeID]  DEFAULT ((0)),
	[MatchType] [tinyint] NOT NULL CONSTRAINT [DF_StreamMatchHistory_MatchType]  DEFAULT ((0)),
	[ServerID] [int] NOT NULL,
	[RankID] [smallint] NOT NULL,
	[MatchScore] [int] NOT NULL,
	[UserRight] [int] NOT NULL,
	[RewardGold] [bigint] NOT NULL,
	[RewardIngot] [bigint] NOT NULL CONSTRAINT [DF_StreamMatchHistory_RewardMedal]  DEFAULT ((0)),
	[RewardExperience] [bigint] NOT NULL CONSTRAINT [DF_StreamMatchHistory_RewardExperience]  DEFAULT ((0)),
	[WinCount] [int] NOT NULL CONSTRAINT [DF_StreamMatchHistory_WinCount]  DEFAULT ((0)),
	[LostCount] [int] NOT NULL CONSTRAINT [DF_StreamMatchHistory_LostCount]  DEFAULT ((0)),
	[DrawCount] [int] NOT NULL CONSTRAINT [DF_StreamMatchHistory_DrawCount]  DEFAULT ((0)),
	[FleeCount] [int] NOT NULL CONSTRAINT [DF_StreamMatchHistory_FleeCount]  DEFAULT ((0)),
	[MatchStartTime] [datetime] NOT NULL CONSTRAINT [DF_StreamMatchHistory_FristStartTime]  DEFAULT (getdate()),
	[MatchEndTime] [datetime] NOT NULL CONSTRAINT [DF_StreamMatchHistory_LastEndTime]  DEFAULT (getdate()),
	[PlayTimeCount] [int] NOT NULL CONSTRAINT [DF_StreamMatchHistory_PlayDureation]  DEFAULT ((0)),
	[OnlineTime] [int] NOT NULL CONSTRAINT [DF_StreamMatchHistory_OnlineDuration]  DEFAULT ((0)),
	[Machine] [nvarchar](32) NOT NULL CONSTRAINT [DF_StreamMatchHistory_Machine]  DEFAULT (''),
	[ClientIP] [nvarchar](15) NOT NULL,
	[RecordDate] [datetime] NOT NULL CONSTRAINT [DF_StreamMatchHistory_RecordDate]  DEFAULT (getdate()),
 CONSTRAINT [PK_StreamMatchHistory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StreamMatchHistory', @level2type=N'COLUMN',@level2name=N'UserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'比赛标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StreamMatchHistory', @level2type=N'COLUMN',@level2name=N'MatchID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'比赛场次' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StreamMatchHistory', @level2type=N'COLUMN',@level2name=N'MatchNo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'比赛类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StreamMatchHistory', @level2type=N'COLUMN',@level2name=N'MatchType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'房间ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StreamMatchHistory', @level2type=N'COLUMN',@level2name=N'ServerID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'比赛名次' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StreamMatchHistory', @level2type=N'COLUMN',@level2name=N'RankID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'比赛得分' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StreamMatchHistory', @level2type=N'COLUMN',@level2name=N'MatchScore'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户权限 如：有进入下一论的权限' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StreamMatchHistory', @level2type=N'COLUMN',@level2name=N'UserRight'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'奖励金币' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StreamMatchHistory', @level2type=N'COLUMN',@level2name=N'RewardGold'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'赢的局数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StreamMatchHistory', @level2type=N'COLUMN',@level2name=N'WinCount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'输的局数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StreamMatchHistory', @level2type=N'COLUMN',@level2name=N'LostCount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'平的局数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StreamMatchHistory', @level2type=N'COLUMN',@level2name=N'DrawCount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'逃跑局数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StreamMatchHistory', @level2type=N'COLUMN',@level2name=N'FleeCount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'比赛第一局开始时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StreamMatchHistory', @level2type=N'COLUMN',@level2name=N'MatchStartTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'比赛最后一句结束时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StreamMatchHistory', @level2type=N'COLUMN',@level2name=N'MatchEndTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'游戏时长 单位:秒' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StreamMatchHistory', @level2type=N'COLUMN',@level2name=N'PlayTimeCount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'在线时长 单位:秒' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StreamMatchHistory', @level2type=N'COLUMN',@level2name=N'OnlineTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'机器码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StreamMatchHistory', @level2type=N'COLUMN',@level2name=N'Machine'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'连接地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StreamMatchHistory', @level2type=N'COLUMN',@level2name=N'ClientIP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'录入时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StreamMatchHistory', @level2type=N'COLUMN',@level2name=N'RecordDate'
GO
/****** 对象:  Table [dbo].[StreamMatchFeeInfo]    脚本日期: 03/17/2017 10:05:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StreamMatchFeeInfo](
	[RecordID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[ServerID] [int] NOT NULL,
	[MatchID] [int] NOT NULL,
	[MatchNo] [bigint] NOT NULL CONSTRAINT [DF_StreamMatchFeeInfo_MacthNo]  DEFAULT ((0)),
	[MatchType] [smallint] NOT NULL CONSTRAINT [DF_StreamMatchFeeInfo_MatchType]  DEFAULT ((0)),
	[SignupMode] [smallint] NOT NULL,
	[MatchFee] [bigint] NOT NULL,
	[CollectDate] [datetime] NOT NULL CONSTRAINT [DF_StreamMatchFeeInfo_CollectDate]  DEFAULT (getdate()),
 CONSTRAINT [PK_StreamMatchFeeInfo] PRIMARY KEY CLUSTERED 
(
	[RecordID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StreamMatchFeeInfo', @level2type=N'COLUMN',@level2name=N'RecordID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StreamMatchFeeInfo', @level2type=N'COLUMN',@level2name=N'UserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'房间标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StreamMatchFeeInfo', @level2type=N'COLUMN',@level2name=N'ServerID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'比赛标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StreamMatchFeeInfo', @level2type=N'COLUMN',@level2name=N'MatchID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'比赛序号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StreamMatchFeeInfo', @level2type=N'COLUMN',@level2name=N'MatchNo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'报名费' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StreamMatchFeeInfo', @level2type=N'COLUMN',@level2name=N'MatchFee'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'收录时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StreamMatchFeeInfo', @level2type=N'COLUMN',@level2name=N'CollectDate'
GO
/****** 对象:  Table [dbo].[RecordUserInout]    脚本日期: 03/17/2017 10:04:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RecordUserInout](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[KindID] [int] NOT NULL,
	[ServerID] [int] NOT NULL,
	[EnterTime] [datetime] NOT NULL CONSTRAINT [DF_RecordUserInout_EnterTime]  DEFAULT (getdate()),
	[EnterScore] [bigint] NOT NULL,
	[EnterInsure] [bigint] NOT NULL CONSTRAINT [DF_RecordUserInout_EnterInsure]  DEFAULT ((0)),
	[EnterUserMedal] [int] NOT NULL CONSTRAINT [DF_RecordUserInout_EnterUserMedal_1]  DEFAULT ((0)),
	[EnterLoveliness] [int] NOT NULL CONSTRAINT [DF_RecordUserInout_EnterLoveliness]  DEFAULT ((0)),
	[EnterMachine] [nvarchar](33) NOT NULL CONSTRAINT [DF_RecordUserInout_EnterMachine]  DEFAULT (N''),
	[EnterClientIP] [nvarchar](15) NOT NULL,
	[LeaveTime] [datetime] NULL,
	[LeaveReason] [int] NULL,
	[LeaveMachine] [nvarchar](32) NULL,
	[LeaveClientIP] [nvarchar](15) NULL,
	[Score] [bigint] NOT NULL CONSTRAINT [DF_RecordUserInout_Score]  DEFAULT ((0)),
	[Insure] [bigint] NOT NULL CONSTRAINT [DF_RecordUserInout_Insure_1]  DEFAULT ((0)),
	[Revenue] [bigint] NOT NULL CONSTRAINT [DF_RecordUserInout_Revenue_1]  DEFAULT ((0)),
	[WinCount] [int] NOT NULL CONSTRAINT [DF_RecordUserInout_WinCount]  DEFAULT ((0)),
	[LostCount] [int] NOT NULL CONSTRAINT [DF_RecordUserInout_LostCount]  DEFAULT ((0)),
	[DrawCount] [int] NOT NULL CONSTRAINT [DF_RecordUserInout_DrawCount]  DEFAULT ((0)),
	[FleeCount] [int] NOT NULL CONSTRAINT [DF_RecordUserInout_FleeCount]  DEFAULT ((0)),
	[UserMedal] [int] NOT NULL CONSTRAINT [DF_RecordUserInout_UserMedal_1]  DEFAULT ((0)),
	[LoveLiness] [int] NOT NULL CONSTRAINT [DF_RecordUserInout_LoveLiness]  DEFAULT ((0)),
	[Experience] [int] NOT NULL CONSTRAINT [DF_RecordUserInout_Experience]  DEFAULT ((0)),
	[PlayTimeCount] [int] NOT NULL CONSTRAINT [DF_RecordUserInout_PlayTimeCount]  DEFAULT ((0)),
	[OnLineTimeCount] [int] NOT NULL CONSTRAINT [DF_RecordUserInout_OnLineTimeCount]  DEFAULT ((0)),
 CONSTRAINT [PK_RecordUserInout_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'索引标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordUserInout', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordUserInout', @level2type=N'COLUMN',@level2name=N'UserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'类型标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordUserInout', @level2type=N'COLUMN',@level2name=N'KindID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'房间标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordUserInout', @level2type=N'COLUMN',@level2name=N'ServerID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'进入时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordUserInout', @level2type=N'COLUMN',@level2name=N'EnterTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'进入积分' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordUserInout', @level2type=N'COLUMN',@level2name=N'EnterScore'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'进入银行' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordUserInout', @level2type=N'COLUMN',@level2name=N'EnterInsure'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'进入奖牌' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordUserInout', @level2type=N'COLUMN',@level2name=N'EnterUserMedal'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'进入魅力' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordUserInout', @level2type=N'COLUMN',@level2name=N'EnterLoveliness'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'进入机器' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordUserInout', @level2type=N'COLUMN',@level2name=N'EnterMachine'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登录地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordUserInout', @level2type=N'COLUMN',@level2name=N'EnterClientIP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'离开时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordUserInout', @level2type=N'COLUMN',@level2name=N'LeaveTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'离开原因' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordUserInout', @level2type=N'COLUMN',@level2name=N'LeaveReason'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'进入机器' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordUserInout', @level2type=N'COLUMN',@level2name=N'LeaveMachine'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登录地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordUserInout', @level2type=N'COLUMN',@level2name=N'LeaveClientIP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'变更积分' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordUserInout', @level2type=N'COLUMN',@level2name=N'Score'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'银行变更' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordUserInout', @level2type=N'COLUMN',@level2name=N'Insure'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'变更服务比例' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordUserInout', @level2type=N'COLUMN',@level2name=N'Revenue'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'胜局变更' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordUserInout', @level2type=N'COLUMN',@level2name=N'WinCount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'输局变更' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordUserInout', @level2type=N'COLUMN',@level2name=N'LostCount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'和局变更' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordUserInout', @level2type=N'COLUMN',@level2name=N'DrawCount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'逃局变更' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordUserInout', @level2type=N'COLUMN',@level2name=N'FleeCount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'奖牌数目' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordUserInout', @level2type=N'COLUMN',@level2name=N'UserMedal'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'魅力变更' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordUserInout', @level2type=N'COLUMN',@level2name=N'LoveLiness'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'经验变更' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordUserInout', @level2type=N'COLUMN',@level2name=N'Experience'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'游戏时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordUserInout', @level2type=N'COLUMN',@level2name=N'PlayTimeCount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'在线时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordUserInout', @level2type=N'COLUMN',@level2name=N'OnLineTimeCount'
GO
/****** 对象:  Table [dbo].[RecordDrawScore]    脚本日期: 03/17/2017 10:04:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RecordDrawScore](
	[DrawID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[ChairID] [int] NOT NULL CONSTRAINT [DF_RecordDrawScore_ChairID]  DEFAULT ((0)),
	[Score] [bigint] NOT NULL,
	[Grade] [bigint] NOT NULL,
	[Revenue] [bigint] NOT NULL,
	[UserMedal] [int] NOT NULL CONSTRAINT [DF_RecordDrawScore_UserMedal]  DEFAULT ((0)),
	[PlayTimeCount] [int] NOT NULL CONSTRAINT [DF_RecordDrawScore_PlayTimeCount]  DEFAULT ((0)),
	[DBQuestID] [int] NOT NULL,
	[InoutIndex] [int] NOT NULL,
	[InsertTime] [datetime] NOT NULL CONSTRAINT [DF_RecordDrawScore_InsertTime]  DEFAULT (getdate())
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'局数标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordDrawScore', @level2type=N'COLUMN',@level2name=N'DrawID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordDrawScore', @level2type=N'COLUMN',@level2name=N'UserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'椅子号码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordDrawScore', @level2type=N'COLUMN',@level2name=N'ChairID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户成绩' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordDrawScore', @level2type=N'COLUMN',@level2name=N'Score'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户积分' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordDrawScore', @level2type=N'COLUMN',@level2name=N'Grade'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'服务比例数目' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordDrawScore', @level2type=N'COLUMN',@level2name=N'Revenue'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户奖牌' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordDrawScore', @level2type=N'COLUMN',@level2name=N'UserMedal'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'游戏时长' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordDrawScore', @level2type=N'COLUMN',@level2name=N'PlayTimeCount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'请求标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordDrawScore', @level2type=N'COLUMN',@level2name=N'DBQuestID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'进出索引' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordDrawScore', @level2type=N'COLUMN',@level2name=N'InoutIndex'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'插入时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordDrawScore', @level2type=N'COLUMN',@level2name=N'InsertTime'
GO
/****** 对象:  Table [dbo].[RecordDrawInfo]    脚本日期: 03/17/2017 10:04:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RecordDrawInfo](
	[DrawID] [int] IDENTITY(1,1) NOT NULL,
	[KindID] [int] NOT NULL,
	[ServerID] [int] NOT NULL,
	[TableID] [int] NOT NULL,
	[UserCount] [int] NOT NULL,
	[AndroidCount] [int] NOT NULL,
	[Waste] [bigint] NOT NULL,
	[Revenue] [bigint] NOT NULL,
	[UserMedal] [int] NOT NULL CONSTRAINT [DF_RecordDrawInfo_UserMedal]  DEFAULT ((0)),
	[StartTime] [datetime] NOT NULL,
	[ConcludeTime] [datetime] NOT NULL,
	[InsertTime] [datetime] NOT NULL CONSTRAINT [DF_RecordDrawInfo_InsertTime]  DEFAULT (getdate()),
	[DrawCourse] [image] NULL,
 CONSTRAINT [PK_RecordDrawInfo_DrawID] PRIMARY KEY CLUSTERED 
(
	[DrawID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'局数标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordDrawInfo', @level2type=N'COLUMN',@level2name=N'DrawID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'类型标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordDrawInfo', @level2type=N'COLUMN',@level2name=N'KindID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'房间标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordDrawInfo', @level2type=N'COLUMN',@level2name=N'ServerID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'桌子号码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordDrawInfo', @level2type=N'COLUMN',@level2name=N'TableID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户数目' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordDrawInfo', @level2type=N'COLUMN',@level2name=N'UserCount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'机器数目' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordDrawInfo', @level2type=N'COLUMN',@level2name=N'AndroidCount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'损耗数目' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordDrawInfo', @level2type=N'COLUMN',@level2name=N'Waste'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'服务比例数目' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordDrawInfo', @level2type=N'COLUMN',@level2name=N'Revenue'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户奖牌' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordDrawInfo', @level2type=N'COLUMN',@level2name=N'UserMedal'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'开始时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordDrawInfo', @level2type=N'COLUMN',@level2name=N'StartTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'结束时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordDrawInfo', @level2type=N'COLUMN',@level2name=N'ConcludeTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'插入时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordDrawInfo', @level2type=N'COLUMN',@level2name=N'InsertTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'游戏过程' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordDrawInfo', @level2type=N'COLUMN',@level2name=N'DrawCourse'
GO
/****** 对象:  Table [dbo].[MatchScoreInfo]    脚本日期: 03/17/2017 10:04:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MatchScoreInfo](
	[UserID] [int] NOT NULL,
	[ServerID] [int] NOT NULL,
	[MatchID] [int] NOT NULL,
	[MatchNo] [bigint] NOT NULL,
	[Score] [bigint] NOT NULL CONSTRAINT [DF_MatchScoreInfo_Score]  DEFAULT ((0)),
	[WinCount] [int] NOT NULL CONSTRAINT [DF_MatchScoreInfo_WinCount]  DEFAULT ((0)),
	[LostCount] [int] NOT NULL CONSTRAINT [DF_MatchScoreInfo_LostCount]  DEFAULT ((0)),
	[DrawCount] [int] NOT NULL CONSTRAINT [DF_MatchScoreInfo_DrawCount]  DEFAULT ((0)),
	[FleeCount] [int] NOT NULL CONSTRAINT [DF_MatchScoreInfo_FleeCount]  DEFAULT ((0)),
	[MatchRight] [int] NOT NULL CONSTRAINT [DF_MatchScoreInfo_UserRight]  DEFAULT ((0)),
	[PlayTimeCount] [int] NOT NULL CONSTRAINT [DF_MatchScoreInfo_PlayTimeCount]  DEFAULT ((0)),
	[OnlineTime] [int] NOT NULL CONSTRAINT [DF_MatchScoreInfo_OnlineTime]  DEFAULT ((0)),
	[SignupTime] [datetime] NOT NULL CONSTRAINT [DF_MatchScoreInfo_UpdateTime]  DEFAULT (getdate()),
 CONSTRAINT [PK_MatchScoreInfo] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC,
	[ServerID] ASC,
	[MatchID] ASC,
	[MatchNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MatchScoreInfo', @level2type=N'COLUMN',@level2name=N'UserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'房间标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MatchScoreInfo', @level2type=N'COLUMN',@level2name=N'ServerID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'比赛标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MatchScoreInfo', @level2type=N'COLUMN',@level2name=N'MatchID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'场次编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MatchScoreInfo', @level2type=N'COLUMN',@level2name=N'MatchNo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'比赛分数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MatchScoreInfo', @level2type=N'COLUMN',@level2name=N'Score'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'胜利局数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MatchScoreInfo', @level2type=N'COLUMN',@level2name=N'WinCount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'失败局数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MatchScoreInfo', @level2type=N'COLUMN',@level2name=N'LostCount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'打平局数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MatchScoreInfo', @level2type=N'COLUMN',@level2name=N'DrawCount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'逃跑局数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MatchScoreInfo', @level2type=N'COLUMN',@level2name=N'FleeCount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户权限' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MatchScoreInfo', @level2type=N'COLUMN',@level2name=N'MatchRight'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'游戏时长' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MatchScoreInfo', @level2type=N'COLUMN',@level2name=N'PlayTimeCount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'在线时长' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MatchScoreInfo', @level2type=N'COLUMN',@level2name=N'OnlineTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'报名时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MatchScoreInfo', @level2type=N'COLUMN',@level2name=N'SignupTime'
GO
/****** 对象:  Table [dbo].[MatchReward]    脚本日期: 03/17/2017 10:04:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MatchReward](
	[MatchID] [int] NOT NULL,
	[MatchRank] [smallint] NOT NULL,
	[RewardGold] [bigint] NOT NULL CONSTRAINT [DF_MatchAward_AwardGold]  DEFAULT ((0)),
	[RewardIngot] [bigint] NOT NULL CONSTRAINT [DF_MatchReward_RewardMedal]  DEFAULT ((0)),
	[RewardExperience] [bigint] NOT NULL CONSTRAINT [DF_MatchReward_RewardExperience]  DEFAULT ((0)),
	[RewardDescibe] [nvarchar](128) NULL,
 CONSTRAINT [PK_MatchReward_1] PRIMARY KEY CLUSTERED 
(
	[MatchID] ASC,
	[MatchRank] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'奖励的游戏币' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MatchReward', @level2type=N'COLUMN',@level2name=N'RewardGold'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'奖励描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MatchReward', @level2type=N'COLUMN',@level2name=N'RewardDescibe'
GO
/****** 对象:  Table [dbo].[MatchReviveInfo]    脚本日期: 03/17/2017 10:04:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MatchReviveInfo](
	[UserID] [int] NOT NULL,
	[MatchID] [int] NOT NULL,
	[MatchNo] [bigint] NOT NULL CONSTRAINT [DF_MatchReviveInfo_MatchNO]  DEFAULT ((0)),
	[HoldSafeCard] [tinyint] NOT NULL CONSTRAINT [DF_MatchReviveInfo_SafeCard]  DEFAULT ((0)),
	[UseSafeCard] [tinyint] NOT NULL CONSTRAINT [DF_MatchReviveInfo_UseSafeCard]  DEFAULT ((0)),
	[ReviveFee] [int] NOT NULL CONSTRAINT [DF_MatchReviveInfo_ReviveFee]  DEFAULT ((0)),
	[ReviveTimes] [tinyint] NOT NULL CONSTRAINT [DF_MatchReviveInfo_ReviveTimes]  DEFAULT ((0)),
	[CollectDate] [datetime] NOT NULL CONSTRAINT [DF_MatchReviveInfo_CollectDate]  DEFAULT (getdate()),
 CONSTRAINT [PK_MatchReviveInfo] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC,
	[MatchID] ASC,
	[MatchNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否拥有保险卡' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MatchReviveInfo', @level2type=N'COLUMN',@level2name=N'HoldSafeCard'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'复活费用' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MatchReviveInfo', @level2type=N'COLUMN',@level2name=N'ReviveFee'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'复活次数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MatchReviveInfo', @level2type=N'COLUMN',@level2name=N'ReviveTimes'
GO
/****** 对象:  Table [dbo].[MatchResults]    脚本日期: 03/17/2017 10:04:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MatchResults](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[MatchID] [int] NOT NULL,
	[MatchNo] [bigint] NOT NULL CONSTRAINT [DF_MatchResults_MatchNo]  DEFAULT ((0)),
	[ServerID] [int] NOT NULL,
	[Score] [bigint] NOT NULL,
	[WinCount] [int] NOT NULL,
	[LostCount] [int] NOT NULL,
	[DrawCount] [int] NOT NULL,
	[FleeCount] [int] NOT NULL,
	[CollectDate] [datetime] NOT NULL CONSTRAINT [DF_MatchResults_COllectData]  DEFAULT (getdate()),
 CONSTRAINT [PK_MatchResults] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** 对象:  Table [dbo].[MatchPublic]    脚本日期: 03/17/2017 10:04:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MatchPublic](
	[MatchID] [int] IDENTITY(1,1) NOT NULL,
	[MatchStatus] [tinyint] NOT NULL CONSTRAINT [DF_MatchPublic_Status]  DEFAULT ((0)),
	[KindID] [int] NOT NULL CONSTRAINT [DF_MatchPublic_KindID]  DEFAULT ((0)),
	[MatchName] [nvarchar](50) NOT NULL,
	[MatchType] [tinyint] NOT NULL,
	[SignupMode] [tinyint] NOT NULL,
	[FeeType] [tinyint] NOT NULL CONSTRAINT [DF_MatchPublic_FeeType]  DEFAULT ((0)),
	[SignupFee] [bigint] NOT NULL,
	[DeductArea] [tinyint] NOT NULL CONSTRAINT [DF_MatchPublic_DeductArea]  DEFAULT ((0)),
	[JoinCondition] [tinyint] NOT NULL,
	[MemberOrder] [tinyint] NOT NULL CONSTRAINT [DF_MatchPublic_MemberOrder]  DEFAULT ((0)),
	[Experience] [int] NOT NULL CONSTRAINT [DF_MatchPublic_Experience]  DEFAULT ((0)),
	[FromMatchID] [int] NOT NULL CONSTRAINT [DF_MatchPublic_FromMatchID]  DEFAULT ((0)),
	[FilterType] [tinyint] NOT NULL CONSTRAINT [DF_MatchPublic_FilterType]  DEFAULT ((0)),
	[MaxRankID] [smallint] NOT NULL CONSTRAINT [DF_MatchPublic_MaxRankID]  DEFAULT ((0)),
	[MatchEndDate] [datetime] NOT NULL CONSTRAINT [DF_MatchPublic_MatchEndData]  DEFAULT (getdate()),
	[MatchStartDate] [datetime] NOT NULL CONSTRAINT [DF_MatchPublic_MatchStartDate]  DEFAULT (getdate()),
	[RankingMode] [tinyint] NOT NULL CONSTRAINT [DF_MatchPublic_RankingMode]  DEFAULT ((0)),
	[CountInnings] [smallint] NOT NULL CONSTRAINT [DF_MatchPublic_CountInnings]  DEFAULT ((0)),
	[FilterGradesMode] [tinyint] NOT NULL CONSTRAINT [DF_MatchPublic_FilterGradesMode]  DEFAULT ((0)),
	[DistributeRule] [tinyint] NOT NULL CONSTRAINT [DF_MatchPublic_DistributeRule]  DEFAULT ((0)),
	[MinDistributeUser] [smallint] NOT NULL CONSTRAINT [DF_MatchPublic_MinDistributeUser]  DEFAULT ((0)),
	[DistributeTimeSpace] [smallint] NOT NULL CONSTRAINT [DF_MatchPublic_DistributeTimeSpace]  DEFAULT ((0)),
	[MinPartakeGameUser] [smallint] NOT NULL CONSTRAINT [DF_MatchPublic_MinPartakeGameUser]  DEFAULT ((0)),
	[MaxPartakeGameUser] [smallint] NOT NULL CONSTRAINT [DF_MatchPublic_MaxPartakeGameUser]  DEFAULT ((0)),
	[MatchRule] [nvarchar](1024) NOT NULL CONSTRAINT [DF_MatchPublic_MatchRule]  DEFAULT (''),
	[ServiceMachine] [nchar](32) NOT NULL CONSTRAINT [DF_MatchPublic_ServiceMachine]  DEFAULT (N''),
	[Nullity] [bit] NOT NULL CONSTRAINT [DF_MatchPublic_Nullity]  DEFAULT ((0)),
	[CollectDate] [datetime] NOT NULL,
 CONSTRAINT [PK_MatchPublic_1] PRIMARY KEY CLUSTERED 
(
	[MatchID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'比赛标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MatchPublic', @level2type=N'COLUMN',@level2name=N'MatchID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'比赛状态（0x00： 为空闲   0x02：比赛中  0x08： 比赛结束）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MatchPublic', @level2type=N'COLUMN',@level2name=N'MatchStatus'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'类型标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MatchPublic', @level2type=N'COLUMN',@level2name=N'KindID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'比赛名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MatchPublic', @level2type=N'COLUMN',@level2name=N'MatchName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'比赛类型 0:定时赛 1:即时赛' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MatchPublic', @level2type=N'COLUMN',@level2name=N'MatchType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'报名方式  1:扣除金币 2:跳转网站' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MatchPublic', @level2type=N'COLUMN',@level2name=N'SignupMode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'费用类型（0：金币   1： 奖牌）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MatchPublic', @level2type=N'COLUMN',@level2name=N'FeeType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'扣费数量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MatchPublic', @level2type=N'COLUMN',@level2name=N'SignupFee'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'扣费区域（0： 房间扣费 1： 网页扣费）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MatchPublic', @level2type=N'COLUMN',@level2name=N'DeductArea'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'参赛条件  (1 表示会员等级 2表示经验值 4表示比赛玩家)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MatchPublic', @level2type=N'COLUMN',@level2name=N'JoinCondition'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'会员等级' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MatchPublic', @level2type=N'COLUMN',@level2name=N'MemberOrder'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'玩家经验' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MatchPublic', @level2type=N'COLUMN',@level2name=N'Experience'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'赛事来源' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MatchPublic', @level2type=N'COLUMN',@level2name=N'FromMatchID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'筛选方式' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MatchPublic', @level2type=N'COLUMN',@level2name=N'FilterType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最大名次' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MatchPublic', @level2type=N'COLUMN',@level2name=N'MaxRankID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'比赛玩家所属比赛的开始统计日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MatchPublic', @level2type=N'COLUMN',@level2name=N'MatchStartDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排名方式（0:  按总成绩排名   1:  按特定局数成绩排名）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MatchPublic', @level2type=N'COLUMN',@level2name=N'RankingMode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'统计局数( 比赛多少局统计一次成绩)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MatchPublic', @level2type=N'COLUMN',@level2name=N'CountInnings'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'筛选方式(0: 取最优成绩  1：取平均成绩 2：去掉最优和最差,取平均成绩  )' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MatchPublic', @level2type=N'COLUMN',@level2name=N'FilterGradesMode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分配规则' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MatchPublic', @level2type=N'COLUMN',@level2name=N'DistributeRule'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最小分组人数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MatchPublic', @level2type=N'COLUMN',@level2name=N'MinDistributeUser'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分组时间间隔' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MatchPublic', @level2type=N'COLUMN',@level2name=N'DistributeTimeSpace'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最小游戏人数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MatchPublic', @level2type=N'COLUMN',@level2name=N'MinPartakeGameUser'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最大游戏人数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MatchPublic', @level2type=N'COLUMN',@level2name=N'MaxPartakeGameUser'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'比赛规则' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MatchPublic', @level2type=N'COLUMN',@level2name=N'MatchRule'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'机器序列' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MatchPublic', @level2type=N'COLUMN',@level2name=N'ServiceMachine'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'禁止标志' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MatchPublic', @level2type=N'COLUMN',@level2name=N'Nullity'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MatchPublic', @level2type=N'COLUMN',@level2name=N'CollectDate'
GO
/****** 对象:  Table [dbo].[MatchPromoteInfo]    脚本日期: 03/17/2017 10:04:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MatchPromoteInfo](
	[UserID] [int] NOT NULL,
	[MatchID] [int] NOT NULL,
	[PromoteMatchID] [int] NOT NULL CONSTRAINT [DF_MatchPromoteInfo_RelatedMatchID]  DEFAULT ((0)),
	[ServerID] [int] NOT NULL CONSTRAINT [DF_MatchPromoteInfo_ServerID]  DEFAULT ((0)),
	[RankID] [int] NOT NULL,
	[Score] [bigint] NOT NULL CONSTRAINT [DF_MatchPromoteInfo_Score]  DEFAULT ((0)),
	[RewardGold] [bigint] NOT NULL CONSTRAINT [DF_MatchPromoteInfo_RewardGold]  DEFAULT ((0)),
	[RewardIngot] [bigint] NOT NULL CONSTRAINT [DF_MatchPromoteInfo_RewardMedal]  DEFAULT ((0)),
	[RewardExperience] [bigint] NOT NULL CONSTRAINT [DF_MatchPromoteInfo_RewardExperience]  DEFAULT ((0)),
	[CollectDate] [datetime] NOT NULL CONSTRAINT [DF_MatchPromoteInfo_CollectDate]  DEFAULT (getdate()),
 CONSTRAINT [PK_MatchPromoteInfo] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC,
	[MatchID] ASC,
	[PromoteMatchID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MatchPromoteInfo', @level2type=N'COLUMN',@level2name=N'UserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'比赛标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MatchPromoteInfo', @level2type=N'COLUMN',@level2name=N'MatchID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'晋级比赛标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MatchPromoteInfo', @level2type=N'COLUMN',@level2name=N'PromoteMatchID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'比赛名次' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MatchPromoteInfo', @level2type=N'COLUMN',@level2name=N'RankID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'插入时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MatchPromoteInfo', @level2type=N'COLUMN',@level2name=N'CollectDate'
GO
/****** 对象:  Table [dbo].[GameScoreLocker]    脚本日期: 03/17/2017 10:04:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GameScoreLocker](
	[UserID] [int] NOT NULL,
	[KindID] [int] NOT NULL,
	[ServerID] [int] NOT NULL,
	[EnterID] [int] NOT NULL,
	[EnterIP] [nvarchar](15) NOT NULL CONSTRAINT [DF_GameScoreLocker_EnterIP]  DEFAULT (N''),
	[EnterMachine] [nvarchar](32) NOT NULL CONSTRAINT [DF_GameScoreLocker_RegisterMachine]  DEFAULT (N''),
	[CollectDate] [datetime] NOT NULL CONSTRAINT [DF_GameScoreLocker_CollectDate]  DEFAULT (getdate()),
 CONSTRAINT [PK_GameScoreLocker_1] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC,
	[ServerID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户索引' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameScoreLocker', @level2type=N'COLUMN',@level2name=N'UserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'房间索引' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameScoreLocker', @level2type=N'COLUMN',@level2name=N'KindID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'游戏标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameScoreLocker', @level2type=N'COLUMN',@level2name=N'ServerID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'进出索引' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameScoreLocker', @level2type=N'COLUMN',@level2name=N'EnterID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'进入地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameScoreLocker', @level2type=N'COLUMN',@level2name=N'EnterIP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'进入机器' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameScoreLocker', @level2type=N'COLUMN',@level2name=N'EnterMachine'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'录入日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameScoreLocker', @level2type=N'COLUMN',@level2name=N'CollectDate'
GO
/****** 对象:  Table [dbo].[GameScoreInfo]    脚本日期: 03/17/2017 10:04:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GameScoreInfo](
	[UserID] [int] NOT NULL,
	[UserRight] [int] NOT NULL CONSTRAINT [DF_GameScoreInfo_UserRight]  DEFAULT ((0)),
	[MasterRight] [int] NOT NULL CONSTRAINT [DF_GameScoreInfo_MasterRight]  DEFAULT ((0)),
	[MasterOrder] [tinyint] NOT NULL CONSTRAINT [DF_GameScoreInfo_MasterOrder]  DEFAULT ((0)),
	[LastLogonIP] [nvarchar](15) NOT NULL,
	[LastLogonDate] [datetime] NOT NULL CONSTRAINT [DF_GameScore_LastLogonDate]  DEFAULT (getdate()),
	[LastLogonMachine] [nvarchar](32) NOT NULL CONSTRAINT [DF_GameScoreInfo_LastLogonMachine]  DEFAULT (N''),
	[AllLogonTimes] [int] NOT NULL CONSTRAINT [DF_GameScore_AllLogonTimes]  DEFAULT ((0)),
	[PlayTimeCount] [int] NOT NULL CONSTRAINT [DF_GameScore_PlayTimeCount_1]  DEFAULT ((0)),
	[OnLineTimeCount] [int] NOT NULL CONSTRAINT [DF_GameScore_OnLineTimeCount]  DEFAULT ((0)),
 CONSTRAINT [PK_GameScore] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户 ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameScoreInfo', @level2type=N'COLUMN',@level2name=N'UserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户权限' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameScoreInfo', @level2type=N'COLUMN',@level2name=N'UserRight'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'管理权限' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameScoreInfo', @level2type=N'COLUMN',@level2name=N'MasterRight'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'管理等级' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameScoreInfo', @level2type=N'COLUMN',@level2name=N'MasterOrder'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'上次登陆 IP' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameScoreInfo', @level2type=N'COLUMN',@level2name=N'LastLogonIP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'上次登陆时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameScoreInfo', @level2type=N'COLUMN',@level2name=N'LastLogonDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'总登陆次数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameScoreInfo', @level2type=N'COLUMN',@level2name=N'AllLogonTimes'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'游戏时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameScoreInfo', @level2type=N'COLUMN',@level2name=N'PlayTimeCount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'在线时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameScoreInfo', @level2type=N'COLUMN',@level2name=N'OnLineTimeCount'
GO
/****** 对象:  Table [dbo].[GameProperty]    脚本日期: 03/17/2017 10:04:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GameProperty](
	[ID] [int] NOT NULL,
	[Name] [nvarchar](31) NOT NULL,
	[Cash] [decimal](18, 2) NOT NULL,
	[Gold] [bigint] NOT NULL,
	[Discount] [smallint] NOT NULL CONSTRAINT [DF_GameProperty_Discount]  DEFAULT ((90)),
	[IssueArea] [smallint] NOT NULL CONSTRAINT [DF_GameProperty_SellArea]  DEFAULT ((3)),
	[ServiceArea] [smallint] NOT NULL,
	[SendLoveLiness] [bigint] NOT NULL,
	[RecvLoveLiness] [bigint] NOT NULL,
	[RegulationsInfo] [nvarchar](255) NOT NULL,
	[Nullity] [tinyint] NOT NULL CONSTRAINT [DF_GameProperty_Nullity]  DEFAULT ((0)),
 CONSTRAINT [PK_GameProperty] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'道具标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameProperty', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'道具名字' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameProperty', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'道具价格' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameProperty', @level2type=N'COLUMN',@level2name=N'Cash'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'道具金币' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameProperty', @level2type=N'COLUMN',@level2name=N'Gold'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'会员折扣' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameProperty', @level2type=N'COLUMN',@level2name=N'Discount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'发行范围' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameProperty', @level2type=N'COLUMN',@level2name=N'IssueArea'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'使用范围' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameProperty', @level2type=N'COLUMN',@level2name=N'ServiceArea'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'增加魅力' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameProperty', @level2type=N'COLUMN',@level2name=N'SendLoveLiness'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'增加魅力' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameProperty', @level2type=N'COLUMN',@level2name=N'RecvLoveLiness'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'使用说明' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameProperty', @level2type=N'COLUMN',@level2name=N'RegulationsInfo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'禁止标志' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameProperty', @level2type=N'COLUMN',@level2name=N'Nullity'
GO
/****** 对象:  Table [dbo].[GameColumnItem]    脚本日期: 03/17/2017 10:04:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GameColumnItem](
	[SortID] [int] NOT NULL,
	[ColumnName] [nvarchar](15) NOT NULL,
	[ColumnWidth] [tinyint] NOT NULL,
	[DataDescribe] [tinyint] NOT NULL,
 CONSTRAINT [PK_GameColumnItem_SortID] PRIMARY KEY CLUSTERED 
(
	[SortID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排列标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameColumnItem', @level2type=N'COLUMN',@level2name=N'SortID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'列头名字' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameColumnItem', @level2type=N'COLUMN',@level2name=N'ColumnName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'列表宽度' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameColumnItem', @level2type=N'COLUMN',@level2name=N'ColumnWidth'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数据描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameColumnItem', @level2type=N'COLUMN',@level2name=N'DataDescribe'
GO
/****** 对象:  Table [dbo].[ConfineMachine]    脚本日期: 03/17/2017 10:04:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConfineMachine](
	[MachineSerial] [nvarchar](32) NOT NULL,
	[EnjoinLogon] [bit] NOT NULL CONSTRAINT [DF_MachineConfineRule_EnjoinLogon]  DEFAULT ((0)),
	[EnjoinRegister] [bit] NOT NULL CONSTRAINT [DF_MachineConfineRule_EnjoinRegister]  DEFAULT ((0)),
	[EnjoinOverDate] [datetime] NOT NULL,
	[CollectDate] [datetime] NOT NULL CONSTRAINT [DF_MachineConfineRule_CollectDate]  DEFAULT (getdate()),
	[CollectNote] [nvarchar](32) NOT NULL CONSTRAINT [DF_MachineConfineRule_CollectNote]  DEFAULT (''),
 CONSTRAINT [PK_MachineConfineRule_MachineSerial] PRIMARY KEY CLUSTERED 
(
	[MachineSerial] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'机器序列' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ConfineMachine', @level2type=N'COLUMN',@level2name=N'MachineSerial'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'限制登录' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ConfineMachine', @level2type=N'COLUMN',@level2name=N'EnjoinLogon'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'限制注册' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ConfineMachine', @level2type=N'COLUMN',@level2name=N'EnjoinRegister'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'过期时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ConfineMachine', @level2type=N'COLUMN',@level2name=N'EnjoinOverDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'收集日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ConfineMachine', @level2type=N'COLUMN',@level2name=N'CollectDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'输入备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ConfineMachine', @level2type=N'COLUMN',@level2name=N'CollectNote'
GO
/****** 对象:  Table [dbo].[ConfineAddress]    脚本日期: 03/17/2017 10:04:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConfineAddress](
	[AddrString] [nvarchar](15) NOT NULL,
	[EnjoinLogon] [bit] NOT NULL CONSTRAINT [DF_AddrConfineRule_EnjoinLogon]  DEFAULT ((0)),
	[EnjoinOverDate] [datetime] NOT NULL,
	[CollectDate] [datetime] NOT NULL CONSTRAINT [DF_AddrConfineRule_CollectDate]  DEFAULT (getdate()),
	[CollectNote] [nvarchar](32) NOT NULL CONSTRAINT [DF_AddrConfineRule_CollectNote]  DEFAULT (''),
 CONSTRAINT [PK_ConfineAddress_AddrString] PRIMARY KEY CLUSTERED 
(
	[AddrString] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'地址字符' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ConfineAddress', @level2type=N'COLUMN',@level2name=N'AddrString'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'限制登陆' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ConfineAddress', @level2type=N'COLUMN',@level2name=N'EnjoinLogon'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'过期时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ConfineAddress', @level2type=N'COLUMN',@level2name=N'EnjoinOverDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'收集日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ConfineAddress', @level2type=N'COLUMN',@level2name=N'CollectDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'输入备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ConfineAddress', @level2type=N'COLUMN',@level2name=N'CollectNote'
GO
/****** 对象:  Table [dbo].[MatchWebShow]    脚本日期: 03/17/2017 10:04:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MatchWebShow](
	[MatchID] [int] NOT NULL,
	[MatchNo] [smallint] NOT NULL,
	[ImageUrl] [nvarchar](512) NOT NULL CONSTRAINT [DF_MatchInfo_ImageUrl]  DEFAULT (''),
	[MatchSummary] [nvarchar](256) NOT NULL CONSTRAINT [DF_MatchTypeInfo_TypeSummary]  DEFAULT (''),
	[MatchContent] [ntext] NOT NULL,
	[IsRecommend] [bit] NOT NULL CONSTRAINT [DF_MatchInfo_IsRecommend]  DEFAULT ((1)),
	[MatchStatus] [int] NOT NULL CONSTRAINT [DF_MatchWebShow_MatchStatus]  DEFAULT ((0)),
 CONSTRAINT [PK_GameMatchInfo] PRIMARY KEY CLUSTERED 
(
	[MatchID] ASC,
	[MatchNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'比赛标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MatchWebShow', @level2type=N'COLUMN',@level2name=N'MatchID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'比赛场次' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MatchWebShow', @level2type=N'COLUMN',@level2name=N'MatchNo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'小图地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MatchWebShow', @level2type=N'COLUMN',@level2name=N'ImageUrl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'比赛摘要' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MatchWebShow', @level2type=N'COLUMN',@level2name=N'MatchSummary'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'比赛说明' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MatchWebShow', @level2type=N'COLUMN',@level2name=N'MatchContent'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否推荐至首页' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MatchWebShow', @level2type=N'COLUMN',@level2name=N'IsRecommend'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'比赛状态 (0:未开始,1:进行中,2:已结束)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MatchWebShow', @level2type=N'COLUMN',@level2name=N'MatchStatus'
GO
/****** 对象:  Table [dbo].[MatchInfo]    脚本日期: 03/17/2017 10:04:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MatchInfo](
	[MatchID] [int] NOT NULL,
	[MatchName] [nvarchar](100) NOT NULL,
	[MatchDate] [nvarchar](50) NOT NULL,
	[MatchSummary] [nvarchar](200) NOT NULL CONSTRAINT [DF_MatchInfo_MatchSummary]  DEFAULT (''),
	[MatchImage] [nvarchar](200) NOT NULL CONSTRAINT [DF_MatchInfo_MatchImage]  DEFAULT (''),
	[MatchContent] [text] NOT NULL CONSTRAINT [DF_MatchInfo_MatchContent]  DEFAULT (''),
	[SortID] [int] NOT NULL CONSTRAINT [DF_MatchInfo_SortID]  DEFAULT ((0)),
	[Nullity] [tinyint] NOT NULL CONSTRAINT [DF_MatchInfo_Nullity]  DEFAULT ((0)),
	[CollectDate] [datetime] NOT NULL CONSTRAINT [DF_MatchInfo_CollectDate]  DEFAULT (getdate()),
 CONSTRAINT [PK_MatchInfo] PRIMARY KEY CLUSTERED 
(
	[MatchID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'比赛标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MatchInfo', @level2type=N'COLUMN',@level2name=N'MatchID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'比赛名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MatchInfo', @level2type=N'COLUMN',@level2name=N'MatchName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'比赛时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MatchInfo', @level2type=N'COLUMN',@level2name=N'MatchDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'比赛摘要' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MatchInfo', @level2type=N'COLUMN',@level2name=N'MatchSummary'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'比赛介绍' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MatchInfo', @level2type=N'COLUMN',@level2name=N'MatchContent'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否禁用' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MatchInfo', @level2type=N'COLUMN',@level2name=N'Nullity'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'添加时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MatchInfo', @level2type=N'COLUMN',@level2name=N'CollectDate'
GO
