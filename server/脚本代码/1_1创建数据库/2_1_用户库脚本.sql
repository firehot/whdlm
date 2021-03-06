USE [WHQJAccountsDB]
GO

/****** Object:  Table [dbo].[AccountsGame]    Script Date: 2018/6/21 14:38:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountsGame](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UniteID] [int] NOT NULL,
	[TypeID] [tinyint] NOT NULL,
	[KindID] [int] NOT NULL,
	[SortID] [int] NOT NULL,
	[CollectDate] [datetime] NOT NULL,
 CONSTRAINT [PK_AccountsGame] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Index [IX_AccountsGame_UniteID]    Script Date: 2018/6/21 14:38:00 ******/
CREATE NONCLUSTERED INDEX [IX_AccountsGame_UniteID] ON [dbo].[AccountsGame]
(
	[UniteID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AccountsGame] ADD  CONSTRAINT [DF_AccountsGame_UGID]  DEFAULT ((0)) FOR [UniteID]
GO
ALTER TABLE [dbo].[AccountsGame] ADD  CONSTRAINT [DF_AccountsGame_TypeID]  DEFAULT ((0)) FOR [TypeID]
GO
ALTER TABLE [dbo].[AccountsGame] ADD  CONSTRAINT [DF_AccountsGame_KindID]  DEFAULT ((0)) FOR [KindID]
GO
ALTER TABLE [dbo].[AccountsGame] ADD  CONSTRAINT [DF_AccountsGame_SortID]  DEFAULT ((0)) FOR [SortID]
GO
ALTER TABLE [dbo].[AccountsGame] ADD  CONSTRAINT [DF_AccountsGame_CollectDate]  DEFAULT (getdate()) FOR [CollectDate]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccountsGame', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户或代理标识（TypeID为1表示玩家标识，为2表示代理标识）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccountsGame', @level2type=N'COLUMN',@level2name=N'UniteID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'身份类型（0 通用  1 玩家  2 代理）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccountsGame', @level2type=N'COLUMN',@level2name=N'TypeID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'游戏标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccountsGame', @level2type=N'COLUMN',@level2name=N'KindID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccountsGame', @level2type=N'COLUMN',@level2name=N'SortID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccountsGame', @level2type=N'COLUMN',@level2name=N'CollectDate'
GO

/****** Object:  Table [dbo].[AccountsAgentInfo]    Script Date: 2017/7/17 15:56:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountsAgentInfo](
	[AgentID] [int] IDENTITY(1,1) NOT NULL,
	[ParentAgent] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[Password] [nvarchar](32) NOT NULL,
	[Compellation] [nvarchar](16) NOT NULL,
	[QQAccount] [nvarchar](32) NOT NULL,
	[WCNickName] [nvarchar](32) NOT NULL,
	[ContactPhone] [nvarchar](11) NOT NULL,
	[ContactAddress] [nvarchar](50) NOT NULL,
	[AgentDomain] [nvarchar](50) NOT NULL,
	[AgentLevel] [tinyint] NOT NULL,
	[AgentNote] [nvarchar](100) NOT NULL,
	[Nullity] [tinyint] NOT NULL,
	[CollectDate] [datetime] NOT NULL,
 CONSTRAINT [PK_AccountsAgentInfo] PRIMARY KEY CLUSTERED 
(
	[AgentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AccountsAgentInfo] ADD  CONSTRAINT [DF_AccountsAgentInfo_ParentAgent]  DEFAULT ((0)) FOR [ParentAgent]
GO
ALTER TABLE [dbo].[AccountsAgentInfo] ADD  CONSTRAINT [DF_AccountsAgentInfo_UserID]  DEFAULT ((0)) FOR [UserID]
GO
ALTER TABLE [dbo].[AccountsAgentInfo] ADD  CONSTRAINT [DF_AccountsAgentInfo_Password]  DEFAULT ('') FOR [Password]
GO
ALTER TABLE [dbo].[AccountsAgentInfo] ADD  CONSTRAINT [DF_AccountsAgentInfo_Compellation]  DEFAULT ('') FOR [Compellation]
GO
ALTER TABLE [dbo].[AccountsAgentInfo] ADD  CONSTRAINT [DF_AccountsAgentInfo_QQAccount]  DEFAULT ('') FOR [QQAccount]
GO
ALTER TABLE [dbo].[AccountsAgentInfo] ADD  CONSTRAINT [DF_AccountsAgentInfo_WCNickName]  DEFAULT ('') FOR [WCNickName]
GO
ALTER TABLE [dbo].[AccountsAgentInfo] ADD  CONSTRAINT [DF_AccountsAgentInfo_ContactPhone]  DEFAULT ('') FOR [ContactPhone]
GO
ALTER TABLE [dbo].[AccountsAgentInfo] ADD  CONSTRAINT [DF_AccountsAgentInfo_ContactAddress]  DEFAULT ('') FOR [ContactAddress]
GO
ALTER TABLE [dbo].[AccountsAgentInfo] ADD  CONSTRAINT [DF_AccountsAgentInfo_AgentDomain]  DEFAULT ('') FOR [AgentDomain]
GO
ALTER TABLE [dbo].[AccountsAgentInfo] ADD  CONSTRAINT [DF_AccountsAgentInfo_AgentLevel]  DEFAULT ((0)) FOR [AgentLevel]
GO
ALTER TABLE [dbo].[AccountsAgentInfo] ADD  CONSTRAINT [DF_AccountsAgentInfo_AgentNote]  DEFAULT ('') FOR [AgentNote]
GO
ALTER TABLE [dbo].[AccountsAgentInfo] ADD  CONSTRAINT [DF_AccountsAgentInfo_Nullity]  DEFAULT ((0)) FOR [Nullity]
GO
ALTER TABLE [dbo].[AccountsAgentInfo] ADD  CONSTRAINT [DF_AccountsAgentInfo_CollectDate]  DEFAULT (getdate()) FOR [CollectDate]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'代理标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccountsAgentInfo', @level2type=N'COLUMN',@level2name=N'AgentID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'父级代理标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccountsAgentInfo', @level2type=N'COLUMN',@level2name=N'ParentAgent'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccountsAgentInfo', @level2type=N'COLUMN',@level2name=N'UserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'安全密码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccountsAgentInfo', @level2type=N'COLUMN',@level2name=N'Password'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'真实姓名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccountsAgentInfo', @level2type=N'COLUMN',@level2name=N'Compellation'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'QQ账号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccountsAgentInfo', @level2type=N'COLUMN',@level2name=N'QQAccount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'微信昵称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccountsAgentInfo', @level2type=N'COLUMN',@level2name=N'WCNickName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'联系电话' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccountsAgentInfo', @level2type=N'COLUMN',@level2name=N'ContactPhone'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'联系地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccountsAgentInfo', @level2type=N'COLUMN',@level2name=N'ContactAddress'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'代理域名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccountsAgentInfo', @level2type=N'COLUMN',@level2name=N'AgentDomain'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'代理等级' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccountsAgentInfo', @level2type=N'COLUMN',@level2name=N'AgentLevel'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'代理备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccountsAgentInfo', @level2type=N'COLUMN',@level2name=N'AgentNote'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'禁用标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccountsAgentInfo', @level2type=N'COLUMN',@level2name=N'Nullity'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccountsAgentInfo', @level2type=N'COLUMN',@level2name=N'CollectDate'
GO

/****** Object:  Table [dbo].[AccountsUmeng]    Script Date: 2017/7/10 16:35:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountsUmeng](
	[UserID] [int] NOT NULL,
	[GameID] [int] NOT NULL,
	[DeviceType] [tinyint] NOT NULL,
	[DeviceToken] [nvarchar](65) NOT NULL,
	[UpdateTime] [datetime] NOT NULL,
	[UpdateAddress] [nvarchar](15) NOT NULL,
 CONSTRAINT [PK_AccountsUmeng] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AccountsUmeng] ADD  CONSTRAINT [DF_AccountsUmeng_GameID]  DEFAULT ((0)) FOR [GameID]
GO
ALTER TABLE [dbo].[AccountsUmeng] ADD  CONSTRAINT [DF_AccountsUmeng_DeviceType]  DEFAULT ((0)) FOR [DeviceType]
GO
ALTER TABLE [dbo].[AccountsUmeng] ADD  CONSTRAINT [DF_AccountsUmeng_DeviceToken]  DEFAULT ('') FOR [DeviceToken]
GO
ALTER TABLE [dbo].[AccountsUmeng] ADD  CONSTRAINT [DF_AccountsUmeng_UpdateTime]  DEFAULT (getdate()) FOR [UpdateTime]
GO
ALTER TABLE [dbo].[AccountsUmeng] ADD  CONSTRAINT [DF_AccountsUmeng_UpdateAddress]  DEFAULT ('') FOR [UpdateAddress]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'游戏标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccountsUmeng', @level2type=N'COLUMN',@level2name=N'GameID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0 安卓  1 IOS' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccountsUmeng', @level2type=N'COLUMN',@level2name=N'DeviceType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'绑定设备标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccountsUmeng', @level2type=N'COLUMN',@level2name=N'DeviceToken'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccountsUmeng', @level2type=N'COLUMN',@level2name=N'UpdateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccountsUmeng', @level2type=N'COLUMN',@level2name=N'UpdateAddress'
GO

/****** 对象:  Table [dbo].[GameIdentifier]    脚本日期: 03/17/2017 10:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GameIdentifier](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[GameID] [int] NOT NULL,
	[IDLevel] [int] NOT NULL CONSTRAINT [DF_GameIdentifiers_IDLevel]  DEFAULT ((0)),
 CONSTRAINT [PK_GameIdentifier_UserID] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameIdentifier', @level2type=N'COLUMN',@level2name=N'UserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'游戏标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameIdentifier', @level2type=N'COLUMN',@level2name=N'GameID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'标识等级' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameIdentifier', @level2type=N'COLUMN',@level2name=N'IDLevel'
GO
/****** 对象:  Table [dbo].[SystemGrantCount]    脚本日期: 03/17/2017 10:02:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SystemGrantCount](
	[DateID] [int] NOT NULL,
	[RegisterIP] [nchar](15) NOT NULL,
	[RegisterMachine] [nvarchar](32) NOT NULL CONSTRAINT [DF_SystemGrantCount_RegisterMachine]  DEFAULT (N'------------'),
	[GrantScore] [bigint] NOT NULL,
	[GrantCount] [bigint] NOT NULL CONSTRAINT [DF_SystemGrantCount_PresentScoreStat]  DEFAULT ((0)),
	[CollectDate] [datetime] NOT NULL CONSTRAINT [DF_SystemGrantCount_CollectDate]  DEFAULT (getdate()),
 CONSTRAINT [PK_SystemGrantCount] PRIMARY KEY CLUSTERED 
(
	[DateID] ASC,
	[RegisterIP] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'注册地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SystemGrantCount', @level2type=N'COLUMN',@level2name=N'RegisterIP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'注册机器' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SystemGrantCount', @level2type=N'COLUMN',@level2name=N'RegisterMachine'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'赠送金币' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SystemGrantCount', @level2type=N'COLUMN',@level2name=N'GrantScore'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'赠送次数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SystemGrantCount', @level2type=N'COLUMN',@level2name=N'GrantCount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'收集时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SystemGrantCount', @level2type=N'COLUMN',@level2name=N'CollectDate'
GO
/****** 对象:  Table [dbo].[IndividualDatum]    脚本日期: 03/17/2017 10:02:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IndividualDatum](
	[UserID] [int] NOT NULL,
	[QQ] [nvarchar](16) NOT NULL,
	[EMail] [nvarchar](32) NOT NULL,
	[SeatPhone] [nvarchar](32) NOT NULL CONSTRAINT [DF_IndividualDatum_SeatPhone]  DEFAULT (''),
	[MobilePhone] [nvarchar](16) NOT NULL CONSTRAINT [DF_IndividualDatum_MobilePhone]  DEFAULT (''),
	[DwellingPlace] [nvarchar](128) NOT NULL CONSTRAINT [DF_IndividualDatum_DwellingPlace]  DEFAULT (''),
	[PostalCode] [nvarchar](8) NOT NULL CONSTRAINT [DF_IndividualDatum_PostalCode]  DEFAULT (''),
	[CollectDate] [datetime] NOT NULL CONSTRAINT [DF_IndividualDatum_CollectDate]  DEFAULT (getdate()),
	[UserNote] [nvarchar](256) NOT NULL CONSTRAINT [DF_IndividualDatum_UserNote]  DEFAULT (''),
 CONSTRAINT [PK_IndividualDatum_UserID] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IndividualDatum', @level2type=N'COLUMN',@level2name=N'UserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'QQ 号码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IndividualDatum', @level2type=N'COLUMN',@level2name=N'QQ'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'电子邮件' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IndividualDatum', @level2type=N'COLUMN',@level2name=N'EMail'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'固定电话' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IndividualDatum', @level2type=N'COLUMN',@level2name=N'SeatPhone'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'手机号码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IndividualDatum', @level2type=N'COLUMN',@level2name=N'MobilePhone'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'详细住址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IndividualDatum', @level2type=N'COLUMN',@level2name=N'DwellingPlace'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'邮政编码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IndividualDatum', @level2type=N'COLUMN',@level2name=N'PostalCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'收集日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IndividualDatum', @level2type=N'COLUMN',@level2name=N'CollectDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IndividualDatum', @level2type=N'COLUMN',@level2name=N'UserNote'
GO
/****** 对象:  Table [dbo].[RecordMedalChange]    脚本日期: 03/17/2017 10:02:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RecordMedalChange](
	[RecordID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[SrcMedal] [int] NOT NULL CONSTRAINT [DF_Table_1_PreUserMedal]  DEFAULT ((0)),
	[TradeMedal] [int] NOT NULL CONSTRAINT [DF_Table_1_GrantUserMedal]  DEFAULT ((0)),
	[TypeID] [int] NOT NULL,
	[ClientIP] [nvarchar](15) NOT NULL,
	[CollectDate] [datetime] NOT NULL CONSTRAINT [DF_Table_1_GrantDate]  DEFAULT (getdate()),
 CONSTRAINT [PK_RecordMedalChange] PRIMARY KEY CLUSTERED 
(
	[RecordID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1.获取元宝,2:大厅消耗元宝,3:网站元宝,4:退还元宝' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordMedalChange', @level2type=N'COLUMN',@level2name=N'TypeID'
GO
/****** 对象:  Table [dbo].[SystemGrantRoomCardCount]    脚本日期: 03/17/2017 10:02:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SystemGrantRoomCardCount](
	[DateID] [int] NOT NULL,
	[RegisterIP] [nchar](15) NOT NULL,
	[RegisterMachine] [nvarchar](32) NOT NULL,
	[GrantRoomCard] [bigint] NOT NULL,
	[GrantCount] [bigint] NOT NULL,
	[CollectDate] [datetime] NOT NULL CONSTRAINT [DF_SystemGrantRoomCardCount_CollectDate]  DEFAULT (getdate()),
 CONSTRAINT [PK_SystemGrantRoomCardCount] PRIMARY KEY CLUSTERED 
(
	[DateID] ASC,
	[RegisterIP] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'日期标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SystemGrantRoomCardCount', @level2type=N'COLUMN',@level2name=N'DateID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'注册地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SystemGrantRoomCardCount', @level2type=N'COLUMN',@level2name=N'RegisterIP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'注册机器' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SystemGrantRoomCardCount', @level2type=N'COLUMN',@level2name=N'RegisterMachine'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'赠送钻石' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SystemGrantRoomCardCount', @level2type=N'COLUMN',@level2name=N'GrantRoomCard'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'赠送次数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SystemGrantRoomCardCount', @level2type=N'COLUMN',@level2name=N'GrantCount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'赠送时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SystemGrantRoomCardCount', @level2type=N'COLUMN',@level2name=N'CollectDate'
GO
/****** 对象:  Table [dbo].[AccountsRelation]    脚本日期: 03/17/2017 10:02:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountsRelation](
	[MainUserID] [int] NOT NULL,
	[SubUserID] [int] NOT NULL,
	[GroupID] [smallint] NOT NULL,
 CONSTRAINT [PK_AccountsRelation] PRIMARY KEY CLUSTERED 
(
	[MainUserID] ASC,
	[SubUserID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主用户标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccountsRelation', @level2type=N'COLUMN',@level2name=N'MainUserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'从属用户标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccountsRelation', @level2type=N'COLUMN',@level2name=N'SubUserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主用户组别' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccountsRelation', @level2type=N'COLUMN',@level2name=N'GroupID'
GO
/****** 对象:  Table [dbo].[AccountsGroup]    脚本日期: 03/17/2017 10:02:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountsGroup](
	[UserID] [int] NOT NULL,
	[GroupID] [smallint] NOT NULL,
	[GroupName] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_AccountsGroup] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC,
	[GroupID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccountsGroup', @level2type=N'COLUMN',@level2name=N'UserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'组别编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccountsGroup', @level2type=N'COLUMN',@level2name=N'GroupID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'组别名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccountsGroup', @level2type=N'COLUMN',@level2name=N'GroupName'
GO
/****** 对象:  Table [dbo].[OfflineMessage]    脚本日期: 03/17/2017 10:02:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OfflineMessage](
	[UserID] [int] NOT NULL,
	[MessageType] [smallint] NOT NULL,
	[OfflineData] [varchar](2400) NOT NULL,
	[DataSize] [int] NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OfflineMessage', @level2type=N'COLUMN',@level2name=N'UserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'组别编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OfflineMessage', @level2type=N'COLUMN',@level2name=N'MessageType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'组别名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OfflineMessage', @level2type=N'COLUMN',@level2name=N'OfflineData'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'组别名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OfflineMessage', @level2type=N'COLUMN',@level2name=N'DataSize'
GO
/****** 对象:  Table [dbo].[AccountsAgent]    脚本日期: 03/17/2017 10:01:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountsAgent](
	[AgentID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[Compellation] [nvarchar](16) NOT NULL,
	[Domain] [nvarchar](50) NOT NULL CONSTRAINT [DF_AccountsAgent_Domain]  DEFAULT (''),
	[AgentType] [int] NOT NULL,
	[AgentScale] [decimal](18, 3) NOT NULL,
	[PayBackScore] [bigint] NOT NULL,
	[PayBackScale] [decimal](18, 3) NOT NULL,
	[MobilePhone] [nvarchar](16) NOT NULL CONSTRAINT [DF_AccountsAgent_MobilePhone]  DEFAULT (''),
	[EMail] [nvarchar](32) NOT NULL CONSTRAINT [DF_AccountsAgent_EMail]  DEFAULT (''),
	[DwellingPlace] [nvarchar](128) NOT NULL CONSTRAINT [DF_AccountsAgent_DwellingPlace]  DEFAULT (''),
	[Nullity] [tinyint] NOT NULL CONSTRAINT [DF_AccountsAgent_Nullity]  DEFAULT ((0)),
	[AgentNote] [nvarchar](200) NOT NULL CONSTRAINT [DF_Table_1_CollectNote]  DEFAULT (''),
	[CollectDate] [datetime] NOT NULL CONSTRAINT [DF_AccountsAgent_CollectDate]  DEFAULT (getdate()),
	[WeChat] [nvarchar](32) NOT NULL DEFAULT (''),
 CONSTRAINT [PK_AccountsAgent] PRIMARY KEY CLUSTERED 
(
	[AgentID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_AccountsAgent_UserID] ON [dbo].[AccountsAgent] 
(
	[UserID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'代理标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccountsAgent', @level2type=N'COLUMN',@level2name=N'AgentID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccountsAgent', @level2type=N'COLUMN',@level2name=N'UserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'代理姓名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccountsAgent', @level2type=N'COLUMN',@level2name=N'Compellation'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'代理域名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccountsAgent', @level2type=N'COLUMN',@level2name=N'Domain'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分成类型(1:充值分成，2:服务比例分成)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccountsAgent', @level2type=N'COLUMN',@level2name=N'AgentType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分成比例' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccountsAgent', @level2type=N'COLUMN',@level2name=N'AgentScale'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'日累计充值返现' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccountsAgent', @level2type=N'COLUMN',@level2name=N'PayBackScore'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'返现比例' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccountsAgent', @level2type=N'COLUMN',@level2name=N'PayBackScale'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'电话' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccountsAgent', @level2type=N'COLUMN',@level2name=N'MobilePhone'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'邮箱' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccountsAgent', @level2type=N'COLUMN',@level2name=N'EMail'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'详细地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccountsAgent', @level2type=N'COLUMN',@level2name=N'DwellingPlace'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'禁用标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccountsAgent', @level2type=N'COLUMN',@level2name=N'Nullity'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccountsAgent', @level2type=N'COLUMN',@level2name=N'AgentNote'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccountsAgent', @level2type=N'COLUMN',@level2name=N'CollectDate'
GO
/****** 对象:  Table [dbo].[AndroidConfigure]    脚本日期: 03/17/2017 10:02:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AndroidConfigure](
	[ServerID] [int] NOT NULL,
	[ServiceMode] [int] NOT NULL DEFAULT ((7)),
	[AndroidCount] [int] NOT NULL,
	[SwitchMinInnings] [int] NOT NULL DEFAULT ((3)),
	[SwitchMaxInnings] [int] NOT NULL DEFAULT ((6)),
	[AIHangingMinRate] [int] NOT NULL DEFAULT ((20)),
	[AIHangingMaxRate] [int] NOT NULL DEFAULT ((30)),
	[AICarryScoreMinMultiple0] [int] NOT NULL DEFAULT ((200)),
	[AICarryScoreMaxMultiple0] [int] NOT NULL DEFAULT ((200)),
	[AIScoreLevelRate0] [int] NOT NULL DEFAULT ((14)),
	[dwAIScoreFloatMinRate0] [int] NOT NULL DEFAULT ((80)),
	[dwAIScoreFloatMaxRate0] [int] NOT NULL DEFAULT ((120)),	
	[AICarryScoreMinMultiple1] [int] NOT NULL DEFAULT ((200)),
	[AICarryScoreMaxMultiple1] [int] NOT NULL DEFAULT ((200)),
	[AIScoreLevelRate1] [int] NOT NULL DEFAULT ((43)),
	[dwAIScoreFloatMinRate1] [int] NOT NULL DEFAULT ((80)),
	[dwAIScoreFloatMaxRate1] [int] NOT NULL DEFAULT ((120)),	
	[AICarryScoreMinMultiple2] [int] NOT NULL DEFAULT ((200)),
	[AICarryScoreMaxMultiple2] [int] NOT NULL DEFAULT ((200)),
	[AIScoreLevelRate2] [int] NOT NULL DEFAULT ((36)),
	[dwAIScoreFloatMinRate2] [int] NOT NULL DEFAULT ((80)),
	[dwAIScoreFloatMaxRate2] [int] NOT NULL DEFAULT ((120)),	
	[AICarryScoreMinMultiple3] [int] NOT NULL DEFAULT ((200)),
	[AICarryScoreMaxMultiple3] [int] NOT NULL DEFAULT ((200)),
	[AIScoreLevelRate3] [int] NOT NULL DEFAULT ((7)),
	[dwAIScoreFloatMinRate3] [int] NOT NULL DEFAULT ((80)),
	[dwAIScoreFloatMaxRate3] [int] NOT NULL DEFAULT ((120)),
	
 CONSTRAINT [PK_AndroidConfigure_1] PRIMARY KEY CLUSTERED 
(
	[ServerID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'房间标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AndroidConfigure', @level2type=N'COLUMN',@level2name=N'ServerID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'服务模式' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AndroidConfigure', @level2type=N'COLUMN',@level2name=N'ServiceMode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最少换桌局数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AndroidConfigure', @level2type=N'COLUMN',@level2name=N'SwitchMinInnings'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最大换桌局数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AndroidConfigure', @level2type=N'COLUMN',@level2name=N'SwitchMaxInnings'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'挂机比例最小' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AndroidConfigure', @level2type=N'COLUMN',@level2name=N'AIHangingMinRate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'挂机比例最大' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AndroidConfigure', @level2type=N'COLUMN',@level2name=N'AIHangingMaxRate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最小筹码倍数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AndroidConfigure', @level2type=N'COLUMN',@level2name=N'AICarryScoreMinMultiple0'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'第二筹码倍数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AndroidConfigure', @level2type=N'COLUMN',@level2name=N'AICarryScoreMaxMultiple0'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'人数比例' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AndroidConfigure', @level2type=N'COLUMN',@level2name=N'AIScoreLevelRate0'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'浮动范围最小' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AndroidConfigure', @level2type=N'COLUMN',@level2name=N'dwAIScoreFloatMinRate0'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'浮动范围最大' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AndroidConfigure', @level2type=N'COLUMN',@level2name=N'dwAIScoreFloatMaxRate0'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'第二筹码倍数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AndroidConfigure', @level2type=N'COLUMN',@level2name=N'AICarryScoreMinMultiple1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'第三筹码倍数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AndroidConfigure', @level2type=N'COLUMN',@level2name=N'AICarryScoreMaxMultiple1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'人数比例' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AndroidConfigure', @level2type=N'COLUMN',@level2name=N'AIScoreLevelRate1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'浮动范围最小' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AndroidConfigure', @level2type=N'COLUMN',@level2name=N'dwAIScoreFloatMinRate1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'浮动范围最大' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AndroidConfigure', @level2type=N'COLUMN',@level2name=N'dwAIScoreFloatMaxRate1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'第三筹码倍数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AndroidConfigure', @level2type=N'COLUMN',@level2name=N'AICarryScoreMinMultiple2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'第四筹码倍数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AndroidConfigure', @level2type=N'COLUMN',@level2name=N'AICarryScoreMaxMultiple2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'人数比例' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AndroidConfigure', @level2type=N'COLUMN',@level2name=N'AIScoreLevelRate2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'浮动范围最小' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AndroidConfigure', @level2type=N'COLUMN',@level2name=N'dwAIScoreFloatMinRate2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'浮动范围最大' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AndroidConfigure', @level2type=N'COLUMN',@level2name=N'dwAIScoreFloatMaxRate2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'第四筹码倍数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AndroidConfigure', @level2type=N'COLUMN',@level2name=N'AICarryScoreMinMultiple3'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最大筹码倍数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AndroidConfigure', @level2type=N'COLUMN',@level2name=N'AICarryScoreMaxMultiple3'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'人数比例' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AndroidConfigure', @level2type=N'COLUMN',@level2name=N'AIScoreLevelRate3'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'浮动范围最小' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AndroidConfigure', @level2type=N'COLUMN',@level2name=N'dwAIScoreFloatMinRate3'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'浮动范围最大' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AndroidConfigure', @level2type=N'COLUMN',@level2name=N'dwAIScoreFloatMaxRate3'
GO

/****** 对象:  Table [dbo].[AccountsVisitor]    脚本日期: 03/17/2017 10:02:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountsVisitor](
	[VisitorUserID] [int] NOT NULL,
	[VisitorMachine] [nvarchar](32) NOT NULL,
	[BindUserID] [int] NOT NULL,
	[BindAccounts] [nvarchar](31) NOT NULL,
	[BindType] [int] NOT NULL CONSTRAINT [DF_AccountsVisitor_BindType]  DEFAULT ((0)),
	[CollectDate] [datetime] NOT NULL CONSTRAINT [DF_AccountsVisitor_CollectDate]  DEFAULT (getdate()),
 CONSTRAINT [PK_AccountsVisitor] PRIMARY KEY CLUSTERED 
(
	[VisitorUserID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'游客ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccountsVisitor', @level2type=N'COLUMN',@level2name=N'VisitorUserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'游客机器' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccountsVisitor', @level2type=N'COLUMN',@level2name=N'VisitorMachine'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'绑定标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccountsVisitor', @level2type=N'COLUMN',@level2name=N'BindUserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'绑定帐号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccountsVisitor', @level2type=N'COLUMN',@level2name=N'BindAccounts'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'绑定类型(0新帐号，1旧帐号)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccountsVisitor', @level2type=N'COLUMN',@level2name=N'BindType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'插入日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccountsVisitor', @level2type=N'COLUMN',@level2name=N'CollectDate'
GO
/****** 对象:  Table [dbo].[ConfineAddress]    脚本日期: 03/17/2017 10:02:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConfineAddress](
	[AddrString] [nvarchar](15) NOT NULL,
	[EnjoinLogon] [bit] NOT NULL CONSTRAINT [DF_AddrConfineRule_EnjoinLogon]  DEFAULT ((0)),
	[EnjoinRegister] [bit] NOT NULL CONSTRAINT [DF_AddrConfineRule_EnjoinRegister]  DEFAULT ((0)),
	[EnjoinOverDate] [datetime] NULL,
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
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'限制登录' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ConfineAddress', @level2type=N'COLUMN',@level2name=N'EnjoinLogon'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'限制注册' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ConfineAddress', @level2type=N'COLUMN',@level2name=N'EnjoinRegister'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'过期时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ConfineAddress', @level2type=N'COLUMN',@level2name=N'EnjoinOverDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'收集日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ConfineAddress', @level2type=N'COLUMN',@level2name=N'CollectDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'输入备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ConfineAddress', @level2type=N'COLUMN',@level2name=N'CollectNote'
GO
/****** 对象:  Table [dbo].[AccountsSignin]    脚本日期: 03/17/2017 10:02:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountsSignin](
	[UserID] [int] NOT NULL,
	[StartDateTime] [datetime] NOT NULL,
	[LastDateTime] [datetime] NOT NULL,
	[SeriesDate] [smallint] NOT NULL,
	[GotPackageInfo] [NVARCHAR](32) NOT NULL CONSTRAINT[DF_AccountsSignin_GotPackageInfo] DEFAULT (N'') 
 CONSTRAINT [PK_AccountsCheckIn] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'连续签到天数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccountsSignin', @level2type=N'COLUMN',@level2name=N'SeriesDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'已领礼包' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccountsSignin', @level2type=N'COLUMN',@level2name=N'GotPackageInfo'
GO
/****** 对象:  Table [dbo].[ReserveIdentifier]    脚本日期: 03/17/2017 10:02:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReserveIdentifier](
	[GameID] [int] NOT NULL,
	[IDLevel] [int] NOT NULL CONSTRAINT [DF_Table1_IDLevel]  DEFAULT ((0)),
	[Distribute] [bit] NOT NULL CONSTRAINT [DF_ReserveIdentifiers_Distribute]  DEFAULT ((0)),
 CONSTRAINT [PK_ReserveIdentifier_GameID] PRIMARY KEY CLUSTERED 
(
	[GameID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'游戏标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReserveIdentifier', @level2type=N'COLUMN',@level2name=N'GameID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'标识等级' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReserveIdentifier', @level2type=N'COLUMN',@level2name=N'IDLevel'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分配标志' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReserveIdentifier', @level2type=N'COLUMN',@level2name=N'Distribute'
GO
/****** 对象:  Table [dbo].[AccountsMember]    脚本日期: 03/17/2017 10:02:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountsMember](
	[UserID] [int] NOT NULL,
	[MemberOrder] [tinyint] NOT NULL,
	[UserRight] [int] NOT NULL CONSTRAINT [DF_MemberInfo_UserRight]  DEFAULT ((0)),
	[MemberOverDate] [datetime] NOT NULL CONSTRAINT [DF_MemberInfo_MemberOverDate]  DEFAULT (getdate()),
 CONSTRAINT [PK_MemberInfo] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC,
	[MemberOrder] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccountsMember', @level2type=N'COLUMN',@level2name=N'UserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'会员标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccountsMember', @level2type=N'COLUMN',@level2name=N'MemberOrder'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户权限' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccountsMember', @level2type=N'COLUMN',@level2name=N'UserRight'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'会员期限' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccountsMember', @level2type=N'COLUMN',@level2name=N'MemberOverDate'
GO
/****** 对象:  Table [dbo].[SystemStreamInfo]    脚本日期: 03/17/2017 10:02:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SystemStreamInfo](
	[DateID] [int] NOT NULL,
	[WebLogonSuccess] [int] NOT NULL CONSTRAINT [DF_SystemLogonInfo_WebLogonSuccess]  DEFAULT ((0)),
	[WebRegisterSuccess] [int] NOT NULL CONSTRAINT [DF_SystemLogonInfo_WebRegisterSuccess]  DEFAULT ((0)),
	[GameLogonSuccess] [int] NOT NULL CONSTRAINT [DF_TABLE1_LogonCount]  DEFAULT ((0)),
	[GameRegisterSuccess] [int] NOT NULL CONSTRAINT [DF_TABLE1_RegisterCount]  DEFAULT ((0)),
	[CollectDate] [datetime] NOT NULL CONSTRAINT [DF_TABLE1_RecordDate]  DEFAULT (getdate()),
 CONSTRAINT [PK_SystemStreamInfo] PRIMARY KEY CLUSTERED 
(
	[DateID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'日期标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SystemStreamInfo', @level2type=N'COLUMN',@level2name=N'DateID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登录成功' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SystemStreamInfo', @level2type=N'COLUMN',@level2name=N'WebLogonSuccess'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'注册成功' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SystemStreamInfo', @level2type=N'COLUMN',@level2name=N'WebRegisterSuccess'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登录成功' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SystemStreamInfo', @level2type=N'COLUMN',@level2name=N'GameLogonSuccess'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'注册成功' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SystemStreamInfo', @level2type=N'COLUMN',@level2name=N'GameRegisterSuccess'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'录入时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SystemStreamInfo', @level2type=N'COLUMN',@level2name=N'CollectDate'
GO
/****** 对象:  Table [dbo].[AccountsPackage]    脚本日期: 03/17/2017 10:02:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountsPackage](
	[UserID] [int] NOT NULL,
	[GoodsID] [int] NOT NULL,
	[GoodShowID] [int] NOT NULL CONSTRAINT [DF_AccountsPackage_GoodShowID]  DEFAULT ((0)),
	[GoodsSortID] [int] NOT NULL CONSTRAINT [DF_AccountsPackage_GoodsIndex]  DEFAULT ((0)),
	[GoodsCount] [int] NOT NULL,
	[PushTime] [datetime] NOT NULL
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'物品标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccountsPackage', @level2type=N'COLUMN',@level2name=N'GoodsID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'背包归类类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccountsPackage', @level2type=N'COLUMN',@level2name=N'GoodShowID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'背包内物品排序' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccountsPackage', @level2type=N'COLUMN',@level2name=N'GoodsSortID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'物品数量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccountsPackage', @level2type=N'COLUMN',@level2name=N'GoodsCount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'增加时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccountsPackage', @level2type=N'COLUMN',@level2name=N'PushTime'
GO
/****** 对象:  Table [dbo].[AccountsInfoPoperty]    脚本日期: 03/17/2017 10:02:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountsInfoPoperty](
	[UserID] [int] NOT NULL,
	[KindID] [smallint] NOT NULL,
	[UseTime] [datetime] NOT NULL,
	[UseResultsValidTime] [bigint] NOT NULL,
	[UseResultsValidTimeScoreMultiple] [smallint] NOT NULL,
	[Name] [nvarchar](31) NOT NULL
) ON [PRIMARY]
GO
/****** 对象:  Table [dbo].[AccountsAgentGame]    脚本日期: 03/17/2017 10:01:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountsAgentGame](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[AgentID] [int] NOT NULL,
	[KindID] [int] NOT NULL,
	[DeviceID] [int] NOT NULL CONSTRAINT [DF_AccountsAgentGame_DeviceID]  DEFAULT ((0)),
	[SortID] [int] NOT NULL CONSTRAINT [DF_AccountsAgentGame_SortID]  DEFAULT ((0)),
	[CollectDate] [datetime] NOT NULL CONSTRAINT [DF_AccountsAgentGame_CollectDate]  DEFAULT (getdate()),
 CONSTRAINT [PK_AccountsAgentGame] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'代理标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccountsAgentGame', @level2type=N'COLUMN',@level2name=N'AgentID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'游戏标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccountsAgentGame', @level2type=N'COLUMN',@level2name=N'KindID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'设备标识(1:大厅,2:手机)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccountsAgentGame', @level2type=N'COLUMN',@level2name=N'DeviceID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccountsAgentGame', @level2type=N'COLUMN',@level2name=N'SortID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccountsAgentGame', @level2type=N'COLUMN',@level2name=N'CollectDate'
GO
/****** 对象:  Table [dbo].[AccountsSendPresent]    脚本日期: 03/17/2017 10:02:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountsSendPresent](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[UserID] [int] NOT NULL,
	[ReceiverUserID] [int] NOT NULL,
	[PropID] [int] NOT NULL,
	[PropCount] [int] NOT NULL,
	[SendTime] [datetime] NOT NULL,
	[PropStatus] [smallint] NOT NULL,
	[ClientIP] [nvarchar](15) NOT NULL,
 CONSTRAINT [PK_AccountsSendPresent] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'赠送ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccountsSendPresent', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'赠送者用户ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccountsSendPresent', @level2type=N'COLUMN',@level2name=N'UserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'接收者 用户ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccountsSendPresent', @level2type=N'COLUMN',@level2name=N'ReceiverUserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'赠送的道具ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccountsSendPresent', @level2type=N'COLUMN',@level2name=N'PropID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'赠送的道具数量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccountsSendPresent', @level2type=N'COLUMN',@level2name=N'PropCount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'赠送的时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccountsSendPresent', @level2type=N'COLUMN',@level2name=N'SendTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0:已经赠送,等待接收者接收   1:已经被接收' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccountsSendPresent', @level2type=N'COLUMN',@level2name=N'PropStatus'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'赠送者的 客户端IP' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccountsSendPresent', @level2type=N'COLUMN',@level2name=N'ClientIP'
GO
/****** 对象:  Table [dbo].[AccountsProperty]    脚本日期: 03/17/2017 10:02:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountsProperty](
	[UserID] [int] NOT NULL,
	[PropID] [int] NOT NULL,
	[ServerID] [int] NOT NULL,
	[PropCount] [int] NOT NULL,
	[KindID] [int] NOT NULL,
	[SendTime] [datetime] NOT NULL CONSTRAINT [DF_AccountsProperty_SendTime]  DEFAULT (getdate()),
 CONSTRAINT [PK_AccountsProperty] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC,
	[PropID] ASC,
	[ServerID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccountsProperty', @level2type=N'COLUMN',@level2name=N'UserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'道具标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccountsProperty', @level2type=N'COLUMN',@level2name=N'PropID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'房间标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccountsProperty', @level2type=N'COLUMN',@level2name=N'ServerID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'道具数量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccountsProperty', @level2type=N'COLUMN',@level2name=N'PropCount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'游戏标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccountsProperty', @level2type=N'COLUMN',@level2name=N'KindID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'购买时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccountsProperty', @level2type=N'COLUMN',@level2name=N'SendTime'
GO
/****** 对象:  Table [dbo].[MemberProperty]    脚本日期: 03/17/2017 10:02:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MemberProperty](
	[MemberOrder] [int] NOT NULL,
	[MemberName] [nvarchar](50) NOT NULL,
	[UserRight] [int] NOT NULL CONSTRAINT [DF_MemberProperty_UserRight]  DEFAULT ((0)),
	[TaskRate] [int] NOT NULL CONSTRAINT [DF_MemberProperty_TaskRate]  DEFAULT ((0)),
	[ShopRate] [int] NOT NULL CONSTRAINT [DF_MemberProperty_ShopRate]  DEFAULT ((0)),
	[InsureRate] [int] NOT NULL CONSTRAINT [DF_MemberProperty_InsureRete]  DEFAULT ((0)),
	[DayPresent] [int] NOT NULL CONSTRAINT [DF_MemberProperty_DayPresent]  DEFAULT ((0)),
	[DayGiftID] [int] NOT NULL CONSTRAINT [DF_MemberProperty_DayGiftID]  DEFAULT ((0)),
	[CollectDate] [datetime] NOT NULL CONSTRAINT [DF_MemberProperty_CollectDate]  DEFAULT (getdate()),
	[CollectNote] [nvarchar](200) NOT NULL CONSTRAINT [DF_MemberProperty_CollectNote]  DEFAULT (''),
 CONSTRAINT [PK_MemberProperty] PRIMARY KEY CLUSTERED 
(
	[MemberOrder] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'会员名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MemberProperty', @level2type=N'COLUMN',@level2name=N'MemberName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'会员权限' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MemberProperty', @level2type=N'COLUMN',@level2name=N'UserRight'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'任务奖励' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MemberProperty', @level2type=N'COLUMN',@level2name=N'TaskRate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'商城折扣' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MemberProperty', @level2type=N'COLUMN',@level2name=N'ShopRate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'银行优惠' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MemberProperty', @level2type=N'COLUMN',@level2name=N'InsureRate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'每日赠送' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MemberProperty', @level2type=N'COLUMN',@level2name=N'DayPresent'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'每日登录礼包' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MemberProperty', @level2type=N'COLUMN',@level2name=N'DayGiftID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MemberProperty', @level2type=N'COLUMN',@level2name=N'CollectDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MemberProperty', @level2type=N'COLUMN',@level2name=N'CollectNote'
GO
/****** Object:  Table [dbo].[AccountsFace]    Script Date: 2017/8/7 14:19:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountsFace](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[CustomFace] [image] NULL,
	[FaceUrl] [nvarchar](500) NOT NULL,
	[InsertTime] [datetime] NOT NULL,
	[InsertAddr] [nvarchar](15) NOT NULL,
	[InsertMachine] [nvarchar](12) NOT NULL,
 CONSTRAINT [PK_AccountsFace_ID] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[AccountsFace] ADD  CONSTRAINT [DF_AccountsFace_FaceUrl]  DEFAULT ('') FOR [FaceUrl]
GO
ALTER TABLE [dbo].[AccountsFace] ADD  CONSTRAINT [DF_AccountsFace_CustomTime]  DEFAULT (getdate()) FOR [InsertTime]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccountsFace', @level2type=N'COLUMN',@level2name=N'UserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'头像地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccountsFace', @level2type=N'COLUMN',@level2name=N'FaceUrl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登录地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccountsFace', @level2type=N'COLUMN',@level2name=N'InsertAddr'
GO
/****** 对象:  Table [dbo].[AccountsMemberDayGift]    脚本日期: 03/17/2017 10:02:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountsMemberDayGift](
	[UserID] [int] NOT NULL,
	[TakeDateID] [int] NOT NULL,
	[GiftID] [int] NOT NULL,
 CONSTRAINT [AccountsMemberDayGift_1] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC,
	[TakeDateID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccountsMemberDayGift', @level2type=N'COLUMN',@level2name=N'UserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'领取日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccountsMemberDayGift', @level2type=N'COLUMN',@level2name=N'TakeDateID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'领取礼包' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccountsMemberDayGift', @level2type=N'COLUMN',@level2name=N'GiftID'
GO
/****** 对象:  Table [dbo].[AccountsInfo]    脚本日期: 03/17/2017 10:02:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountsInfo](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[GameID] [int] NOT NULL CONSTRAINT [DF_AccountsInfo_GameID]  DEFAULT ((0)),	
	[SpreaderID] [int] NOT NULL CONSTRAINT [DF_AccountsInfo_SpreaderID]  DEFAULT ((0)),
	[Accounts] [nvarchar](31) NOT NULL,
	[NickName] [nvarchar](31) NOT NULL CONSTRAINT [DF_AccountsInfo_Nickname]  DEFAULT (''),
	[RegAccounts] [nvarchar](31) NOT NULL,
	[UnderWrite] [nvarchar](250) NOT NULL CONSTRAINT [DF_UserAccounts_UnderWrite]  DEFAULT (''),
	[PassPortID] [nvarchar](18) NOT NULL CONSTRAINT [DF_AccountsInfo_PassPortID]  DEFAULT (N''),
	[Compellation] [nvarchar](16) NOT NULL CONSTRAINT [DF_AccountsInfo_Compellation]  DEFAULT (N''),
	[LogonPass] [nchar](32) NOT NULL,
	[InsurePass] [nchar](32) NOT NULL CONSTRAINT [DF_AccountsInfo_InsurePass]  DEFAULT (N''),
	[DynamicPass] [nchar](32) NOT NULL CONSTRAINT [DF_AccountsInfo_DynamicPass]  DEFAULT (''),
	[DynamicPassTime] [datetime] NOT NULL CONSTRAINT [DF_AccountsInfo_DynamicPassTime]  DEFAULT (getdate()),
	[FaceID] [smallint] NOT NULL CONSTRAINT [DF_UserAccounts_FaceID]  DEFAULT ((0)),
	[CustomID] [int] NOT NULL CONSTRAINT [DF_AccountsInfo_CustomFaceID]  DEFAULT ((0)),				
	[UserRight] [int] NOT NULL CONSTRAINT [DF_AccountsInfo_UserRight]  DEFAULT ((0)),
	[MasterRight] [int] NOT NULL CONSTRAINT [DF_AccountsInfo_MasterRight]  DEFAULT ((0)),
	[ServiceRight] [int] NOT NULL CONSTRAINT [DF_AccountsInfo_ServiceRight]  DEFAULT ((0)),
	[MasterOrder] [tinyint] NOT NULL CONSTRAINT [DF_AccountsInfo_MasterOrder]  DEFAULT ((0)),
	[MemberOrder] [tinyint] NOT NULL CONSTRAINT [DF_UserAccounts_MemberOrder]  DEFAULT ((0)),
	[MemberOverDate] [datetime] NOT NULL CONSTRAINT [DF_UserAccounts_MemberOverDate]  DEFAULT (((1980)-(1))-(1)),
	[MemberSwitchDate] [datetime] NOT NULL CONSTRAINT [DF_AccountsInfo_MemberSwitchDate]  DEFAULT (((1980)-(1))-(1)),
	[CustomFaceVer] [tinyint] NOT NULL CONSTRAINT [DF_AccountsInfo_CustomFaceVer]  DEFAULT ((0)),
	[Gender] [tinyint] NOT NULL CONSTRAINT [DF_AccountsInfo_Gender]  DEFAULT ((0)),
	[Nullity] [tinyint] NOT NULL CONSTRAINT [DF_UserAccounts_ServiceNullity]  DEFAULT ((0)),
	[NullityOverDate] [datetime] NOT NULL CONSTRAINT [DF_AccountsInfo_NullityOverDate]  DEFAULT ('1900-01-01'),
	[StunDown] [tinyint] NOT NULL CONSTRAINT [DF_AccountsInfo_CloseDown]  DEFAULT ((0)),
	[MoorMachine] [tinyint] NOT NULL CONSTRAINT [DF_AccountsInfo_MoorMachine]  DEFAULT ((0)),
	[IsAndroid] [tinyint] NOT NULL CONSTRAINT [DF_AccountsInfo_IsAndroid]  DEFAULT ((0)),
	[WebLogonTimes] [int] NOT NULL CONSTRAINT [DF_AccountsInfo_WebLogonTimes]  DEFAULT ((0)),
	[GameLogonTimes] [int] NOT NULL CONSTRAINT [DF_UserAccounts_AllLogonTimes]  DEFAULT ((0)),
	[PlayTimeCount] [int] NOT NULL CONSTRAINT [DF_AccountsInfo_PlayTimeCount]  DEFAULT ((0)),
	[OnLineTimeCount] [int] NOT NULL CONSTRAINT [DF_AccountsInfo_OnLineTimeCount]  DEFAULT ((0)),
	[LastLogonIP] [nvarchar](15) NOT NULL,
	[LastLogonDate] [datetime] NOT NULL CONSTRAINT [DF_UserAccounts_LastLogonDate]  DEFAULT (getdate()),
	[LastLogonMobile] [nvarchar](11) NOT NULL CONSTRAINT [DF_AccountsInfo_RegisterMobile1]  DEFAULT (N''),
	[LastLogonMachine] [nvarchar](32) NOT NULL CONSTRAINT [DF_AccountsInfo_MachineSerial]  DEFAULT ('------------'),
	[RegisterIP] [nvarchar](15) NOT NULL,
	[RegisterDate] [datetime] NOT NULL CONSTRAINT [DF_UserAccounts_RegisterDate]  DEFAULT (getdate()),
	[RegisterMobile] [nvarchar](11) NOT NULL CONSTRAINT [DF_AccountsInfo_RegisterMobile]  DEFAULT (N''),
	[RegisterMachine] [nvarchar](32) NOT NULL CONSTRAINT [DF_AccountsInfo_RegisterMachine]  DEFAULT (N'------------'),
	[RegisterOrigin] [tinyint] NULL CONSTRAINT [DF_AccountsInfo_RegisterOrigin]  DEFAULT ((0)),
	[ClientType] [tinyint] NULL CONSTRAINT [DF_AccountsInfo_ClientType]  DEFAULT ((0)),
	[PlatformID] [smallint] NOT NULL CONSTRAINT [DF_AccountsInfo_UserUin]  DEFAULT ((0)),
	[UserUin] [nvarchar](32) NOT NULL CONSTRAINT [DF_AccountsInfo_UserUin_1]  DEFAULT (N''),
	[RankID] [int] NULL,
	[AgentID] [int] NOT NULL CONSTRAINT [DF_AccountsInfo_AgentID]  DEFAULT ((0)),
	[PlaceName] [nvarchar](33) NOT NULL CONSTRAINT [DF_AccountsInfo_PlaceName]  DEFAULT (N''),
	[IsGroupMember] [int] NOT NULL CONSTRAINT [DF_AccountsInfo_IsGroupMember]  DEFAULT ((0)),
 CONSTRAINT [PK_AccountsInfo_UserID] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccountsInfo', @level2type=N'COLUMN',@level2name=N'UserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'游戏标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccountsInfo', @level2type=N'COLUMN',@level2name=N'GameID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'推广员标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccountsInfo', @level2type=N'COLUMN',@level2name=N'SpreaderID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户帐号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccountsInfo', @level2type=N'COLUMN',@level2name=N'Accounts'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户昵称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccountsInfo', @level2type=N'COLUMN',@level2name=N'NickName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'注册帐号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccountsInfo', @level2type=N'COLUMN',@level2name=N'RegAccounts'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'个性签名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccountsInfo', @level2type=N'COLUMN',@level2name=N'UnderWrite'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'身份证号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccountsInfo', @level2type=N'COLUMN',@level2name=N'PassPortID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'真实名字' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccountsInfo', @level2type=N'COLUMN',@level2name=N'Compellation'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登录密码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccountsInfo', @level2type=N'COLUMN',@level2name=N'LogonPass'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'安全密码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccountsInfo', @level2type=N'COLUMN',@level2name=N'InsurePass'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'动态密码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccountsInfo', @level2type=N'COLUMN',@level2name=N'DynamicPass'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'动态密码更新时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccountsInfo', @level2type=N'COLUMN',@level2name=N'DynamicPassTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'头像标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccountsInfo', @level2type=N'COLUMN',@level2name=N'FaceID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'自定标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccountsInfo', @level2type=N'COLUMN',@level2name=N'CustomID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户权限' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccountsInfo', @level2type=N'COLUMN',@level2name=N'UserRight'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'管理权限' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccountsInfo', @level2type=N'COLUMN',@level2name=N'MasterRight'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'服务权限' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccountsInfo', @level2type=N'COLUMN',@level2name=N'ServiceRight'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'管理等级' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccountsInfo', @level2type=N'COLUMN',@level2name=N'MasterOrder'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'会员等级' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccountsInfo', @level2type=N'COLUMN',@level2name=N'MemberOrder'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'过期日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccountsInfo', @level2type=N'COLUMN',@level2name=N'MemberOverDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'切换时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccountsInfo', @level2type=N'COLUMN',@level2name=N'MemberSwitchDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'头像版本' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccountsInfo', @level2type=N'COLUMN',@level2name=N'CustomFaceVer'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户性别' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccountsInfo', @level2type=N'COLUMN',@level2name=N'Gender'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'禁止服务' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccountsInfo', @level2type=N'COLUMN',@level2name=N'Nullity'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'禁止时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccountsInfo', @level2type=N'COLUMN',@level2name=N'NullityOverDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'关闭标志' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccountsInfo', @level2type=N'COLUMN',@level2name=N'StunDown'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'固定机器' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccountsInfo', @level2type=N'COLUMN',@level2name=N'MoorMachine'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否AI' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccountsInfo', @level2type=N'COLUMN',@level2name=N'IsAndroid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登录次数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccountsInfo', @level2type=N'COLUMN',@level2name=N'WebLogonTimes'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登录次数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccountsInfo', @level2type=N'COLUMN',@level2name=N'GameLogonTimes'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'游戏时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccountsInfo', @level2type=N'COLUMN',@level2name=N'PlayTimeCount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'在线时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccountsInfo', @level2type=N'COLUMN',@level2name=N'OnLineTimeCount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登录地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccountsInfo', @level2type=N'COLUMN',@level2name=N'LastLogonIP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登录时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccountsInfo', @level2type=N'COLUMN',@level2name=N'LastLogonDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登录手机' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccountsInfo', @level2type=N'COLUMN',@level2name=N'LastLogonMobile'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登录机器' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccountsInfo', @level2type=N'COLUMN',@level2name=N'LastLogonMachine'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'注册地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccountsInfo', @level2type=N'COLUMN',@level2name=N'RegisterIP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'注册时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccountsInfo', @level2type=N'COLUMN',@level2name=N'RegisterDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'注册手机' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccountsInfo', @level2type=N'COLUMN',@level2name=N'RegisterMobile'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'注册机器' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccountsInfo', @level2type=N'COLUMN',@level2name=N'RegisterMachine'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'客户端类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccountsInfo', @level2type=N'COLUMN',@level2name=N'ClientType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'PC       0x00     ,
ANDROID  0x10(cocos 0x11,u3d 0x12)     ,
ITOUCH   0x20     ,
IPHONE   0x30(cocos 0x31,u3d 0x32)     ,
IPAD     0x40(cocos 0x41,u3d 0x42)     ,
WEB      0x50     ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccountsInfo', @level2type=N'COLUMN',@level2name=N'RegisterOrigin'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'地名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccountsInfo', @level2type=N'COLUMN',@level2name=N'PlaceName'
GO
/****** 对象:  Table [dbo].[AccountsMemberDayPresent]    脚本日期: 03/17/2017 10:02:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountsMemberDayPresent](
	[UserID] [int] NOT NULL,
	[TakeDateID] [int] NOT NULL,
	[TakeGold] [bigint] NOT NULL,
 CONSTRAINT [AccountsMemberDayPresent_1] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC,
	[TakeDateID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccountsMemberDayPresent', @level2type=N'COLUMN',@level2name=N'UserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'领取日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccountsMemberDayPresent', @level2type=N'COLUMN',@level2name=N'TakeDateID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'领取金币' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccountsMemberDayPresent', @level2type=N'COLUMN',@level2name=N'TakeGold'
GO
/****** 对象:  Table [dbo].[ConfineMachine]    脚本日期: 03/17/2017 10:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConfineMachine](
	[MachineSerial] [nvarchar](32) NOT NULL,
	[EnjoinLogon] [bit] NOT NULL CONSTRAINT [DF_MachineConfineRule_EnjoinLogon]  DEFAULT ((0)),
	[EnjoinRegister] [bit] NOT NULL CONSTRAINT [DF_MachineConfineRule_EnjoinRegister]  DEFAULT ((0)),
	[EnjoinOverDate] [datetime] NULL,
	[CollectDate] [datetime] NOT NULL CONSTRAINT [DF_MachineConfineRule_CollectDate]  DEFAULT (getdate()),
	[CollectNote] [nvarchar](32) NOT NULL CONSTRAINT [DF_MachineConfineRule_CollectNote]  DEFAULT (''),
 CONSTRAINT [PK_ConfineMachine_MachineSerial] PRIMARY KEY CLUSTERED 
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
/****** 对象:  Table [dbo].[ConfineContent]    脚本日期: 03/17/2017 10:02:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConfineContent](
	[ContentID] [int] IDENTITY(1,1) NOT NULL,
	[String] [nvarchar](31) NOT NULL,
	[EnjoinOverDate] [datetime] NULL,
	[CollectDate] [datetime] NOT NULL CONSTRAINT [DF_ReserveCharacter_ModifyDate]  DEFAULT (getdate()),
 CONSTRAINT [PK_ConfineContent] PRIMARY KEY CLUSTERED 
(
	[ContentID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'保留字符' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ConfineContent', @level2type=N'COLUMN',@level2name=N'String'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'有效时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ConfineContent', @level2type=N'COLUMN',@level2name=N'EnjoinOverDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'录入日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ConfineContent', @level2type=N'COLUMN',@level2name=N'CollectDate'
GO
/****** 对象:  Table [dbo].[SystemMachineGrantCount]    脚本日期: 03/17/2017 10:02:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SystemMachineGrantCount](
	[DateID] [int] NOT NULL,
	[RegisterMachine] [nvarchar](32) NOT NULL CONSTRAINT [DF_SystemMachineGrantCount_RegisterMachine]  DEFAULT (N'------------'),
	[RegisterIP] [nchar](15) NOT NULL,
	[GrantScore] [bigint] NOT NULL,
	[GrantCount] [bigint] NOT NULL CONSTRAINT [DF_SystemMachineGrantCount_PresentScoreStat]  DEFAULT ((0)),
	[CollectDate] [datetime] NOT NULL CONSTRAINT [DF_SystemMachineGrantCount_CollectDate]  DEFAULT (getdate()),
 CONSTRAINT [PK_SystemMachineGrantCount_1] PRIMARY KEY CLUSTERED 
(
	[DateID] ASC,
	[RegisterMachine] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'注册机器' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SystemMachineGrantCount', @level2type=N'COLUMN',@level2name=N'RegisterMachine'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'注册地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SystemMachineGrantCount', @level2type=N'COLUMN',@level2name=N'RegisterIP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'赠送金币' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SystemMachineGrantCount', @level2type=N'COLUMN',@level2name=N'GrantScore'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'赠送次数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SystemMachineGrantCount', @level2type=N'COLUMN',@level2name=N'GrantCount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'收集时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SystemMachineGrantCount', @level2type=N'COLUMN',@level2name=N'CollectDate'
GO
/****** 对象:  Table [dbo].[AndroidLockInfo]    脚本日期: 03/17/2017 10:02:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AndroidLockInfo](
	[UserID] [int] NOT NULL,
	[AndroidStatus] [tinyint] NOT NULL CONSTRAINT [DF_AndroidLockInfo_AndroidStatus]  DEFAULT ((0)),
	[ServiceServerID] [int] NOT NULL CONSTRAINT [DF_AndroidLockInfo_ServiceServerID]  DEFAULT ((0)),
	[LastServerID] [int] NOT NULL CONSTRAINT [DF_AndroidLockInfo_LastServerID]  DEFAULT ((0)),
	[LastLockDateTime] [datetime],
	[LastLeaveTime] [datetime],
 CONSTRAINT [PK_AndroidLockInfo] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'机器标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AndroidLockInfo', @level2type=N'COLUMN',@level2name=N'UserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'机器状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AndroidLockInfo', @level2type=N'COLUMN',@level2name=N'AndroidStatus'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'服务房间标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AndroidLockInfo', @level2type=N'COLUMN',@level2name=N'ServiceServerID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'上次房间标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AndroidLockInfo', @level2type=N'COLUMN',@level2name=N'LastServerID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'上次插入房间日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AndroidLockInfo', @level2type=N'COLUMN',@level2name=N'LastLockDateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'上次离开房间日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AndroidLockInfo', @level2type=N'COLUMN',@level2name=N'LastLeaveTime'
GO

/****** 对象:  Table [dbo].[SystemStatusInfo]    脚本日期: 03/17/2017 10:02:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SystemStatusInfo](
	[StatusName] [nvarchar](32) NOT NULL,
	[StatusValue] [BIGINT] NOT NULL CONSTRAINT [DF_SystemStatusInfo_StatusValue]  DEFAULT ((0)),
	[StatusString] [nvarchar](512) NOT NULL CONSTRAINT [DF_SystemStatusInfo_StatusString]  DEFAULT (''),
	[StatusTip] [nvarchar](50) NOT NULL CONSTRAINT [DF_SystemStatusInfo_StatusTip]  DEFAULT (''),
	[StatusDescription] [nvarchar](100) NOT NULL CONSTRAINT [DF_SystemStatusInfo_StatusDescription]  DEFAULT (''),
	[SortID] [int] NOT NULL CONSTRAINT [DF_SystemStatusInfo_SortID]  DEFAULT ((0)),
 CONSTRAINT [PK_SystemStatusInfo] PRIMARY KEY CLUSTERED 
(
	[StatusName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态名字' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SystemStatusInfo', @level2type=N'COLUMN',@level2name=N'StatusName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态数值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SystemStatusInfo', @level2type=N'COLUMN',@level2name=N'StatusValue'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态字符' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SystemStatusInfo', @level2type=N'COLUMN',@level2name=N'StatusString'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态显示名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SystemStatusInfo', @level2type=N'COLUMN',@level2name=N'StatusTip'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'字符的描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SystemStatusInfo', @level2type=N'COLUMN',@level2name=N'StatusDescription'
GO
/****** Object:  Table [dbo].[AccountsTask]    Script Date: 05/08/2018 10:55:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountsTask](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[TaskID] [int] NOT NULL,
	[KindID] [int] NOT NULL,
	[ServerID] [int] NOT NULL,
	[TaskType] [int] NOT NULL,
	[TaskObject] [int] NOT NULL,
	[Progress] [int] NOT NULL,
	[TimeType] [tinyint] NOT NULL,
	[TaskStatus] [tinyint] NOT NULL,
	[CollectDate] [datetime] NOT NULL,
 CONSTRAINT [PK_AccountsTask_ID] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Index [IX_AccountsTask_UserTask]    Script Date: 05/08/2018 10:54:34 ******/
CREATE NONCLUSTERED INDEX [IX_AccountsTask_UserTask] ON [dbo].[AccountsTask]
(
	[UserID] ASC ,  [TaskID] ASC
)

/****** Object:  Index [IX_AccountsTask_UserKind]    Script Date: 05/08/2018 10:54:34 ******/
CREATE NONCLUSTERED INDEX [IX_AccountsTask_UserKind] ON [dbo].[AccountsTask]
(
	[UserID] ASC ,  [KindID] ASC, [ServerID] ASC 
)

GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccountsTask', @level2type=N'COLUMN',@level2name=N'UserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'任务标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccountsTask', @level2type=N'COLUMN',@level2name=N'TaskID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'任务所属游戏标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccountsTask', @level2type=N'COLUMN',@level2name=N'KindID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'任务所属房间(0表示所有房间)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccountsTask', @level2type=N'COLUMN',@level2name=N'ServerID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'完成任务目标' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccountsTask', @level2type=N'COLUMN',@level2name=N'TaskObject'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'任务进度' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccountsTask', @level2type=N'COLUMN',@level2name=N'Progress'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'时间模式(0x01:一次任务，0x02:每日任务，0x04:每周任务，0x08:每月任务)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccountsTask', @level2type=N'COLUMN',@level2name=N'TimeType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'任务状态 (0 为未完成  1为成功   2为已领奖)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccountsTask', @level2type=N'COLUMN',@level2name=N'TaskStatus'
GO

/****** Object:  Default [DF_AccountsTask_TaskID]    Script Date: 05/08/2018 10:55:21 ******/
ALTER TABLE [dbo].[AccountsTask] ADD  CONSTRAINT [DF_AccountsTask_TaskID]  DEFAULT ((0)) FOR [TaskID]
GO
/****** Object:  Default [DF_AccountsTask_KingID]    Script Date: 05/08/2018 10:55:21 ******/
ALTER TABLE [dbo].[AccountsTask] ADD  CONSTRAINT [DF_AccountsTask_KingID]  DEFAULT ((0)) FOR [KindID]
GO
/****** Object:  Default [DF_AccountsTask_ServerID]    Script Date: 05/08/2018 10:55:21 ******/
ALTER TABLE [dbo].[AccountsTask] ADD  CONSTRAINT [DF_AccountsTask_ServerID]  DEFAULT ((0)) FOR [ServerID]
GO
/****** Object:  Default [DF_AccountsTask_TaskType]    Script Date: 05/08/2018 10:55:21 ******/
ALTER TABLE [dbo].[AccountsTask] ADD  CONSTRAINT [DF_AccountsTask_TaskType]  DEFAULT ((0)) FOR [TaskType]
GO
/****** Object:  Default [DF_AccountsTask_TaskObject]    Script Date: 05/08/2018 10:55:21 ******/
ALTER TABLE [dbo].[AccountsTask] ADD  CONSTRAINT [DF_AccountsTask_TaskObject]  DEFAULT ((0)) FOR [TaskObject]
GO
/****** Object:  Default [DF_AccountsTask_Progress]    Script Date: 05/08/2018 10:55:21 ******/
ALTER TABLE [dbo].[AccountsTask] ADD  CONSTRAINT [DF_AccountsTask_Progress]  DEFAULT ((0)) FOR [Progress]
GO
/****** Object:  Default [DF_AccountsTask_TimeType]    Script Date: 05/08/2018 10:55:21 ******/
ALTER TABLE [dbo].[AccountsTask] ADD  CONSTRAINT [DF_AccountsTask_TimeType]  DEFAULT ((0)) FOR [TimeType]
GO
/****** Object:  Default [DF_AccountsTask_TaskStatus]    Script Date: 05/08/2018 10:55:21 ******/
ALTER TABLE [dbo].[AccountsTask] ADD  CONSTRAINT [DF_AccountsTask_TaskStatus]  DEFAULT ((0)) FOR [TaskStatus]
GO
/****** Object:  Default [DF_AccountsTask_CollectDate]    Script Date: 05/08/2018 10:55:21 ******/
ALTER TABLE [dbo].[AccountsTask] ADD  CONSTRAINT [DF_AccountsTask_CollectDate]  DEFAULT (getdate()) FOR [CollectDate]
GO



/****** Object:  Table [dbo].[CheckCode]    Script Date: 2018/8/20 16:28:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CheckCode]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CheckCode](
	[PhoneNum] [nvarchar](11) NOT NULL,
	[CheckCode] [nvarchar](6) NOT NULL,
	[CollectTime] [datetime] NOT NULL,
 CONSTRAINT [PK_CheckCode] PRIMARY KEY CLUSTERED 
(
	[PhoneNum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_CheckCode_CollectTime]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CheckCode] ADD  CONSTRAINT [DF_CheckCode_CollectTime]  DEFAULT (getdate()) FOR [CollectTime]
END

GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'CheckCode', N'COLUMN',N'PhoneNum'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'手机号码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CheckCode', @level2type=N'COLUMN',@level2name=N'PhoneNum'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'CheckCode', N'COLUMN',N'CheckCode'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'验证码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CheckCode', @level2type=N'COLUMN',@level2name=N'CheckCode'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'CheckCode', N'COLUMN',N'CollectTime'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'验证码生成时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CheckCode', @level2type=N'COLUMN',@level2name=N'CollectTime'
GO


/****** Object:  Table [dbo].[RegisterGive]    Script Date: 2018/11/7 15:40:49 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[RegisterGive](
	[ConfigID] [int] IDENTITY(1,1) NOT NULL,
	[ScoreCount] [int] NOT NULL,
	[DiamondCount] [int] NOT NULL,
	[PlatformType] [int] NOT NULL
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[RegisterGive] ADD  CONSTRAINT [DF_RegisterGive_ScoreCount]  DEFAULT ((0)) FOR [ScoreCount]
GO

ALTER TABLE [dbo].[RegisterGive] ADD  CONSTRAINT [DF_RegisterGive_DiamondCount]  DEFAULT ((0)) FOR [DiamondCount]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'赠送金币数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RegisterGive', @level2type=N'COLUMN',@level2name=N'ScoreCount'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'赠送钻石数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RegisterGive', @level2type=N'COLUMN',@level2name=N'DiamondCount'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'平台类型（1.H5,2.U3D,3.LUA）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RegisterGive', @level2type=N'COLUMN',@level2name=N'PlatformType'
GO



/****** Object:  Table [dbo].[BindIP]    Script Date: 05/17/2019 17:47:24 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[BindIP](
	[UserIP] [VARCHAR](50) NOT NULL,
	[GameID] [INT] NOT NULL,
	[CollectDate] [DATETIME] NOT NULL
) ON [PRIMARY]

GO

/****** Object:  Table [dbo].[AccountsOnlineTime]    Script Date: 2018/6/21 14:38:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountsDayPlayTime](
	[DateID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[DayPlayTimeCount] [int] NOT NULL,
	[CollectDate] [datetime] NOT NULL,
 CONSTRAINT [PK_AccountsDayPlayTime] PRIMARY KEY CLUSTERED 
(
	[DateID] ASC,
	[UserID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[AccountsDayPlayTime] ADD  CONSTRAINT [DF_AccountsDayPlayTime_DateID]  DEFAULT ((0)) FOR [DateID]
GO
ALTER TABLE [dbo].[AccountsDayPlayTime] ADD  CONSTRAINT [DF_AccountsDayPlayTime_UserID]  DEFAULT ((0)) FOR [UserID]
GO
ALTER TABLE [dbo].[AccountsDayPlayTime] ADD  CONSTRAINT [DF_AccountsDayPlayTime_DayPlayTimeCount]  DEFAULT ((0)) FOR [DayPlayTimeCount]
GO
ALTER TABLE [dbo].[AccountsDayPlayTime] ADD  CONSTRAINT [DF_AccountsDayPlayTime_CollectDate]  DEFAULT (getdate()) FOR [CollectDate]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'日期标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccountsDayPlayTime', @level2type=N'COLUMN',@level2name=N'DateID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccountsDayPlayTime', @level2type=N'COLUMN',@level2name=N'UserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'游戏时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccountsDayPlayTime', @level2type=N'COLUMN',@level2name=N'DayPlayTimeCount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AccountsDayPlayTime', @level2type=N'COLUMN',@level2name=N'CollectDate'
GO


SET ANSI_PADDING OFF
GO


/****** Object:  Table [dbo].[GroupAIMember]    Script Date: 2019/12/10 15:28:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GroupAIMember]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[GroupAIMember](
	[GroupID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[PlayStatus] [tinyint] NOT NULL CONSTRAINT [DF_GroupAIMember_Status]  DEFAULT ((0)),
	[KindID] [smallint] NOT NULL CONSTRAINT [DF_GroupAIMember_KindID]  DEFAULT ((0))
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[GroupAIParameter]    Script Date: 2019/12/10 15:28:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GroupAIParameter]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[GroupAIParameter](
	[RecordID] [int] IDENTITY(1,1) NOT NULL,
	[GroupID] [int] NOT NULL CONSTRAINT [DF_GroupAIParameter_GroupID]  DEFAULT ((0)),
	[KindID] [int] NOT NULL CONSTRAINT [DF_GroupAIParameter_KindID]  DEFAULT ((0)),
	[AICount] [int] NOT NULL,
	[DistributeTotalScore] [bigint] NOT NULL CONSTRAINT [DF_GroupAIParameter_DistributeTotalScore]  DEFAULT ((0)),
	[PlayingAIRateMin] [int] NOT NULL CONSTRAINT [DF_GroupAIParameter_PlayingAIRateMin]  DEFAULT ((0)),
	[PlayingAIRateMax] [int] NOT NULL CONSTRAINT [DF_GroupAIParameter_PlayingAIRateMax]  DEFAULT ((0)),
	[DistirbuteSingleScore] [bigint] NOT NULL CONSTRAINT [DF_GroupAIParameter_DistirbuteSingleScore]  DEFAULT ((0)),
	[DistirbuteScoreMinRatio] [bigint] NOT NULL CONSTRAINT [DF_GroupAIParameter_DistirbuteScoreMinRatio]  DEFAULT ((0)),
	[DistirbuteScoreMaxRatio] [bigint] NOT NULL CONSTRAINT [DF_GroupAIParameter_DistirbuteScoreMaxRatio]  DEFAULT ((0)),
 CONSTRAINT [PK_GroupAIParameter] PRIMARY KEY NONCLUSTERED 
(
	[RecordID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'GroupAIParameter', N'COLUMN',N'GroupID'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'俱乐部ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GroupAIParameter', @level2type=N'COLUMN',@level2name=N'GroupID'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'GroupAIParameter', N'COLUMN',N'KindID'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'游戏标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GroupAIParameter', @level2type=N'COLUMN',@level2name=N'KindID'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'GroupAIParameter', N'COLUMN',N'AICount'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'AI总数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GroupAIParameter', @level2type=N'COLUMN',@level2name=N'AICount'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'GroupAIParameter', N'COLUMN',N'DistributeTotalScore'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分配给AI的总财富' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GroupAIParameter', @level2type=N'COLUMN',@level2name=N'DistributeTotalScore'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'GroupAIParameter', N'COLUMN',N'PlayingAIRateMin'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'进入俱乐部且参与游戏的AI最小比例' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GroupAIParameter', @level2type=N'COLUMN',@level2name=N'PlayingAIRateMin'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'GroupAIParameter', N'COLUMN',N'PlayingAIRateMax'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'进入俱乐部且参与游戏的AI最大比例' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GroupAIParameter', @level2type=N'COLUMN',@level2name=N'PlayingAIRateMax'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'GroupAIParameter', N'COLUMN',N'DistirbuteSingleScore'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分配给单个AI的财富值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GroupAIParameter', @level2type=N'COLUMN',@level2name=N'DistirbuteSingleScore'
GO