USE [WHQJGroupDB]
GO
/****** Object:  Table [dbo].[IMGroupApplyRecord]    Script Date: 2018/3/15 11:33:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IMGroupApplyRecord](
	[RecordID] [int] IDENTITY(1,1) NOT NULL,
	[GroupID] [bigint] NOT NULL,
	[ApplyerID] [int] NOT NULL,
	[ApplyerGameID] [int] NOT NULL,
	[ApplyerCustomID] [int] NOT NULL,
	[ApplyerNickName] [nvarchar](32) NOT NULL,
	[ApplyType] [tinyint] NOT NULL,
	[ApplyStatus] [tinyint] NOT NULL,
	[OperatorID] [int] NOT NULL ,
	[OperatorName] [nvarchar](32) NOT NULL ,
	[CreaterID] [int] NOT NULL,
	[GroupName] [nvarchar](32) NOT NULL,
	[DeleteMask] [tinyint] NOT NULL,
	[Remarks] [nvarchar](64) NOT NULL,
	[InvitationCode] [bigint] NOT NULL,
	[CollectDateTime] [datetime] NOT NULL,
 CONSTRAINT [PK_IMGroupApplyRecord_1] PRIMARY KEY CLUSTERED 
(
	[RecordID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

/****** Object:  Table [dbo].[IMGroupBattleRule]    Script Date: 2018/3/15 11:33:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IMGroupBattleRule](
	[GroupID] [bigint] NOT NULL,
	[PayType] [tinyint] NOT NULL,
	[CurrencyKind] [tinyint] NOT NULL,
	[BattleMask] [tinyint] NOT NULL,
	[ManagerRight] [int] NOT NULL,
	[CaptainRight] [int] NOT NULL,
	[InMode]	[tinyint] NOT NULL,
	[OutMode]	[tinyint] NOT NULL,
	[FreeTableLimit]	[tinyint] NOT NULL,
	[BigWinnerShow]	[tinyint] NOT NULL,
	[MedalMode]	[tinyint] NOT NULL,
	[MedalShow]	[tinyint] NOT NULL,
	[CurMedalShow]	[tinyint] NOT NULL,
	[MedalRevenueShow]	[tinyint] NOT NULL,
	[MedalClear]	[tinyint] NOT NULL,
	[GroupIDShow]	[tinyint] NOT NULL,
 CONSTRAINT [PK_IMGroupRule] PRIMARY KEY CLUSTERED 
(
	[GroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[IMGroupMember]    Script Date: 2018/3/15 11:33:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IMGroupMember](
	[GroupID] [bigint] NOT NULL,
	[UserID] [bigint] NOT NULL,
	[Score]	[bigint] NOT NULL,
	[MemberRight] [int] NOT NULL,
	[BattleCount] [int] NOT NULL,
	[CaptainID]	[bigint] NOT NULL,
	[FavoriteConfig] [bigint] NOT NULL,	
	[ManagerRightFlag] [tinyint] NOT NULL,	
	[MemberManagerRight] [bigint] NOT NULL,	
	[AwardPoint] [int] NOT NULL,	
	[AwardScore] [bigint] NOT NULL,	
	[JoinDateTime] [datetime] NOT NULL,
	[UserStatus] [TINYINT] NOT NULL,	
	[OnlineTimeCount] [bigint] NOT NULL,
	[EnterTime] [datetime] NOT NULL,
	[LeaveTime] [datetime] NOT NULL,
	[QQ]		nvarchar(32) NOT NULL,
	[WX]		nvarchar(32) NOT NULL,
	[Phone]		nvarchar(12) NOT NULL,
 CONSTRAINT [PK__IMGroupM__8455F7B99DE973A8] PRIMARY KEY CLUSTERED 
(
	[GroupID] ASC,
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[IMGroupOption]    Script Date: 2018/3/15 11:33:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IMGroupOption](
	[OptionName] [nvarchar](32) NOT NULL,
	[OptionValue] [int] NOT NULL,
	[OptionDescribe] [nvarchar](128) NOT NULL,
	[OptionTip] NVARCHAR(50) NOT NULL,
	[SortID] INT NOT NULL,
) ON [PRIMARY]

GO

/****** Object:  Table [dbo].[[RecordTeamDayInfo]]    Script Date: 2018/3/15 11:33:38 ******/
CREATE TABLE [dbo].[RecordTeamDayInfo](
	[GroupID] [bigint],
	[CaptainID] [bigint] NOT NULL,
	[DateID] [int] NOT NULL,
	[DrawCount] [int] NOT NULL,
	[BigWinnerCount] [int] NOT NULL,
	[ScoreCount] [bigint] NOT NULL,
	[RevenueCount] [bigint] NOT NULL,
	[ContributionValue] [bigint] NOT NULL,
	[Flag]			[tinyint] NOT NULL,
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[IMGroupProperty]    Script Date: 2018/3/15 11:33:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IMGroupProperty](
	[GroupID] [bigint] IDENTITY(100000,1) NOT NULL,
	[CreaterID] [int] NOT NULL,
	[CreaterGameID] [int] NOT NULL,
	[CreaterNickName] [nvarchar](32) NOT NULL,
	[GroupName] [nvarchar](32) NOT NULL,
	[GroupLevel] [tinyint] NOT NULL,
	[CanUseMedal] [tinyint] NOT NULL,
	[GroupStatus] [tinyint] NOT NULL,
	[GroupIntroduce] [nvarchar](128) NOT NULL,
	[MemberCount] [smallint] NOT NULL,
	[MaxMemberCount] [smallint] NOT NULL,
	[CreateDateTime] [datetime] NOT NULL,
 CONSTRAINT [PK_IMGroupProperty_1] PRIMARY KEY CLUSTERED 
(
	[GroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[IMGroupWealth]    Script Date: 2018/3/15 11:33:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IMGroupWealth](
	[GroupID] [bigint] NOT NULL,
	[Ingot] [bigint] NOT NULL,
	[ConsumeIngot][bigint] NOT NULL,
	[BattleCreate][int] NOT NULL,
	[Score]		[bigint] NOT NULL,
 CONSTRAINT [PK_IMGroupWealth] PRIMARY KEY CLUSTERED 
(
	[GroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]


/****** Object:  Table [dbo].[IMGroupShareStorageProperty]    Script Date: 12/17/2019 16:47:54 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[IMGroupShareStorageProperty](
	[GroupID] [bigint] NOT NULL,
	[KindID] [int] NOT NULL,
	[PlayMode] [tinyint] NOT NULL,
	[ConfigSubStorageItem] [nvarchar](1024) NOT NULL,
	[CurSubStorageItem] [nvarchar](1024) NOT NULL,
	[ConfigSysStorage] [bigint] NOT NULL,
	[ConfigPlayerStorage] [bigint] NOT NULL,
	[ConfigParameterK] [bigint] NOT NULL,
	[CurResetCount] [bigint] NOT NULL,
 CONSTRAINT [PK_IMGroupShareStorageProperty_1] PRIMARY KEY CLUSTERED 
(
	[GroupID] ASC,
	[KindID] ASC,
	[PlayMode] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'大联盟GroupID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IMGroupShareStorageProperty', @level2type=N'COLUMN',@level2name=N'GroupID'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'游戏KINDID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IMGroupShareStorageProperty', @level2type=N'COLUMN',@level2name=N'KindID'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0 积分场 1 金币场' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IMGroupShareStorageProperty', @level2type=N'COLUMN',@level2name=N'PlayMode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'配置库存子项' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IMGroupShareStorageProperty', @level2type=N'COLUMN',@level2name=N'ConfigSubStorageItem'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'当前库存子项' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IMGroupShareStorageProperty', @level2type=N'COLUMN',@level2name=N'CurSubStorageItem'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'配置系统库存' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IMGroupShareStorageProperty', @level2type=N'COLUMN',@level2name=N'ConfigSysStorage'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'配置玩家库存' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IMGroupShareStorageProperty', @level2type=N'COLUMN',@level2name=N'ConfigPlayerStorage'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'配置调节系数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IMGroupShareStorageProperty', @level2type=N'COLUMN',@level2name=N'ConfigParameterK'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'当前库存重置次数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IMGroupShareStorageProperty', @level2type=N'COLUMN',@level2name=N'CurResetCount'
GO

ALTER TABLE [dbo].[IMGroupShareStorageProperty]  WITH CHECK ADD  CONSTRAINT [FK_IMGroupShareStorageProperty_IMGroupProperty] FOREIGN KEY([GroupID])
REFERENCES [dbo].[IMGroupProperty] ([GroupID])
GO

ALTER TABLE [dbo].[IMGroupShareStorageProperty] CHECK CONSTRAINT [FK_IMGroupShareStorageProperty_IMGroupProperty]
GO

ALTER TABLE [dbo].[IMGroupShareStorageProperty] ADD  CONSTRAINT [DF_IMGroupShareStorageProperty_ShareStorageRule]  DEFAULT ('') FOR [ConfigSubStorageItem]
GO

ALTER TABLE [dbo].[IMGroupShareStorageProperty] ADD  CONSTRAINT [DF_IMGroupShareStorageProperty_CurSubStorageItem]  DEFAULT ('') FOR [CurSubStorageItem]
GO

ALTER TABLE [dbo].[IMGroupShareStorageProperty] ADD  CONSTRAINT [DF_IMGroupShareStorageProperty_ConfigSysStorage]  DEFAULT ((0)) FOR [ConfigSysStorage]
GO

ALTER TABLE [dbo].[IMGroupShareStorageProperty] ADD  CONSTRAINT [DF_IMGroupShareStorageProperty_ConfigPlayerStorage]  DEFAULT ((0)) FOR [ConfigPlayerStorage]
GO

ALTER TABLE [dbo].[IMGroupShareStorageProperty] ADD  CONSTRAINT [DF_IMGroupShareStorageProperty_ConfigParameterK]  DEFAULT ((0)) FOR [ConfigParameterK]
GO

ALTER TABLE [dbo].[IMGroupShareStorageProperty] ADD  CONSTRAINT [DF_IMGroupShareStorageProperty_CurResetCount]  DEFAULT ((0)) FOR [CurResetCount]
GO

GO
/****** Object:  Table [dbo].[IMUserGroupInfo]    Script Date: 2018/3/15 11:33:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IMUserGroupInfo](
	[UserID] [int] NOT NULL,
	[GroupIDArray] [nvarchar](512) NOT NULL,
 CONSTRAINT [PK_IMUserGroupInfo] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[StreamGroupBalance](
	[GroupID] [bigint] NOT NULL,
	[UserID] [int] NOT NULL,
	[BattleCount] [int] NOT NULL,
	[BalanceCount] [int] NOT NULL,
	[CollectDate] [datetime] NOT NULL,
 CONSTRAINT [PK_IMGroupBalance] PRIMARY KEY CLUSTERED 
(
	[GroupID] ASC,
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[RecordGroupIngotChange](
	[RecordID] [int] IDENTITY(1,1) NOT NULL,
	[GroupID] [bigint] NOT NULL,
	[BeforeIngot] [bigint] NOT NULL,
	[TradeType] [tinyint] NOT NULL,
	[TradeIngot] [bigint] NOT NULL,
	[TradeRoomGUID] [nvarchar](31) NOT NULL,
	[CollectDate] [datetime] NOT NULL,
 CONSTRAINT [PK_RecordGroupIngotChange] PRIMARY KEY CLUSTERED 
(
	[RecordID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[RecordGroupScorePresent](
	[RecordID] [int] IDENTITY(1,1) NOT NULL,
	[GroupID] [bigint] NOT NULL,
	[PresentUserID] [int] NOT NULL,
	[PresentGameID] [int] NOT NULL,
	[PresentNickName] [nvarchar](31) NOT NULL,
	[ReceiveUserID] [int] NOT NULL,
	[ReceiveGameID] [int] NOT NULL,
	[ReceiveNickName] [nvarchar](31) NOT NULL,
	[CurScore] [bigint] NOT NULL,
	[ChangeType] [tinyint] NOT NULL,
	[ChangeScore] [bigint] NOT NULL,
	[CollectDate] [datetime] NOT NULL,
	[PresentUserRight] [tinyint] NOT NULL
 CONSTRAINT [PK_RecordGroupScorePresent] PRIMARY KEY CLUSTERED 
(
	[RecordID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[RecordUserScoreChange](
	[RecordID] [int] IDENTITY(1,1) NOT NULL,
	[GroupID] [bigint] NOT NULL CONSTRAINT [DF_RecordUserScoreChange_GroupID]  DEFAULT ((0)),
	[UserID] [int] NOT NULL CONSTRAINT [DF_RecordUserScoreChange_PresentUserID]  DEFAULT ((0)),
	[BeforeScore] [bigint] NOT NULL CONSTRAINT [DF_RecordUserScoreChange_BeforeScore]  DEFAULT ((0)),
	[ChangeType] [tinyint] NOT NULL CONSTRAINT [DF_RecordUserScoreChange_ChangeType]  DEFAULT ((0)),
	[ChangeScore] [bigint] NOT NULL CONSTRAINT [DF_RecordUserScoreChange_ChangeScore]  DEFAULT ((0)),
	[AfterScore] [bigint] NOT NULL CONSTRAINT [DF_RecordUserScoreChange_AfterScore]  DEFAULT ((0)),
	[CollectDate] [datetime] NOT NULL CONSTRAINT [DF_RecordUserScoreChange_CollectDate]  DEFAULT (getdate()),
	
 CONSTRAINT [PK_RecordUserScoreChange] PRIMARY KEY CLUSTERED 
(
	[RecordID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

CREATE TABLE [dbo].[RecordGroupScoreChange](
	[RecordID] [int] IDENTITY(1,1) NOT NULL,
	[GroupID] [bigint] NOT NULL CONSTRAINT [DF_RecordGroupScoreChange_GroupID]  DEFAULT ((0)),
	[BeforeScore] [bigint] NOT NULL CONSTRAINT [DF_RecordGroupScoreChange_BeforeScore]  DEFAULT ((0)),
	[ChangeType] [tinyint] NOT NULL CONSTRAINT [DF_RecordGroupScoreChange_ChangeType]  DEFAULT ((0)),
	[ChangeScore] [bigint] NOT NULL CONSTRAINT [DF_RecordGroupScoreChange_ChangeScore]  DEFAULT ((0)),
	[AfterScore] [bigint] NOT NULL CONSTRAINT [DF_RecordGroupScoreChange_AfterScore]  DEFAULT ((0)),
	[CollectDate] [datetime] NOT NULL CONSTRAINT [DF_RecordGroupScoreChange_CollectDate]  DEFAULT (getdate()),
	
 CONSTRAINT [PK_RecordGroupScoreChange] PRIMARY KEY CLUSTERED 
(
	[RecordID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

CREATE TABLE [dbo].[RecordGroupScoreRevenue](
	[RecordID] [int] IDENTITY(1,1) NOT NULL,
	[GroupID] [bigint] NOT NULL,
	[KindName] [nvarchar](32) NOT NULL,
	[Score] [bigint] NOT NULL,
	[Revenue] [bigint] NOT NULL,
	[CollectDate] [datetime] NOT NULL,
 CONSTRAINT [PK_RecordGroupScoreRevenue] PRIMARY KEY CLUSTERED 
(
	[RecordID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[IMGroupConfig](
	[ConfigID] [bigint] IDENTITY(1,1) NOT NULL,
	[GroupID] [bigint] NOT NULL,
	[CreaterID] [bigint] NOT NULL,
	[ConfigName] [nvarchar](12) NOT NULL,
	[KindID] [int] NOT NULL,
	[PlayMode] [tinyint] NOT NULL,
	[CellScore] [bigint] NOT NULL,
	[DrawCountLimit] [bigint] NOT NULL,
	[DrawTimeLimit] [bigint] NOT NULL,
	[JoinCount]  [int] NOT NULL,
	[RoomTax]  [int] NOT NULL,
	[PasswordMode] [tinyint] NOT NULL,
	[PayMode] [tinyint] NOT NULL,
	[GameMode] [tinyint] NOT NULL,
	[JoinMode] [tinyint] NOT NULL,
	[EnterScore] [bigint] NOT NULL,
	[LeaveScore] [bigint] NOT NULL,
	[TaxMode] [tinyint] NOT NULL,
	[TaxCount] [bigint] NOT NULL,
	[LessScoreDismiss] [tinyint] NOT NULL,
	[TimeSecond] [bigint] NOT NULL,
	[GroupPersonalMaxChair] [tinyint] NOT NULL,
	[GameRule] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_IMGroupConfig] PRIMARY KEY CLUSTERED 
(
	[ConfigID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


CREATE TABLE [dbo].[RecordGroupDrawInfo](
	[DrawID] [int] IDENTITY(1,1) NOT NULL,
	[KindID] [int] NOT NULL,
	[ServerID] [int] NOT NULL,
	[GroupID] [int] NOT NULL,
	[RoomID] [int] NOT NULL,
	[TurnIndex] [int] NOT NULL,
	[StartTime] [datetime] NOT NULL,
	[ConcludeTime] [datetime] NOT NULL,
 CONSTRAINT [PK_RecordDrawInfo_DrawID] PRIMARY KEY CLUSTERED 
(
	[DrawID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[RecordGroupDrawScore](
	[DrawID] [int] NOT NULL,
	[RoomID] [bigint] NOT NULL,
	[UserID] [bigint] NOT NULL,
	[UserName] [nvarchar](31) NOT NULL,
	[ChairID] [int] NOT NULL,
	[Score] [bigint] NOT NULL,
	[Revenue] [bigint] NOT NULL,
	[InsertTime] [datetime] NOT NULL,
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[RecordUserDayInfo](
	[DateID]	[int] NOT NULL,
	[GroupID] [bigint] NOT NULL,
	[UserID] [bigint] NOT NULL,
	[UserName] [nvarchar](31) NOT NULL,
	[CurScore] [bigint]	NOT NULL,
	[CreateCount] [int] NOT NULL,
	[DrawCount] [int] NOT NULL,
	[BigWinnerCount] [int] NOT NULL,
	[ScoreCount] [bigint] NOT NULL,
	[RevenueCount] [bigint] NOT NULL,
	[ContributionValue] [bigint] NOT NULL,
	[Flag] [tinyint] NOT NULL,
	[InsertTime] [datetime] NOT NULL,
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[RecordGroupRoomInfo](
	[GroupID] [bigint] NOT NULL,
	[RoomID] [bigint] NOT NULL,
	[PlayMode] [tinyint] NOT NULL,
	[KindID]	[int] NOT NULL,
	[KindName] [nvarchar](31) NOT NULL,
	[DrawCount] [int] NOT NULL,
	[BigWinnerID] [int] NOT NULL,
	[BigWinnerName] [nvarchar](31) NOT NULL,
	[MinTableScore] [bigint] NOT NULL,
	[RoomRevenue] [bigint] NOT NULL,
	[StartTime] [datetime] NOT NULL,
	[EndTime] [datetime] NOT NULL,
	[RoomOver] [tinyint] NOT NULL,
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[RecordBoxScore](
	[RecordID]		[int] IDENTITY(1,1) NOT NULL,
	[GroupID]		[bigint] NOT NULL,
	[UserID]		[bigint] NOT NULL,
	[BeforeScore]	[bigint] NOT NULL,
	[Score]			[bigint] NOT NULL,
	[AfterScore]	[bigint] NOT NULL,
	[CollectTime]	[datetime] NOT NULL,
 CONSTRAINT [PK_RecordBoxScore] PRIMARY KEY CLUSTERED 
(
	[RecordID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IMGroupWhiteList](
	[UserID] [bigint] NOT NULL,
	[InsertTime] [datetime] NOT NULL,
 CONSTRAINT [PK_IMGroupwhiteList_1] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

/****** Object:  Table [dbo].[IMGroupBindIP]    Script Date: 09/10/2019 09:49:20 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[IMGroupBindIP](
	[UserIP] [VARCHAR](50) NOT NULL,
	[GroupID] [INT] NOT NULL,
	[InvitationCode] [BIGINT] NOT NULL,
	[InsertTime] [DATETIME] NOT NULL,
 CONSTRAINT [PK_IMGroupBindIP] PRIMARY KEY CLUSTERED 
(
	[UserIP] ASC,
	[GroupID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


/****** Object:  Table [dbo].[IMGroupInvitationCode]    Script Date: 09/10/2019 09:49:20 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[IMGroupInvitationCode](
	[InvitationCode] [BIGINT] IDENTITY(10000001,1) NOT NULL,
	[GroupID]		[INT] NOT NULL,
	[UserID]		[INT] NOT NULL,
 CONSTRAINT [PK_IMGroupInvitationCode] PRIMARY KEY CLUSTERED 
(
	[GroupID] ASC,
	[UserID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


/****** Object:  Index [IX_IMGroupApplyRecord_ApplyerID]    Script Date: 2018/3/15 17:23:05 ******/
CREATE NONCLUSTERED INDEX [IX_IMGroupApplyRecord_ApplyerID] ON [dbo].[IMGroupApplyRecord]
(
	[ApplyerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_IMGroupApplyRecord_CreaterID]    Script Date: 2018/3/15 17:23:05 ******/
CREATE NONCLUSTERED INDEX [IX_IMGroupApplyRecord_CreaterID] ON [dbo].[IMGroupApplyRecord]
(
	[CreaterID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_IMGroupApplyRecord_GroupID]    Script Date: 2018/3/15 17:23:05 ******/
CREATE NONCLUSTERED INDEX [IX_IMGroupApplyRecord_GroupID] ON [dbo].[IMGroupApplyRecord]
(
	[GroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_IMGroupApplyRecord_ViewMask]    Script Date: 2018/3/15 17:23:05 ******/
CREATE NONCLUSTERED INDEX [IX_IMGroupApplyRecord_ViewMask] ON [dbo].[IMGroupApplyRecord]
(
	[DeleteMask] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_IMGroupProperty_CreaterID]    Script Date: 2018/3/15 17:23:05 ******/
CREATE NONCLUSTERED INDEX [IX_IMGroupProperty_CreaterID] ON [dbo].[IMGroupProperty]
(
	[CreaterID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_IMGroupProperty_GroupName]    Script Date: 2018/3/15 17:23:05 ******/
/*
CREATE UNIQUE NONCLUSTERED INDEX [IX_IMGroupProperty_GroupName] ON [dbo].[IMGroupProperty]
(
	[GroupName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO*/

ALTER TABLE [dbo].[IMGroupApplyRecord] ADD  CONSTRAINT [DF_IMGroupApplyRecord_ApplyerNickName]  DEFAULT ('') FOR [ApplyerNickName]
GO
ALTER TABLE [dbo].[IMGroupApplyRecord] ADD  CONSTRAINT [DF_IMGroupApplyRecord_ApplyType]  DEFAULT ((0)) FOR [ApplyType]
GO
ALTER TABLE [dbo].[IMGroupApplyRecord] ADD  CONSTRAINT [DF_IMGroupApplyRecord_ViewMask]  DEFAULT ((0)) FOR [DeleteMask]
GO
ALTER TABLE [dbo].[IMGroupApplyRecord] ADD  CONSTRAINT [DF_IMGroupApplyRecord_Remarks]  DEFAULT ('') FOR [Remarks]
GO
ALTER TABLE [dbo].[IMGroupApplyRecord] ADD  CONSTRAINT [DF_IMGroupApplyRecord_CollectDateTime]  DEFAULT (getdate()) FOR [CollectDateTime]
GO
ALTER TABLE [dbo].[IMGroupApplyRecord] add CONSTRAINT [DF_IMGroupApplyRecord_OperatorID] DEFAULT 0 FOR [OperatorID]
GO
ALTER TABLE [dbo].[IMGroupApplyRecord] add  CONSTRAINT [DF_IMGroupApplyRecord_OperatorName] default ('') FOR [OperatorName]
GO
ALTER TABLE [dbo].[IMGroupApplyRecord] add  CONSTRAINT [DF_IMGroupApplyRecord_InvitationCode] default (0) FOR [InvitationCode]
GO

ALTER TABLE [dbo].[IMGroupBattleRule] ADD  CONSTRAINT [DF_IMGroupRule_PayType]  DEFAULT ((0)) FOR [PayType]
GO
ALTER TABLE [dbo].[IMGroupBattleRule] ADD  CONSTRAINT [DF_IMGroupBattleRule_BattleMask]  DEFAULT ((0)) FOR [BattleMask]
GO
ALTER TABLE [dbo].[IMGroupBattleRule] ADD  CONSTRAINT [DF_IMGroupBattleRule_ManagerRight]  DEFAULT ((14)) FOR [ManagerRight]
GO
ALTER TABLE [dbo].[IMGroupBattleRule] ADD  CONSTRAINT [DF_IMGroupBattleRule_CaptainRight]  DEFAULT ((28)) FOR [CaptainRight]
GO
ALTER TABLE [dbo].[IMGroupBattleRule] ADD  CONSTRAINT [DF_IMGroupBattleRule_InMode]  DEFAULT ((1)) FOR [InMode]
GO
ALTER TABLE [dbo].[IMGroupBattleRule] ADD  CONSTRAINT [DF_IMGroupBattleRule_OutMode]  DEFAULT ((1)) FOR [OutMode]
GO
ALTER TABLE [dbo].[IMGroupBattleRule] ADD  CONSTRAINT [DF_IMGroupBattleRule_MedalMode]  DEFAULT ((0)) FOR [MedalMode]
GO
ALTER TABLE [dbo].[IMGroupBattleRule] ADD  CONSTRAINT [DF_IMGroupBattleRule_FreeTableLimit]  DEFAULT ((5)) FOR [FreeTableLimit]
GO
ALTER TABLE [dbo].[IMGroupBattleRule] ADD  CONSTRAINT [DF_IMGroupBattleRule_BigWinnerShow]  DEFAULT ((0)) FOR [BigWinnerShow]
GO
ALTER TABLE [dbo].[IMGroupBattleRule] ADD  CONSTRAINT [DF_IMGroupBattleRule_MedalShow]  DEFAULT ((1)) FOR [MedalShow]
GO
ALTER TABLE [dbo].[IMGroupBattleRule] ADD  CONSTRAINT [DF_IMGroupBattleRule_CurMedalShow]  DEFAULT ((1)) FOR [CurMedalShow]
GO
ALTER TABLE [dbo].[IMGroupBattleRule] ADD  CONSTRAINT [DF_IMGroupBattleBattleRule_MedalRevenueShow]  DEFAULT ((1)) FOR [MedalRevenueShow]
GO
ALTER TABLE [dbo].[IMGroupBattleRule] ADD  CONSTRAINT [DF_IMGroupBattleRule_MedalClear]  DEFAULT ((0)) FOR [MedalClear]
GO
ALTER TABLE [dbo].[IMGroupBattleRule] ADD  CONSTRAINT [DF_IMGroupBattleRule_GroupIDShow]  DEFAULT ((1)) FOR [GroupIDShow]
GO

ALTER TABLE [dbo].[IMGroupMember] ADD  CONSTRAINT [DF_IMGroupMember_BattleCount]  DEFAULT ((0)) FOR [BattleCount]
GO
ALTER TABLE [dbo].[IMGroupMember] ADD  CONSTRAINT [DF_IMGroupMember_Score]  DEFAULT ((0)) FOR [Score]
GO
ALTER TABLE [dbo].[IMGroupMember] ADD  CONSTRAINT [DF_IMGroupMember_MemberRight]  DEFAULT ((0)) FOR [MemberRight]
GO
ALTER TABLE [dbo].[IMGroupMember] ADD  CONSTRAINT [DF_IMGroupMember_CaptainID]  DEFAULT ((0)) FOR [CaptainID]
GO
ALTER TABLE [dbo].[IMGroupMember] ADD  CONSTRAINT [DF_IMGroupMember_FavoriteConfig]  DEFAULT ((0)) FOR [FavoriteConfig]
GO
ALTER TABLE [dbo].[IMGroupMember] ADD  CONSTRAINT [DF_IMGroupMember_ManagerRightFlag]  DEFAULT ((0)) FOR [ManagerRightFlag]
GO
ALTER TABLE [dbo].[IMGroupMember] ADD  CONSTRAINT [DF_IMGroupMember_MemberManagerRight]  DEFAULT ((0)) FOR [MemberManagerRight]
GO
ALTER TABLE [dbo].[IMGroupMember] ADD  CONSTRAINT [DF_IMGroupMember_AwardPoint]  DEFAULT ((0)) FOR [AwardPoint]
GO
ALTER TABLE [dbo].[IMGroupMember] ADD  CONSTRAINT [DF_IMGroupMember_AwardScore]  DEFAULT ((0)) FOR [AwardScore]
GO
ALTER TABLE [dbo].[IMGroupMember] ADD  CONSTRAINT [DF__IMGroupMember_JoinDateTime]  DEFAULT (getdate()) FOR [JoinDateTime]
GO
ALTER TABLE [dbo].[IMGroupMember] ADD  CONSTRAINT [DF_IMGroupMember_UserStatus]  DEFAULT ((0)) FOR [UserStatus]
GO
ALTER TABLE [dbo].[IMGroupMember] ADD  CONSTRAINT [DF_IMGroupMember_OnlineTimeCount]  DEFAULT ((0)) FOR [OnlineTimeCount]
GO
ALTER TABLE [dbo].[IMGroupMember] ADD  CONSTRAINT [DF_IMGroupMember_EnterTime]  DEFAULT (getdate()) FOR [EnterTime]
GO
ALTER TABLE [dbo].[IMGroupMember] ADD  CONSTRAINT [DF_IMGroupMember_LeaveTime]  DEFAULT (getdate()) FOR [LeaveTime]
GO

ALTER TABLE [dbo].[IMGroupMember] ADD  CONSTRAINT [DF_IMGroupMember_QQ]  DEFAULT (N'') FOR [QQ]
GO
ALTER TABLE [dbo].[IMGroupMember] ADD  CONSTRAINT [DF_IMGroupMember_WX]  DEFAULT (N'') FOR [WX]
GO
ALTER TABLE [dbo].[IMGroupMember] ADD  CONSTRAINT [DF_IMGroupMember_Phone]  DEFAULT (N'') FOR [Phone]
GO

ALTER TABLE [dbo].[IMGroupProperty] ADD  CONSTRAINT [DF_IMGroupProperty_CreaterNickName]  DEFAULT ('') FOR [CreaterNickName]
GO
ALTER TABLE [dbo].[IMGroupProperty] ADD  CONSTRAINT [DF_IMGroupProperty_GroupLevel]  DEFAULT ((0)) FOR [GroupLevel]
GO
ALTER TABLE [dbo].[IMGroupProperty] ADD  CONSTRAINT [DF_IMGroupProperty_GroupStatus]  DEFAULT ((1)) FOR [GroupStatus]
GO
ALTER TABLE [dbo].[IMGroupProperty] ADD  CONSTRAINT [DF_IMGroupProperty_GroupIntroduce]  DEFAULT ('') FOR [GroupIntroduce]
GO
ALTER TABLE [dbo].[IMGroupProperty] ADD  CONSTRAINT [DF_IMGroupProperty_MemberCount]  DEFAULT ((0)) FOR [MemberCount]
GO
ALTER TABLE [dbo].[IMGroupProperty] ADD  CONSTRAINT [DF_IMGroupProperty_MaxMemberCount]  DEFAULT ((0)) FOR [MaxMemberCount]
GO
ALTER TABLE [dbo].[IMGroupProperty] ADD  CONSTRAINT [DF_IMGroupProperty_CanUseMedal]  DEFAULT ((0)) FOR [CanUseMedal]
GO
ALTER TABLE [dbo].[IMGroupProperty] ADD  CONSTRAINT [DF_IMGroupProperty_CreateDateTime]  DEFAULT (getdate()) FOR [CreateDateTime]
GO

ALTER TABLE [dbo].[IMUserGroupInfo] ADD  CONSTRAINT [DF_IMUserGroupInfo_GroupIDArray]  DEFAULT (N';') FOR [GroupIDArray]
GO

ALTER TABLE [dbo].[StreamGroupBalance] ADD  CONSTRAINT [DF_IMGroupBalance_GroupID]  DEFAULT ((0)) FOR [GroupID]
GO
ALTER TABLE [dbo].[StreamGroupBalance] ADD  CONSTRAINT [DF_IMGroupBalance_UserID]  DEFAULT ((0)) FOR [UserID]
GO
ALTER TABLE [dbo].[StreamGroupBalance] ADD  CONSTRAINT [DF_IMGroupBalance_BattleCount]  DEFAULT ((0)) FOR [BattleCount]
GO
ALTER TABLE [dbo].[StreamGroupBalance] ADD  CONSTRAINT [DF_IMGroupBalance_BalanceCount]  DEFAULT ((0)) FOR [BalanceCount]
GO
ALTER TABLE [dbo].[StreamGroupBalance] ADD  CONSTRAINT [DF_IMGroupBalance_CollectDate]  DEFAULT (getdate()) FOR [CollectDate]
GO

ALTER TABLE [dbo].[RecordGroupIngotChange] ADD  CONSTRAINT [DF_RecordGroupIngotChange_GroupID]  DEFAULT ((0)) FOR [GroupID]
GO
ALTER TABLE [dbo].[RecordGroupIngotChange] ADD  CONSTRAINT [DF_RecordGroupIngotChange_BeforeIngot]  DEFAULT ((0)) FOR [BeforeIngot]
GO
ALTER TABLE [dbo].[RecordGroupIngotChange] ADD  CONSTRAINT [DF_RecordGroupIngotChange_TradeType]  DEFAULT ((0)) FOR [TradeType]
GO
ALTER TABLE [dbo].[RecordGroupIngotChange] ADD  CONSTRAINT [DF_RecordGroupIngotChange_TradeIngot]  DEFAULT ((0)) FOR [TradeIngot]
GO
ALTER TABLE [dbo].[RecordGroupIngotChange] ADD  CONSTRAINT [DF_RecordGroupIngotChange_TradeRoomGUID]  DEFAULT (N'0') FOR [TradeRoomGUID]
GO
ALTER TABLE [dbo].[RecordGroupIngotChange] ADD  CONSTRAINT [DF_RecordGroupIngotChange_CollectDate]  DEFAULT (getdate()) FOR [CollectDate]
GO

ALTER TABLE [dbo].[IMGroupWealth] ADD  CONSTRAINT [DF_IMGroupWealth_GroupID]  DEFAULT ((0)) FOR [GroupID]
GO
ALTER TABLE [dbo].[IMGroupWealth] ADD  CONSTRAINT [DF_IMGroupWealth_Ingot]  DEFAULT ((0)) FOR [Ingot]
GO
ALTER TABLE [dbo].[IMGroupWealth] ADD  CONSTRAINT [DF_IMGroupWealth_ConsumeIngot]  DEFAULT ((0)) FOR [ConsumeIngot]
GO
ALTER TABLE [dbo].[IMGroupWealth] ADD  CONSTRAINT [DF_IMGroupWealth_Score]  DEFAULT ((0)) FOR [Score]
GO
ALTER TABLE [dbo].[IMGroupWealth] ADD  CONSTRAINT [DF_IMGroupWealth_BattleCreate]  DEFAULT ((0)) FOR [BattleCreate]
GO

ALTER TABLE [dbo].[IMGroupOption] ADD  CONSTRAINT [DF_IMGroupOption_OptionName]  DEFAULT (N'') FOR [OptionName]
GO
ALTER TABLE [dbo].[IMGroupOption] ADD  CONSTRAINT [DF_IMGroupOption_OptionValue]  DEFAULT ((0)) FOR [OptionValue]
GO
ALTER TABLE [dbo].[IMGroupOption] ADD  CONSTRAINT [DF_IMGroupOption_OptionDescribe]  DEFAULT (N'') FOR [OptionDescribe]
GO
ALTER TABLE [dbo].[IMGroupOption] ADD  CONSTRAINT [DF_IMGroupOption_OptionTip]  DEFAULT (N'') FOR [OptionTip]
GO
ALTER TABLE [dbo].[IMGroupOption] ADD  CONSTRAINT [DF_IMGroupOption_SortID]  DEFAULT ((0)) FOR [SortID]
GO

ALTER TABLE [dbo].[RecordGroupScorePresent] ADD  CONSTRAINT [DF_RecordGroupScorePresent_GroupID]  DEFAULT ((0)) FOR [GroupID]
GO
ALTER TABLE [dbo].[RecordGroupScorePresent] ADD  CONSTRAINT [DF_RecordGroupScorePresent_PresentUserID]  DEFAULT ((0)) FOR [PresentUserID]
GO
ALTER TABLE [dbo].[RecordGroupScorePresent] ADD  CONSTRAINT [DF_RecordGroupScorePresent_PresentGameID]  DEFAULT ((0)) FOR [PresentGameID]
GO
ALTER TABLE [dbo].[RecordGroupScorePresent] ADD  CONSTRAINT [DF_RecordGroupScorePresent_PresentNickName]  DEFAULT ('') FOR [PresentNickName]
GO
ALTER TABLE [dbo].[RecordGroupScorePresent] ADD  CONSTRAINT [DF_RecordGroupScorePresent_ReceiveUserID]  DEFAULT ((0)) FOR [ReceiveUserID]
GO
ALTER TABLE [dbo].[RecordGroupScorePresent] ADD  CONSTRAINT [DF_RecordGroupScorePresent_ReceiveGameID]  DEFAULT ((0)) FOR [ReceiveGameID]
GO
ALTER TABLE [dbo].[RecordGroupScorePresent] ADD  CONSTRAINT [DF_RecordGroupScorePresent_ReceiveNickName]  DEFAULT ('') FOR [ReceiveNickName]
GO
ALTER TABLE [dbo].[RecordGroupScorePresent] ADD  CONSTRAINT [DF_RecordGroupScorePresent_CurScore]  DEFAULT ((0)) FOR [CurScore]
GO
ALTER TABLE [dbo].[RecordGroupScorePresent] ADD  CONSTRAINT [DF_RecordGroupScorePresent_ChangeType]  DEFAULT ((0)) FOR [ChangeType]
GO
ALTER TABLE [dbo].[RecordGroupScorePresent] ADD  CONSTRAINT [DF_RecordGroupScorePresent_ChangeScore]  DEFAULT (0) FOR [ChangeScore]
GO
ALTER TABLE [dbo].[RecordGroupScorePresent] ADD  CONSTRAINT [DF_RecordGroupScorePresent_CollectDate]  DEFAULT (getdate()) FOR [CollectDate]
GO

ALTER TABLE [dbo].[RecordGroupScoreRevenue] ADD  CONSTRAINT [DF_RecordGroupScoreRevenue_GroupID]  DEFAULT ((0)) FOR [GroupID]
GO
ALTER TABLE [dbo].[RecordGroupScoreRevenue] ADD  CONSTRAINT [DF_RecordGroupScoreRevenue_KindName]  DEFAULT ('') FOR [KindName]
GO
ALTER TABLE [dbo].[RecordGroupScoreRevenue] ADD  CONSTRAINT [DF_RecordGroupScoreRevenue_Score]  DEFAULT (0) FOR [Score]
GO
ALTER TABLE [dbo].[RecordGroupScoreRevenue] ADD  CONSTRAINT [DF_RecordGroupScoreRevenue_Revenue]  DEFAULT (0) FOR [Revenue]
GO
ALTER TABLE [dbo].[RecordGroupScoreRevenue] ADD  CONSTRAINT [DF_RecordGroupScoreRevenue_CollectDate]  DEFAULT (getdate()) FOR [CollectDate]
GO

ALTER TABLE [dbo].[IMGroupwhiteList] ADD  CONSTRAINT [DF_IMGroupwhiteList_InsertTime]  DEFAULT (getdate()) FOR [InsertTime]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'大联盟ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IMGroupApplyRecord', @level2type=N'COLUMN',@level2name=N'GroupID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'申请者标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IMGroupApplyRecord', @level2type=N'COLUMN',@level2name=N'ApplyerID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'申请者游戏标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IMGroupApplyRecord', @level2type=N'COLUMN',@level2name=N'ApplyerGameID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'头像标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IMGroupApplyRecord', @level2type=N'COLUMN',@level2name=N'ApplyerCustomID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'申请者昵称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IMGroupApplyRecord', @level2type=N'COLUMN',@level2name=N'ApplyerNickName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'申请类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IMGroupApplyRecord', @level2type=N'COLUMN',@level2name=N'ApplyType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'申请状态（0：等待审核 1：同意 2：拒绝 3: 撤销）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IMGroupApplyRecord', @level2type=N'COLUMN',@level2name=N'ApplyStatus'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建者标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IMGroupApplyRecord', @level2type=N'COLUMN',@level2name=N'CreaterID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'大联盟名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IMGroupApplyRecord', @level2type=N'COLUMN',@level2name=N'GroupName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'删除掩码（0：未删除 1：申请者删除 2：馆主删除）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IMGroupApplyRecord', @level2type=N'COLUMN',@level2name=N'DeleteMask'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注信息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IMGroupApplyRecord', @level2type=N'COLUMN',@level2name=N'Remarks'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'邀请码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IMGroupApplyRecord', @level2type=N'COLUMN',@level2name=N'InvitationCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'审批者ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IMGroupApplyRecord', @level2type=N'COLUMN',@level2name=N'OperatorID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'审批者昵称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IMGroupApplyRecord', @level2type=N'COLUMN',@level2name=N'OperatorName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'大联盟ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IMGroupBattleRule', @level2type=N'COLUMN',@level2name=N'GroupID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'支付类型（0x01：盟主支付 0x02：玩家支付）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IMGroupBattleRule', @level2type=N'COLUMN',@level2name=N'PayType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'货币类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IMGroupBattleRule', @level2type=N'COLUMN',@level2name=N'CurrencyKind'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'约战掩码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IMGroupBattleRule', @level2type=N'COLUMN',@level2name=N'BattleMask'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'管理员权限' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IMGroupBattleRule', @level2type=N'COLUMN',@level2name=N'ManagerRight'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'队长权限' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IMGroupBattleRule', @level2type=N'COLUMN',@level2name=N'CaptainRight'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'加入模式（0不用审核，1审核）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IMGroupBattleRule', @level2type=N'COLUMN',@level2name=N'InMode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'退出模式（0不用审核，1审核）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IMGroupBattleRule', @level2type=N'COLUMN',@level2name=N'OutMode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'空桌限制' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IMGroupBattleRule', @level2type=N'COLUMN',@level2name=N'FreeTableLimit'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'大赢家显示' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IMGroupBattleRule', @level2type=N'COLUMN',@level2name=N'BigWinnerShow'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'勋章模式（0关闭，1开启）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IMGroupBattleRule', @level2type=N'COLUMN',@level2name=N'MedalMode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'勋章栏显示' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IMGroupBattleRule', @level2type=N'COLUMN',@level2name=N'MedalShow'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'当前勋章显示' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IMGroupBattleRule', @level2type=N'COLUMN',@level2name=N'CurMedalShow'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'勋章贡献显示' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IMGroupBattleRule', @level2type=N'COLUMN',@level2name=N'MedalRevenueShow'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'勋章清零（0不清零，1五点清零）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IMGroupBattleRule', @level2type=N'COLUMN',@level2name=N'MedalClear'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'大联盟ID显示（0不显示，1显示）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IMGroupBattleRule', @level2type=N'COLUMN',@level2name=N'GroupIDShow'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'大联盟ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IMGroupMember', @level2type=N'COLUMN',@level2name=N'GroupID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'成员标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IMGroupMember', @level2type=N'COLUMN',@level2name=N'UserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'成员勋章' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IMGroupMember', @level2type=N'COLUMN',@level2name=N'Score'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'成员权限' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IMGroupMember', @level2type=N'COLUMN',@level2name=N'MemberRight'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'队长ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IMGroupMember', @level2type=N'COLUMN',@level2name=N'CaptainID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'收藏玩法' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IMGroupMember', @level2type=N'COLUMN',@level2name=N'FavoriteConfig'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'权限开关' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IMGroupMember', @level2type=N'COLUMN',@level2name=N'ManagerRightFlag'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'独立权限' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IMGroupMember', @level2type=N'COLUMN',@level2name=N'MemberManagerRight'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'点位' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IMGroupMember', @level2type=N'COLUMN',@level2name=N'AwardPoint'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'奖励分' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IMGroupMember', @level2type=N'COLUMN',@level2name=N'AwardScore'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'加入时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IMGroupMember', @level2type=N'COLUMN',@level2name=N'JoinDateTime'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'属性名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IMGroupOption', @level2type=N'COLUMN',@level2name=N'OptionName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'属性值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IMGroupOption', @level2type=N'COLUMN',@level2name=N'OptionValue'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'属性描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IMGroupOption', @level2type=N'COLUMN',@level2name=N'OptionDescribe'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'属性描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IMGroupOption', @level2type=N'COLUMN',@level2name=N'OptionTip'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排列索引' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IMGroupOption', @level2type=N'COLUMN',@level2name=N'SortID'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'大联盟ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IMGroupProperty', @level2type=N'COLUMN',@level2name=N'GroupID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'游戏标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IMGroupProperty', @level2type=N'COLUMN',@level2name=N'CreaterGameID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'盟主昵称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IMGroupProperty', @level2type=N'COLUMN',@level2name=N'CreaterNickName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'大联盟名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IMGroupProperty', @level2type=N'COLUMN',@level2name=N'GroupName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'大联盟级别' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IMGroupProperty', @level2type=N'COLUMN',@level2name=N'GroupLevel'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'大联盟状态（1：可用 2：不可用）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IMGroupProperty', @level2type=N'COLUMN',@level2name=N'GroupStatus'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'大联盟公告' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IMGroupProperty', @level2type=N'COLUMN',@level2name=N'GroupIntroduce'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'成员数量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IMGroupProperty', @level2type=N'COLUMN',@level2name=N'MemberCount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最大成员数量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IMGroupProperty', @level2type=N'COLUMN',@level2name=N'MaxMemberCount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IMGroupProperty', @level2type=N'COLUMN',@level2name=N'CreateDateTime'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'大联盟ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IMGroupWealth', @level2type=N'COLUMN',@level2name=N'GroupID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'大联盟钻石' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IMGroupWealth', @level2type=N'COLUMN',@level2name=N'Ingot'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'钻石创建消耗' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IMGroupWealth', @level2type=N'COLUMN',@level2name=N'ConsumeIngot'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'房间创建数目' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IMGroupWealth', @level2type=N'COLUMN',@level2name=N'BattleCreate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'大联盟勋章' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IMGroupWealth', @level2type=N'COLUMN',@level2name=N'Score'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'成员标志' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IMUserGroupInfo', @level2type=N'COLUMN',@level2name=N'UserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'成员加入' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IMUserGroupInfo', @level2type=N'COLUMN',@level2name=N'GroupIDArray'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'大联盟ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StreamGroupBalance', @level2type=N'COLUMN',@level2name=N'GroupID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StreamGroupBalance', @level2type=N'COLUMN',@level2name=N'UserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'约战次数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StreamGroupBalance', @level2type=N'COLUMN',@level2name=N'BattleCount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'结算次数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StreamGroupBalance', @level2type=N'COLUMN',@level2name=N'BalanceCount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StreamGroupBalance', @level2type=N'COLUMN',@level2name=N'CollectDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'大联盟ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGroupIngotChange', @level2type=N'COLUMN',@level2name=N'GroupID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'变化前钻石' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGroupIngotChange', @level2type=N'COLUMN',@level2name=N'BeforeIngot'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'改变类型(1:存 2：取 3：房间消耗 4:解散返回)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGroupIngotChange', @level2type=N'COLUMN',@level2name=N'TradeType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'钻石变化' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGroupIngotChange', @level2type=N'COLUMN',@level2name=N'TradeIngot'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录房间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGroupIngotChange', @level2type=N'COLUMN',@level2name=N'TradeRoomGUID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGroupIngotChange', @level2type=N'COLUMN',@level2name=N'CollectDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'大联盟ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGroupScorePresent', @level2type=N'COLUMN',@level2name=N'GroupID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'赠送玩家ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGroupScorePresent', @level2type=N'COLUMN',@level2name=N'PresentUserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'赠送玩家GameID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGroupScorePresent', @level2type=N'COLUMN',@level2name=N'PresentGameID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'赠送玩家昵称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGroupScorePresent', @level2type=N'COLUMN',@level2name=N'PresentNickName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'接收玩家ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGroupScorePresent', @level2type=N'COLUMN',@level2name=N'ReceiveUserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'接收玩家GameID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGroupScorePresent', @level2type=N'COLUMN',@level2name=N'ReceiveGameID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'接收玩家昵称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGroupScorePresent', @level2type=N'COLUMN',@level2name=N'ReceiveNickName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'当前勋章' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGroupScorePresent', @level2type=N'COLUMN',@level2name=N'CurScore'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'类型(0:赠送 1:消耗)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGroupScorePresent', @level2type=N'COLUMN',@level2name=N'ChangeType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'勋章变化' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGroupScorePresent', @level2type=N'COLUMN',@level2name=N'ChangeScore'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGroupScorePresent', @level2type=N'COLUMN',@level2name=N'CollectDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'大联盟ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGroupScoreChange', @level2type=N'COLUMN',@level2name=N'GroupID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'改变前分数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGroupScoreChange', @level2type=N'COLUMN',@level2name=N'BeforeScore'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'类型(0:发放 1:扣除 2:运营商 3:成员贡献 )' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGroupScoreChange', @level2type=N'COLUMN',@level2name=N'ChangeType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'变化值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGroupScoreChange', @level2type=N'COLUMN',@level2name=N'ChangeScore'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'改变后分数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGroupScoreChange', @level2type=N'COLUMN',@level2name=N'AfterScore'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGroupScoreChange', @level2type=N'COLUMN',@level2name=N'CollectDate'
GO


EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'大联盟ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordUserScoreChange', @level2type=N'COLUMN',@level2name=N'GroupID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'玩家ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordUserScoreChange', @level2type=N'COLUMN',@level2name=N'UserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'改变前分数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordUserScoreChange', @level2type=N'COLUMN',@level2name=N'BeforeScore'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'类型(0:赠送 1:扣除 2:游戏输赢 3:贡献 4:清零)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordUserScoreChange', @level2type=N'COLUMN',@level2name=N'ChangeType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'变化值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordUserScoreChange', @level2type=N'COLUMN',@level2name=N'ChangeScore'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'改变后分数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordUserScoreChange', @level2type=N'COLUMN',@level2name=N'AfterScore'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordUserScoreChange', @level2type=N'COLUMN',@level2name=N'CollectDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'大联盟ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGroupScoreRevenue', @level2type=N'COLUMN',@level2name=N'GroupID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'游戏名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGroupScoreRevenue', @level2type=N'COLUMN',@level2name=N'KindName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGroupScoreRevenue', @level2type=N'COLUMN',@level2name=N'Score'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'消耗' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGroupScoreRevenue', @level2type=N'COLUMN',@level2name=N'Revenue'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGroupScoreRevenue', @level2type=N'COLUMN',@level2name=N'CollectDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IMGroupwhiteList', @level2type=N'COLUMN',@level2name=N'InsertTime'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'玩家IP' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IMGroupBindIP', @level2type=N'COLUMN',@level2name=N'UserIP'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'俱乐部ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IMGroupBindIP', @level2type=N'COLUMN',@level2name=N'GroupID'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'邀请码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IMGroupBindIP', @level2type=N'COLUMN',@level2name=N'InvitationCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'插入时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IMGroupBindIP', @level2type=N'COLUMN',@level2name=N'InsertTime'
GO


EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'邀请码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IMGroupInvitationCode', @level2type=N'COLUMN',@level2name=N'InvitationCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'俱乐部ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IMGroupInvitationCode', @level2type=N'COLUMN',@level2name=N'GroupID'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'玩家ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IMGroupInvitationCode', @level2type=N'COLUMN',@level2name=N'UserID'
GO
																					