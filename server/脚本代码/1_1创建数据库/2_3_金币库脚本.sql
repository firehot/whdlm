USE [WHQJTreasureDB]
GO

/****** Object:  Table [dbo].[CurrencyExchConfig]    Script Date: 2017/9/13 17:20:20 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[CurrencyExchConfig](
	[ConfigID] [int] IDENTITY(1,1) NOT NULL,
	[ConfigName] [nvarchar](50) NOT NULL,
	[Diamond] [int] NOT NULL,
	[ExchGold] [bigint] NOT NULL,
	[ImageType] [tinyint] NOT NULL,
	[SortID] [int] NOT NULL,
	[ConfigTime] [datetime] NOT NULL,
 CONSTRAINT [PK_CurrencyExchConfig] PRIMARY KEY CLUSTERED 
(
	[ConfigID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[CurrencyExchConfig] ADD  CONSTRAINT [DF_CurrencyExchConfig_ConfigName]  DEFAULT ('') FOR [ConfigName]
GO

ALTER TABLE [dbo].[CurrencyExchConfig] ADD  CONSTRAINT [DF_CurrencyExchConfig_Diamond]  DEFAULT ((0)) FOR [Diamond]
GO

ALTER TABLE [dbo].[CurrencyExchConfig] ADD  CONSTRAINT [DF_CurrencyExchConfig_ExchGold]  DEFAULT ((0)) FOR [ExchGold]
GO

ALTER TABLE [dbo].[CurrencyExchConfig] ADD  CONSTRAINT [DF_CurrencyExchConfig_ImageType]  DEFAULT ((0)) FOR [ImageType]
GO

ALTER TABLE [dbo].[CurrencyExchConfig] ADD  CONSTRAINT [DF_CurrencyExchConfig_SortID]  DEFAULT ((0)) FOR [SortID]
GO

ALTER TABLE [dbo].[CurrencyExchConfig] ADD  CONSTRAINT [DF_CurrencyExchConfig_ConfigTime]  DEFAULT (getdate()) FOR [ConfigTime]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'配置标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CurrencyExchConfig', @level2type=N'COLUMN',@level2name=N'ConfigID'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'配置名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CurrencyExchConfig', @level2type=N'COLUMN',@level2name=N'ConfigName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'兑换的钻石数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CurrencyExchConfig', @level2type=N'COLUMN',@level2name=N'Diamond'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'钻石兑换金币数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CurrencyExchConfig', @level2type=N'COLUMN',@level2name=N'ExchGold'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'图片资源类型（1、2、3、4）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CurrencyExchConfig', @level2type=N'COLUMN',@level2name=N'ImageType'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CurrencyExchConfig', @level2type=N'COLUMN',@level2name=N'SortID'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'配置时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CurrencyExchConfig', @level2type=N'COLUMN',@level2name=N'ConfigTime'
GO

/****** Object:  Table [dbo].[SpreadConfig]    Script Date: 2017/7/17 16:01:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SpreadConfig](
	[ConfigID] [int] IDENTITY(1,1) NOT NULL,
	[SpreadNum] [int] NOT NULL,
	[PresentDiamond] [int] NOT NULL,
	[PresentPropID] [int] NOT NULL,
	[PresentPropName] [nvarchar](32) NOT NULL,
	[PresentPropNum] [int] NOT NULL,
	[UpdateTime] [datetime] NOT NULL,
 CONSTRAINT [PK_SpreadConfig] PRIMARY KEY CLUSTERED 
(
	[ConfigID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SpreadConfig] ADD  CONSTRAINT [DF_SpreadConfig_SpreadNum]  DEFAULT ((0)) FOR [SpreadNum]
GO
ALTER TABLE [dbo].[SpreadConfig] ADD  CONSTRAINT [DF_SpreadConfig_PresentDiamond]  DEFAULT ((0)) FOR [PresentDiamond]
GO
ALTER TABLE [dbo].[SpreadConfig] ADD  CONSTRAINT [DF_SpreadConfig_PresentPropID]  DEFAULT ((0)) FOR [PresentPropID]
GO
ALTER TABLE [dbo].[SpreadConfig] ADD  CONSTRAINT [DF_SpreadConfig_PresentPropName]  DEFAULT ('') FOR [PresentPropName]
GO
ALTER TABLE [dbo].[SpreadConfig] ADD  CONSTRAINT [DF_SpreadConfig_PresentPropNum]  DEFAULT ((0)) FOR [PresentPropNum]
GO
ALTER TABLE [dbo].[SpreadConfig] ADD  CONSTRAINT [DF_SpreadConfig_UpdateTime]  DEFAULT (getdate()) FOR [UpdateTime]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'配置标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SpreadConfig', @level2type=N'COLUMN',@level2name=N'ConfigID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'推广人数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SpreadConfig', @level2type=N'COLUMN',@level2name=N'SpreadNum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'赠送钻石' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SpreadConfig', @level2type=N'COLUMN',@level2name=N'PresentDiamond'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'赠送道具标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SpreadConfig', @level2type=N'COLUMN',@level2name=N'PresentPropID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'赠送道具名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SpreadConfig', @level2type=N'COLUMN',@level2name=N'PresentPropName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'赠送道具数量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SpreadConfig', @level2type=N'COLUMN',@level2name=N'PresentPropNum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SpreadConfig', @level2type=N'COLUMN',@level2name=N'UpdateTime'
GO

/****** Object:  Table [dbo].[RecordSpreadAward]    Script Date: 2017/7/17 16:01:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RecordSpreadAward](
	[RecordID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[UserNum] [int] NOT NULL,
	[ConfigID] [int] NOT NULL,
	[SpreadNum] [int] NOT NULL,
	[CurrentDiamond] [bigint] NOT NULL,
	[PresentDiamond] [int] NOT NULL,
	[PresentPropID] [int] NOT NULL,
	[PresentPropName] [nvarchar](32) NOT NULL,
	[PresentPropNum] [int] NOT NULL,
	[ClientIP] [nvarchar](15) NOT NULL,
	[CollectDate] [datetime] NOT NULL,
 CONSTRAINT [PK_RecordSpreadAward] PRIMARY KEY CLUSTERED 
(
	[RecordID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[RecordSpreadAward] ADD  CONSTRAINT [DF_RecordSpreadAward_UserID]  DEFAULT ((0)) FOR [UserID]
GO
ALTER TABLE [dbo].[RecordSpreadAward] ADD  CONSTRAINT [DF_RecordSpreadAward_UserNum]  DEFAULT ((0)) FOR [UserNum]
GO
ALTER TABLE [dbo].[RecordSpreadAward] ADD  CONSTRAINT [DF_RecordSpreadAward_ConfigID]  DEFAULT ((0)) FOR [ConfigID]
GO
ALTER TABLE [dbo].[RecordSpreadAward] ADD  CONSTRAINT [DF_RecordSpreadAward_SpreadNum]  DEFAULT ((0)) FOR [SpreadNum]
GO
ALTER TABLE [dbo].[RecordSpreadAward] ADD  CONSTRAINT [DF_RecordSpreadAward_CurrentDiamond]  DEFAULT ((0)) FOR [CurrentDiamond]
GO
ALTER TABLE [dbo].[RecordSpreadAward] ADD  CONSTRAINT [DF_RecordSpreadAward_PresentDiamond]  DEFAULT ((0)) FOR [PresentDiamond]
GO
ALTER TABLE [dbo].[RecordSpreadAward] ADD  CONSTRAINT [DF_RecordSpreadAward_PresentPropID]  DEFAULT ((0)) FOR [PresentPropID]
GO
ALTER TABLE [dbo].[RecordSpreadAward] ADD  CONSTRAINT [DF_RecordSpreadAward_PresentPropName]  DEFAULT ('') FOR [PresentPropName]
GO
ALTER TABLE [dbo].[RecordSpreadAward] ADD  CONSTRAINT [DF_RecordSpreadAward_PresentPropNum]  DEFAULT ((0)) FOR [PresentPropNum]
GO
ALTER TABLE [dbo].[RecordSpreadAward] ADD  CONSTRAINT [DF_RecordSpreadAward_ClientIP]  DEFAULT ('') FOR [ClientIP]
GO
ALTER TABLE [dbo].[RecordSpreadAward] ADD  CONSTRAINT [DF_RecordSpreadAward_CollectDate]  DEFAULT (getdate()) FOR [CollectDate]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordSpreadAward', @level2type=N'COLUMN',@level2name=N'UserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户有效好友数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordSpreadAward', @level2type=N'COLUMN',@level2name=N'UserNum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'领取配置标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordSpreadAward', @level2type=N'COLUMN',@level2name=N'ConfigID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'有效好友数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordSpreadAward', @level2type=N'COLUMN',@level2name=N'SpreadNum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'领取前钻石' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordSpreadAward', @level2type=N'COLUMN',@level2name=N'CurrentDiamond'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'赠送钻石' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordSpreadAward', @level2type=N'COLUMN',@level2name=N'PresentDiamond'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'赠送道具标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordSpreadAward', @level2type=N'COLUMN',@level2name=N'PresentPropID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'赠送道家名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordSpreadAward', @level2type=N'COLUMN',@level2name=N'PresentPropName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'赠送道具数量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordSpreadAward', @level2type=N'COLUMN',@level2name=N'PresentPropNum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'领取地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordSpreadAward', @level2type=N'COLUMN',@level2name=N'ClientIP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'领取时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordSpreadAward', @level2type=N'COLUMN',@level2name=N'CollectDate'
GO
/****** Object:  Table [dbo].[RecordAccountsUmeng]    Script Date: 2017/7/17 15:57:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RecordAccountsUmeng](
	[RecordID] [bigint] IDENTITY(1,1) NOT NULL,
	[MasterID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[PushType] [tinyint] NOT NULL,
	[PushContent] [nvarchar](500) NOT NULL,
	[PushTime] [datetime] NOT NULL,
	[PushIP] [nvarchar](15) NOT NULL,
 CONSTRAINT [PK_RecordAccountsUmeng] PRIMARY KEY CLUSTERED 
(
	[RecordID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[RecordAccountsUmeng] ADD  CONSTRAINT [DF_RecordAccountsUmeng_MasterID]  DEFAULT ((0)) FOR [MasterID]
GO
ALTER TABLE [dbo].[RecordAccountsUmeng] ADD  CONSTRAINT [DF_RecordAccountsUmeng_UserID]  DEFAULT ((0)) FOR [UserID]
GO
ALTER TABLE [dbo].[RecordAccountsUmeng] ADD  CONSTRAINT [DF_RecordAccountsUmeng_PushType]  DEFAULT ((0)) FOR [PushType]
GO
ALTER TABLE [dbo].[RecordAccountsUmeng] ADD  CONSTRAINT [DF_RecordAccountsUmeng_PushContent]  DEFAULT ('') FOR [PushContent]
GO
ALTER TABLE [dbo].[RecordAccountsUmeng] ADD  CONSTRAINT [DF_RecordAccountsUmeng_PushTime]  DEFAULT (getdate()) FOR [PushTime]
GO
ALTER TABLE [dbo].[RecordAccountsUmeng] ADD  CONSTRAINT [DF_RecordAccountsUmeng_PushIP]  DEFAULT ('') FOR [PushIP]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'操作管理员' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordAccountsUmeng', @level2type=N'COLUMN',@level2name=N'MasterID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'推送用户' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordAccountsUmeng', @level2type=N'COLUMN',@level2name=N'UserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'推送类型（）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordAccountsUmeng', @level2type=N'COLUMN',@level2name=N'PushType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'推送内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordAccountsUmeng', @level2type=N'COLUMN',@level2name=N'PushContent'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'推送时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordAccountsUmeng', @level2type=N'COLUMN',@level2name=N'PushTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'推送地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordAccountsUmeng', @level2type=N'COLUMN',@level2name=N'PushIP'
GO
/****** Object:  Table [dbo].[OnLinePayOrder]    Script Date: 2017/7/17 16:00:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OnLinePayOrder](
	[OnLineID] [int] IDENTITY(1,1) NOT NULL,
	[ConfigID] [int] NOT NULL,
	[ShareID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[GameID] [int] NOT NULL,
	[Accounts] [nvarchar](31) NOT NULL,
	[NickName] [nvarchar](31) NOT NULL,
	[OrderID] [nvarchar](32) NOT NULL,
	[OrderType] [tinyint] NOT NULL,
	[Amount] [decimal](18, 2) NOT NULL,
	[Score] [int] NOT NULL,
	[ScoreType] [tinyint] NOT NULL,
	[OtherPresent] [int] NOT NULL,
	[OrderStatus] [tinyint] NOT NULL,
	[OrderDate] [datetime] NOT NULL,
	[OrderAddress] [nvarchar](15) NOT NULL,
	[BeforeScore] [bigint] NULL,
	[PayDate] [datetime] NULL,
	[PayAddress] [nvarchar](15) NULL,
 CONSTRAINT [PK_OnLinePayOrder] PRIMARY KEY CLUSTERED 
(
	[OnLineID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[OnLinePayOrder] ADD  CONSTRAINT [DF_OnLinePayOrder_ConfigID]  DEFAULT ((0)) FOR [ConfigID]
GO

ALTER TABLE [dbo].[OnLinePayOrder] ADD  CONSTRAINT [DF_OnLinePayOrder_ShareID]  DEFAULT ((100)) FOR [ShareID]
GO

ALTER TABLE [dbo].[OnLinePayOrder] ADD  CONSTRAINT [DF_OnLinePayOrder_UserID]  DEFAULT ((0)) FOR [UserID]
GO

ALTER TABLE [dbo].[OnLinePayOrder] ADD  CONSTRAINT [DF_OnLinePayOrder_GameID]  DEFAULT ((0)) FOR [GameID]
GO

ALTER TABLE [dbo].[OnLinePayOrder] ADD  CONSTRAINT [DF_OnLinePayOrder_Accounts]  DEFAULT ('') FOR [Accounts]
GO

ALTER TABLE [dbo].[OnLinePayOrder] ADD  CONSTRAINT [DF_OnLinePayOrder_NickName]  DEFAULT ('') FOR [NickName]
GO

ALTER TABLE [dbo].[OnLinePayOrder] ADD  CONSTRAINT [DF_OnLinePayOrder_OrderID]  DEFAULT ('') FOR [OrderID]
GO

ALTER TABLE [dbo].[OnLinePayOrder] ADD  CONSTRAINT [DF_OnLinePayOrder_OrderType]  DEFAULT ((0)) FOR [OrderType]
GO

ALTER TABLE [dbo].[OnLinePayOrder] ADD  CONSTRAINT [DF_OnLinePayOrder_Amount]  DEFAULT ((0)) FOR [Amount]
GO

ALTER TABLE [dbo].[OnLinePayOrder] ADD  CONSTRAINT [DF_OnLinePayOrder_Diamond]  DEFAULT ((0)) FOR [Score]
GO

ALTER TABLE [dbo].[OnLinePayOrder] ADD  CONSTRAINT [DF_OnLinePayOrder_PresentScale]  DEFAULT ((0)) FOR [ScoreType]
GO

ALTER TABLE [dbo].[OnLinePayOrder] ADD  CONSTRAINT [DF_OnLinePayOrder_OtherPresent]  DEFAULT ((0)) FOR [OtherPresent]
GO

ALTER TABLE [dbo].[OnLinePayOrder] ADD  CONSTRAINT [DF_OnLinePayOrder_OrderStatus]  DEFAULT ((0)) FOR [OrderStatus]
GO

ALTER TABLE [dbo].[OnLinePayOrder] ADD  CONSTRAINT [DF_OnLinePayOrder_CollectDate]  DEFAULT (getdate()) FOR [OrderDate]
GO

ALTER TABLE [dbo].[OnLinePayOrder] ADD  CONSTRAINT [DF_OnLinePayOrder_ClientIP]  DEFAULT ('') FOR [OrderAddress]
GO

ALTER TABLE [dbo].[OnLinePayOrder] ADD  CONSTRAINT [DF_OnLinePayOrder_BeforeScore]  DEFAULT ((0)) FOR [BeforeScore]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'订单标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OnLinePayOrder', @level2type=N'COLUMN',@level2name=N'OnLineID'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'充值配置标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OnLinePayOrder', @level2type=N'COLUMN',@level2name=N'ConfigID'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'充值方式（100 微信支付  101 微信APP  102 微信H5  200  支付宝  201 支付宝APP 202 支付宝H5）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OnLinePayOrder', @level2type=N'COLUMN',@level2name=N'ShareID'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OnLinePayOrder', @level2type=N'COLUMN',@level2name=N'UserID'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'游戏标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OnLinePayOrder', @level2type=N'COLUMN',@level2name=N'GameID'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户账号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OnLinePayOrder', @level2type=N'COLUMN',@level2name=N'Accounts'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户昵称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OnLinePayOrder', @level2type=N'COLUMN',@level2name=N'NickName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'订单号码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OnLinePayOrder', @level2type=N'COLUMN',@level2name=N'OrderID'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'订单类型（0 普通充值  1 苹果充值）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OnLinePayOrder', @level2type=N'COLUMN',@level2name=N'OrderType'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'订单金额' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OnLinePayOrder', @level2type=N'COLUMN',@level2name=N'Amount'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'充值货币' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OnLinePayOrder', @level2type=N'COLUMN',@level2name=N'Score'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'充值类型（0、游戏币  1、钻石  2、游戏豆）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OnLinePayOrder', @level2type=N'COLUMN',@level2name=N'ScoreType'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'充值额外赠送钻石数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OnLinePayOrder', @level2type=N'COLUMN',@level2name=N'OtherPresent'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'订单状态（0 未支付  1 已支付  2 已到账）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OnLinePayOrder', @level2type=N'COLUMN',@level2name=N'OrderStatus'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'订单时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OnLinePayOrder', @level2type=N'COLUMN',@level2name=N'OrderDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'订单地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OnLinePayOrder', @level2type=N'COLUMN',@level2name=N'OrderAddress'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'支付前货币数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OnLinePayOrder', @level2type=N'COLUMN',@level2name=N'BeforeScore'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'付款时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OnLinePayOrder', @level2type=N'COLUMN',@level2name=N'PayDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'付款地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OnLinePayOrder', @level2type=N'COLUMN',@level2name=N'PayAddress'
GO

/****** Object:  Table [dbo].[AppPayConfig]    Script Date: 2017/7/17 16:00:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AppPayConfig](
	[ConfigID] [int] IDENTITY(1,1) NOT NULL,
	[AppleID] [nvarchar](32) NOT NULL,
	[PayName] [nvarchar](32) NOT NULL,
	[PayType] [tinyint] NOT NULL,
	[PayPrice] [decimal](18, 2) NOT NULL,
	[PayIdentity] [tinyint] NOT NULL,
	[ImageType] [tinyint] NOT NULL,
	[SortID] [int] NOT NULL,
	[Score] [int] NOT NULL,
	[ScoreType] [tinyint] NOT NULL,
	[FristPresent] [int] NOT NULL,
	[PresentScore] [int] NOT NULL,
	[ConfigTime] [datetime] NOT NULL,
 CONSTRAINT [PK_AppPayConfig] PRIMARY KEY CLUSTERED 
(
	[ConfigID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[AppPayConfig] ADD  CONSTRAINT [DF_AppPayConfig_AppleID]  DEFAULT ('') FOR [AppleID]
GO

ALTER TABLE [dbo].[AppPayConfig] ADD  CONSTRAINT [DF_AppPayConfig_PayName]  DEFAULT ('') FOR [PayName]
GO

ALTER TABLE [dbo].[AppPayConfig] ADD  CONSTRAINT [DF_AppPayConfig_PayType]  DEFAULT ((0)) FOR [PayType]
GO

ALTER TABLE [dbo].[AppPayConfig] ADD  CONSTRAINT [DF_AppPayConfig_PayPrice]  DEFAULT ((0)) FOR [PayPrice]
GO

ALTER TABLE [dbo].[AppPayConfig] ADD  CONSTRAINT [DF_AppPayConfig_IsHot]  DEFAULT ((0)) FOR [PayIdentity]
GO

ALTER TABLE [dbo].[AppPayConfig] ADD  CONSTRAINT [DF_AppPayConfig_ImageType]  DEFAULT ((0)) FOR [ImageType]
GO

ALTER TABLE [dbo].[AppPayConfig] ADD  CONSTRAINT [DF_AppPayConfig_SortID]  DEFAULT ((0)) FOR [SortID]
GO

ALTER TABLE [dbo].[AppPayConfig] ADD  CONSTRAINT [DF_AppPayConfig_Score]  DEFAULT ((0)) FOR [Score]
GO

ALTER TABLE [dbo].[AppPayConfig] ADD  CONSTRAINT [DF_AppPayConfig_ScoreType]  DEFAULT ((0)) FOR [ScoreType]
GO

ALTER TABLE [dbo].[AppPayConfig] ADD  CONSTRAINT [DF_AppPayConfig_FristPresent]  DEFAULT ((0)) FOR [FristPresent]
GO

ALTER TABLE [dbo].[AppPayConfig] ADD  CONSTRAINT [DF_AppPayConfig_PresentScore]  DEFAULT ((0)) FOR [PresentScore]
GO

ALTER TABLE [dbo].[AppPayConfig] ADD  CONSTRAINT [DF_AppPayConfig_ConfigTime]  DEFAULT (getdate()) FOR [ConfigTime]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'充值标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AppPayConfig', @level2type=N'COLUMN',@level2name=N'ConfigID'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'苹果充值标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AppPayConfig', @level2type=N'COLUMN',@level2name=N'AppleID'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'充值产品名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AppPayConfig', @level2type=N'COLUMN',@level2name=N'PayName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'充值产品类型（0 普通  1 苹果）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AppPayConfig', @level2type=N'COLUMN',@level2name=N'PayType'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'充值产品价格' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AppPayConfig', @level2type=N'COLUMN',@level2name=N'PayPrice'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'充值标志（0 普通  1 推荐  2  首充）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AppPayConfig', @level2type=N'COLUMN',@level2name=N'PayIdentity'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'图片资源类型（1、2、3、4）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AppPayConfig', @level2type=N'COLUMN',@level2name=N'ImageType'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AppPayConfig', @level2type=N'COLUMN',@level2name=N'SortID'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'充值获取货币值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AppPayConfig', @level2type=N'COLUMN',@level2name=N'Score'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'充值类型（0、游戏币  1、钻石  2、游戏豆）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AppPayConfig', @level2type=N'COLUMN',@level2name=N'ScoreType'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'首冲赠送货币' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AppPayConfig', @level2type=N'COLUMN',@level2name=N'FristPresent'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'普通充值额外赠送' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AppPayConfig', @level2type=N'COLUMN',@level2name=N'PresentScore'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'配置时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AppPayConfig', @level2type=N'COLUMN',@level2name=N'ConfigTime'
GO
/****** Object:  Table [dbo].[UserGameInfo_Line]    Script Date: 05/19/2017 17:43:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserGameInfo_Line](
	[DateID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[LineGrandTotal] [bigint] NOT NULL,
	[LineWinMax] [bigint] NOT NULL,
	[LastModifyDate] [datetime] NOT NULL,
 CONSTRAINT [PK_UserGameInfo_Line] PRIMARY KEY CLUSTERED 
(
	[DateID] ASC,
	[UserID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'日期标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UserGameInfo_Line', @level2type=N'COLUMN',@level2name=N'DateID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UserGameInfo_Line', @level2type=N'COLUMN',@level2name=N'UserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'总局数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UserGameInfo_Line', @level2type=N'COLUMN',@level2name=N'LineGrandTotal'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'单次最高' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UserGameInfo_Line', @level2type=N'COLUMN',@level2name=N'LineWinMax'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UserGameInfo_Line', @level2type=N'COLUMN',@level2name=N'LastModifyDate'
GO
/****** Object:  Table [dbo].[UserGameInfo]    Script Date: 05/19/2017 17:43:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserGameInfo](
	[UserID] [int] NOT NULL,
	[KindID] [int] NOT NULL,
	[UserGameData] [nvarchar](1024) NOT NULL,
	[LineGrandTotal] [int] NOT NULL,
	[LineWinMax] [int] NOT NULL,
	[LastModifyDate] [datetime] NOT NULL,
 CONSTRAINT [PK_UserGameData] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC,
	[KindID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UserGameInfo', @level2type=N'COLUMN',@level2name=N'UserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'游戏标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UserGameInfo', @level2type=N'COLUMN',@level2name=N'KindID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'游戏数据（Index:Value;）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UserGameInfo', @level2type=N'COLUMN',@level2name=N'UserGameData'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'三九连线：总赢局' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UserGameInfo', @level2type=N'COLUMN',@level2name=N'LineGrandTotal'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'三九连线：单次最高' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UserGameInfo', @level2type=N'COLUMN',@level2name=N'LineWinMax'
GO
/****** Object:  Table [dbo].[TransferReturnStream]    Script Date: 05/19/2017 17:43:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TransferReturnStream](
	[UserID] [int] NOT NULL,
	[ReturnUserMedal] [bigint] NOT NULL,
	[ReturnLoveLiness] [bigint] NOT NULL,
	[LastReturnTime] [datetime] NOT NULL,
 CONSTRAINT [PK_TransferReturnStream] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TransferReturnStream', @level2type=N'COLUMN',@level2name=N'UserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'返利元宝总数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TransferReturnStream', @level2type=N'COLUMN',@level2name=N'ReturnUserMedal'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'返利魅力总数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TransferReturnStream', @level2type=N'COLUMN',@level2name=N'ReturnLoveLiness'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最后返利时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TransferReturnStream', @level2type=N'COLUMN',@level2name=N'LastReturnTime'
GO
/****** Object:  Table [dbo].[TransferReturnDetailInfo]    Script Date: 05/19/2017 17:43:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TransferReturnDetailInfo](
	[RecordID] [int] IDENTITY(1,1) NOT NULL,
	[SourceUserID] [int] NOT NULL,
	[TargetUserID] [int] NOT NULL,
	[SwapScore] [bigint] NOT NULL,
	[Revenue] [bigint] NOT NULL,
	[ReturnType] [tinyint] NOT NULL,
	[ReturnPercent] [int] NOT NULL,
	[ReturnDescribe] [nvarchar](32) NOT NULL,
	[ReturnUserMedal] [int] NOT NULL,
	[ReturnLoveLiness] [int] NOT NULL,
	[IsReturn] [bit] NOT NULL,
	[CollectDate] [datetime] NOT NULL,
 CONSTRAINT [PK_TransferReturnDetailInfo] PRIMARY KEY CLUSTERED 
(
	[RecordID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'转账用户标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TransferReturnDetailInfo', @level2type=N'COLUMN',@level2name=N'SourceUserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'目标用户' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TransferReturnDetailInfo', @level2type=N'COLUMN',@level2name=N'TargetUserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'转账金额' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TransferReturnDetailInfo', @level2type=N'COLUMN',@level2name=N'SwapScore'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'服务比例' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TransferReturnDetailInfo', @level2type=N'COLUMN',@level2name=N'Revenue'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'返利类型（0 元宝 1魅力值）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TransferReturnDetailInfo', @level2type=N'COLUMN',@level2name=N'ReturnType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'返利百分比' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TransferReturnDetailInfo', @level2type=N'COLUMN',@level2name=N'ReturnPercent'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'返利描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TransferReturnDetailInfo', @level2type=N'COLUMN',@level2name=N'ReturnDescribe'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'返利元宝数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TransferReturnDetailInfo', @level2type=N'COLUMN',@level2name=N'ReturnUserMedal'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'返利魅力值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TransferReturnDetailInfo', @level2type=N'COLUMN',@level2name=N'ReturnLoveLiness'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否返利到账（0 未到账  1已到账）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TransferReturnDetailInfo', @level2type=N'COLUMN',@level2name=N'IsReturn'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'插入时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TransferReturnDetailInfo', @level2type=N'COLUMN',@level2name=N'CollectDate'
GO
/****** Object:  Table [dbo].[TransferReturnConfig]    Script Date: 05/19/2017 17:43:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TransferReturnConfig](
	[ConfigID] [int] IDENTITY(1,1) NOT NULL,
	[ReturnType] [tinyint] NOT NULL,
	[ReturnPercent] [int] NOT NULL,
	[ConfigDescribe] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_TransferReturnConfig] PRIMARY KEY CLUSTERED 
(
	[ConfigID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'配置标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TransferReturnConfig', @level2type=N'COLUMN',@level2name=N'ConfigID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'返回类型（0、元宝  1、魅力值）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TransferReturnConfig', @level2type=N'COLUMN',@level2name=N'ReturnType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'返还百分比（实际值需要除以100）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TransferReturnConfig', @level2type=N'COLUMN',@level2name=N'ReturnPercent'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'配置描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TransferReturnConfig', @level2type=N'COLUMN',@level2name=N'ConfigDescribe'
GO
/****** Object:  Table [dbo].[SystemStreamInfo]    Script Date: 05/19/2017 17:43:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SystemStreamInfo](
	[DateID] [int] NOT NULL,
	[KindID] [int] NOT NULL,
	[ServerID] [int] NOT NULL,
	[LogonCount] [int] NOT NULL,
	[RegisterCount] [int] NOT NULL,
	[CollectDate] [datetime] NOT NULL,
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
/****** Object:  Table [dbo].[StreamShareInfo]    Script Date: 05/19/2017 17:43:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StreamShareInfo](
	[DateID] [int] NOT NULL,
	[ShareID] [int] NOT NULL,
	[ShareTotals] [int] NOT NULL,
	[CollectDate] [datetime] NOT NULL,
 CONSTRAINT [PK_StreamShareInfo] PRIMARY KEY CLUSTERED 
(
	[DateID] ASC,
	[ShareID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StreamScoreInfo]    Script Date: 05/19/2017 17:43:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StreamScoreInfo](
	[DateID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[WinCount] [int] NOT NULL,
	[LostCount] [int] NOT NULL,
	[Score][bigint] NOT NULL,
	[Revenue] [bigint] NOT NULL,
	[ChipSerialScore] [bigint] NOT NULL,
	[PlayTimeCount] [int] NOT NULL,
	[OnlineTimeCount] [int] NOT NULL,
	[FirstCollectDate] [datetime] NOT NULL,
	[LastCollectDate] [datetime] NOT NULL,
 CONSTRAINT [PK_StreamScoreInfo] PRIMARY KEY CLUSTERED 
(
	[DateID] ASC,
	[UserID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'日期标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StreamScoreInfo', @level2type=N'COLUMN',@level2name=N'DateID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StreamScoreInfo', @level2type=N'COLUMN',@level2name=N'UserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'总输赢' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StreamScoreInfo', @level2type=N'COLUMN',@level2name=N'Score'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'服务比例' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StreamScoreInfo', @level2type=N'COLUMN',@level2name=N'Revenue'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户流水' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StreamScoreInfo', @level2type=N'COLUMN',@level2name=N'ChipSerialScore'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'游戏时长' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StreamScoreInfo', @level2type=N'COLUMN',@level2name=N'PlayTimeCount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'在线时长' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StreamScoreInfo', @level2type=N'COLUMN',@level2name=N'OnlineTimeCount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'开始统计时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StreamScoreInfo', @level2type=N'COLUMN',@level2name=N'FirstCollectDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最后统计时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StreamScoreInfo', @level2type=N'COLUMN',@level2name=N'LastCollectDate'
GO
/****** Object:  Table [dbo].[StreamPresentInfo]    Script Date: 05/19/2017 17:43:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StreamPresentInfo](
	[DateID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[TypeID] [int] NOT NULL,
	[PresentCount] [int] NOT NULL,
	[PresentScore] [int] NOT NULL,
	[FirstDate] [datetime] NOT NULL,
	[LastDate] [datetime] NOT NULL,
 CONSTRAINT [PK_StreamPresentInfo] PRIMARY KEY CLUSTERED 
(
	[DateID] ASC,
	[UserID] ASC,
	[TypeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'日期标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StreamPresentInfo', @level2type=N'COLUMN',@level2name=N'DateID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StreamPresentInfo', @level2type=N'COLUMN',@level2name=N'UserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1:注册赠送,2:低保赠送,3:签到赠送,4:元宝兑换,5:魅力兑换,6:在线时长赠送,7:任务奖励 8:实名验证 9:会员每日送金 10比赛奖励 11等级升级 12 分享赠送  13 代理注册赠送  14 转盘赠送' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StreamPresentInfo', @level2type=N'COLUMN',@level2name=N'TypeID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'赠送次数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StreamPresentInfo', @level2type=N'COLUMN',@level2name=N'PresentCount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'赠送金币' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StreamPresentInfo', @level2type=N'COLUMN',@level2name=N'PresentScore'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'开始时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StreamPresentInfo', @level2type=N'COLUMN',@level2name=N'FirstDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'结束时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StreamPresentInfo', @level2type=N'COLUMN',@level2name=N'LastDate'
GO
/****** Object:  Table [dbo].[StreamPlayPresent]    Script Date: 05/19/2017 17:43:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StreamPlayPresent](
	[DateID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[PresentCount] [int] NOT NULL,
	[PresentScore] [int] NOT NULL,
	[PlayTimeCount] [int] NOT NULL,
	[OnLineTimeCount] [int] NOT NULL,
	[FirstDate] [datetime] NOT NULL,
	[LastDate] [datetime] NOT NULL,
 CONSTRAINT [PK_StreamPlayPresent] PRIMARY KEY CLUSTERED 
(
	[DateID] ASC,
	[UserID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'时间标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StreamPlayPresent', @level2type=N'COLUMN',@level2name=N'DateID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StreamPlayPresent', @level2type=N'COLUMN',@level2name=N'UserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'赠送次数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StreamPlayPresent', @level2type=N'COLUMN',@level2name=N'PresentCount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'游戏泡分总数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StreamPlayPresent', @level2type=N'COLUMN',@level2name=N'PresentScore'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'游戏时长' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StreamPlayPresent', @level2type=N'COLUMN',@level2name=N'PlayTimeCount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'在线时长' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StreamPlayPresent', @level2type=N'COLUMN',@level2name=N'OnLineTimeCount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'开始统计时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StreamPlayPresent', @level2type=N'COLUMN',@level2name=N'FirstDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最后统计时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StreamPlayPresent', @level2type=N'COLUMN',@level2name=N'LastDate'
GO
/****** Object:  Table [dbo].[StreamAgentPayInfo]    Script Date: 05/19/2017 17:43:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StreamAgentPayInfo](
	[DateID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[PayAmount] [decimal](18, 2) NOT NULL,
	[Currency] [decimal](18, 2) NOT NULL,
	[PayScore] [bigint] NOT NULL,
	[FirstCollectDate] [datetime] NOT NULL,
	[LastCollectDate] [datetime] NOT NULL,
 CONSTRAINT [PK_StreamAgentPayInfo] PRIMARY KEY CLUSTERED 
(
	[DateID] ASC,
	[UserID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'日期标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StreamAgentPayInfo', @level2type=N'COLUMN',@level2name=N'DateID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'代理用户标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StreamAgentPayInfo', @level2type=N'COLUMN',@level2name=N'UserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'充值金额' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StreamAgentPayInfo', @level2type=N'COLUMN',@level2name=N'PayAmount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'充值元宝' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StreamAgentPayInfo', @level2type=N'COLUMN',@level2name=N'Currency'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'充值金币' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StreamAgentPayInfo', @level2type=N'COLUMN',@level2name=N'PayScore'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'开始充值时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StreamAgentPayInfo', @level2type=N'COLUMN',@level2name=N'FirstCollectDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'结束充值时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StreamAgentPayInfo', @level2type=N'COLUMN',@level2name=N'LastCollectDate'
GO
/****** Object:  Table [dbo].[ShareDetailInfo]    Script Date: 05/19/2017 17:43:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShareDetailInfo](
	[DetailID] [int] IDENTITY(1,1) NOT NULL,
	[OperUserID] [int] NOT NULL,
	[ShareID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[GameID] [int] NOT NULL,
	[Accounts] [nvarchar](31) NOT NULL,
	[CardTypeID] [int] NOT NULL,
	[SerialID] [nvarchar](15) NOT NULL,
	[OrderID] [nvarchar](32) NOT NULL,
	[OrderAmount] [decimal](18, 2) NOT NULL,
	[DiscountScale] [decimal](18, 2) NOT NULL,
	[PayAmount] [decimal](18, 2) NOT NULL,
	[Currency] [decimal](18, 2) NOT NULL,
	[BeforeCurrency] [decimal](18, 2) NOT NULL,
	[IPAddress] [nvarchar](15) NOT NULL,
	[ApplyDate] [datetime] NOT NULL,
	[Gold] [int] NOT NULL,
	[BeforeGold] [bigint] NOT NULL,
	[RoomCard] [int] NOT NULL,
	[BeforeRoomCard] [int] NOT NULL,
 CONSTRAINT [PK_ShareOLDetialInfo] PRIMARY KEY CLUSTERED 
(
	[DetailID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'充值标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ShareDetailInfo', @level2type=N'COLUMN',@level2name=N'DetailID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'操作用户' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ShareDetailInfo', @level2type=N'COLUMN',@level2name=N'OperUserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'服务标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ShareDetailInfo', @level2type=N'COLUMN',@level2name=N'ShareID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ShareDetailInfo', @level2type=N'COLUMN',@level2name=N'UserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'游戏ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ShareDetailInfo', @level2type=N'COLUMN',@level2name=N'GameID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ShareDetailInfo', @level2type=N'COLUMN',@level2name=N'Accounts'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'实卡类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ShareDetailInfo', @level2type=N'COLUMN',@level2name=N'CardTypeID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'订单号码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ShareDetailInfo', @level2type=N'COLUMN',@level2name=N'OrderID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'订单金额' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ShareDetailInfo', @level2type=N'COLUMN',@level2name=N'OrderAmount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'折扣比例' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ShareDetailInfo', @level2type=N'COLUMN',@level2name=N'DiscountScale'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'实付金额' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ShareDetailInfo', @level2type=N'COLUMN',@level2name=N'PayAmount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'充值货币' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ShareDetailInfo', @level2type=N'COLUMN',@level2name=N'Currency'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'充值地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ShareDetailInfo', @level2type=N'COLUMN',@level2name=N'IPAddress'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'充值日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ShareDetailInfo', @level2type=N'COLUMN',@level2name=N'ApplyDate'
GO
/****** Object:  Table [dbo].[RoomCardConfig]    Script Date: 05/19/2017 17:43:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoomCardConfig](
	[ConfigID] [int] IDENTITY(1,1) NOT NULL,
	[RoomCard] [int] NOT NULL,
	[Currency] [decimal](18, 2) NOT NULL,
	[Amount] [decimal](18, 2) NOT NULL,
	[SortID] [int] NOT NULL,
	[Nullity] [tinyint] NOT NULL,
	[CollectDate] [datetime] NOT NULL,
 CONSTRAINT [PK_RoomCardConfig] PRIMARY KEY CLUSTERED 
(
	[ConfigID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'配置标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RoomCardConfig', @level2type=N'COLUMN',@level2name=N'ConfigID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'钻石数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RoomCardConfig', @level2type=N'COLUMN',@level2name=N'RoomCard'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'花费游戏豆' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RoomCardConfig', @level2type=N'COLUMN',@level2name=N'Currency'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'支付金额' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RoomCardConfig', @level2type=N'COLUMN',@level2name=N'Amount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RoomCardConfig', @level2type=N'COLUMN',@level2name=N'SortID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否禁用' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RoomCardConfig', @level2type=N'COLUMN',@level2name=N'Nullity'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'配置时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RoomCardConfig', @level2type=N'COLUMN',@level2name=N'CollectDate'
GO
/****** Object:  Table [dbo].[ReturnYPDetailInfo]    Script Date: 05/19/2017 17:43:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReturnYPDetailInfo](
	[DetailID] [int] IDENTITY(1,1) NOT NULL,
	[p1_MerId] [nvarchar](22) NOT NULL,
	[r0_Cmd] [nvarchar](40) NOT NULL,
	[r1_Code] [nvarchar](2) NOT NULL,
	[r2_TrxId] [nvarchar](100) NOT NULL,
	[r3_Amt] [decimal](18, 2) NOT NULL,
	[r4_Cur] [nvarchar](20) NOT NULL,
	[r5_Pid] [nvarchar](40) NOT NULL,
	[r6_Order] [nvarchar](64) NOT NULL,
	[r7_Uid] [nvarchar](100) NOT NULL,
	[r8_MP] [nvarchar](400) NOT NULL,
	[r9_BType] [nchar](2) NOT NULL,
	[rb_BankId] [nvarchar](64) NOT NULL,
	[ro_BankOrderId] [nvarchar](128) NOT NULL,
	[rp_PayDate] [nvarchar](64) NOT NULL,
	[rq_CardNo] [nvarchar](128) NOT NULL,
	[ru_Trxtime] [nvarchar](64) NOT NULL,
	[hmac] [nchar](64) NOT NULL,
	[CollectDate] [datetime] NOT NULL,
 CONSTRAINT [PK_ReturnYPDetailInfo] PRIMARY KEY NONCLUSTERED 
(
	[DetailID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'流水标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReturnYPDetailInfo', @level2type=N'COLUMN',@level2name=N'DetailID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'商户编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReturnYPDetailInfo', @level2type=N'COLUMN',@level2name=N'p1_MerId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'业务类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReturnYPDetailInfo', @level2type=N'COLUMN',@level2name=N'r0_Cmd'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'支付结果' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReturnYPDetailInfo', @level2type=N'COLUMN',@level2name=N'r1_Code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'易宝支付交易流水号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReturnYPDetailInfo', @level2type=N'COLUMN',@level2name=N'r2_TrxId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'支付金额' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReturnYPDetailInfo', @level2type=N'COLUMN',@level2name=N'r3_Amt'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'交易币种' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReturnYPDetailInfo', @level2type=N'COLUMN',@level2name=N'r4_Cur'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'商品名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReturnYPDetailInfo', @level2type=N'COLUMN',@level2name=N'r5_Pid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'商户订单号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReturnYPDetailInfo', @level2type=N'COLUMN',@level2name=N'r6_Order'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'易宝支付会员ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReturnYPDetailInfo', @level2type=N'COLUMN',@level2name=N'r7_Uid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N' 商户扩展信息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReturnYPDetailInfo', @level2type=N'COLUMN',@level2name=N'r8_MP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'交易结果返回类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReturnYPDetailInfo', @level2type=N'COLUMN',@level2name=N'r9_BType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'银行编码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReturnYPDetailInfo', @level2type=N'COLUMN',@level2name=N'rb_BankId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'银行订单号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReturnYPDetailInfo', @level2type=N'COLUMN',@level2name=N'ro_BankOrderId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'支付成功时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReturnYPDetailInfo', @level2type=N'COLUMN',@level2name=N'rp_PayDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N' 神州行充值卡序列号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReturnYPDetailInfo', @level2type=N'COLUMN',@level2name=N'rq_CardNo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N' 交易结果通知时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReturnYPDetailInfo', @level2type=N'COLUMN',@level2name=N'ru_Trxtime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'签名数据' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReturnYPDetailInfo', @level2type=N'COLUMN',@level2name=N'hmac'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'收录时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReturnYPDetailInfo', @level2type=N'COLUMN',@level2name=N'CollectDate'
GO
/****** Object:  Table [dbo].[ReturnVBDetailInfo]    Script Date: 05/19/2017 17:43:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReturnVBDetailInfo](
	[DetailID] [int] IDENTITY(1,1) NOT NULL,
	[OperStationID] [int] NOT NULL,
	[Rtmd5] [nvarchar](32) NOT NULL,
	[Rtka] [nvarchar](15) NOT NULL,
	[Rtmi] [nvarchar](6) NOT NULL,
	[Rtmz] [int] NOT NULL,
	[Rtlx] [int] NOT NULL,
	[Rtoid] [nvarchar](10) NOT NULL,
	[OrderID] [nvarchar](32) NOT NULL,
	[Rtuserid] [nvarchar](31) NOT NULL,
	[Rtcustom] [nvarchar](128) NOT NULL,
	[Rtflag] [int] NOT NULL,
	[EcryptStr] [nvarchar](1024) NOT NULL,
	[SignMsg] [nvarchar](32) NOT NULL,
	[CollectDate] [datetime] NOT NULL,
 CONSTRAINT [PK_ReturnVBDetailInfo] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'流水标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReturnVBDetailInfo', @level2type=N'COLUMN',@level2name=N'DetailID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'操作站点' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReturnVBDetailInfo', @level2type=N'COLUMN',@level2name=N'OperStationID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'V币服务器MD5' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReturnVBDetailInfo', @level2type=N'COLUMN',@level2name=N'Rtmd5'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'V币号码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReturnVBDetailInfo', @level2type=N'COLUMN',@level2name=N'Rtka'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'V币密码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReturnVBDetailInfo', @level2type=N'COLUMN',@level2name=N'Rtmi'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'面值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReturnVBDetailInfo', @level2type=N'COLUMN',@level2name=N'Rtmz'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'卡的类型(1:正式卡 2:测试卡 3 :促销卡)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReturnVBDetailInfo', @level2type=N'COLUMN',@level2name=N'Rtlx'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'盈华讯方服务器端订单' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReturnVBDetailInfo', @level2type=N'COLUMN',@level2name=N'Rtoid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'订单号码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReturnVBDetailInfo', @level2type=N'COLUMN',@level2name=N'OrderID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'商户的用户ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReturnVBDetailInfo', @level2type=N'COLUMN',@level2name=N'Rtuserid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'商户自己定义数据' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReturnVBDetailInfo', @level2type=N'COLUMN',@level2name=N'Rtcustom'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'返回状态(1:为正常发送回来,2:为补单发送回来)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReturnVBDetailInfo', @level2type=N'COLUMN',@level2name=N'Rtflag'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'回传字符' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReturnVBDetailInfo', @level2type=N'COLUMN',@level2name=N'EcryptStr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'签名字符串' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReturnVBDetailInfo', @level2type=N'COLUMN',@level2name=N'SignMsg'
GO
/****** Object:  Table [dbo].[ReturnKQDetailInfo]    Script Date: 05/19/2017 17:43:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReturnKQDetailInfo](
	[DetailID] [int] IDENTITY(1,1) NOT NULL,
	[MerchantAcctID] [nvarchar](32) NOT NULL,
	[Version] [nvarchar](10) NOT NULL,
	[Language] [int] NOT NULL,
	[SignType] [int] NOT NULL,
	[PayType] [nvarchar](16) NOT NULL,
	[BankID] [nvarchar](16) NOT NULL,
	[OrderID] [nvarchar](32) NOT NULL,
	[OrderTime] [datetime] NOT NULL,
	[OrderAmount] [decimal](18, 2) NOT NULL,
	[DealID] [nvarchar](32) NOT NULL,
	[BankDealID] [nvarchar](32) NOT NULL,
	[DealTime] [datetime] NOT NULL,
	[PayAmount] [decimal](18, 2) NOT NULL,
	[Fee] [decimal](18, 3) NOT NULL,
	[PayResult] [nvarchar](32) NOT NULL,
	[ErrCode] [nvarchar](32) NOT NULL,
	[SignMsg] [nvarchar](32) NOT NULL,
	[Ext1] [nvarchar](128) NOT NULL,
	[Ext2] [nvarchar](128) NOT NULL,
	[CardNumber] [nvarchar](30) NOT NULL,
	[CardPwd] [nvarchar](30) NOT NULL,
	[BossType] [nvarchar](2) NOT NULL,
	[ReceiveBossType] [nvarchar](2) NOT NULL,
	[ReceiverAcctId] [nvarchar](32) NOT NULL,
	[PayDate] [datetime] NOT NULL,
 CONSTRAINT [PK_ReturnKQDetailInfo] PRIMARY KEY CLUSTERED 
(
	[DetailID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'流水标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReturnKQDetailInfo', @level2type=N'COLUMN',@level2name=N'DetailID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'收款帐号(人民币)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReturnKQDetailInfo', @level2type=N'COLUMN',@level2name=N'MerchantAcctID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'快钱版本' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReturnKQDetailInfo', @level2type=N'COLUMN',@level2name=N'Version'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'网关页面语言类别' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReturnKQDetailInfo', @level2type=N'COLUMN',@level2name=N'Language'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'签名类别' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReturnKQDetailInfo', @level2type=N'COLUMN',@level2name=N'SignType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'支付方式' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReturnKQDetailInfo', @level2type=N'COLUMN',@level2name=N'PayType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'银行代码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReturnKQDetailInfo', @level2type=N'COLUMN',@level2name=N'BankID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'订单编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReturnKQDetailInfo', @level2type=N'COLUMN',@level2name=N'OrderID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'订单日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReturnKQDetailInfo', @level2type=N'COLUMN',@level2name=N'OrderTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'订单金额(元)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReturnKQDetailInfo', @level2type=N'COLUMN',@level2name=N'OrderAmount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'快钱交易号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReturnKQDetailInfo', @level2type=N'COLUMN',@level2name=N'DealID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'银行交易号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReturnKQDetailInfo', @level2type=N'COLUMN',@level2name=N'BankDealID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'快钱交易时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReturnKQDetailInfo', @level2type=N'COLUMN',@level2name=N'DealTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'订单实际支付金额(元)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReturnKQDetailInfo', @level2type=N'COLUMN',@level2name=N'PayAmount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'快钱收取商户的手续费(元)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReturnKQDetailInfo', @level2type=N'COLUMN',@level2name=N'Fee'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'支付结果  10:支付成功; 11:支付失败' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReturnKQDetailInfo', @level2type=N'COLUMN',@level2name=N'PayResult'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'错误代码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReturnKQDetailInfo', @level2type=N'COLUMN',@level2name=N'ErrCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'签名字符串' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReturnKQDetailInfo', @level2type=N'COLUMN',@level2name=N'SignMsg'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'扩展字段' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReturnKQDetailInfo', @level2type=N'COLUMN',@level2name=N'Ext1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'扩展字段' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReturnKQDetailInfo', @level2type=N'COLUMN',@level2name=N'Ext2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'支付卡号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReturnKQDetailInfo', @level2type=N'COLUMN',@level2name=N'CardNumber'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'支付卡密' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReturnKQDetailInfo', @level2type=N'COLUMN',@level2name=N'CardPwd'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'支付类型(只适合充值卡)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReturnKQDetailInfo', @level2type=N'COLUMN',@level2name=N'BossType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'实际支付类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReturnKQDetailInfo', @level2type=N'COLUMN',@level2name=N'ReceiveBossType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'实际收款账户' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReturnKQDetailInfo', @level2type=N'COLUMN',@level2name=N'ReceiverAcctId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'支付时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReturnKQDetailInfo', @level2type=N'COLUMN',@level2name=N'PayDate'
GO
/****** Object:  Table [dbo].[ReturnDouwanDetailInfo]    Script Date: 05/19/2017 17:43:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReturnDouwanDetailInfo](
	[DetailID] [int] IDENTITY(1,1) NOT NULL,
	[OpenId] [nvarchar](100) NOT NULL,
	[ServerId] [nvarchar](100) NOT NULL,
	[ServerName] [nvarchar](100) NOT NULL,
	[RoleId] [nvarchar](100) NOT NULL,
	[RoleName] [nvarchar](100) NOT NULL,
	[OrderId] [nvarchar](100) NOT NULL,
	[OrderStatus] [int] NOT NULL,
	[PayType] [nvarchar](100) NOT NULL,
	[Amount] [decimal](18, 2) NOT NULL,
	[Remark] [nvarchar](100) NOT NULL,
	[CallBackInfo] [nvarchar](100) NOT NULL,
	[Sign] [nvarchar](32) NOT NULL,
	[MySign] [nvarchar](32) NOT NULL,
	[CollectDate] [datetime] NOT NULL,
 CONSTRAINT [PK_ReturnDouwanDetailInfo] PRIMARY KEY CLUSTERED 
(
	[DetailID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'''''' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReturnDouwanDetailInfo', @level2type=N'COLUMN',@level2name=N'ServerName'
GO
/****** Object:  Table [dbo].[ReturnDayDetailInfo]    Script Date: 05/19/2017 17:43:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReturnDayDetailInfo](
	[DetailID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [nvarchar](32) NOT NULL,
	[MerID] [nvarchar](32) NOT NULL,
	[PayMoney] [decimal](18, 0) NOT NULL,
	[UserName] [nvarchar](16) NOT NULL,
	[PayType] [int] NOT NULL,
	[Status] [nvarchar](5) NOT NULL,
	[Sign] [nvarchar](32) NOT NULL,
	[InputDate] [datetime] NOT NULL,
 CONSTRAINT [PK_ReturnDayInfo] PRIMARY KEY CLUSTERED 
(
	[DetailID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'流水号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReturnDayDetailInfo', @level2type=N'COLUMN',@level2name=N'DetailID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'订单号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReturnDayDetailInfo', @level2type=N'COLUMN',@level2name=N'OrderID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'商户ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReturnDayDetailInfo', @level2type=N'COLUMN',@level2name=N'MerID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'金额' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReturnDayDetailInfo', @level2type=N'COLUMN',@level2name=N'PayMoney'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReturnDayDetailInfo', @level2type=N'COLUMN',@level2name=N'UserName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'支付类型（1：网银支付 ）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReturnDayDetailInfo', @level2type=N'COLUMN',@level2name=N'PayType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'支付状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReturnDayDetailInfo', @level2type=N'COLUMN',@level2name=N'Status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'签名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReturnDayDetailInfo', @level2type=N'COLUMN',@level2name=N'Sign'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'充值时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReturnDayDetailInfo', @level2type=N'COLUMN',@level2name=N'InputDate'
GO
/****** Object:  Table [dbo].[ReturnAppDetailInfo]    Script Date: 05/19/2017 17:43:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReturnAppDetailInfo](
	[DetailID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[OrderID] [nvarchar](32) NOT NULL,
	[PayAmount] [decimal](18, 2) NOT NULL,
	[Status] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[product_id] [nvarchar](50) NULL,
	[transaction_id] [nvarchar](50) NULL,
	[purchase_date] [nvarchar](50) NULL,
	[original_transaction_id] [nvarchar](50) NULL,
	[original_purchase_date] [nvarchar](50) NULL,
	[app_item_id] [nvarchar](50) NULL,
	[version_external_identifier] [nvarchar](50) NULL,
	[bid] [nvarchar](50) NULL,
	[bvrs] [nvarchar](50) NULL,
	[CollectDate] [datetime] NOT NULL,
 CONSTRAINT [PK_ReturnAppDetailInfo] PRIMARY KEY CLUSTERED 
(
	[DetailID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Return91DetailInfo]    Script Date: 05/19/2017 17:43:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Return91DetailInfo](
	[DetailID] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[ProductName] [nvarchar](100) NOT NULL,
	[ConsumeStreamId] [nvarchar](50) NOT NULL,
	[OrderID] [nvarchar](32) NOT NULL,
	[Uin] [int] NOT NULL,
	[GoodsID] [nvarchar](50) NOT NULL,
	[GoodsInfo] [nvarchar](100) NOT NULL,
	[GoodsCount] [int] NOT NULL,
	[OriginalMoney] [decimal](18, 2) NOT NULL,
	[OrderMoney] [decimal](18, 2) NOT NULL,
	[Note] [nvarchar](100) NOT NULL,
	[PayStatus] [int] NOT NULL,
	[CreateTime] [datetime] NOT NULL,
	[Sign] [nvarchar](32) NOT NULL,
	[MySign] [nvarchar](32) NOT NULL,
	[CollectDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Return91DetailInfo] PRIMARY KEY CLUSTERED 
(
	[DetailID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RecordWriteScoreError]    Script Date: 05/19/2017 17:43:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RecordWriteScoreError](
	[RecordID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[KindID] [int] NOT NULL,
	[ServerID] [int] NOT NULL,
	[UserScore] [bigint] NOT NULL,
	[Score] [bigint] NOT NULL,
	[CollectDate] [datetime] NOT NULL,
 CONSTRAINT [PK_RecordA] PRIMARY KEY CLUSTERED 
(
	[RecordID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordWriteScoreError', @level2type=N'COLUMN',@level2name=N'UserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'游戏标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordWriteScoreError', @level2type=N'COLUMN',@level2name=N'KindID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'房间标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordWriteScoreError', @level2type=N'COLUMN',@level2name=N'ServerID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户积分' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordWriteScoreError', @level2type=N'COLUMN',@level2name=N'UserScore'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'输赢积分' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordWriteScoreError', @level2type=N'COLUMN',@level2name=N'Score'
GO
/****** Object:  Table [dbo].[RecordVideoPlayerInfo]    Script Date: 05/19/2017 17:43:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RecordVideoPlayerInfo](
	[UserID] [int] NOT NULL,
	[VideoNumber] [varchar](22) NOT NULL,
	[BuildVideoTime] [datetime] NOT NULL,
	[Score] [bigint] NOT NULL,
	[PlayBackCode] [int] NOT NULL,
	[ChairID] [int] NOT NULL,
	[KindID] [int] NOT NULL,
 CONSTRAINT [PK_RecordVideoPlayerInfo] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC,
	[VideoNumber] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'玩家ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordVideoPlayerInfo', @level2type=N'COLUMN',@level2name=N'UserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'录像id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordVideoPlayerInfo', @level2type=N'COLUMN',@level2name=N'VideoNumber'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建录像时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordVideoPlayerInfo', @level2type=N'COLUMN',@level2name=N'BuildVideoTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'玩家积分' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordVideoPlayerInfo', @level2type=N'COLUMN',@level2name=N'Score'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'回放码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordVideoPlayerInfo', @level2type=N'COLUMN',@level2name=N'PlayBackCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'座位id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordVideoPlayerInfo', @level2type=N'COLUMN',@level2name=N'ChairID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'游戏类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordVideoPlayerInfo', @level2type=N'COLUMN',@level2name=N'KindID'
GO
/****** Object:  Table [dbo].[RecordVideoInfo]    Script Date: 05/19/2017 17:43:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RecordVideoInfo](
	[VideoNumber] [varchar](22) NOT NULL,
	[RoomID] [int] NOT NULL,
	[TableId] [int] NOT NULL,
	[VideoData] [varbinary](max) NOT NULL,
	[VideoBuildTime] [datetime] NOT NULL,
 CONSTRAINT [PK_RecordVideoInfo] PRIMARY KEY CLUSTERED 
(
	[VideoNumber] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'唯一标识ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordVideoInfo', @level2type=N'COLUMN',@level2name=N'VideoNumber'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'房间ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordVideoInfo', @level2type=N'COLUMN',@level2name=N'RoomID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'桌子ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordVideoInfo', @level2type=N'COLUMN',@level2name=N'TableId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'视频数据' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordVideoInfo', @level2type=N'COLUMN',@level2name=N'VideoData'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'建立视频时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordVideoInfo', @level2type=N'COLUMN',@level2name=N'VideoBuildTime'
GO
/****** Object:  Table [dbo].[RecordUserRevenue]    Script Date: 05/19/2017 17:43:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RecordUserRevenue](
	[RecordID] [int] IDENTITY(1,1) NOT NULL,
	[DateID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[Revenue] [bigint] NOT NULL,
	[AgentUserID] [int] NOT NULL,
	[AgentScale] [decimal](18, 3) NOT NULL,
	[AgentRevenue] [bigint] NOT NULL,
	[CompanyScale] [decimal](18, 3) NOT NULL,
	[CompanyRevenue] [bigint] NOT NULL,
	[CollectDate] [datetime] NOT NULL,
 CONSTRAINT [PK_RecordUserRevenue] PRIMARY KEY CLUSTERED 
(
	[RecordID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordUserRevenue', @level2type=N'COLUMN',@level2name=N'RecordID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'日期标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordUserRevenue', @level2type=N'COLUMN',@level2name=N'DateID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordUserRevenue', @level2type=N'COLUMN',@level2name=N'UserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'服务比例' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordUserRevenue', @level2type=N'COLUMN',@level2name=N'Revenue'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'代理用户标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordUserRevenue', @level2type=N'COLUMN',@level2name=N'AgentUserID'
GO
/****** Object:  Table [dbo].[RecordUserInout]    Script Date: 05/19/2017 17:43:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RecordUserInout](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[KindID] [int] NOT NULL,
	[ServerID] [int] NOT NULL,
	[EnterTime] [datetime] NOT NULL,
	[EnterScore] [bigint] NOT NULL,
	[EnterGrade] [bigint] NOT NULL,
	[EnterInsure] [bigint] NOT NULL,		
	[EnterMachine] [nvarchar](33) NOT NULL,
	[EnterClientIP] [nvarchar](15) NOT NULL,
	[LeaveTime] [datetime] NULL,
	[LeaveReason] [int] NULL,
	[LeaveMachine] [nvarchar](32) NULL,
	[LeaveClientIP] [nvarchar](15) NULL,
	[Score] [bigint] NOT NULL,
	[Grade] [bigint] NOT NULL,
	[Insure] [bigint] NOT NULL,
	[Revenue] [bigint] NOT NULL,
	[WinCount] [int] NOT NULL,
	[LostCount] [int] NOT NULL,
	[DrawCount] [int] NOT NULL,
	[FleeCount] [int] NOT NULL,
	[PlayTimeCount] [int] NOT NULL,
	[OnLineTimeCount] [int] NOT NULL,
	[GroupID] [int] NOT NULL,
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
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'进入成绩' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordUserInout', @level2type=N'COLUMN',@level2name=N'EnterGrade'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'进入银行' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordUserInout', @level2type=N'COLUMN',@level2name=N'EnterInsure'
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
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'成绩变更' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordUserInout', @level2type=N'COLUMN',@level2name=N'Grade'
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
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'游戏时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordUserInout', @level2type=N'COLUMN',@level2name=N'PlayTimeCount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'在线时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordUserInout', @level2type=N'COLUMN',@level2name=N'OnLineTimeCount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'大联盟ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordUserInout', @level2type=N'COLUMN',@level2name=N'GroupID'
GO
/****** Object:  Table [dbo].[RecordSpreadInfo]    Script Date: 05/19/2017 17:43:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RecordSpreadInfo](
	[RecordID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[Score] [bigint] NOT NULL,
	[TypeID] [int] NOT NULL,
	[ChildrenID] [int] NOT NULL,
	[InsureScore] [bigint] NOT NULL,
	[CollectDate] [datetime] NOT NULL,
	[CollectNote] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_RecordSpreadInfo] PRIMARY KEY CLUSTERED 
(
	[RecordID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordSpreadInfo', @level2type=N'COLUMN',@level2name=N'RecordID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordSpreadInfo', @level2type=N'COLUMN',@level2name=N'UserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'推广积分' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordSpreadInfo', @level2type=N'COLUMN',@level2name=N'Score'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'类型标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordSpreadInfo', @level2type=N'COLUMN',@level2name=N'TypeID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'子类型标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordSpreadInfo', @level2type=N'COLUMN',@level2name=N'ChildrenID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'银行金币' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordSpreadInfo', @level2type=N'COLUMN',@level2name=N'InsureScore'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'收集日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordSpreadInfo', @level2type=N'COLUMN',@level2name=N'CollectNote'
GO
/****** Object:  Table [dbo].[RecordSharePresent]    Script Date: 05/19/2017 17:43:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RecordSharePresent](
	[DateID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[MachineID] [nvarchar](32) NOT NULL,
	[PresentScore] [int] NOT NULL,
	[CollectDate] [datetime] NOT NULL,
 CONSTRAINT [PK_RecordSharePresent] PRIMARY KEY CLUSTERED 
(
	[DateID] ASC,
	[UserID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RecordPresentInfo]    Script Date: 05/19/2017 17:43:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RecordPresentInfo](
	[RecordID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[PreScore] [bigint] NOT NULL,
	[PreInsureScore] [bigint] NOT NULL,
	[PresentScore] [bigint] NOT NULL,
	[TypeID] [int] NOT NULL,
	[IPAddress] [nvarchar](15) NOT NULL,
	[CollectDate] [datetime] NOT NULL,
 CONSTRAINT [PK_RecordPresentInfo] PRIMARY KEY CLUSTERED 
(
	[RecordID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordPresentInfo', @level2type=N'COLUMN',@level2name=N'UserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'赠送前金币' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordPresentInfo', @level2type=N'COLUMN',@level2name=N'PreScore'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'赠送前银行金币' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordPresentInfo', @level2type=N'COLUMN',@level2name=N'PreInsureScore'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'赠送金币' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordPresentInfo', @level2type=N'COLUMN',@level2name=N'PresentScore'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'类型标识 1:注册赠送,2:低保赠送,3:签到赠送,4:元宝兑换,5:魅力兑换,6:在线时长赠送,7:任务奖励' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordPresentInfo', @level2type=N'COLUMN',@level2name=N'TypeID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordPresentInfo', @level2type=N'COLUMN',@level2name=N'IPAddress'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordPresentInfo', @level2type=N'COLUMN',@level2name=N'CollectDate'
GO
/****** Object:  Table [dbo].[RecordMachinePresent]    Script Date: 05/19/2017 17:43:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RecordMachinePresent](
	[DateID] [int] NOT NULL,
	[MachineID] [nvarchar](32) NOT NULL,
	[PresentGold] [bigint] NOT NULL,
	[PresentCount] [int] NOT NULL,
	[UserIDString] [nvarchar](512) NOT NULL,
	[FirstGrantDate] [datetime] NOT NULL,
	[LastGrantDate] [datetime] NOT NULL,
 CONSTRAINT [PK_RecordMachinePresent] PRIMARY KEY CLUSTERED 
(
	[DateID] ASC,
	[MachineID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'日期标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordMachinePresent', @level2type=N'COLUMN',@level2name=N'DateID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'机器码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordMachinePresent', @level2type=N'COLUMN',@level2name=N'MachineID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'赠送金币' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordMachinePresent', @level2type=N'COLUMN',@level2name=N'PresentGold'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'赠送次数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordMachinePresent', @level2type=N'COLUMN',@level2name=N'PresentCount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'赠送ID串' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordMachinePresent', @level2type=N'COLUMN',@level2name=N'UserIDString'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'开始赠送时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordMachinePresent', @level2type=N'COLUMN',@level2name=N'FirstGrantDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最后赠送时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordMachinePresent', @level2type=N'COLUMN',@level2name=N'LastGrantDate'
GO
/****** Object:  Table [dbo].[RecordLogonError]    Script Date: 05/19/2017 17:43:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RecordLogonError](
	[RecordID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[KindID] [int] NOT NULL,
	[ServerID] [int] NOT NULL,
	[Score] [bigint] NOT NULL,
	[InsureScore] [bigint] NOT NULL,
	[LogonIP] [nvarchar](15) NOT NULL,
	[LogonMachine] [nvarchar](32) NOT NULL,
	[CollectDate] [datetime] NOT NULL,
 CONSTRAINT [PK_RecordLogonError] PRIMARY KEY CLUSTERED 
(
	[RecordID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RecordInsure]    Script Date: 05/19/2017 17:43:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RecordInsure](
	[RecordID] [int] IDENTITY(1,1) NOT NULL,
	[KindID] [int] NOT NULL,
	[ServerID] [int] NOT NULL,
	[SourceUserID] [int] NOT NULL,
	[SourceGold] [bigint] NOT NULL,
	[SourceBank] [bigint] NOT NULL,
	[TargetUserID] [int] NOT NULL,
	[TargetGold] [bigint] NOT NULL,
	[TargetBank] [bigint] NOT NULL,
	[SwapScore] [bigint] NOT NULL,
	[Revenue] [bigint] NOT NULL,
	[IsGamePlaza] [tinyint] NOT NULL,
	[TradeType] [tinyint] NOT NULL,
	[ClientIP] [nvarchar](15) NOT NULL,
	[CollectDate] [datetime] NOT NULL,
	[CollectNote] [nvarchar](63) NOT NULL,
 CONSTRAINT [PK_RecordInsure] PRIMARY KEY CLUSTERED 
(
	[RecordID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'类型标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordInsure', @level2type=N'COLUMN',@level2name=N'KindID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'房间标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordInsure', @level2type=N'COLUMN',@level2name=N'ServerID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'源用户ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordInsure', @level2type=N'COLUMN',@level2name=N'SourceUserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'当前金币数目' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordInsure', @level2type=N'COLUMN',@level2name=N'SourceGold'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'当前银行数目' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordInsure', @level2type=N'COLUMN',@level2name=N'SourceBank'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'目标用户ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordInsure', @level2type=N'COLUMN',@level2name=N'TargetUserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'当前金币数目' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordInsure', @level2type=N'COLUMN',@level2name=N'TargetGold'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'当前银行数目' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordInsure', @level2type=N'COLUMN',@level2name=N'TargetBank'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'流通金币数目' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordInsure', @level2type=N'COLUMN',@level2name=N'SwapScore'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'服务比例数目' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordInsure', @level2type=N'COLUMN',@level2name=N'Revenue'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'转账场所(0:大厅,1:网页)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordInsure', @level2type=N'COLUMN',@level2name=N'IsGamePlaza'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'交易类别,存 1,取 2,转 3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordInsure', @level2type=N'COLUMN',@level2name=N'TradeType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'连接地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordInsure', @level2type=N'COLUMN',@level2name=N'ClientIP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'录入时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordInsure', @level2type=N'COLUMN',@level2name=N'CollectDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordInsure', @level2type=N'COLUMN',@level2name=N'CollectNote'
GO
/****** Object:  Table [dbo].[RecordDrawScore]    Script Date: 05/19/2017 17:43:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RecordDrawScore](
	[DrawID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[ChairID] [int] NOT NULL,
	[Score] [bigint] NOT NULL,
	[Grade] [bigint] NOT NULL,
	[Revenue] [bigint] NOT NULL,
	[ChipSerialScore] [bigint] NOT NULL,		
	[PlayTimeCount] [int] NOT NULL,
	[DBQuestID] [int] NOT NULL,
	[InoutIndex] [int] NOT NULL,
	[InsertTime] [datetime] NOT NULL
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
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户流水' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordDrawScore', @level2type=N'COLUMN',@level2name=N'ChipSerialScore'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'游戏时长' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordDrawScore', @level2type=N'COLUMN',@level2name=N'PlayTimeCount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'请求标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordDrawScore', @level2type=N'COLUMN',@level2name=N'DBQuestID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'进出索引' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordDrawScore', @level2type=N'COLUMN',@level2name=N'InoutIndex'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'插入时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordDrawScore', @level2type=N'COLUMN',@level2name=N'InsertTime'
GO


/****** Object:  Table [dbo].[RecordDrawScoreForWeb]    Script Date: 2018/5/24 11:32:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RecordDrawScoreForWeb](
	[DrawID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[KindID] [int] NOT NULL,
	[ChairID] [int] NOT NULL,
	[Score] [bigint] NOT NULL,
	[Grade] [bigint] NOT NULL,
	[Revenue] [bigint] NOT NULL,
	[PlayTimeCount] [int] NOT NULL,
	[DBQuestID] [int] NOT NULL,
	[InoutIndex] [int] NOT NULL,
	[InsertTime] [datetime] NOT NULL,
 CONSTRAINT [PK_RecordDrawScoreForWeb] PRIMARY KEY CLUSTERED 
(
	[DrawID] ASC,
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Index [IX_RecordDrawScoreForWeb_DrawID]    Script Date: 2018/5/24 11:32:13 ******/
CREATE NONCLUSTERED INDEX [IX_RecordDrawScoreForWeb_DrawID] ON [dbo].[RecordDrawScoreForWeb]
(
	[DrawID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RecordDrawScoreForWeb_InsertTime]    Script Date: 2018/5/24 11:32:13 ******/
CREATE NONCLUSTERED INDEX [IX_RecordDrawScoreForWeb_InsertTime] ON [dbo].[RecordDrawScoreForWeb]
(
	[InsertTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RecordDrawScoreForWeb_UserID]    Script Date: 2018/5/24 11:32:13 ******/
CREATE NONCLUSTERED INDEX [IX_RecordDrawScoreForWeb_UserID] ON [dbo].[RecordDrawScoreForWeb]
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'局数标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordDrawScoreForWeb', @level2type=N'COLUMN',@level2name=N'DrawID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordDrawScoreForWeb', @level2type=N'COLUMN',@level2name=N'UserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'游戏标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordDrawScoreForWeb', @level2type=N'COLUMN',@level2name=N'KindID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'椅子号码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordDrawScoreForWeb', @level2type=N'COLUMN',@level2name=N'ChairID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户成绩' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordDrawScoreForWeb', @level2type=N'COLUMN',@level2name=N'Score'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户积分' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordDrawScoreForWeb', @level2type=N'COLUMN',@level2name=N'Grade'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'服务比例数目' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordDrawScoreForWeb', @level2type=N'COLUMN',@level2name=N'Revenue'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'游戏时长' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordDrawScoreForWeb', @level2type=N'COLUMN',@level2name=N'PlayTimeCount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'请求标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordDrawScoreForWeb', @level2type=N'COLUMN',@level2name=N'DBQuestID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'进出索引' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordDrawScoreForWeb', @level2type=N'COLUMN',@level2name=N'InoutIndex'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'插入时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordDrawScoreForWeb', @level2type=N'COLUMN',@level2name=N'InsertTime'
GO

/****** Object:  Table [dbo].[RecordDrawInfo]    Script Date: 05/19/2017 17:43:33 ******/
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
	[StartTime] [datetime] NOT NULL,
	[ConcludeTime] [datetime] NOT NULL,
	[InsertTime] [datetime] NOT NULL,
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
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'开始时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordDrawInfo', @level2type=N'COLUMN',@level2name=N'StartTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'结束时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordDrawInfo', @level2type=N'COLUMN',@level2name=N'ConcludeTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'插入时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordDrawInfo', @level2type=N'COLUMN',@level2name=N'InsertTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'游戏过程' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordDrawInfo', @level2type=N'COLUMN',@level2name=N'DrawCourse'
GO
/****** Object:  Table [dbo].[RecordCurrencyExchage]    Script Date: 05/19/2017 17:43:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RecordCurrencyExchage](
	[RecordID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[Currency] [decimal](18, 2) NOT NULL,
	[BeforeCurrency] [nchar](10) NOT NULL,
	[Score] [bigint] NOT NULL,
	[BeforeScore] [bigint] NOT NULL,
	[ClinetIP] [varchar](15) NOT NULL,
	[CollectDate] [datetime] NOT NULL,
 CONSTRAINT [PK_RecordCurrencyExchage] PRIMARY KEY CLUSTERED 
(
	[RecordID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordCurrencyExchage', @level2type=N'COLUMN',@level2name=N'UserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'兑换货币数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordCurrencyExchage', @level2type=N'COLUMN',@level2name=N'Currency'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'兑换前货币' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordCurrencyExchage', @level2type=N'COLUMN',@level2name=N'BeforeCurrency'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'兑换金币数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordCurrencyExchage', @level2type=N'COLUMN',@level2name=N'Score'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'兑换前金币' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordCurrencyExchage', @level2type=N'COLUMN',@level2name=N'BeforeScore'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'客户端IP' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordCurrencyExchage', @level2type=N'COLUMN',@level2name=N'ClinetIP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'兑换时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordCurrencyExchage', @level2type=N'COLUMN',@level2name=N'CollectDate'
GO
/****** Object:  Table [dbo].[RecordCurrencyChange]    Script Date: 05/19/2017 17:43:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RecordCurrencyChange](
	[RecordID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[ChangeCurrency] [decimal](18, 2) NOT NULL,
	[ChangeType] [tinyint] NOT NULL,
	[BeforeCurrency] [decimal](18, 2) NOT NULL,
	[AfterCurrency] [decimal](18, 2) NOT NULL,
	[ClinetIP] [varchar](15) NOT NULL,
	[InputDate] [datetime] NOT NULL,
	[Remark] [nvarchar](200) NULL,
 CONSTRAINT [PK_RecordCurrencyChange] PRIMARY KEY CLUSTERED 
(
	[RecordID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'日志标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordCurrencyChange', @level2type=N'COLUMN',@level2name=N'RecordID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordCurrencyChange', @level2type=N'COLUMN',@level2name=N'UserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'货币变更数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordCurrencyChange', @level2type=N'COLUMN',@level2name=N'ChangeCurrency'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'变更类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordCurrencyChange', @level2type=N'COLUMN',@level2name=N'ChangeType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'变更前货币' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordCurrencyChange', @level2type=N'COLUMN',@level2name=N'BeforeCurrency'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'变更后货币数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordCurrencyChange', @level2type=N'COLUMN',@level2name=N'AfterCurrency'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'变更IP' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordCurrencyChange', @level2type=N'COLUMN',@level2name=N'ClinetIP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'变更时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordCurrencyChange', @level2type=N'COLUMN',@level2name=N'InputDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordCurrencyChange', @level2type=N'COLUMN',@level2name=N'Remark'
GO
/****** Object:  Table [dbo].[RecordBuyMember]    Script Date: 05/19/2017 17:43:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RecordBuyMember](
	[RecordID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[MemberOrder] [int] NOT NULL,
	[MemberMonths] [int] NOT NULL,
	[MemberPrice] [decimal](18, 2) NOT NULL,
	[Currency] [decimal](18, 2) NOT NULL,
	[PresentScore] [bigint] NOT NULL,
	[BeforeCurrency] [decimal](18, 2) NOT NULL,
	[BeforeScore] [bigint] NOT NULL,
	[ClinetIP] [varchar](15) NOT NULL,
	[InputDate] [datetime] NOT NULL,
 CONSTRAINT [PK_RecordExchange] PRIMARY KEY CLUSTERED 
(
	[RecordID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'日志标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordBuyMember', @level2type=N'COLUMN',@level2name=N'RecordID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordBuyMember', @level2type=N'COLUMN',@level2name=N'UserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'购买会员类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordBuyMember', @level2type=N'COLUMN',@level2name=N'MemberOrder'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'购买月数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordBuyMember', @level2type=N'COLUMN',@level2name=N'MemberMonths'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'会员每月价格（单位：货币）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordBuyMember', @level2type=N'COLUMN',@level2name=N'MemberPrice'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'总花费货币' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordBuyMember', @level2type=N'COLUMN',@level2name=N'Currency'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'赠送金币' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordBuyMember', @level2type=N'COLUMN',@level2name=N'PresentScore'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'购买前货币' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordBuyMember', @level2type=N'COLUMN',@level2name=N'BeforeCurrency'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'购买前金币' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordBuyMember', @level2type=N'COLUMN',@level2name=N'BeforeScore'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'客户端IP' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordBuyMember', @level2type=N'COLUMN',@level2name=N'ClinetIP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'兑换时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordBuyMember', @level2type=N'COLUMN',@level2name=N'InputDate'
GO
/****** Object:  Table [dbo].[RecordAgentInfo]    Script Date: 05/19/2017 17:43:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RecordAgentInfo](
	[RecordID] [int] IDENTITY(1,1) NOT NULL,
	[DateID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[AgentScale] [decimal](18, 3) NOT NULL,
	[PayBackScale] [decimal](18, 3) NOT NULL,
	[TypeID] [int] NOT NULL,
	[PayScore] [bigint] NOT NULL,
	[Score] [bigint] NOT NULL,
	[ChildrenID] [int] NOT NULL,
	[InsureScore] [nchar](10) NOT NULL,
	[CollectDate] [datetime] NOT NULL,
	[CollectIP] [nvarchar](15) NOT NULL,
	[CollectNote] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_RecordAgentInfo] PRIMARY KEY CLUSTERED 
(
	[RecordID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分成比例' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordAgentInfo', @level2type=N'COLUMN',@level2name=N'AgentScale'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'类型(1:充值,2:返现,3:结算)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordAgentInfo', @level2type=N'COLUMN',@level2name=N'TypeID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'充值金币' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordAgentInfo', @level2type=N'COLUMN',@level2name=N'PayScore'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'变化金币' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordAgentInfo', @level2type=N'COLUMN',@level2name=N'Score'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'下级用户标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordAgentInfo', @level2type=N'COLUMN',@level2name=N'ChildrenID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'银行金币' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordAgentInfo', @level2type=N'COLUMN',@level2name=N'InsureScore'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordAgentInfo', @level2type=N'COLUMN',@level2name=N'CollectDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordAgentInfo', @level2type=N'COLUMN',@level2name=N'CollectIP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordAgentInfo', @level2type=N'COLUMN',@level2name=N'CollectNote'
GO
/****** Object:  Table [dbo].[OnLineOrder]    Script Date: 05/19/2017 17:43:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OnLineOrder](
	[OnLineID] [int] IDENTITY(1,1) NOT NULL,
	[OperUserID] [int] NOT NULL,
	[ShareID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[GameID] [int] NOT NULL,
	[Accounts] [nvarchar](31) NOT NULL,
	[OrderID] [nvarchar](32) NOT NULL,
	[OrderAmount] [decimal](18, 2) NOT NULL,
	[DiscountScale] [decimal](18, 2) NOT NULL,
	[PayAmount] [decimal](18, 2) NOT NULL,
	[Rate] [int] NOT NULL,
	[Currency] [decimal](18, 2) NOT NULL,
	[OrderStatus] [tinyint] NOT NULL,
	[IPAddress] [nvarchar](15) NOT NULL,
	[ApplyDate] [datetime] NOT NULL,
	[RoomCard] [int] NOT NULL,
 CONSTRAINT [PK_OnLineOrder] PRIMARY KEY CLUSTERED 
(
	[OnLineID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'订单标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OnLineOrder', @level2type=N'COLUMN',@level2name=N'OnLineID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'操作用户' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OnLineOrder', @level2type=N'COLUMN',@level2name=N'OperUserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'服务标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OnLineOrder', @level2type=N'COLUMN',@level2name=N'ShareID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OnLineOrder', @level2type=N'COLUMN',@level2name=N'UserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'游戏ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OnLineOrder', @level2type=N'COLUMN',@level2name=N'GameID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OnLineOrder', @level2type=N'COLUMN',@level2name=N'Accounts'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'订单号码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OnLineOrder', @level2type=N'COLUMN',@level2name=N'OrderID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'订单金额' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OnLineOrder', @level2type=N'COLUMN',@level2name=N'OrderAmount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'折扣比例' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OnLineOrder', @level2type=N'COLUMN',@level2name=N'DiscountScale'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'实付金额' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OnLineOrder', @level2type=N'COLUMN',@level2name=N'PayAmount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'游戏豆数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OnLineOrder', @level2type=N'COLUMN',@level2name=N'Currency'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'订单状态  0:未付款;1:已付款待处理;2:处理完成' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OnLineOrder', @level2type=N'COLUMN',@level2name=N'OrderStatus'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'订单地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OnLineOrder', @level2type=N'COLUMN',@level2name=N'IPAddress'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'订单日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OnLineOrder', @level2type=N'COLUMN',@level2name=N'ApplyDate'
GO
/****** Object:  Table [dbo].[LotteryItem]    Script Date: 05/19/2017 17:43:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LotteryItem](
	[ItemIndex] [int] NOT NULL,
	[ItemType] [int] NOT NULL,
	[ItemQuota] [int] NOT NULL,
	[ItemRate] [int] NOT NULL,
 CONSTRAINT [PK_LotteryItem_1] PRIMARY KEY CLUSTERED 
(
	[ItemIndex] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'奖项索引' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LotteryItem', @level2type=N'COLUMN',@level2name=N'ItemIndex'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'奖项类型(0游戏币,1游戏豆 2元宝)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LotteryItem', @level2type=N'COLUMN',@level2name=N'ItemType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'奖项额度' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LotteryItem', @level2type=N'COLUMN',@level2name=N'ItemQuota'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'中奖概率(百分比)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LotteryItem', @level2type=N'COLUMN',@level2name=N'ItemRate'
GO
/****** Object:  Table [dbo].[LotteryConfig]    Script Date: 05/19/2017 17:43:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LotteryConfig](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FreeCount] [int] NOT NULL,
	[ChargeFee] [int] NOT NULL,
	[IsCharge] [tinyint] NOT NULL,
 CONSTRAINT [PK_LotteryConfig] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'每日免费次数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LotteryConfig', @level2type=N'COLUMN',@level2name=N'FreeCount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'抽奖收费额度' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LotteryConfig', @level2type=N'COLUMN',@level2name=N'ChargeFee'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'允许收费(0:不允许,1:允许)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LotteryConfig', @level2type=N'COLUMN',@level2name=N'IsCharge'
GO
/****** Object:  Table [dbo].[LivcardAssociator]    Script Date: 05/19/2017 17:43:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LivcardAssociator](
	[CardID] [int] IDENTITY(1,1) NOT NULL,
	[SerialID] [nvarchar](31) NOT NULL,
	[Password] [nchar](32) NOT NULL,
	[BuildID] [int] NOT NULL,
	[CardTypeID] [int] NOT NULL,
	[CardPrice] [decimal](18, 2) NOT NULL,
	[Currency] [decimal](18, 2) NOT NULL,
	[ValidDate] [datetime] NOT NULL,
	[BuildDate] [datetime] NOT NULL,
	[ApplyDate] [datetime] NULL,
	[UseRange] [int] NOT NULL,
	[SalesPerson] [nvarchar](31) NOT NULL,
	[Nullity] [tinyint] NOT NULL,
	[Gold] [int] NOT NULL,
 CONSTRAINT [PK_LivcardAssociator] PRIMARY KEY CLUSTERED 
(
	[CardID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'会员卡索引' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LivcardAssociator', @level2type=N'COLUMN',@level2name=N'CardID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'卡号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LivcardAssociator', @level2type=N'COLUMN',@level2name=N'SerialID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'密码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LivcardAssociator', @level2type=N'COLUMN',@level2name=N'Password'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'生产批次' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LivcardAssociator', @level2type=N'COLUMN',@level2name=N'BuildID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'会员卡类型标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LivcardAssociator', @level2type=N'COLUMN',@level2name=N'CardTypeID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'会员卡价格' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LivcardAssociator', @level2type=N'COLUMN',@level2name=N'CardPrice'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'会员卡货币数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LivcardAssociator', @level2type=N'COLUMN',@level2name=N'Currency'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'有效时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LivcardAssociator', @level2type=N'COLUMN',@level2name=N'ValidDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'生产日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LivcardAssociator', @level2type=N'COLUMN',@level2name=N'BuildDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'使用时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LivcardAssociator', @level2type=N'COLUMN',@level2name=N'ApplyDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0:全部用户,1:新注册用户,2:第一次充值用户' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LivcardAssociator', @level2type=N'COLUMN',@level2name=N'UseRange'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'销售商' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LivcardAssociator', @level2type=N'COLUMN',@level2name=N'SalesPerson'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'禁用标志' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LivcardAssociator', @level2type=N'COLUMN',@level2name=N'Nullity'
GO
/****** Object:  Table [dbo].[GlobalWebInfo]    Script Date: 05/19/2017 17:43:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GlobalWebInfo](
	[WebID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](32) NOT NULL,
	[ProductType] [int] NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[AttachCurrency] [decimal](18, 2) NOT NULL,
	[PresentCurrency] [decimal](18, 2) NOT NULL,
	[SortID] [int] NOT NULL,
	[CollectDate] [datetime] NOT NULL,
 CONSTRAINT [PK_GlobalWebInfo] PRIMARY KEY CLUSTERED 
(
	[WebID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'配置标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GlobalWebInfo', @level2type=N'COLUMN',@level2name=N'WebID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'产品名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GlobalWebInfo', @level2type=N'COLUMN',@level2name=N'ProductName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'产品类型（对应 GlobalCardInfo 表CardID  如若为0，则表示主流充值）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GlobalWebInfo', @level2type=N'COLUMN',@level2name=N'ProductType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'产品价格' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GlobalWebInfo', @level2type=N'COLUMN',@level2name=N'Price'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'首冲赠送游戏豆' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GlobalWebInfo', @level2type=N'COLUMN',@level2name=N'AttachCurrency'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'充值获得游戏豆' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GlobalWebInfo', @level2type=N'COLUMN',@level2name=N'PresentCurrency'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GlobalWebInfo', @level2type=N'COLUMN',@level2name=N'SortID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'添加时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GlobalWebInfo', @level2type=N'COLUMN',@level2name=N'CollectDate'
GO
/****** Object:  Table [dbo].[GlobalSpreadInfo]    Script Date: 05/19/2017 17:43:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GlobalSpreadInfo](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RegisterGrantScore] [int] NOT NULL,
	[PlayTimeCount] [int] NOT NULL,
	[PlayTimeGrantScore] [int] NOT NULL,
	[FillGrantRate] [decimal](18, 2) NOT NULL,
	[BalanceRate] [decimal](18, 2) NOT NULL,
	[MinBalanceScore] [int] NOT NULL,
 CONSTRAINT [PK_GlobalSpreadInfo] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'注册时赠送金币数目' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GlobalSpreadInfo', @level2type=N'COLUMN',@level2name=N'RegisterGrantScore'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'在线时长（单位：秒）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GlobalSpreadInfo', @level2type=N'COLUMN',@level2name=N'PlayTimeCount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'根据在线时长赠送金币数目' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GlobalSpreadInfo', @level2type=N'COLUMN',@level2name=N'PlayTimeGrantScore'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'充值赠送比率' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GlobalSpreadInfo', @level2type=N'COLUMN',@level2name=N'FillGrantRate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'结算赠送比率' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GlobalSpreadInfo', @level2type=N'COLUMN',@level2name=N'BalanceRate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'结算最小值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GlobalSpreadInfo', @level2type=N'COLUMN',@level2name=N'MinBalanceScore'
GO
/****** Object:  Table [dbo].[GlobalShareInfo]    Script Date: 05/19/2017 17:43:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GlobalShareInfo](
	[ShareID] [int] NOT NULL,
	[ShareName] [nvarchar](32) NOT NULL,
	[ShareAlias] [nvarchar](32) NOT NULL,
	[ShareNote] [nvarchar](32) NOT NULL,
	[CollectDate] [datetime] NOT NULL,
 CONSTRAINT [PK_GlobalShareInfo] PRIMARY KEY CLUSTERED 
(
	[ShareID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'服务标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GlobalShareInfo', @level2type=N'COLUMN',@level2name=N'ShareID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'服务名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GlobalShareInfo', @level2type=N'COLUMN',@level2name=N'ShareName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'服务别名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GlobalShareInfo', @level2type=N'COLUMN',@level2name=N'ShareAlias'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'服务说明' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GlobalShareInfo', @level2type=N'COLUMN',@level2name=N'ShareNote'
GO
/****** Object:  Table [dbo].[GlobalLivcard]    Script Date: 05/19/2017 17:43:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GlobalLivcard](
	[CardTypeID] [int] IDENTITY(1,1) NOT NULL,
	[CardName] [nvarchar](16) NOT NULL,
	[CardPrice] [decimal](18, 2) NOT NULL,
	[Currency] [decimal](18, 2) NOT NULL,
	[InputDate] [datetime] NOT NULL,
	[Gold] [int] NOT NULL,
 CONSTRAINT [PK_GlobalLivcard] PRIMARY KEY CLUSTERED 
(
	[CardTypeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'实卡类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GlobalLivcard', @level2type=N'COLUMN',@level2name=N'CardTypeID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'实卡名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GlobalLivcard', @level2type=N'COLUMN',@level2name=N'CardName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'实卡价格' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GlobalLivcard', @level2type=N'COLUMN',@level2name=N'CardPrice'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'赠送平台币' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GlobalLivcard', @level2type=N'COLUMN',@level2name=N'Currency'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'录入日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GlobalLivcard', @level2type=N'COLUMN',@level2name=N'InputDate'
GO
/****** Object:  Table [dbo].[GlobalAppInfo]    Script Date: 05/19/2017 17:43:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GlobalAppInfo](
	[AppID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [nvarchar](100) NOT NULL,
	[ProductName] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](100) NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[AttachCurrency] [decimal](18, 2) NOT NULL,
	[TagID] [int] NOT NULL,
	[CollectDate] [datetime] NOT NULL,
	[SortID] [int] NOT NULL,
	[PresentCurrency] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_GlobalAppInfo] PRIMARY KEY CLUSTERED 
(
	[AppID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GlobalAppInfo', @level2type=N'COLUMN',@level2name=N'AppID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'商品标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GlobalAppInfo', @level2type=N'COLUMN',@level2name=N'ProductID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'商品名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GlobalAppInfo', @level2type=N'COLUMN',@level2name=N'ProductName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'商品描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GlobalAppInfo', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'商品价格' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GlobalAppInfo', @level2type=N'COLUMN',@level2name=N'Price'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'首充奖励' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GlobalAppInfo', @level2type=N'COLUMN',@level2name=N'AttachCurrency'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'商品标识(1:手机使用,2:PAD使用)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GlobalAppInfo', @level2type=N'COLUMN',@level2name=N'TagID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GlobalAppInfo', @level2type=N'COLUMN',@level2name=N'CollectDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'赠送货币' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GlobalAppInfo', @level2type=N'COLUMN',@level2name=N'PresentCurrency'
GO
/****** Object:  Table [dbo].[GameScoreLocker]    Script Date: 05/19/2017 17:43:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GameScoreLocker](
	[UserID] [int] NOT NULL,
	[KindID] [int] NOT NULL,
	[ServerID] [int] NOT NULL,
	[EnterID] [int] NOT NULL,
	[EnterIP] [nvarchar](15) NOT NULL,
	[EnterMachine] [nvarchar](32) NOT NULL,
	[CollectDate] [datetime] NOT NULL,
 CONSTRAINT [PK_GameScoreLocker_UserID] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
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
/****** Object:  Table [dbo].[GameScoreInfo]    Script Date: 05/19/2017 17:43:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GameScoreInfo](
	[UserID] [int] NOT NULL,
	[Score] [bigint] NOT NULL,
	[Revenue] [bigint] NOT NULL,
	[InsureScore] [bigint] NOT NULL,
	[WinCount] [int] NOT NULL,
	[LostCount] [int] NOT NULL,
	[DrawCount] [int] NOT NULL,
	[FleeCount] [int] NOT NULL,
	[UserRight] [int] NOT NULL,
	[MasterRight] [int] NOT NULL,
	[MasterOrder] [tinyint] NOT NULL,
	[AllLogonTimes] [int] NOT NULL,
	[PlayTimeCount] [int] NOT NULL,
	[OnLineTimeCount] [int] NOT NULL,
	[LastLogonIP] [nvarchar](15) NOT NULL,
	[LastLogonDate] [datetime] NOT NULL,
	[LastLogonMachine] [nvarchar](32) NOT NULL,
	[RegisterIP] [nvarchar](15) NOT NULL,
	[RegisterDate] [datetime] NOT NULL,
	[RegisterMachine] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_GameScoreInfo_1] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户 ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameScoreInfo', @level2type=N'COLUMN',@level2name=N'UserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户积分（货币）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameScoreInfo', @level2type=N'COLUMN',@level2name=N'Score'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'游戏服务比例' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameScoreInfo', @level2type=N'COLUMN',@level2name=N'Revenue'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'银行金币' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameScoreInfo', @level2type=N'COLUMN',@level2name=N'InsureScore'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'胜局数目' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameScoreInfo', @level2type=N'COLUMN',@level2name=N'WinCount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'输局数目' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameScoreInfo', @level2type=N'COLUMN',@level2name=N'LostCount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'和局数目' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameScoreInfo', @level2type=N'COLUMN',@level2name=N'DrawCount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'逃局数目' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameScoreInfo', @level2type=N'COLUMN',@level2name=N'FleeCount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户权限' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameScoreInfo', @level2type=N'COLUMN',@level2name=N'UserRight'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'管理权限' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameScoreInfo', @level2type=N'COLUMN',@level2name=N'MasterRight'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'管理等级' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameScoreInfo', @level2type=N'COLUMN',@level2name=N'MasterOrder'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'总登陆次数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameScoreInfo', @level2type=N'COLUMN',@level2name=N'AllLogonTimes'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'游戏时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameScoreInfo', @level2type=N'COLUMN',@level2name=N'PlayTimeCount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'在线时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameScoreInfo', @level2type=N'COLUMN',@level2name=N'OnLineTimeCount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'上次登陆 IP' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameScoreInfo', @level2type=N'COLUMN',@level2name=N'LastLogonIP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'上次登陆时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameScoreInfo', @level2type=N'COLUMN',@level2name=N'LastLogonDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登录机器' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameScoreInfo', @level2type=N'COLUMN',@level2name=N'LastLogonMachine'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'注册 IP' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameScoreInfo', @level2type=N'COLUMN',@level2name=N'RegisterIP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'注册时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameScoreInfo', @level2type=N'COLUMN',@level2name=N'RegisterDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'注册机器' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameScoreInfo', @level2type=N'COLUMN',@level2name=N'RegisterMachine'
GO
/****** Object:  Table [dbo].[GameScoreAttribute]    Script Date: 05/19/2017 17:43:33 ******/
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
/****** Object:  Table [dbo].[GameProperty]    Script Date: 05/19/2017 17:43:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GameProperty](
	[ID] [int] NOT NULL,
	[Name] [nvarchar](31) NOT NULL,
	[Cash] [decimal](18, 2) NOT NULL,
	[Gold] [bigint] NOT NULL,
	[Discount] [smallint] NOT NULL,
	[IssueArea] [smallint] NOT NULL,
	[ServiceArea] [smallint] NOT NULL,
	[SendLoveLiness] [bigint] NOT NULL,
	[RecvLoveLiness] [bigint] NOT NULL,
	[RegulationsInfo] [nvarchar](255) NOT NULL,
	[Nullity] [tinyint] NOT NULL,
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
/****** Object:  Table [dbo].[GameColumnItem]    Script Date: 05/19/2017 17:43:33 ******/
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
/****** Object:  Table [dbo].[ConfineMachine]    Script Date: 05/19/2017 17:43:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConfineMachine](
	[MachineSerial] [nvarchar](32) NOT NULL,
	[EnjoinLogon] [bit] NOT NULL,
	[EnjoinRegister] [bit] NOT NULL,
	[EnjoinOverDate] [datetime] NOT NULL,
	[CollectDate] [datetime] NOT NULL,
	[CollectNote] [nvarchar](32) NOT NULL,
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
/****** Object:  Table [dbo].[ConfineAddress]    Script Date: 05/19/2017 17:43:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConfineAddress](
	[AddrString] [nvarchar](15) NOT NULL,
	[EnjoinLogon] [bit] NOT NULL,
	[EnjoinOverDate] [datetime] NOT NULL,
	[CollectDate] [datetime] NOT NULL,
	[CollectNote] [nvarchar](32) NOT NULL,
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
/****** Object:  Table [dbo].[AndroidManager]    Script Date: 05/19/2017 17:43:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AndroidManager](
	[UserID] [int] NOT NULL,
	[ServerID] [int] NOT NULL,
	[MinPlayDraw] [int] NOT NULL,
	[MaxPlayDraw] [int] NOT NULL,
	[MinTakeScore] [bigint] NOT NULL,
	[MaxTakeScore] [bigint] NOT NULL,
	[MinReposeTime] [int] NOT NULL,
	[MaxReposeTime] [int] NOT NULL,
	[ServiceTime] [int] NOT NULL,
	[ServiceGender] [int] NOT NULL,
	[Nullity] [tinyint] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[AndroidNote] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_AndroidManager_UserID_ServerID] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC,
	[ServerID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AndroidManager', @level2type=N'COLUMN',@level2name=N'UserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'房间标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AndroidManager', @level2type=N'COLUMN',@level2name=N'ServerID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最少局数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AndroidManager', @level2type=N'COLUMN',@level2name=N'MinPlayDraw'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最大局数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AndroidManager', @level2type=N'COLUMN',@level2name=N'MaxPlayDraw'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最少分数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AndroidManager', @level2type=N'COLUMN',@level2name=N'MinTakeScore'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最高分数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AndroidManager', @level2type=N'COLUMN',@level2name=N'MaxTakeScore'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最少休息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AndroidManager', @level2type=N'COLUMN',@level2name=N'MinReposeTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最大休息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AndroidManager', @level2type=N'COLUMN',@level2name=N'MaxReposeTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'服务类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AndroidManager', @level2type=N'COLUMN',@level2name=N'ServiceGender'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'禁止标志' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AndroidManager', @level2type=N'COLUMN',@level2name=N'Nullity'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注信息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AndroidManager', @level2type=N'COLUMN',@level2name=N'AndroidNote'
GO

/****** Object:  Table [dbo].[UserCurrency]    Script Date: 06/13/2017 09:12:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserCurrency](
	[UserID] [int] NOT NULL,
	[Diamond] [bigint] NOT NULL,
	[AwardTicket][int] NOT NULL
 CONSTRAINT [PK_UserCurrency] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UserCurrency', @level2type=N'COLUMN',@level2name=N'UserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户钻石' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UserCurrency', @level2type=N'COLUMN',@level2name=N'Diamond'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'奖券' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UserCurrency', @level2type=N'COLUMN',@level2name=N'AwardTicket'
GO
ALTER TABLE [dbo].[UserCurrency] ADD  CONSTRAINT [DF_UserCurrency_UserID]  DEFAULT ((0)) FOR [UserID]
GO
ALTER TABLE [dbo].[UserCurrency] ADD  CONSTRAINT [DF_UserCurrency_Diamond]  DEFAULT ((0)) FOR [Diamond]
GO
ALTER TABLE [dbo].[UserCurrency] ADD  CONSTRAINT [DF_UserCurrency_AwardTicket]  DEFAULT ((0)) FOR [AwardTicket]
GO


/****** Object:  Table [MiddleMoney]    Script Date: 2018/4/18 10:59:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MiddleMoney](
	[RecordID] [bigint] IDENTITY(1,1) NOT NULL,
	[OrderID] [nvarchar](32) NOT NULL,
	[UserID] [int] NOT NULL,
	[Amount] [numeric](18, 2) NOT NULL,
	[MoneyType] [tinyint] NOT NULL,
	[MiddleMoney] [bigint] NOT NULL,
 CONSTRAINT [PK_MiddleMoney] PRIMARY KEY CLUSTERED 
(
	[RecordID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

/****** Object:  Index [IX_COM_UserID_MoneyType]    Script Date: 2018/6/5 17:06:35 ******/
CREATE NONCLUSTERED INDEX [IX_COM_UserID_MoneyType] ON [dbo].[MiddleMoney]
(
	[UserID] ASC,
	[MoneyType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

ALTER TABLE [dbo].[MiddleMoney] ADD  CONSTRAINT [DF_MiddleMoney_OrderID]  DEFAULT ('') FOR [OrderID]
GO

ALTER TABLE [dbo].[MiddleMoney] ADD  CONSTRAINT [DF_MiddleMoney_Amount]  DEFAULT ((0)) FOR [Amount]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'订单标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MiddleMoney', @level2type=N'COLUMN',@level2name=N'OrderID'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MiddleMoney', @level2type=N'COLUMN',@level2name=N'UserID'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'充值金额' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MiddleMoney', @level2type=N'COLUMN',@level2name=N'Amount'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'代币类型  0 表示金币  1 表示钻石 2 标识游戏豆' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MiddleMoney', @level2type=N'COLUMN',@level2name=N'MoneyType'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'代币' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MiddleMoney', @level2type=N'COLUMN',@level2name=N'MiddleMoney'
GO

/****** Object:  Default [DF_AndroidManager_MinPlayDraw]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[AndroidManager] ADD  CONSTRAINT [DF_AndroidManager_MinPlayDraw]  DEFAULT ((0)) FOR [MinPlayDraw]
GO
/****** Object:  Default [DF_AndroidManager_MaxPlayDraw]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[AndroidManager] ADD  CONSTRAINT [DF_AndroidManager_MaxPlayDraw]  DEFAULT ((0)) FOR [MaxPlayDraw]
GO
/****** Object:  Default [DF_AndroidManager_MinTakeScore]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[AndroidManager] ADD  CONSTRAINT [DF_AndroidManager_MinTakeScore]  DEFAULT ((0)) FOR [MinTakeScore]
GO
/****** Object:  Default [DF_AndroidManager_MaxTakeScore]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[AndroidManager] ADD  CONSTRAINT [DF_AndroidManager_MaxTakeScore]  DEFAULT ((0)) FOR [MaxTakeScore]
GO
/****** Object:  Default [DF_AndroidManager_MinReposeTime]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[AndroidManager] ADD  CONSTRAINT [DF_AndroidManager_MinReposeTime]  DEFAULT ((0)) FOR [MinReposeTime]
GO
/****** Object:  Default [DF_AndroidManager_MaxReposeTime]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[AndroidManager] ADD  CONSTRAINT [DF_AndroidManager_MaxReposeTime]  DEFAULT ((0)) FOR [MaxReposeTime]
GO
/****** Object:  Default [DF_AndroidManager_ServiceTime]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[AndroidManager] ADD  CONSTRAINT [DF_AndroidManager_ServiceTime]  DEFAULT ((0)) FOR [ServiceTime]
GO
/****** Object:  Default [DF_AndroidManager_ServiceGender]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[AndroidManager] ADD  CONSTRAINT [DF_AndroidManager_ServiceGender]  DEFAULT ((0)) FOR [ServiceGender]
GO
/****** Object:  Default [DF_AndroidManager_Nullity]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[AndroidManager] ADD  CONSTRAINT [DF_AndroidManager_Nullity]  DEFAULT ((0)) FOR [Nullity]
GO
/****** Object:  Default [DF_AndroidManager_CreateDate]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[AndroidManager] ADD  CONSTRAINT [DF_AndroidManager_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
/****** Object:  Default [DF_AndroidManager_AndroidNote]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[AndroidManager] ADD  CONSTRAINT [DF_AndroidManager_AndroidNote]  DEFAULT (N'') FOR [AndroidNote]
GO
/****** Object:  Default [DF_AddrConfineRule_EnjoinLogon]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[ConfineAddress] ADD  CONSTRAINT [DF_AddrConfineRule_EnjoinLogon]  DEFAULT ((0)) FOR [EnjoinLogon]
GO
/****** Object:  Default [DF_AddrConfineRule_CollectDate]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[ConfineAddress] ADD  CONSTRAINT [DF_AddrConfineRule_CollectDate]  DEFAULT (getdate()) FOR [CollectDate]
GO
/****** Object:  Default [DF_AddrConfineRule_CollectNote]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[ConfineAddress] ADD  CONSTRAINT [DF_AddrConfineRule_CollectNote]  DEFAULT ('') FOR [CollectNote]
GO
/****** Object:  Default [DF_MachineConfineRule_EnjoinLogon]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[ConfineMachine] ADD  CONSTRAINT [DF_MachineConfineRule_EnjoinLogon]  DEFAULT ((0)) FOR [EnjoinLogon]
GO
/****** Object:  Default [DF_MachineConfineRule_EnjoinRegister]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[ConfineMachine] ADD  CONSTRAINT [DF_MachineConfineRule_EnjoinRegister]  DEFAULT ((0)) FOR [EnjoinRegister]
GO
/****** Object:  Default [DF_MachineConfineRule_CollectDate]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[ConfineMachine] ADD  CONSTRAINT [DF_MachineConfineRule_CollectDate]  DEFAULT (getdate()) FOR [CollectDate]
GO
/****** Object:  Default [DF_MachineConfineRule_CollectNote]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[ConfineMachine] ADD  CONSTRAINT [DF_MachineConfineRule_CollectNote]  DEFAULT ('') FOR [CollectNote]
GO
/****** Object:  Default [DF_GameProperty_Discount]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[GameProperty] ADD  CONSTRAINT [DF_GameProperty_Discount]  DEFAULT ((90)) FOR [Discount]
GO
/****** Object:  Default [DF_GameProperty_SellArea]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[GameProperty] ADD  CONSTRAINT [DF_GameProperty_SellArea]  DEFAULT ((3)) FOR [IssueArea]
GO
/****** Object:  Default [DF_GameProperty_RegulationsInfo]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[GameProperty] ADD  CONSTRAINT [DF_GameProperty_RegulationsInfo]  DEFAULT ('') FOR [RegulationsInfo]
GO
/****** Object:  Default [DF_GameProperty_Nullity]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[GameProperty] ADD  CONSTRAINT [DF_GameProperty_Nullity]  DEFAULT ((0)) FOR [Nullity]
GO
/****** Object:  Default [DF_GameScore_Score]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[GameScoreInfo] ADD  CONSTRAINT [DF_GameScore_Score]  DEFAULT ((0)) FOR [Score]
GO
/****** Object:  Default [DF_GameScoreInfo_GameTax]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[GameScoreInfo] ADD  CONSTRAINT [DF_GameScoreInfo_GameTax]  DEFAULT ((0)) FOR [Revenue]
GO
/****** Object:  Default [DF_GameScoreInfo_InsureScore]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[GameScoreInfo] ADD  CONSTRAINT [DF_GameScoreInfo_InsureScore]  DEFAULT ((0)) FOR [InsureScore]
GO
/****** Object:  Default [DF_GameScore_WinCount]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[GameScoreInfo] ADD  CONSTRAINT [DF_GameScore_WinCount]  DEFAULT ((0)) FOR [WinCount]
GO
/****** Object:  Default [DF_GameScore_LostCount]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[GameScoreInfo] ADD  CONSTRAINT [DF_GameScore_LostCount]  DEFAULT ((0)) FOR [LostCount]
GO
/****** Object:  Default [DF_GameScore_DrawCount]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[GameScoreInfo] ADD  CONSTRAINT [DF_GameScore_DrawCount]  DEFAULT ((0)) FOR [DrawCount]
GO
/****** Object:  Default [DF_GameScore_FleeCount]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[GameScoreInfo] ADD  CONSTRAINT [DF_GameScore_FleeCount]  DEFAULT ((0)) FOR [FleeCount]
GO
/****** Object:  Default [DF_GameScoreInfo_UserRight]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[GameScoreInfo] ADD  CONSTRAINT [DF_GameScoreInfo_UserRight]  DEFAULT ((0)) FOR [UserRight]
GO
/****** Object:  Default [DF_GameScoreInfo_MasterRight]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[GameScoreInfo] ADD  CONSTRAINT [DF_GameScoreInfo_MasterRight]  DEFAULT ((0)) FOR [MasterRight]
GO
/****** Object:  Default [DF_GameScoreInfo_MasterOrder]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[GameScoreInfo] ADD  CONSTRAINT [DF_GameScoreInfo_MasterOrder]  DEFAULT ((0)) FOR [MasterOrder]
GO
/****** Object:  Default [DF_GameScore_AllLogonTimes]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[GameScoreInfo] ADD  CONSTRAINT [DF_GameScore_AllLogonTimes]  DEFAULT ((0)) FOR [AllLogonTimes]
GO
/****** Object:  Default [DF_GameScore_PlayTimeCount_1]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[GameScoreInfo] ADD  CONSTRAINT [DF_GameScore_PlayTimeCount_1]  DEFAULT ((0)) FOR [PlayTimeCount]
GO
/****** Object:  Default [DF_GameScore_OnLineTimeCount]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[GameScoreInfo] ADD  CONSTRAINT [DF_GameScore_OnLineTimeCount]  DEFAULT ((0)) FOR [OnLineTimeCount]
GO
/****** Object:  Default [DF_GameScoreInfo_LastLogonIP]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[GameScoreInfo] ADD  CONSTRAINT [DF_GameScoreInfo_LastLogonIP]  DEFAULT (N'') FOR [LastLogonIP]
GO
/****** Object:  Default [DF_GameScore_LastLogonDate]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[GameScoreInfo] ADD  CONSTRAINT [DF_GameScore_LastLogonDate]  DEFAULT (getdate()) FOR [LastLogonDate]
GO
/****** Object:  Default [DF_GameScoreInfo_LastLogonMachine]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[GameScoreInfo] ADD  CONSTRAINT [DF_GameScoreInfo_LastLogonMachine]  DEFAULT ('------------') FOR [LastLogonMachine]
GO
/****** Object:  Default [DF_GameScoreInfo_RegisterIP]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[GameScoreInfo] ADD  CONSTRAINT [DF_GameScoreInfo_RegisterIP]  DEFAULT (N'') FOR [RegisterIP]
GO
/****** Object:  Default [DF_GameScore_RegisterDate]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[GameScoreInfo] ADD  CONSTRAINT [DF_GameScore_RegisterDate]  DEFAULT (getdate()) FOR [RegisterDate]
GO
/****** Object:  Default [DF_GameScoreInfo_RegisterMachine]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[GameScoreInfo] ADD  CONSTRAINT [DF_GameScoreInfo_RegisterMachine]  DEFAULT (N'------------') FOR [RegisterMachine]
GO
/****** Object:  Default [DF_GameScoreLocker_EnterIP]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[GameScoreLocker] ADD  CONSTRAINT [DF_GameScoreLocker_EnterIP]  DEFAULT (N'') FOR [EnterIP]
GO
/****** Object:  Default [DF_GameScoreLocker_RegisterMachine]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[GameScoreLocker] ADD  CONSTRAINT [DF_GameScoreLocker_RegisterMachine]  DEFAULT (N'') FOR [EnterMachine]
GO
/****** Object:  Default [DF_GameScoreLocker_CollectDate]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[GameScoreLocker] ADD  CONSTRAINT [DF_GameScoreLocker_CollectDate]  DEFAULT (getdate()) FOR [CollectDate]
GO
/****** Object:  Default [DF_GlobalAppInfo_ProductID]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[GlobalAppInfo] ADD  CONSTRAINT [DF_GlobalAppInfo_ProductID]  DEFAULT ('') FOR [ProductID]
GO
/****** Object:  Default [DF_GlobalAppInfo_ProductName]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[GlobalAppInfo] ADD  CONSTRAINT [DF_GlobalAppInfo_ProductName]  DEFAULT ('') FOR [ProductName]
GO
/****** Object:  Default [DF_GlobalAppInfo_Description]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[GlobalAppInfo] ADD  CONSTRAINT [DF_GlobalAppInfo_Description]  DEFAULT ('') FOR [Description]
GO
/****** Object:  Default [DF_GlobalAppInfo_Price]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[GlobalAppInfo] ADD  CONSTRAINT [DF_GlobalAppInfo_Price]  DEFAULT ((0)) FOR [Price]
GO
/****** Object:  Default [DF_GlobalAppInfo_AttachCurrency]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[GlobalAppInfo] ADD  CONSTRAINT [DF_GlobalAppInfo_AttachCurrency]  DEFAULT ((0)) FOR [AttachCurrency]
GO
/****** Object:  Default [DF_GlobalAppInfo_TagID]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[GlobalAppInfo] ADD  CONSTRAINT [DF_GlobalAppInfo_TagID]  DEFAULT ((0)) FOR [TagID]
GO
/****** Object:  Default [DF_GlobalAppInfo_CollectDate]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[GlobalAppInfo] ADD  CONSTRAINT [DF_GlobalAppInfo_CollectDate]  DEFAULT (getdate()) FOR [CollectDate]
GO
/****** Object:  Default [DF__GlobalApp__SortI__3C34F16F]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[GlobalAppInfo] ADD  DEFAULT ((0)) FOR [SortID]
GO
/****** Object:  Default [DF_GlobalAppInfo_PresentCurrency]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[GlobalAppInfo] ADD  CONSTRAINT [DF_GlobalAppInfo_PresentCurrency]  DEFAULT ((0)) FOR [PresentCurrency]
GO
/****** Object:  Default [DF_GlobalLivcard_CardName]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[GlobalLivcard] ADD  CONSTRAINT [DF_GlobalLivcard_CardName]  DEFAULT ('') FOR [CardName]
GO
/****** Object:  Default [DF_GlobalLivcard_CardPrice]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[GlobalLivcard] ADD  CONSTRAINT [DF_GlobalLivcard_CardPrice]  DEFAULT ((0)) FOR [CardPrice]
GO
/****** Object:  Default [DF_GlobalLivcard_CardCurrencyPirce]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[GlobalLivcard] ADD  CONSTRAINT [DF_GlobalLivcard_CardCurrencyPirce]  DEFAULT ((0)) FOR [Currency]
GO
/****** Object:  Default [DF_GlobalLivcard_GoldCount]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[GlobalLivcard] ADD  CONSTRAINT [DF_GlobalLivcard_GoldCount]  DEFAULT (getdate()) FOR [InputDate]
GO
/****** Object:  Default [DF__GlobalLivc__Gold__151B244E]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[GlobalLivcard] ADD  DEFAULT ((0)) FOR [Gold]
GO
/****** Object:  Default [DF_GlobalShareInfo_CollectDate]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[GlobalShareInfo] ADD  CONSTRAINT [DF_GlobalShareInfo_CollectDate]  DEFAULT (getdate()) FOR [CollectDate]
GO
/****** Object:  Default [DF_GlobalSpreadInfo_RegisterGrantScore]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[GlobalSpreadInfo] ADD  CONSTRAINT [DF_GlobalSpreadInfo_RegisterGrantScore]  DEFAULT ((0)) FOR [RegisterGrantScore]
GO
/****** Object:  Default [DF_GlobalSpreadInfo_PlayTimeCount]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[GlobalSpreadInfo] ADD  CONSTRAINT [DF_GlobalSpreadInfo_PlayTimeCount]  DEFAULT ((0)) FOR [PlayTimeCount]
GO
/****** Object:  Default [DF_GlobalSpreadInfo_PlayTimeGrantScore]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[GlobalSpreadInfo] ADD  CONSTRAINT [DF_GlobalSpreadInfo_PlayTimeGrantScore]  DEFAULT ((0)) FOR [PlayTimeGrantScore]
GO
/****** Object:  Default [DF_GlobalSpreadInfo_FillGrantRate]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[GlobalSpreadInfo] ADD  CONSTRAINT [DF_GlobalSpreadInfo_FillGrantRate]  DEFAULT ((0)) FOR [FillGrantRate]
GO
/****** Object:  Default [DF_GlobalSpreadInfo_BalanceRate]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[GlobalSpreadInfo] ADD  CONSTRAINT [DF_GlobalSpreadInfo_BalanceRate]  DEFAULT ((0)) FOR [BalanceRate]
GO
/****** Object:  Default [DF_GlobalSpreadInfo_MinBalanceScore]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[GlobalSpreadInfo] ADD  CONSTRAINT [DF_GlobalSpreadInfo_MinBalanceScore]  DEFAULT ((0)) FOR [MinBalanceScore]
GO
/****** Object:  Default [DF_GlobalWebInfo_ProductName]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[GlobalWebInfo] ADD  CONSTRAINT [DF_GlobalWebInfo_ProductName]  DEFAULT ('') FOR [ProductName]
GO
/****** Object:  Default [DF_GlobalWebInfo_ProductType]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[GlobalWebInfo] ADD  CONSTRAINT [DF_GlobalWebInfo_ProductType]  DEFAULT ((0)) FOR [ProductType]
GO
/****** Object:  Default [DF_GlobalWebInfo_Price]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[GlobalWebInfo] ADD  CONSTRAINT [DF_GlobalWebInfo_Price]  DEFAULT ((0)) FOR [Price]
GO
/****** Object:  Default [DF_GlobalWebInfo_AttachCurrency]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[GlobalWebInfo] ADD  CONSTRAINT [DF_GlobalWebInfo_AttachCurrency]  DEFAULT ((0)) FOR [AttachCurrency]
GO
/****** Object:  Default [DF_GlobalWebInfo_PresentCurrency]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[GlobalWebInfo] ADD  CONSTRAINT [DF_GlobalWebInfo_PresentCurrency]  DEFAULT ((0)) FOR [PresentCurrency]
GO
/****** Object:  Default [DF_GlobalWebInfo_SortID]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[GlobalWebInfo] ADD  CONSTRAINT [DF_GlobalWebInfo_SortID]  DEFAULT ((0)) FOR [SortID]
GO
/****** Object:  Default [DF_GlobalWebInfo_CollectDate]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[GlobalWebInfo] ADD  CONSTRAINT [DF_GlobalWebInfo_CollectDate]  DEFAULT (getdate()) FOR [CollectDate]
GO
/****** Object:  Default [DF_LivcardAssociator_ValidDate]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[LivcardAssociator] ADD  CONSTRAINT [DF_LivcardAssociator_ValidDate]  DEFAULT (getdate()+(180)) FOR [ValidDate]
GO
/****** Object:  Default [DF_LivcardAssociator_BuildDate]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[LivcardAssociator] ADD  CONSTRAINT [DF_LivcardAssociator_BuildDate]  DEFAULT (getdate()) FOR [BuildDate]
GO
/****** Object:  Default [DF_LivcardAssociator_Range]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[LivcardAssociator] ADD  CONSTRAINT [DF_LivcardAssociator_Range]  DEFAULT ((0)) FOR [UseRange]
GO
/****** Object:  Default [DF_LivcardAssociator_SalesPerson]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[LivcardAssociator] ADD  CONSTRAINT [DF_LivcardAssociator_SalesPerson]  DEFAULT ('') FOR [SalesPerson]
GO
/****** Object:  Default [DF_LivcardAssociator_Nullity]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[LivcardAssociator] ADD  CONSTRAINT [DF_LivcardAssociator_Nullity]  DEFAULT ((0)) FOR [Nullity]
GO
/****** Object:  Default [DF__LivcardAss__Gold__7CD98669]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[LivcardAssociator] ADD  DEFAULT ((0)) FOR [Gold]
GO
/****** Object:  Default [DF_LotteryConfig_FreeCount]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[LotteryConfig] ADD  CONSTRAINT [DF_LotteryConfig_FreeCount]  DEFAULT ((0)) FOR [FreeCount]
GO
/****** Object:  Default [DF_LotteryConfig_ChargeFee]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[LotteryConfig] ADD  CONSTRAINT [DF_LotteryConfig_ChargeFee]  DEFAULT ((0)) FOR [ChargeFee]
GO
/****** Object:  Default [DF_LotteryConfig_IsCharge]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[LotteryConfig] ADD  CONSTRAINT [DF_LotteryConfig_IsCharge]  DEFAULT ((0)) FOR [IsCharge]
GO
/****** Object:  Default [DF_LotteryItem_ItemIndex]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[LotteryItem] ADD  CONSTRAINT [DF_LotteryItem_ItemIndex]  DEFAULT ((0)) FOR [ItemIndex]
GO
/****** Object:  Default [DF_LotteryItem_ItemType]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[LotteryItem] ADD  CONSTRAINT [DF_LotteryItem_ItemType]  DEFAULT ((0)) FOR [ItemType]
GO
/****** Object:  Default [DF_LotteryItem_ItemQuota]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[LotteryItem] ADD  CONSTRAINT [DF_LotteryItem_ItemQuota]  DEFAULT ((0)) FOR [ItemQuota]
GO
/****** Object:  Default [DF_LotteryItem_ItemRate]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[LotteryItem] ADD  CONSTRAINT [DF_LotteryItem_ItemRate]  DEFAULT ((0)) FOR [ItemRate]
GO
/****** Object:  Default [DF_OnLineOrder_DiscountScale]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[OnLineOrder] ADD  CONSTRAINT [DF_OnLineOrder_DiscountScale]  DEFAULT ((0)) FOR [DiscountScale]
GO
/****** Object:  Default [DF_OnLineOrder_Rate]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[OnLineOrder] ADD  CONSTRAINT [DF_OnLineOrder_Rate]  DEFAULT ((1)) FOR [Rate]
GO
/****** Object:  Default [DF_OnLineOrder_Currency]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[OnLineOrder] ADD  CONSTRAINT [DF_OnLineOrder_Currency]  DEFAULT ((0)) FOR [Currency]
GO
/****** Object:  Default [DF_OnLineOrder_OrderStatus]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[OnLineOrder] ADD  CONSTRAINT [DF_OnLineOrder_OrderStatus]  DEFAULT ((0)) FOR [OrderStatus]
GO
/****** Object:  Default [DF_OnLineOrder_ApplyDate]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[OnLineOrder] ADD  CONSTRAINT [DF_OnLineOrder_ApplyDate]  DEFAULT (getdate()) FOR [ApplyDate]
GO
/****** Object:  Default [DF__OnLineOrd__RoomC__145C0A3F]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[OnLineOrder] ADD  DEFAULT ((0)) FOR [RoomCard]
GO
/****** Object:  Default [DF_RecordAgentInfo_DateID]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[RecordAgentInfo] ADD  CONSTRAINT [DF_RecordAgentInfo_DateID]  DEFAULT ((0)) FOR [DateID]
GO
/****** Object:  Default [DF_RecordAgentInfo_AgentScale]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[RecordAgentInfo] ADD  CONSTRAINT [DF_RecordAgentInfo_AgentScale]  DEFAULT ((0)) FOR [AgentScale]
GO
/****** Object:  Default [DF_RecordAgentInfo_PayBackScale]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[RecordAgentInfo] ADD  CONSTRAINT [DF_RecordAgentInfo_PayBackScale]  DEFAULT ((0)) FOR [PayBackScale]
GO
/****** Object:  Default [DF_RecordAgentInfo_PayScore]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[RecordAgentInfo] ADD  CONSTRAINT [DF_RecordAgentInfo_PayScore]  DEFAULT ((0)) FOR [PayScore]
GO
/****** Object:  Default [DF_RecordAgentInfo_ChildrenID]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[RecordAgentInfo] ADD  CONSTRAINT [DF_RecordAgentInfo_ChildrenID]  DEFAULT ((0)) FOR [ChildrenID]
GO
/****** Object:  Default [DF_RecordAgentInfo_InsureScore]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[RecordAgentInfo] ADD  CONSTRAINT [DF_RecordAgentInfo_InsureScore]  DEFAULT ((0)) FOR [InsureScore]
GO
/****** Object:  Default [DF_RecordAgentInfo_CollectDate]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[RecordAgentInfo] ADD  CONSTRAINT [DF_RecordAgentInfo_CollectDate]  DEFAULT (getdate()) FOR [CollectDate]
GO
/****** Object:  Default [DF_RecordAgentInfo_CollectIP]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[RecordAgentInfo] ADD  CONSTRAINT [DF_RecordAgentInfo_CollectIP]  DEFAULT ('') FOR [CollectIP]
GO
/****** Object:  Default [DF_RecordAgentInfo_CollectNote]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[RecordAgentInfo] ADD  CONSTRAINT [DF_RecordAgentInfo_CollectNote]  DEFAULT ('') FOR [CollectNote]
GO
/****** Object:  Default [DF_RecordExchCurrency_Price]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[RecordBuyMember] ADD  CONSTRAINT [DF_RecordExchCurrency_Price]  DEFAULT ((0)) FOR [MemberPrice]
GO
/****** Object:  Default [DF_RecordExchangeLog_ExchangeCurreny]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[RecordBuyMember] ADD  CONSTRAINT [DF_RecordExchangeLog_ExchangeCurreny]  DEFAULT ((0)) FOR [Currency]
GO
/****** Object:  Default [DF_RecordExchangeLog_ExchangeScroe]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[RecordBuyMember] ADD  CONSTRAINT [DF_RecordExchangeLog_ExchangeScroe]  DEFAULT ((0)) FOR [PresentScore]
GO
/****** Object:  Default [DF_RecordExchangeLog_BeforeCurreny]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[RecordBuyMember] ADD  CONSTRAINT [DF_RecordExchangeLog_BeforeCurreny]  DEFAULT ((0)) FOR [BeforeCurrency]
GO
/****** Object:  Default [DF_RecordExchangeLog_BeforeScore]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[RecordBuyMember] ADD  CONSTRAINT [DF_RecordExchangeLog_BeforeScore]  DEFAULT ((0)) FOR [BeforeScore]
GO
/****** Object:  Default [DF_RecordExchangeLog_CollectDate]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[RecordBuyMember] ADD  CONSTRAINT [DF_RecordExchangeLog_CollectDate]  DEFAULT (getdate()) FOR [InputDate]
GO
/****** Object:  Default [DF_RecordCurrencyChange_ChangeType]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[RecordCurrencyChange] ADD  CONSTRAINT [DF_RecordCurrencyChange_ChangeType]  DEFAULT ((0)) FOR [ChangeType]
GO
/****** Object:  Default [DF_RecordCurrencyChange_InputDate]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[RecordCurrencyChange] ADD  CONSTRAINT [DF_RecordCurrencyChange_InputDate]  DEFAULT (getdate()) FOR [InputDate]
GO
/****** Object:  Default [DF_RecordCurrencyExchage_Currency]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[RecordCurrencyExchage] ADD  CONSTRAINT [DF_RecordCurrencyExchage_Currency]  DEFAULT ((0)) FOR [Currency]
GO
/****** Object:  Default [DF_RecordCurrencyExchage_BeforeCurrency]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[RecordCurrencyExchage] ADD  CONSTRAINT [DF_RecordCurrencyExchage_BeforeCurrency]  DEFAULT ((0)) FOR [BeforeCurrency]
GO
/****** Object:  Default [DF_RecordCurrencyExchage_Score]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[RecordCurrencyExchage] ADD  CONSTRAINT [DF_RecordCurrencyExchage_Score]  DEFAULT ((0)) FOR [Score]
GO
/****** Object:  Default [DF_RecordCurrencyExchage_BeforeScore]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[RecordCurrencyExchage] ADD  CONSTRAINT [DF_RecordCurrencyExchage_BeforeScore]  DEFAULT ((0)) FOR [BeforeScore]
GO
/****** Object:  Default [DF_RecordCurrencyExchage_ClinetIP]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[RecordCurrencyExchage] ADD  CONSTRAINT [DF_RecordCurrencyExchage_ClinetIP]  DEFAULT ('') FOR [ClinetIP]
GO
/****** Object:  Default [DF_RecordCurrencyExchage_CollectDate]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[RecordCurrencyExchage] ADD  CONSTRAINT [DF_RecordCurrencyExchage_CollectDate]  DEFAULT (getdate()) FOR [CollectDate]
GO
/****** Object:  Default [DF_RecordDrawInfo_InsertTime]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[RecordDrawInfo] ADD  CONSTRAINT [DF_RecordDrawInfo_InsertTime]  DEFAULT (getdate()) FOR [InsertTime]
GO
/****** Object:  Default [DF_RecordDrawScore_ChairID]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[RecordDrawScore] ADD  CONSTRAINT [DF_RecordDrawScore_ChairID]  DEFAULT ((0)) FOR [ChairID]
GO
/****** Object:  Default [DF_RecordDrawScore_PlayTimeCount]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[RecordDrawScore] ADD  CONSTRAINT [DF_RecordDrawScore_PlayTimeCount]  DEFAULT ((0)) FOR [PlayTimeCount]
GO
/****** Object:  Default [DF_RecordDrawScore_InsertTime]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[RecordDrawScore] ADD  CONSTRAINT [DF_RecordDrawScore_InsertTime]  DEFAULT (getdate()) FOR [InsertTime]
GO
/****** Object:  Default [DF_RecordInsure_KindID]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[RecordInsure] ADD  CONSTRAINT [DF_RecordInsure_KindID]  DEFAULT ((0)) FOR [KindID]
GO
/****** Object:  Default [DF_RecordTreasure_ServerID]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[RecordInsure] ADD  CONSTRAINT [DF_RecordTreasure_ServerID]  DEFAULT ((0)) FOR [ServerID]
GO
/****** Object:  Default [DF_RecordTreasure_SourceUserID]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[RecordInsure] ADD  CONSTRAINT [DF_RecordTreasure_SourceUserID]  DEFAULT ((0)) FOR [SourceUserID]
GO
/****** Object:  Default [DF_RecordTreasure_CurBankSource1_1]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[RecordInsure] ADD  CONSTRAINT [DF_RecordTreasure_CurBankSource1_1]  DEFAULT ((0)) FOR [SourceGold]
GO
/****** Object:  Default [DF_RecordTreasure_CurBankSource1]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[RecordInsure] ADD  CONSTRAINT [DF_RecordTreasure_CurBankSource1]  DEFAULT ((0)) FOR [SourceBank]
GO
/****** Object:  Default [DF_RecordTreasure_TargetUserID]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[RecordInsure] ADD  CONSTRAINT [DF_RecordTreasure_TargetUserID]  DEFAULT ((0)) FOR [TargetUserID]
GO
/****** Object:  Default [DF_RecordTreasure_CurBankTarget1]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[RecordInsure] ADD  CONSTRAINT [DF_RecordTreasure_CurBankTarget1]  DEFAULT ((0)) FOR [TargetGold]
GO
/****** Object:  Default [DF_RecordTreasure_SwapScore1]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[RecordInsure] ADD  CONSTRAINT [DF_RecordTreasure_SwapScore1]  DEFAULT ((0)) FOR [TargetBank]
GO
/****** Object:  Default [DF_RecordTreasure_SwapScore]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[RecordInsure] ADD  CONSTRAINT [DF_RecordTreasure_SwapScore]  DEFAULT ((0)) FOR [SwapScore]
GO
/****** Object:  Default [DF_RecordTreasure_Revenue]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[RecordInsure] ADD  CONSTRAINT [DF_RecordTreasure_Revenue]  DEFAULT ((0)) FOR [Revenue]
GO
/****** Object:  Default [DF_RecordInsure_IsGamePlaza]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[RecordInsure] ADD  CONSTRAINT [DF_RecordInsure_IsGamePlaza]  DEFAULT ((0)) FOR [IsGamePlaza]
GO
/****** Object:  Default [DF_RecordTreasure_ClientIPSource1]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[RecordInsure] ADD  CONSTRAINT [DF_RecordTreasure_ClientIPSource1]  DEFAULT ('000.000.000.000') FOR [ClientIP]
GO
/****** Object:  Default [DF_RecordTreasure_CollectDate]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[RecordInsure] ADD  CONSTRAINT [DF_RecordTreasure_CollectDate]  DEFAULT (getdate()) FOR [CollectDate]
GO
/****** Object:  Default [DF_RecordInsure_CollectNote]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[RecordInsure] ADD  CONSTRAINT [DF_RecordInsure_CollectNote]  DEFAULT ('') FOR [CollectNote]
GO
/****** Object:  Default [DF_RecordLogonError_KindID]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[RecordLogonError] ADD  CONSTRAINT [DF_RecordLogonError_KindID]  DEFAULT ((0)) FOR [KindID]
GO
/****** Object:  Default [DF_RecordLogonError_ServerID]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[RecordLogonError] ADD  CONSTRAINT [DF_RecordLogonError_ServerID]  DEFAULT ((0)) FOR [ServerID]
GO
/****** Object:  Default [DF_RecordLogonError_Score]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[RecordLogonError] ADD  CONSTRAINT [DF_RecordLogonError_Score]  DEFAULT ((0)) FOR [Score]
GO
/****** Object:  Default [DF_RecordLogonError_InsureScore]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[RecordLogonError] ADD  CONSTRAINT [DF_RecordLogonError_InsureScore]  DEFAULT ((0)) FOR [InsureScore]
GO
/****** Object:  Default [DF_RecordLogonError_LogonIP]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[RecordLogonError] ADD  CONSTRAINT [DF_RecordLogonError_LogonIP]  DEFAULT (N'000.000.000.000') FOR [LogonIP]
GO
/****** Object:  Default [DF_RecordLogonError_MachineID]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[RecordLogonError] ADD  CONSTRAINT [DF_RecordLogonError_MachineID]  DEFAULT ('') FOR [LogonMachine]
GO
/****** Object:  Default [DF_RecordLogonError_CollectDate]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[RecordLogonError] ADD  CONSTRAINT [DF_RecordLogonError_CollectDate]  DEFAULT (getdate()) FOR [CollectDate]
GO
/****** Object:  Default [DF_RecordMachinePresent_FirstGrantDate]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[RecordMachinePresent] ADD  CONSTRAINT [DF_RecordMachinePresent_FirstGrantDate]  DEFAULT (getdate()) FOR [FirstGrantDate]
GO
/****** Object:  Default [DF_RecordMachinePresent_LastGrantDate]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[RecordMachinePresent] ADD  CONSTRAINT [DF_RecordMachinePresent_LastGrantDate]  DEFAULT (getdate()) FOR [LastGrantDate]
GO
/****** Object:  Default [DF_RecordPresentInfo_PreScore]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[RecordPresentInfo] ADD  CONSTRAINT [DF_RecordPresentInfo_PreScore]  DEFAULT ((0)) FOR [PreScore]
GO
/****** Object:  Default [DF_RecordPresentInfo_PreInsureScore]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[RecordPresentInfo] ADD  CONSTRAINT [DF_RecordPresentInfo_PreInsureScore]  DEFAULT ((0)) FOR [PreInsureScore]
GO
/****** Object:  Default [DF_RecordPresentInfo_PresentScore]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[RecordPresentInfo] ADD  CONSTRAINT [DF_RecordPresentInfo_PresentScore]  DEFAULT ((0)) FOR [PresentScore]
GO
/****** Object:  Default [DF_RecordPresentInfo_TypeID]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[RecordPresentInfo] ADD  CONSTRAINT [DF_RecordPresentInfo_TypeID]  DEFAULT ((0)) FOR [TypeID]
GO
/****** Object:  Default [DF_RecordPresentInfo_IPAddress]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[RecordPresentInfo] ADD  CONSTRAINT [DF_RecordPresentInfo_IPAddress]  DEFAULT ('') FOR [IPAddress]
GO
/****** Object:  Default [DF_RecordPresentInfo_CollectDate]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[RecordPresentInfo] ADD  CONSTRAINT [DF_RecordPresentInfo_CollectDate]  DEFAULT (getdate()) FOR [CollectDate]
GO
/****** Object:  Default [DF_RecordSharePresent_MachineID]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[RecordSharePresent] ADD  CONSTRAINT [DF_RecordSharePresent_MachineID]  DEFAULT ('') FOR [MachineID]
GO
/****** Object:  Default [DF_RecordSharePresent_PresentScore]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[RecordSharePresent] ADD  CONSTRAINT [DF_RecordSharePresent_PresentScore]  DEFAULT ((0)) FOR [PresentScore]
GO
/****** Object:  Default [DF_RecordSharePresent_CollectDate]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[RecordSharePresent] ADD  CONSTRAINT [DF_RecordSharePresent_CollectDate]  DEFAULT (getdate()) FOR [CollectDate]
GO
/****** Object:  Default [DF_RecordSpreadInfo_TypeID]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[RecordSpreadInfo] ADD  CONSTRAINT [DF_RecordSpreadInfo_TypeID]  DEFAULT ((0)) FOR [TypeID]
GO
/****** Object:  Default [DF_RecordSpreadInfo_ChildrenID]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[RecordSpreadInfo] ADD  CONSTRAINT [DF_RecordSpreadInfo_ChildrenID]  DEFAULT ((0)) FOR [ChildrenID]
GO
/****** Object:  Default [DF_RecordSpreadInfo_InsureScore]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[RecordSpreadInfo] ADD  CONSTRAINT [DF_RecordSpreadInfo_InsureScore]  DEFAULT ((0)) FOR [InsureScore]
GO
/****** Object:  Default [DF_RecordSpreadInfo_CollectDate]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[RecordSpreadInfo] ADD  CONSTRAINT [DF_RecordSpreadInfo_CollectDate]  DEFAULT (getdate()) FOR [CollectDate]
GO
/****** Object:  Default [DF_RecordSpreadInfo_CollectNote]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[RecordSpreadInfo] ADD  CONSTRAINT [DF_RecordSpreadInfo_CollectNote]  DEFAULT ('') FOR [CollectNote]
GO
/****** Object:  Default [DF_RecordUserInout_EnterTime]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[RecordUserInout] ADD  CONSTRAINT [DF_RecordUserInout_EnterTime]  DEFAULT (getdate()) FOR [EnterTime]
GO
/****** Object:  Default [DF_RecordUserInout_EnterGold]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[RecordUserInout] ADD  CONSTRAINT [DF_RecordUserInout_EnterGold]  DEFAULT ((0)) FOR [EnterGrade]
GO
/****** Object:  Default [DF_RecordUserInout_EnterGold1]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[RecordUserInout] ADD  CONSTRAINT [DF_RecordUserInout_EnterGold1]  DEFAULT ((0)) FOR [EnterInsure]
GO
/****** Object:  Default [DF_RecordUserInout_EnterMachine]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[RecordUserInout] ADD  CONSTRAINT [DF_RecordUserInout_EnterMachine]  DEFAULT (N'') FOR [EnterMachine]
GO
/****** Object:  Default [DF_RecordUserInout_Score]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[RecordUserInout] ADD  CONSTRAINT [DF_RecordUserInout_Score]  DEFAULT ((0)) FOR [Score]
GO
/****** Object:  Default [DF_RecordUserInout_Gold]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[RecordUserInout] ADD  CONSTRAINT [DF_RecordUserInout_Gold]  DEFAULT ((0)) FOR [Grade]
GO
/****** Object:  Default [DF_RecordUserInout_Insure]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[RecordUserInout] ADD  CONSTRAINT [DF_RecordUserInout_Insure]  DEFAULT ((0)) FOR [Insure]
GO
/****** Object:  Default [DF_RecordUserInout_Revenue]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[RecordUserInout] ADD  CONSTRAINT [DF_RecordUserInout_Revenue]  DEFAULT ((0)) FOR [Revenue]
GO
/****** Object:  Default [DF_RecordUserInout_WinCount]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[RecordUserInout] ADD  CONSTRAINT [DF_RecordUserInout_WinCount]  DEFAULT ((0)) FOR [WinCount]
GO
/****** Object:  Default [DF_RecordUserInout_LostCount]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[RecordUserInout] ADD  CONSTRAINT [DF_RecordUserInout_LostCount]  DEFAULT ((0)) FOR [LostCount]
GO
/****** Object:  Default [DF_RecordUserInout_DrawCount]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[RecordUserInout] ADD  CONSTRAINT [DF_RecordUserInout_DrawCount]  DEFAULT ((0)) FOR [DrawCount]
GO
/****** Object:  Default [DF_RecordUserInout_FleeCount]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[RecordUserInout] ADD  CONSTRAINT [DF_RecordUserInout_FleeCount]  DEFAULT ((0)) FOR [FleeCount]
GO
/****** Object:  Default [DF_RecordUserInout_PlayTimeCount]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[RecordUserInout] ADD  CONSTRAINT [DF_RecordUserInout_PlayTimeCount]  DEFAULT ((0)) FOR [PlayTimeCount]
GO
/****** Object:  Default [DF_RecordUserInout_OnLineTimeCount]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[RecordUserInout] ADD  CONSTRAINT [DF_RecordUserInout_OnLineTimeCount]  DEFAULT ((0)) FOR [OnLineTimeCount]
GO
/****** Object:  Default [DF_RecordUserInout_GroupID]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[RecordUserInout] ADD  CONSTRAINT [DF_RecordUserInout_GroupID]  DEFAULT ((0)) FOR [GroupID]
GO
/****** Object:  Default [DF_RecordUserRevenue_CollectDate]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[RecordUserRevenue] ADD  CONSTRAINT [DF_RecordUserRevenue_CollectDate]  DEFAULT (getdate()) FOR [CollectDate]
GO
/****** Object:  Default [DF_RecordVideoInfo_VideoBuildTime]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[RecordVideoInfo] ADD  CONSTRAINT [DF_RecordVideoInfo_VideoBuildTime]  DEFAULT (getdate()) FOR [VideoBuildTime]
GO
/****** Object:  Default [DF_RecordVideoPlayerInfo_BuildVideoTime]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[RecordVideoPlayerInfo] ADD  CONSTRAINT [DF_RecordVideoPlayerInfo_BuildVideoTime]  DEFAULT (getdate()) FOR [BuildVideoTime]
GO
/****** Object:  Default [DF_RecordVideoPlayerInfo_PlayBackCode]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[RecordVideoPlayerInfo] ADD  CONSTRAINT [DF_RecordVideoPlayerInfo_PlayBackCode]  DEFAULT ((0)) FOR [PlayBackCode]
GO
/****** Object:  Default [DF_RecordA_CollectDate]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[RecordWriteScoreError] ADD  CONSTRAINT [DF_RecordA_CollectDate]  DEFAULT (getdate()) FOR [CollectDate]
GO
/****** Object:  Default [DF_Return91DetailInfo_CollectDate]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[Return91DetailInfo] ADD  CONSTRAINT [DF_Return91DetailInfo_CollectDate]  DEFAULT (getdate()) FOR [CollectDate]
GO
/****** Object:  Default [DF_ReturnAppDetailInfo_UserID]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[ReturnAppDetailInfo] ADD  CONSTRAINT [DF_ReturnAppDetailInfo_UserID]  DEFAULT ((0)) FOR [UserID]
GO
/****** Object:  Default [DF_ReturnAppDetailInfo_OrderID]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[ReturnAppDetailInfo] ADD  CONSTRAINT [DF_ReturnAppDetailInfo_OrderID]  DEFAULT ('') FOR [OrderID]
GO
/****** Object:  Default [DF_ReturnAppDetailInfo_PayAmount]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[ReturnAppDetailInfo] ADD  CONSTRAINT [DF_ReturnAppDetailInfo_PayAmount]  DEFAULT ((0)) FOR [PayAmount]
GO
/****** Object:  Default [DF_ReturnAppDetailInfo_quantity]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[ReturnAppDetailInfo] ADD  CONSTRAINT [DF_ReturnAppDetailInfo_quantity]  DEFAULT ((0)) FOR [quantity]
GO
/****** Object:  Default [DF_ReturnAppDetailInfo_CollectDate]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[ReturnAppDetailInfo] ADD  CONSTRAINT [DF_ReturnAppDetailInfo_CollectDate]  DEFAULT (getdate()) FOR [CollectDate]
GO
/****** Object:  Default [DF_ReturnDayDetailInfo_OrderID]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[ReturnDayDetailInfo] ADD  CONSTRAINT [DF_ReturnDayDetailInfo_OrderID]  DEFAULT ('') FOR [OrderID]
GO
/****** Object:  Default [DF_ReturnDayDetailInfo_MerID]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[ReturnDayDetailInfo] ADD  CONSTRAINT [DF_ReturnDayDetailInfo_MerID]  DEFAULT ('') FOR [MerID]
GO
/****** Object:  Default [DF_ReturnDayDetailInfo_PayMoney]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[ReturnDayDetailInfo] ADD  CONSTRAINT [DF_ReturnDayDetailInfo_PayMoney]  DEFAULT ((0)) FOR [PayMoney]
GO
/****** Object:  Default [DF_ReturnDayDetailInfo_UserName]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[ReturnDayDetailInfo] ADD  CONSTRAINT [DF_ReturnDayDetailInfo_UserName]  DEFAULT ('') FOR [UserName]
GO
/****** Object:  Default [DF_ReturnDayDetailInfo_PayType]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[ReturnDayDetailInfo] ADD  CONSTRAINT [DF_ReturnDayDetailInfo_PayType]  DEFAULT ((0)) FOR [PayType]
GO
/****** Object:  Default [DF_ReturnDayDetailInfo_Status]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[ReturnDayDetailInfo] ADD  CONSTRAINT [DF_ReturnDayDetailInfo_Status]  DEFAULT ('') FOR [Status]
GO
/****** Object:  Default [DF_ReturnDayInfo_InputDate]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[ReturnDayDetailInfo] ADD  CONSTRAINT [DF_ReturnDayInfo_InputDate]  DEFAULT (getdate()) FOR [InputDate]
GO
/****** Object:  Default [DF_ReturnDouwanDetailInfo_ServerId]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[ReturnDouwanDetailInfo] ADD  CONSTRAINT [DF_ReturnDouwanDetailInfo_ServerId]  DEFAULT ('') FOR [ServerId]
GO
/****** Object:  Default [DF_ReturnDouwanDetailInfo_ServerName]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[ReturnDouwanDetailInfo] ADD  CONSTRAINT [DF_ReturnDouwanDetailInfo_ServerName]  DEFAULT ('') FOR [ServerName]
GO
/****** Object:  Default [DF_ReturnDouwanDetailInfo_RoleId]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[ReturnDouwanDetailInfo] ADD  CONSTRAINT [DF_ReturnDouwanDetailInfo_RoleId]  DEFAULT ('') FOR [RoleId]
GO
/****** Object:  Default [DF_ReturnDouwanDetailInfo_RoleName]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[ReturnDouwanDetailInfo] ADD  CONSTRAINT [DF_ReturnDouwanDetailInfo_RoleName]  DEFAULT ('') FOR [RoleName]
GO
/****** Object:  Default [DF_ReturnDouwanDetailInfo_OrderId]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[ReturnDouwanDetailInfo] ADD  CONSTRAINT [DF_ReturnDouwanDetailInfo_OrderId]  DEFAULT ('') FOR [OrderId]
GO
/****** Object:  Default [DF_ReturnDouwanDetailInfo_OrderStatus]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[ReturnDouwanDetailInfo] ADD  CONSTRAINT [DF_ReturnDouwanDetailInfo_OrderStatus]  DEFAULT ('') FOR [OrderStatus]
GO
/****** Object:  Default [DF_ReturnDouwanDetailInfo_PayType]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[ReturnDouwanDetailInfo] ADD  CONSTRAINT [DF_ReturnDouwanDetailInfo_PayType]  DEFAULT ('') FOR [PayType]
GO
/****** Object:  Default [DF_ReturnDouwanDetailInfo_Amount]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[ReturnDouwanDetailInfo] ADD  CONSTRAINT [DF_ReturnDouwanDetailInfo_Amount]  DEFAULT ((0)) FOR [Amount]
GO
/****** Object:  Default [DF_ReturnDouwanDetailInfo_Remark]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[ReturnDouwanDetailInfo] ADD  CONSTRAINT [DF_ReturnDouwanDetailInfo_Remark]  DEFAULT ('') FOR [Remark]
GO
/****** Object:  Default [DF_ReturnDouwanDetailInfo_CallBackInfo]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[ReturnDouwanDetailInfo] ADD  CONSTRAINT [DF_ReturnDouwanDetailInfo_CallBackInfo]  DEFAULT ('') FOR [CallBackInfo]
GO
/****** Object:  Default [DF_ReturnDouwanDetailInfo_Sign]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[ReturnDouwanDetailInfo] ADD  CONSTRAINT [DF_ReturnDouwanDetailInfo_Sign]  DEFAULT ('') FOR [Sign]
GO
/****** Object:  Default [DF_ReturnDouwanDetailInfo_MySign]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[ReturnDouwanDetailInfo] ADD  CONSTRAINT [DF_ReturnDouwanDetailInfo_MySign]  DEFAULT ('') FOR [MySign]
GO
/****** Object:  Default [DF_ReturnDouwanDetailInfo_CollectDate]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[ReturnDouwanDetailInfo] ADD  CONSTRAINT [DF_ReturnDouwanDetailInfo_CollectDate]  DEFAULT (getdate()) FOR [CollectDate]
GO
/****** Object:  Default [DF_ReturnKQInfo_SignType]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[ReturnKQDetailInfo] ADD  CONSTRAINT [DF_ReturnKQInfo_SignType]  DEFAULT ((1)) FOR [SignType]
GO
/****** Object:  Default [DF_ReturnKQInfo_PayType]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[ReturnKQDetailInfo] ADD  CONSTRAINT [DF_ReturnKQInfo_PayType]  DEFAULT ((0)) FOR [PayType]
GO
/****** Object:  Default [DF_ReturnKQInfo_OrderTime]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[ReturnKQDetailInfo] ADD  CONSTRAINT [DF_ReturnKQInfo_OrderTime]  DEFAULT (getdate()) FOR [OrderTime]
GO
/****** Object:  Default [DF_ReturnKQInfo_OrderAmount]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[ReturnKQDetailInfo] ADD  CONSTRAINT [DF_ReturnKQInfo_OrderAmount]  DEFAULT ((0)) FOR [OrderAmount]
GO
/****** Object:  Default [DF_ReturnKQInfo_PayAmount]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[ReturnKQDetailInfo] ADD  CONSTRAINT [DF_ReturnKQInfo_PayAmount]  DEFAULT ((0)) FOR [PayAmount]
GO
/****** Object:  Default [DF_ReturnKQInfo_Fee]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[ReturnKQDetailInfo] ADD  CONSTRAINT [DF_ReturnKQInfo_Fee]  DEFAULT ((0)) FOR [Fee]
GO
/****** Object:  Default [DF_ReturnKQDetailInfo_ErrCode]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[ReturnKQDetailInfo] ADD  CONSTRAINT [DF_ReturnKQDetailInfo_ErrCode]  DEFAULT ('') FOR [ErrCode]
GO
/****** Object:  Default [DF_ReturnKQInfo_Ext1]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[ReturnKQDetailInfo] ADD  CONSTRAINT [DF_ReturnKQInfo_Ext1]  DEFAULT (N'') FOR [Ext1]
GO
/****** Object:  Default [DF_ReturnKQInfo_Ext2]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[ReturnKQDetailInfo] ADD  CONSTRAINT [DF_ReturnKQInfo_Ext2]  DEFAULT (N'') FOR [Ext2]
GO
/****** Object:  Default [DF_ReturnKQDetailInfo_CardNumber]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[ReturnKQDetailInfo] ADD  CONSTRAINT [DF_ReturnKQDetailInfo_CardNumber]  DEFAULT ('') FOR [CardNumber]
GO
/****** Object:  Default [DF_ReturnKQDetailInfo_CardPwd]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[ReturnKQDetailInfo] ADD  CONSTRAINT [DF_ReturnKQDetailInfo_CardPwd]  DEFAULT ('') FOR [CardPwd]
GO
/****** Object:  Default [DF_ReturnKQDetailInfo_BossType]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[ReturnKQDetailInfo] ADD  CONSTRAINT [DF_ReturnKQDetailInfo_BossType]  DEFAULT ('') FOR [BossType]
GO
/****** Object:  Default [DF_ReturnKQDetailInfo_ReceiveBossType]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[ReturnKQDetailInfo] ADD  CONSTRAINT [DF_ReturnKQDetailInfo_ReceiveBossType]  DEFAULT ('') FOR [ReceiveBossType]
GO
/****** Object:  Default [DF_ReturnKQDetailInfo_ReceiverAcctId]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[ReturnKQDetailInfo] ADD  CONSTRAINT [DF_ReturnKQDetailInfo_ReceiverAcctId]  DEFAULT ('') FOR [ReceiverAcctId]
GO
/****** Object:  Default [DF_ReturnKQInfo_PayDate]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[ReturnKQDetailInfo] ADD  CONSTRAINT [DF_ReturnKQInfo_PayDate]  DEFAULT (getdate()) FOR [PayDate]
GO
/****** Object:  Default [DF_ReturnVBDetailInfo_OperStationID]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[ReturnVBDetailInfo] ADD  CONSTRAINT [DF_ReturnVBDetailInfo_OperStationID]  DEFAULT ((0)) FOR [OperStationID]
GO
/****** Object:  Default [DF_ReturnVBDetailInfo_rtmi]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[ReturnVBDetailInfo] ADD  CONSTRAINT [DF_ReturnVBDetailInfo_rtmi]  DEFAULT ('') FOR [Rtmi]
GO
/****** Object:  Default [DF_ReturnVBDetailInfo_CollectDate]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[ReturnVBDetailInfo] ADD  CONSTRAINT [DF_ReturnVBDetailInfo_CollectDate]  DEFAULT (getdate()) FOR [CollectDate]
GO
/****** Object:  Default [DF__ReturnYPD__r0_Cm__451F3D2B]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[ReturnYPDetailInfo] ADD  CONSTRAINT [DF__ReturnYPD__r0_Cm__451F3D2B]  DEFAULT (N'Buy') FOR [r0_Cmd]
GO
/****** Object:  Default [DF__ReturnYPD__r1_Co__46136164]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[ReturnYPDetailInfo] ADD  CONSTRAINT [DF__ReturnYPD__r1_Co__46136164]  DEFAULT ((1)) FOR [r1_Code]
GO
/****** Object:  Default [DF__ReturnYPD__r4_Cu__4707859D]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[ReturnYPDetailInfo] ADD  CONSTRAINT [DF__ReturnYPD__r4_Cu__4707859D]  DEFAULT (N'RMB') FOR [r4_Cur]
GO
/****** Object:  Default [DF__ReturnYPD__rp_Pa__47FBA9D6]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[ReturnYPDetailInfo] ADD  CONSTRAINT [DF__ReturnYPD__rp_Pa__47FBA9D6]  DEFAULT (getdate()) FOR [rp_PayDate]
GO
/****** Object:  Default [DF__ReturnYPD__ru_Tr__48EFCE0F]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[ReturnYPDetailInfo] ADD  CONSTRAINT [DF__ReturnYPD__ru_Tr__48EFCE0F]  DEFAULT (getdate()) FOR [ru_Trxtime]
GO
/****** Object:  Default [DF__ReturnYPD__Colle__49E3F248]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[ReturnYPDetailInfo] ADD  CONSTRAINT [DF__ReturnYPD__Colle__49E3F248]  DEFAULT (getdate()) FOR [CollectDate]
GO
/****** Object:  Default [DF_RoomCardConfig_RoomCard]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[RoomCardConfig] ADD  CONSTRAINT [DF_RoomCardConfig_RoomCard]  DEFAULT ((0)) FOR [RoomCard]
GO
/****** Object:  Default [DF_RoomCardConfig_Currency]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[RoomCardConfig] ADD  CONSTRAINT [DF_RoomCardConfig_Currency]  DEFAULT ((0)) FOR [Currency]
GO
/****** Object:  Default [DF_RoomCardConfig_Amount]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[RoomCardConfig] ADD  CONSTRAINT [DF_RoomCardConfig_Amount]  DEFAULT ((0)) FOR [Amount]
GO
/****** Object:  Default [DF_RoomCardConfig_SortID]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[RoomCardConfig] ADD  CONSTRAINT [DF_RoomCardConfig_SortID]  DEFAULT ((0)) FOR [SortID]
GO
/****** Object:  Default [DF_RoomCardConfig_Nullity]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[RoomCardConfig] ADD  CONSTRAINT [DF_RoomCardConfig_Nullity]  DEFAULT ((0)) FOR [Nullity]
GO
/****** Object:  Default [DF_RoomCardConfig_CollectDate]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[RoomCardConfig] ADD  CONSTRAINT [DF_RoomCardConfig_CollectDate]  DEFAULT (getdate()) FOR [CollectDate]
GO
/****** Object:  Default [DF_ShareOLDetialInfo_OperUserID]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[ShareDetailInfo] ADD  CONSTRAINT [DF_ShareOLDetialInfo_OperUserID]  DEFAULT ((0)) FOR [OperUserID]
GO
/****** Object:  Default [DF_ShareDetailInfo_CardTypeID]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[ShareDetailInfo] ADD  CONSTRAINT [DF_ShareDetailInfo_CardTypeID]  DEFAULT ((0)) FOR [CardTypeID]
GO
/****** Object:  Default [DF_ShareOLDetialInfo_SerialID]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[ShareDetailInfo] ADD  CONSTRAINT [DF_ShareOLDetialInfo_SerialID]  DEFAULT ('') FOR [SerialID]
GO
/****** Object:  Default [DF_ShareDetialInfo_OrderID]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[ShareDetailInfo] ADD  CONSTRAINT [DF_ShareDetialInfo_OrderID]  DEFAULT ('') FOR [OrderID]
GO
/****** Object:  Default [DF_ShareDetialInfo_OrderAmount]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[ShareDetailInfo] ADD  CONSTRAINT [DF_ShareDetialInfo_OrderAmount]  DEFAULT ((0)) FOR [OrderAmount]
GO
/****** Object:  Default [DF_ShareOLDetialInfo_DiscountScale]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[ShareDetailInfo] ADD  CONSTRAINT [DF_ShareOLDetialInfo_DiscountScale]  DEFAULT ((0)) FOR [DiscountScale]
GO
/****** Object:  Default [DF_ShareDetailInfo_Currency]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[ShareDetailInfo] ADD  CONSTRAINT [DF_ShareDetailInfo_Currency]  DEFAULT ((0)) FOR [Currency]
GO
/****** Object:  Default [DF_ShareDetailInfo_BeforeCurrency]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[ShareDetailInfo] ADD  CONSTRAINT [DF_ShareDetailInfo_BeforeCurrency]  DEFAULT ((0)) FOR [BeforeCurrency]
GO
/****** Object:  Default [DF_ShareOLDetialInfo_ApplyDate]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[ShareDetailInfo] ADD  CONSTRAINT [DF_ShareOLDetialInfo_ApplyDate]  DEFAULT (getdate()) FOR [ApplyDate]
GO
/****** Object:  Default [DF__ShareDetai__Gold__571DF1D5]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[ShareDetailInfo] ADD  DEFAULT ((0)) FOR [Gold]
GO
/****** Object:  Default [DF__ShareDeta__Befor__5812160E]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[ShareDetailInfo] ADD  DEFAULT ((0)) FOR [BeforeGold]
GO
/****** Object:  Default [DF__ShareDeta__RoomC__59063A47]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[ShareDetailInfo] ADD  DEFAULT ((0)) FOR [RoomCard]
GO
/****** Object:  Default [DF__ShareDeta__Befor__59FA5E80]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[ShareDetailInfo] ADD  DEFAULT ((0)) FOR [BeforeRoomCard]
GO
/****** Object:  Default [DF_StreamAgentPayInfo_FirstCollectDate]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[StreamAgentPayInfo] ADD  CONSTRAINT [DF_StreamAgentPayInfo_FirstCollectDate]  DEFAULT (getdate()) FOR [FirstCollectDate]
GO
/****** Object:  Default [DF_StreamAgentPayInfo_LastCollectDate]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[StreamAgentPayInfo] ADD  CONSTRAINT [DF_StreamAgentPayInfo_LastCollectDate]  DEFAULT (getdate()) FOR [LastCollectDate]
GO
/****** Object:  Default [DF_StreamPlayPresent_PresentCount]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[StreamPlayPresent] ADD  CONSTRAINT [DF_StreamPlayPresent_PresentCount]  DEFAULT ((0)) FOR [PresentCount]
GO
/****** Object:  Default [DF_StreamPlayPresent_PlayPresnet]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[StreamPlayPresent] ADD  CONSTRAINT [DF_StreamPlayPresent_PlayPresnet]  DEFAULT ((0)) FOR [PresentScore]
GO
/****** Object:  Default [DF_StreamPlayPresent_PlayTimeCount]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[StreamPlayPresent] ADD  CONSTRAINT [DF_StreamPlayPresent_PlayTimeCount]  DEFAULT ((0)) FOR [PlayTimeCount]
GO
/****** Object:  Default [DF_StreamPlayPresent_OnLineTimeCount]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[StreamPlayPresent] ADD  CONSTRAINT [DF_StreamPlayPresent_OnLineTimeCount]  DEFAULT ((0)) FOR [OnLineTimeCount]
GO
/****** Object:  Default [DF_StreamPlayPresent_FirstDate]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[StreamPlayPresent] ADD  CONSTRAINT [DF_StreamPlayPresent_FirstDate]  DEFAULT (getdate()) FOR [FirstDate]
GO
/****** Object:  Default [DF_StreamPlayPresent_LastDate]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[StreamPlayPresent] ADD  CONSTRAINT [DF_StreamPlayPresent_LastDate]  DEFAULT (getdate()) FOR [LastDate]
GO
/****** Object:  Default [DF_StreamPresentInfo_FirstDate]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[StreamPresentInfo] ADD  CONSTRAINT [DF_StreamPresentInfo_FirstDate]  DEFAULT (getdate()) FOR [FirstDate]
GO
/****** Object:  Default [DF_StreamPresentInfo_LastDate]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[StreamPresentInfo] ADD  CONSTRAINT [DF_StreamPresentInfo_LastDate]  DEFAULT (getdate()) FOR [LastDate]
GO
/****** Object:  Default [DF_StreamScoreInfo_WinCount]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[StreamScoreInfo] ADD  CONSTRAINT [DF_StreamScoreInfo_WinCount]  DEFAULT ((0)) FOR [WinCount]
GO
/****** Object:  Default [DF_StreamScoreInfo_LostCount]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[StreamScoreInfo] ADD  CONSTRAINT [DF_StreamScoreInfo_LostCount]  DEFAULT ((0)) FOR [LostCount]
GO
/****** Object:  Default [DF_StreamScoreInfo_Score]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[StreamScoreInfo] ADD  CONSTRAINT [DF_StreamScoreInfo_Score]  DEFAULT ((0)) FOR [Score]
GO
/****** Object:  Default [DF_StreamScoreInfo_Revenue]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[StreamScoreInfo] ADD  CONSTRAINT [DF_StreamScoreInfo_Revenue]  DEFAULT ((0)) FOR [Revenue]
GO
/****** Object:  Default [DF_StreamScoreInfo_ChipSerialScore]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[StreamScoreInfo] ADD  CONSTRAINT [DF_StreamScoreInfo_ChipSerialScore]  DEFAULT ((0)) FOR [ChipSerialScore]
GO
/****** Object:  Default [DF_StreamScoreInfo_PlayTimeCount_1]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[StreamScoreInfo] ADD  CONSTRAINT [DF_StreamScoreInfo_PlayTimeCount_1]  DEFAULT ((0)) FOR [PlayTimeCount]
GO
/****** Object:  Default [DF_StreamScoreInfo_FirstCollectDate]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[StreamScoreInfo] ADD  CONSTRAINT [DF_StreamScoreInfo_FirstCollectDate]  DEFAULT (getdate()) FOR [FirstCollectDate]
GO
/****** Object:  Default [DF_StreamScoreInfo_LastCollectDate]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[StreamScoreInfo] ADD  CONSTRAINT [DF_StreamScoreInfo_LastCollectDate]  DEFAULT (getdate()) FOR [LastCollectDate]
GO
/****** Object:  Default [DF_StreamShareInfo_ShareTotals]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[StreamShareInfo] ADD  CONSTRAINT [DF_StreamShareInfo_ShareTotals]  DEFAULT ((0)) FOR [ShareTotals]
GO
/****** Object:  Default [DF_StreamShareInfo_CollectDate]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[StreamShareInfo] ADD  CONSTRAINT [DF_StreamShareInfo_CollectDate]  DEFAULT (getdate()) FOR [CollectDate]
GO
/****** Object:  Default [DF_TABLE1_LogonCount]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[SystemStreamInfo] ADD  CONSTRAINT [DF_TABLE1_LogonCount]  DEFAULT ((0)) FOR [LogonCount]
GO
/****** Object:  Default [DF_GameEnterInfo_LogonCount1]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[SystemStreamInfo] ADD  CONSTRAINT [DF_GameEnterInfo_LogonCount1]  DEFAULT ((0)) FOR [RegisterCount]
GO
/****** Object:  Default [DF_TABLE1_RecordDate]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[SystemStreamInfo] ADD  CONSTRAINT [DF_TABLE1_RecordDate]  DEFAULT (getdate()) FOR [CollectDate]
GO
/****** Object:  Default [DF_TransferReturnConfig_ReturnType]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[TransferReturnConfig] ADD  CONSTRAINT [DF_TransferReturnConfig_ReturnType]  DEFAULT ((0)) FOR [ReturnType]
GO
/****** Object:  Default [DF_TransferReturnConfig_ReturnPercent]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[TransferReturnConfig] ADD  CONSTRAINT [DF_TransferReturnConfig_ReturnPercent]  DEFAULT ((0)) FOR [ReturnPercent]
GO
/****** Object:  Default [DF_TransferReturnConfig_ConfigDescribe]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[TransferReturnConfig] ADD  CONSTRAINT [DF_TransferReturnConfig_ConfigDescribe]  DEFAULT ('') FOR [ConfigDescribe]
GO
/****** Object:  Default [DF_TransferReturnDetailInfo_UserID]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[TransferReturnDetailInfo] ADD  CONSTRAINT [DF_TransferReturnDetailInfo_UserID]  DEFAULT ((0)) FOR [SourceUserID]
GO
/****** Object:  Default [DF_TransferReturnDetailInfo_TargetUserID]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[TransferReturnDetailInfo] ADD  CONSTRAINT [DF_TransferReturnDetailInfo_TargetUserID]  DEFAULT ((0)) FOR [TargetUserID]
GO
/****** Object:  Default [DF_TransferReturnDetailInfo_SwapScore]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[TransferReturnDetailInfo] ADD  CONSTRAINT [DF_TransferReturnDetailInfo_SwapScore]  DEFAULT ((0)) FOR [SwapScore]
GO
/****** Object:  Default [DF_TransferReturnDetailInfo_Revenue]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[TransferReturnDetailInfo] ADD  CONSTRAINT [DF_TransferReturnDetailInfo_Revenue]  DEFAULT ((0)) FOR [Revenue]
GO
/****** Object:  Default [DF_TransferReturnDetailInfo_ReturnType]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[TransferReturnDetailInfo] ADD  CONSTRAINT [DF_TransferReturnDetailInfo_ReturnType]  DEFAULT ((0)) FOR [ReturnType]
GO
/****** Object:  Default [DF_TransferReturnDetailInfo_ReturnPercent]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[TransferReturnDetailInfo] ADD  CONSTRAINT [DF_TransferReturnDetailInfo_ReturnPercent]  DEFAULT ((0)) FOR [ReturnPercent]
GO
/****** Object:  Default [DF_TransferReturnDetailInfo_ReturnDescribe]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[TransferReturnDetailInfo] ADD  CONSTRAINT [DF_TransferReturnDetailInfo_ReturnDescribe]  DEFAULT ('') FOR [ReturnDescribe]
GO
/****** Object:  Default [DF_TransferReturnDetailInfo_ReturnUserMedal]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[TransferReturnDetailInfo] ADD  CONSTRAINT [DF_TransferReturnDetailInfo_ReturnUserMedal]  DEFAULT ((0)) FOR [ReturnUserMedal]
GO
/****** Object:  Default [DF_TransferReturnDetailInfo_ReturnLoveLiness]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[TransferReturnDetailInfo] ADD  CONSTRAINT [DF_TransferReturnDetailInfo_ReturnLoveLiness]  DEFAULT ((0)) FOR [ReturnLoveLiness]
GO
/****** Object:  Default [DF_TransferReturnDetailInfo_IsReturn]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[TransferReturnDetailInfo] ADD  CONSTRAINT [DF_TransferReturnDetailInfo_IsReturn]  DEFAULT ((0)) FOR [IsReturn]
GO
/****** Object:  Default [DF_TransferReturnDetailInfo_CollectDate]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[TransferReturnDetailInfo] ADD  CONSTRAINT [DF_TransferReturnDetailInfo_CollectDate]  DEFAULT (getdate()) FOR [CollectDate]
GO
/****** Object:  Default [DF_TransferReturnStream_UserID]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[TransferReturnStream] ADD  CONSTRAINT [DF_TransferReturnStream_UserID]  DEFAULT ((0)) FOR [UserID]
GO
/****** Object:  Default [DF_TransferReturnStream_ReturnUserMedal]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[TransferReturnStream] ADD  CONSTRAINT [DF_TransferReturnStream_ReturnUserMedal]  DEFAULT ((0)) FOR [ReturnUserMedal]
GO
/****** Object:  Default [DF_TransferReturnStream_ReturnLoveLiness]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[TransferReturnStream] ADD  CONSTRAINT [DF_TransferReturnStream_ReturnLoveLiness]  DEFAULT ((0)) FOR [ReturnLoveLiness]
GO
/****** Object:  Default [DF_TransferReturnStream_LastReturnTime]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[TransferReturnStream] ADD  CONSTRAINT [DF_TransferReturnStream_LastReturnTime]  DEFAULT (getdate()) FOR [LastReturnTime]
GO
/****** Object:  Default [DF_UserGameData_LineGrandTotal]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[UserGameInfo] ADD  CONSTRAINT [DF_UserGameData_LineGrandTotal]  DEFAULT ((0)) FOR [LineGrandTotal]
GO
/****** Object:  Default [DF_UserGameData_LineWinMaxl]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[UserGameInfo] ADD  CONSTRAINT [DF_UserGameData_LineWinMaxl]  DEFAULT ((0)) FOR [LineWinMax]
GO
/****** Object:  Default [DF_UserGameData_LastModifyDate]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[UserGameInfo] ADD  CONSTRAINT [DF_UserGameData_LastModifyDate]  DEFAULT (getdate()) FOR [LastModifyDate]
GO
/****** Object:  Default [DF_UserGameInfo_Line_LineGrandTotal]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[UserGameInfo_Line] ADD  CONSTRAINT [DF_UserGameInfo_Line_LineGrandTotal]  DEFAULT ((0)) FOR [LineGrandTotal]
GO
/****** Object:  Default [DF_UserGameInfo_Line_LineWinMax]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[UserGameInfo_Line] ADD  CONSTRAINT [DF_UserGameInfo_Line_LineWinMax]  DEFAULT ((0)) FOR [LineWinMax]
GO
/****** Object:  Default [DF_UserGameInfo_Line_LastModifyDate]    Script Date: 05/19/2017 17:43:33 ******/
ALTER TABLE [dbo].[UserGameInfo_Line] ADD  CONSTRAINT [DF_UserGameInfo_Line_LastModifyDate]  DEFAULT (getdate()) FOR [LastModifyDate]
GO