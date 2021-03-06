USE [WHQJRecordDB]
GO

/****** Object:  Table [dbo].[RecordTreasureSerial]    Script Date: 2017/9/15 10:23:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RecordTreasureSerial](
	[SerialNumber] [nvarchar](19) NOT NULL,
	[MasterID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[TypeID] [int] NOT NULL,
	[CurScore] [bigint] NOT NULL,
	[CurInsureScore] [bigint] NOT NULL,
	[ChangeScore] [BIGINT] NOT NULL,
	[ClientIP] [nvarchar](15) NOT NULL,
	[CollectDate] [datetime] NOT NULL,
 CONSTRAINT [PK_RecordTreasureSerial] PRIMARY KEY CLUSTERED 
(
	[SerialNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[RecordTreasureSerial] ADD  CONSTRAINT [DF_RecordTreasureSerial_SerialNumber]  DEFAULT ('') FOR [SerialNumber]
GO
ALTER TABLE [dbo].[RecordTreasureSerial] ADD  CONSTRAINT [DF_RecordTreasureSerial_MasterID]  DEFAULT ((0)) FOR [MasterID]
GO
ALTER TABLE [dbo].[RecordTreasureSerial] ADD  CONSTRAINT [DF_RecordTreasureSerial_UserID]  DEFAULT ((0)) FOR [UserID]
GO
ALTER TABLE [dbo].[RecordTreasureSerial] ADD  CONSTRAINT [DF_RecordTreasureSerial_TypeID]  DEFAULT ((0)) FOR [TypeID]
GO
ALTER TABLE [dbo].[RecordTreasureSerial] ADD  CONSTRAINT [DF_RecordTreasureSerial_CurScore]  DEFAULT ((0)) FOR [CurScore]
GO
ALTER TABLE [dbo].[RecordTreasureSerial] ADD  CONSTRAINT [DF_RecordTreasureSerial_CurInsureScore]  DEFAULT ((0)) FOR [CurInsureScore]
GO
ALTER TABLE [dbo].[RecordTreasureSerial] ADD  CONSTRAINT [DF_RecordTreasureSerial_ChangeScore]  DEFAULT ((0)) FOR [ChangeScore]
GO
ALTER TABLE [dbo].[RecordTreasureSerial] ADD  CONSTRAINT [DF_RecordTreasureSerial_ClientIP]  DEFAULT ('') FOR [ClientIP]
GO
ALTER TABLE [dbo].[RecordTreasureSerial] ADD  CONSTRAINT [DF_RecordTreasureSerial_CollectDate]  DEFAULT (getdate()) FOR [CollectDate]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'流水号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordTreasureSerial', @level2type=N'COLUMN',@level2name=N'SerialNumber'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'后台操作管理员' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordTreasureSerial', @level2type=N'COLUMN',@level2name=N'MasterID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'流水用户标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordTreasureSerial', @level2type=N'COLUMN',@level2name=N'UserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'操作类型（0 后台赠送  1 注册赠送  2、主动转账  3、接受转账  4、购买道具  5、钻石兑换）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordTreasureSerial', @level2type=N'COLUMN',@level2name=N'TypeID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'操作前携带金币' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordTreasureSerial', @level2type=N'COLUMN',@level2name=N'CurScore'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'操作前银行金币' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordTreasureSerial', @level2type=N'COLUMN',@level2name=N'CurInsureScore'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'操作变化金币' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordTreasureSerial', @level2type=N'COLUMN',@level2name=N'ChangeScore'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'操作地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordTreasureSerial', @level2type=N'COLUMN',@level2name=N'ClientIP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'操作时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordTreasureSerial', @level2type=N'COLUMN',@level2name=N'CollectDate'
GO

/****** Object:  Table [dbo].[RecordGoldBuyProperty]    Script Date: 2017/9/13 14:42:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[RecordGoldBuyProperty](
	[RecordID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[PropertyID] [int] NOT NULL,
	[PropertyName] [nvarchar](31) NOT NULL,
	[PropertyPrice] [int] NOT NULL,
	[BuyNum] [int] NOT NULL,
	[CurScore] [bigint] NOT NULL,
	[CurInsureScore] [bigint] NOT NULL,
	[CostGold] [bigint] NOT NULL,
	[ClinetIP] [nvarchar](15) NOT NULL,
	[CollectDate] [datetime] NOT NULL,
 CONSTRAINT [PK_RecordGoldBuyProperty] PRIMARY KEY CLUSTERED 
(
	[RecordID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[RecordGoldBuyProperty] ADD  CONSTRAINT [DF_RecordGoldBuyProperty_UserID]  DEFAULT ((0)) FOR [UserID]
GO
ALTER TABLE [dbo].[RecordGoldBuyProperty] ADD  CONSTRAINT [DF_RecordGoldBuyProperty_PropertyID]  DEFAULT ((0)) FOR [PropertyID]
GO
ALTER TABLE [dbo].[RecordGoldBuyProperty] ADD  CONSTRAINT [DF_RecordGoldBuyProperty_PropertyName]  DEFAULT ('') FOR [PropertyName]
GO
ALTER TABLE [dbo].[RecordGoldBuyProperty] ADD  CONSTRAINT [DF_RecordGoldBuyProperty_PropertyPrice]  DEFAULT ((0)) FOR [PropertyPrice]
GO
ALTER TABLE [dbo].[RecordGoldBuyProperty] ADD  CONSTRAINT [DF_RecordGoldBuyProperty_BuyNum]  DEFAULT ((0)) FOR [BuyNum]
GO
ALTER TABLE [dbo].[RecordGoldBuyProperty] ADD  CONSTRAINT [DF_RecordGoldBuyProperty_CurScore]  DEFAULT ((0)) FOR [CurScore]
GO
ALTER TABLE [dbo].[RecordGoldBuyProperty] ADD  CONSTRAINT [DF_RecordGoldBuyProperty_CurInsureScore]  DEFAULT ((0)) FOR [CurInsureScore]
GO
ALTER TABLE [dbo].[RecordGoldBuyProperty] ADD  CONSTRAINT [DF_RecordGoldBuyProperty_CostGold]  DEFAULT ((0)) FOR [CostGold]
GO
ALTER TABLE [dbo].[RecordGoldBuyProperty] ADD  CONSTRAINT [DF_RecordGoldBuyProperty_ClinetIP]  DEFAULT ('') FOR [ClinetIP]
GO
ALTER TABLE [dbo].[RecordGoldBuyProperty] ADD  CONSTRAINT [DF_RecordGoldBuyProperty_CollectDate]  DEFAULT (getdate()) FOR [CollectDate]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGoldBuyProperty', @level2type=N'COLUMN',@level2name=N'RecordID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGoldBuyProperty', @level2type=N'COLUMN',@level2name=N'UserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'道具标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGoldBuyProperty', @level2type=N'COLUMN',@level2name=N'PropertyID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'道具名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGoldBuyProperty', @level2type=N'COLUMN',@level2name=N'PropertyName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'道具价格' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGoldBuyProperty', @level2type=N'COLUMN',@level2name=N'PropertyPrice'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'购买数量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGoldBuyProperty', @level2type=N'COLUMN',@level2name=N'BuyNum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'购买前携带金币' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGoldBuyProperty', @level2type=N'COLUMN',@level2name=N'CurScore'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'购买前银行金币' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGoldBuyProperty', @level2type=N'COLUMN',@level2name=N'CurInsureScore'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'购买消耗金币' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGoldBuyProperty', @level2type=N'COLUMN',@level2name=N'CostGold'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'购买地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGoldBuyProperty', @level2type=N'COLUMN',@level2name=N'ClinetIP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'购买时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGoldBuyProperty', @level2type=N'COLUMN',@level2name=N'CollectDate'
GO
/****** Object:  Table [dbo].[RecordCurrencyExch]    Script Date: 2017/9/13 14:42:26 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[RecordCurrencyExch](
	[RecordID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[TypeID] [tinyint] NOT NULL,
	[CurDiamond] [bigint] NOT NULL,
	[ExchDiamond] [int] NOT NULL,
	[CurScore] [bigint] NOT NULL,
	[CurInsureScore] [bigint] NOT NULL,
	[PresentGold] [bigint] NOT NULL,
	[ClientIP] [nvarchar](15) NOT NULL,
	[CollectDate] [datetime] NOT NULL,
 CONSTRAINT [PK_RecordCurrencyExch] PRIMARY KEY CLUSTERED 
(
	[RecordID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[RecordCurrencyExch] ADD  CONSTRAINT [DF_RecordCurrencyExch_UserID]  DEFAULT ((0)) FOR [UserID]
GO
ALTER TABLE [dbo].[RecordCurrencyExch] ADD  CONSTRAINT [DF_RecordCurrencyExch_TypeID]  DEFAULT ((0)) FOR [TypeID]
GO
ALTER TABLE [dbo].[RecordCurrencyExch] ADD  CONSTRAINT [DF_RecordCurrencyExch_CurDiamond]  DEFAULT ((0)) FOR [CurDiamond]
GO
ALTER TABLE [dbo].[RecordCurrencyExch] ADD  CONSTRAINT [DF_RecordCurrencyExch_ExchDiamond]  DEFAULT ((0)) FOR [ExchDiamond]
GO
ALTER TABLE [dbo].[RecordCurrencyExch] ADD  CONSTRAINT [DF_RecordCurrencyExch_CurScore]  DEFAULT ((0)) FOR [CurScore]
GO
ALTER TABLE [dbo].[RecordCurrencyExch] ADD  CONSTRAINT [DF_RecordCurrencyExch_CurInsureScore]  DEFAULT ((0)) FOR [CurInsureScore]
GO
ALTER TABLE [dbo].[RecordCurrencyExch] ADD  CONSTRAINT [DF_RecordCurrencyExch_PresentGold]  DEFAULT ((0)) FOR [PresentGold]
GO
ALTER TABLE [dbo].[RecordCurrencyExch] ADD  CONSTRAINT [DF_RecordCurrencyExch_ClientIP]  DEFAULT ('') FOR [ClientIP]
GO
ALTER TABLE [dbo].[RecordCurrencyExch] ADD  CONSTRAINT [DF_RecordCurrencyExch_CollectDate]  DEFAULT (getdate()) FOR [CollectDate]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordCurrencyExch', @level2type=N'COLUMN',@level2name=N'RecordID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordCurrencyExch', @level2type=N'COLUMN',@level2name=N'UserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'兑换渠道（0、APP  1、H5）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordCurrencyExch', @level2type=N'COLUMN',@level2name=N'TypeID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'兑换前钻石数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordCurrencyExch', @level2type=N'COLUMN',@level2name=N'CurDiamond'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'兑换钻石数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordCurrencyExch', @level2type=N'COLUMN',@level2name=N'ExchDiamond'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'兑换前携带金币数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordCurrencyExch', @level2type=N'COLUMN',@level2name=N'CurScore'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'兑换前银行金币数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordCurrencyExch', @level2type=N'COLUMN',@level2name=N'CurInsureScore'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'钻石兑换赠送金币数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordCurrencyExch', @level2type=N'COLUMN',@level2name=N'PresentGold'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'兑换地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordCurrencyExch', @level2type=N'COLUMN',@level2name=N'ClientIP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'兑换时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordCurrencyExch', @level2type=N'COLUMN',@level2name=N'CollectDate'
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
/****** Object:  Table [dbo].[RecordRegisterGrant]    Script Date: 2017/7/24 16:41:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RecordRegisterGrant](
	[UserID] [int] NOT NULL,
	[RegisterIP] [nvarchar](15) NOT NULL,
	[RegisterDate] [datetime] NOT NULL,
	[RegisterMachine] [nvarchar](32) NOT NULL,
	[RegisterOrigin] [tinyint] NOT NULL,
	[ClientType] [tinyint] NOT NULL,
	[GrantDiamond] [int] NOT NULL,
	[GrantGold] [int] NOT NULL,
	[IsReceive] [bit] NOT NULL,
	[ReceiveDate] [datetime] NULL,
	[ReceiveIP] [nvarchar](15) NOT NULL,
 CONSTRAINT [PK_RecordRegisterGrant] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[RecordRegisterGrant] ADD  CONSTRAINT [DF_RecordRegisterGrant_UserID]  DEFAULT ((0)) FOR [UserID]
GO
ALTER TABLE [dbo].[RecordRegisterGrant] ADD  CONSTRAINT [DF_RecordRegisterGrant_RegisterIP]  DEFAULT ('') FOR [RegisterIP]
GO
ALTER TABLE [dbo].[RecordRegisterGrant] ADD  CONSTRAINT [DF_RecordRegisterGrant_RegisterDate]  DEFAULT (getdate()) FOR [RegisterDate]
GO
ALTER TABLE [dbo].[RecordRegisterGrant] ADD  CONSTRAINT [DF_RecordRegisterGrant_RegisterMachine]  DEFAULT ('') FOR [RegisterMachine]
GO
ALTER TABLE [dbo].[RecordRegisterGrant] ADD  CONSTRAINT [DF_RecordRegisterGrant_RegisterOrigin]  DEFAULT ((0)) FOR [RegisterOrigin]
GO
ALTER TABLE [dbo].[RecordRegisterGrant] ADD  CONSTRAINT [DF_RecordRegisterGrant_ClientType]  DEFAULT ((0)) FOR [ClientType]
GO
ALTER TABLE [dbo].[RecordRegisterGrant] ADD  CONSTRAINT [DF_RecordRegisterGrant_GrantDiamond]  DEFAULT ((0)) FOR [GrantDiamond]
GO
ALTER TABLE [dbo].[RecordRegisterGrant] ADD  CONSTRAINT [DF_RecordRegisterGrant_IsReceive]  DEFAULT ((0)) FOR [IsReceive]
GO
ALTER TABLE [dbo].[RecordRegisterGrant] ADD  CONSTRAINT [DF_RecordRegisterGrant_ReceiveIP]  DEFAULT ('') FOR [ReceiveIP]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordRegisterGrant', @level2type=N'COLUMN',@level2name=N'UserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'注册地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordRegisterGrant', @level2type=N'COLUMN',@level2name=N'RegisterIP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'注册时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordRegisterGrant', @level2type=N'COLUMN',@level2name=N'RegisterDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'注册机器' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordRegisterGrant', @level2type=N'COLUMN',@level2name=N'RegisterMachine'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'注册来源' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordRegisterGrant', @level2type=N'COLUMN',@level2name=N'RegisterOrigin'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'注册客户端类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordRegisterGrant', @level2type=N'COLUMN',@level2name=N'ClientType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'赠送钻石' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordRegisterGrant', @level2type=N'COLUMN',@level2name=N'GrantDiamond'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否领取 （1 已领取）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordRegisterGrant', @level2type=N'COLUMN',@level2name=N'IsReceive'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'领取时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordRegisterGrant', @level2type=N'COLUMN',@level2name=N'ReceiveDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'领取地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordRegisterGrant', @level2type=N'COLUMN',@level2name=N'ReceiveIP'
GO
/****** 对象:  Table [dbo].[RecordSendPresent]    脚本日期: 03/17/2017 10:13:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RecordSendPresent](
	[PresentID] [tinyint] NOT NULL,
	[RcvUserID] [int] NOT NULL,
	[SendUserID] [int] NOT NULL,
	[LovelinessRcv] [int] NOT NULL,
	[LovelinessSend] [int] NOT NULL,
	[PresentPrice] [int] NOT NULL,
	[PresentCount] [int] NOT NULL,
	[KindID] [int] NOT NULL,
	[ServerID] [int] NOT NULL,
	[SendTime] [datetime] NOT NULL CONSTRAINT [DF_RecordSendPresent_SendTime]  DEFAULT (getdate()),
	[ClientIP] [nvarchar](15) NOT NULL
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'礼物标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordSendPresent', @level2type=N'COLUMN',@level2name=N'PresentID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'玩家标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordSendPresent', @level2type=N'COLUMN',@level2name=N'RcvUserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'玩家标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordSendPresent', @level2type=N'COLUMN',@level2name=N'SendUserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'魅力数目' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordSendPresent', @level2type=N'COLUMN',@level2name=N'LovelinessRcv'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'魅力数目' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordSendPresent', @level2type=N'COLUMN',@level2name=N'LovelinessSend'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'礼物价钱' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordSendPresent', @level2type=N'COLUMN',@level2name=N'PresentPrice'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'礼物数目' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordSendPresent', @level2type=N'COLUMN',@level2name=N'PresentCount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'类型标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordSendPresent', @level2type=N'COLUMN',@level2name=N'KindID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'房间标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordSendPresent', @level2type=N'COLUMN',@level2name=N'ServerID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'赠送时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordSendPresent', @level2type=N'COLUMN',@level2name=N'SendTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'玩家地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordSendPresent', @level2type=N'COLUMN',@level2name=N'ClientIP'
GO
/****** 对象:  Table [dbo].[RecordGrantGameScore]    脚本日期: 03/17/2017 10:12:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RecordGrantGameScore](
	[RecordID] [int] IDENTITY(1,1) NOT NULL,
	[MasterID] [int] NOT NULL,
	[ClientIP] [varchar](15) NOT NULL CONSTRAINT [DF_RecordGrantGameScore_VisitIP]  DEFAULT (N'000.000.000.000'),
	[CollectDate] [datetime] NOT NULL CONSTRAINT [DF_RecordGrantGameScore_CreateDatetime]  DEFAULT (getdate()),
	[UserID] [int] NOT NULL,
	[KindID] [int] NOT NULL,
	[CurScore] [bigint] NOT NULL CONSTRAINT [DF_RecordGrantGameScore_CurScore]  DEFAULT ((0)),
	[AddScore] [int] NOT NULL CONSTRAINT [DF_RecordGrantGameScore_AddScore]  DEFAULT ((0)),
	[Reason] [nvarchar](32) NOT NULL CONSTRAINT [DF_RecordGrantGameScore_Reason]  DEFAULT (N''),
 CONSTRAINT [PK_RecordGrantGameScore] PRIMARY KEY CLUSTERED 
(
	[RecordID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGrantGameScore', @level2type=N'COLUMN',@level2name=N'RecordID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'管理员标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGrantGameScore', @level2type=N'COLUMN',@level2name=N'MasterID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'来访地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGrantGameScore', @level2type=N'COLUMN',@level2name=N'ClientIP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'操作日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGrantGameScore', @level2type=N'COLUMN',@level2name=N'CollectDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGrantGameScore', @level2type=N'COLUMN',@level2name=N'UserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'游戏标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGrantGameScore', @level2type=N'COLUMN',@level2name=N'KindID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'当前积分' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGrantGameScore', @level2type=N'COLUMN',@level2name=N'CurScore'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'增加积分' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGrantGameScore', @level2type=N'COLUMN',@level2name=N'AddScore'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'操作理由' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGrantGameScore', @level2type=N'COLUMN',@level2name=N'Reason'
GO
/****** 对象:  Table [dbo].[RecordSignin]    脚本日期: 03/17/2017 10:13:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RecordSignin](
	[RecordID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[Gold] [int] NOT NULL CONSTRAINT [DF_RecordSingin_AwardGold]  DEFAULT ((0)),
	[ClinetIP] [nvarchar](15) NOT NULL CONSTRAINT [DF_RecordSignin_ClinetIP]  DEFAULT (''),
	[ClinetMachine] [nvarchar](32) NOT NULL CONSTRAINT [DF_RecordSignin_ClinetMachine]  DEFAULT (''),
	[CollectDate] [datetime] NOT NULL CONSTRAINT [DF_RecordSignin_CollectDate]  DEFAULT (getdate()),
 CONSTRAINT [PK_RecordSingin] PRIMARY KEY CLUSTERED 
(
	[RecordID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'日志标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordSignin', @level2type=N'COLUMN',@level2name=N'RecordID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordSignin', @level2type=N'COLUMN',@level2name=N'UserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'奖励金币' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordSignin', @level2type=N'COLUMN',@level2name=N'Gold'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'领取地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordSignin', @level2type=N'COLUMN',@level2name=N'ClinetIP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'领取机器' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordSignin', @level2type=N'COLUMN',@level2name=N'ClinetMachine'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'领取时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordSignin', @level2type=N'COLUMN',@level2name=N'CollectDate'
GO
/****** 对象:  Table [dbo].[RecordSendProperty]    脚本日期: 03/17/2017 10:13:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RecordSendProperty](
	[PropID] [tinyint] NOT NULL,
	[SourceUserID] [int] NOT NULL,
	[TargetUserID] [int] NOT NULL,
	[PropPrice] [int] NOT NULL,
	[PropCount] [int] NOT NULL,
	[KindID] [int] NOT NULL,
	[ServerID] [int] NOT NULL,
	[SendTime] [datetime] NOT NULL CONSTRAINT [DF_RecordSendProperty_SendTime]  DEFAULT (getdate()),
	[ClientIP] [nvarchar](15) NOT NULL
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'道具标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordSendProperty', @level2type=N'COLUMN',@level2name=N'PropID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'玩家标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordSendProperty', @level2type=N'COLUMN',@level2name=N'SourceUserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'玩家标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordSendProperty', @level2type=N'COLUMN',@level2name=N'TargetUserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'道具价格' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordSendProperty', @level2type=N'COLUMN',@level2name=N'PropPrice'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'道具数目' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordSendProperty', @level2type=N'COLUMN',@level2name=N'PropCount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'类型标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordSendProperty', @level2type=N'COLUMN',@level2name=N'KindID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'房间标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordSendProperty', @level2type=N'COLUMN',@level2name=N'ServerID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'赠送时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordSendProperty', @level2type=N'COLUMN',@level2name=N'SendTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'玩家地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordSendProperty', @level2type=N'COLUMN',@level2name=N'ClientIP'
GO
/****** 对象:  Table [dbo].[RecordGrantClearScore]    脚本日期: 03/17/2017 10:12:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RecordGrantClearScore](
	[RecordID] [int] IDENTITY(1,1) NOT NULL,
	[MasterID] [int] NOT NULL,
	[ClientIP] [varchar](15) NOT NULL CONSTRAINT [DF_RecordGrantClearScore_ClientIP]  DEFAULT ('000.000.000.000'),
	[CollectDate] [datetime] NOT NULL CONSTRAINT [DF_RecordGrantClearScore_CollectDate]  DEFAULT (getdate()),
	[UserID] [int] NOT NULL CONSTRAINT [DF_RecordGrantClearScore_UserID]  DEFAULT ((0)),
	[KindID] [int] NOT NULL,
	[CurScore] [bigint] NOT NULL CONSTRAINT [DF_RecordGrantClearScore_CurScore]  DEFAULT ((0)),
	[Reason] [nvarchar](32) NOT NULL CONSTRAINT [DF_RecordGrantClearScore_Reason]  DEFAULT (''),
 CONSTRAINT [PK_RecordGrantClearScore] PRIMARY KEY CLUSTERED 
(
	[RecordID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGrantClearScore', @level2type=N'COLUMN',@level2name=N'RecordID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'管理员ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGrantClearScore', @level2type=N'COLUMN',@level2name=N'MasterID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'客户端IP' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGrantClearScore', @level2type=N'COLUMN',@level2name=N'ClientIP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'收集日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGrantClearScore', @level2type=N'COLUMN',@level2name=N'CollectDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'玩家标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGrantClearScore', @level2type=N'COLUMN',@level2name=N'UserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'游戏标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGrantClearScore', @level2type=N'COLUMN',@level2name=N'KindID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'当前积分' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGrantClearScore', @level2type=N'COLUMN',@level2name=N'CurScore'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'清零负分原因' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGrantClearScore', @level2type=N'COLUMN',@level2name=N'Reason'
GO

/****** Object:  Table [dbo].[RecordPresentCurrency]    Script Date: 2017/7/17 16:04:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RecordPresentCurrency](
	[RecordID] [int] IDENTITY(1,1) NOT NULL,
	[SourceUserID] [int] NOT NULL,
	[SourceDiamond] [bigint] NOT NULL,
	[TargetUserID] [int] NOT NULL,
	[TargetDiamond] [bigint] NOT NULL,
	[TargetAgentLevel] [tinyint] NOT NULL,
	[PresentDiamond] [int] NOT NULL,
	[ClientIP] [nvarchar](15) NOT NULL,
	[CollectDate] [datetime] NOT NULL,
	[CollectNote] [nvarchar](63) NOT NULL,
 CONSTRAINT [PK_RecordPresentCurrency] PRIMARY KEY CLUSTERED 
(
	[RecordID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[RecordPresentCurrency] ADD  CONSTRAINT [DF_RecordPresentCurrency_SourceUserID]  DEFAULT ((0)) FOR [SourceUserID]
GO
ALTER TABLE [dbo].[RecordPresentCurrency] ADD  CONSTRAINT [DF_RecordPresentCurrency_SourceDiamond]  DEFAULT ((0)) FOR [SourceDiamond]
GO
ALTER TABLE [dbo].[RecordPresentCurrency] ADD  CONSTRAINT [DF_RecordPresentCurrency_TargetUserID]  DEFAULT ((0)) FOR [TargetUserID]
GO
ALTER TABLE [dbo].[RecordPresentCurrency] ADD  CONSTRAINT [DF_RecordPresentCurrency_TargetDiamond]  DEFAULT ((0)) FOR [TargetDiamond]
GO
ALTER TABLE [dbo].[RecordPresentCurrency] ADD  CONSTRAINT [DF_RecordPresentCurrency_TargetAgentLevel]  DEFAULT ((0)) FOR [TargetAgentLevel]
GO
ALTER TABLE [dbo].[RecordPresentCurrency] ADD  CONSTRAINT [DF_RecordPresentCurrency_PresentDiamond]  DEFAULT ((0)) FOR [PresentDiamond]
GO
ALTER TABLE [dbo].[RecordPresentCurrency] ADD  CONSTRAINT [DF_RecordPresentCurrency_ClientIP]  DEFAULT ('') FOR [ClientIP]
GO
ALTER TABLE [dbo].[RecordPresentCurrency] ADD  CONSTRAINT [DF_RecordPresentCurrency_CollectDate]  DEFAULT (getdate()) FOR [CollectDate]
GO
ALTER TABLE [dbo].[RecordPresentCurrency] ADD  CONSTRAINT [DF_RecordPresentCurrency_CollectNote]  DEFAULT ('') FOR [CollectNote]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordPresentCurrency', @level2type=N'COLUMN',@level2name=N'RecordID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'赠送者ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordPresentCurrency', @level2type=N'COLUMN',@level2name=N'SourceUserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'赠送者钻石数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordPresentCurrency', @level2type=N'COLUMN',@level2name=N'SourceDiamond'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'接收者ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordPresentCurrency', @level2type=N'COLUMN',@level2name=N'TargetUserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'接收者钻石数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordPresentCurrency', @level2type=N'COLUMN',@level2name=N'TargetDiamond'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'目标账号代理级别（非代理则为0）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordPresentCurrency', @level2type=N'COLUMN',@level2name=N'TargetAgentLevel'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'赠送钻石' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordPresentCurrency', @level2type=N'COLUMN',@level2name=N'PresentDiamond'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'赠送地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordPresentCurrency', @level2type=N'COLUMN',@level2name=N'ClientIP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'赠送时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordPresentCurrency', @level2type=N'COLUMN',@level2name=N'CollectDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'赠送备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordPresentCurrency', @level2type=N'COLUMN',@level2name=N'CollectNote'
GO
/****** Object:  Table [dbo].[RecordGrantDiamond]    Script Date: 2017/7/17 15:59:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RecordGrantDiamond](
	[RecordID] [int] IDENTITY(1,1) NOT NULL,
	[MasterID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[TypeID] [int] NOT NULL,
	[CurDiamond] [bigint] NOT NULL,
	[AddDiamond] [int] NOT NULL,
	[ClientIP] [nvarchar](15) NOT NULL,
	[CollectDate] [datetime] NOT NULL,
	[CollectNote] [nvarchar](63) NOT NULL,
 CONSTRAINT [PK_RecordGrantDiamond] PRIMARY KEY CLUSTERED 
(
	[RecordID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[RecordGrantDiamond] ADD  CONSTRAINT [DF_RecordGrantDiamond_MasterID]  DEFAULT ((1)) FOR [MasterID]
GO
ALTER TABLE [dbo].[RecordGrantDiamond] ADD  CONSTRAINT [DF_RecordGrantDiamond_UserID]  DEFAULT ((0)) FOR [UserID]
GO
ALTER TABLE [dbo].[RecordGrantDiamond] ADD  CONSTRAINT [DF_RecordGrantDiamond_TypeID]  DEFAULT ((0)) FOR [TypeID]
GO
ALTER TABLE [dbo].[RecordGrantDiamond] ADD  CONSTRAINT [DF_RecordGrantDiamond_CurDiamond]  DEFAULT ((0)) FOR [CurDiamond]
GO
ALTER TABLE [dbo].[RecordGrantDiamond] ADD  CONSTRAINT [DF_RecordGrantDiamond_AddDiamond]  DEFAULT ((0)) FOR [AddDiamond]
GO
ALTER TABLE [dbo].[RecordGrantDiamond] ADD  CONSTRAINT [DF_RecordGrantDiamond_ClientIP]  DEFAULT ('') FOR [ClientIP]
GO
ALTER TABLE [dbo].[RecordGrantDiamond] ADD  CONSTRAINT [DF_RecordGrantDiamond_CollectDate]  DEFAULT (getdate()) FOR [CollectDate]
GO
ALTER TABLE [dbo].[RecordGrantDiamond] ADD  CONSTRAINT [DF_RecordGrantDiamond_Reason]  DEFAULT ('') FOR [CollectNote]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'管理员标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGrantDiamond', @level2type=N'COLUMN',@level2name=N'MasterID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'赠送用户' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGrantDiamond', @level2type=N'COLUMN',@level2name=N'UserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'赠送类型（0、系统后台赠送 ）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGrantDiamond', @level2type=N'COLUMN',@level2name=N'TypeID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'赠送前钻石' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGrantDiamond', @level2type=N'COLUMN',@level2name=N'CurDiamond'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'赠送钻石' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGrantDiamond', @level2type=N'COLUMN',@level2name=N'AddDiamond'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'赠送地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGrantDiamond', @level2type=N'COLUMN',@level2name=N'ClientIP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'赠送时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGrantDiamond', @level2type=N'COLUMN',@level2name=N'CollectDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'赠送备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGrantDiamond', @level2type=N'COLUMN',@level2name=N'CollectNote'
GO

/****** 对象:  Table [dbo].[RecordEveryDayRoomData]    脚本日期: 03/17/2017 10:12:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RecordEveryDayRoomData](
	[DateID] [int] NOT NULL,
	[KindID] [int] NOT NULL,
	[ServerID] [int] NOT NULL,
	[Waste] [bigint] NOT NULL CONSTRAINT [DF_RecordEveryDayRoomData_Waste]  DEFAULT ((0)),
	[Revenue] [bigint] NOT NULL CONSTRAINT [DF_RecordEveryDayRoomData_Revenue]  DEFAULT ((0)),
	[Medal] [int] NOT NULL CONSTRAINT [DF_RecordEveryDayRoomData_Medal]  DEFAULT ((0)),
	[CollectDate] [datetime] NOT NULL CONSTRAINT [DF_RecordEveryDayRoomData_InputDate]  DEFAULT (getdate()),
 CONSTRAINT [PK_RecordEveryDayRoomData] PRIMARY KEY CLUSTERED 
(
	[DateID] ASC,
	[KindID] ASC,
	[ServerID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'日期标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordEveryDayRoomData', @level2type=N'COLUMN',@level2name=N'DateID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'游戏标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordEveryDayRoomData', @level2type=N'COLUMN',@level2name=N'KindID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'房间标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordEveryDayRoomData', @level2type=N'COLUMN',@level2name=N'ServerID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'损耗' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordEveryDayRoomData', @level2type=N'COLUMN',@level2name=N'Waste'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'服务比例' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordEveryDayRoomData', @level2type=N'COLUMN',@level2name=N'Revenue'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'奖牌' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordEveryDayRoomData', @level2type=N'COLUMN',@level2name=N'Medal'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'录入日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordEveryDayRoomData', @level2type=N'COLUMN',@level2name=N'CollectDate'
GO
/****** 对象:  Table [dbo].[RecordGrantClearFlee]    脚本日期: 03/17/2017 10:12:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RecordGrantClearFlee](
	[RecordID] [int] IDENTITY(1,1) NOT NULL,
	[MasterID] [int] NOT NULL,
	[ClientIP] [varchar](15) NOT NULL CONSTRAINT [DF_RecordGrantFlee_ClientIP]  DEFAULT ('000.000.000.000'),
	[CollectDate] [datetime] NOT NULL CONSTRAINT [DF_RecordGrantFlee_CollectDate]  DEFAULT (getdate()),
	[UserID] [int] NOT NULL,
	[KindID] [int] NOT NULL,
	[CurFlee] [int] NOT NULL CONSTRAINT [DF_RecordGrantFlee_CurFlee]  DEFAULT ((0)),
	[Reason] [nvarchar](32) NOT NULL CONSTRAINT [DF_RecordGrantFlee_Reason]  DEFAULT (N''),
 CONSTRAINT [PK_RecordGrantFlee] PRIMARY KEY CLUSTERED 
(
	[RecordID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGrantClearFlee', @level2type=N'COLUMN',@level2name=N'RecordID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'管理标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGrantClearFlee', @level2type=N'COLUMN',@level2name=N'MasterID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'服务地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGrantClearFlee', @level2type=N'COLUMN',@level2name=N'ClientIP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'玩家标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGrantClearFlee', @level2type=N'COLUMN',@level2name=N'UserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'游戏标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGrantClearFlee', @level2type=N'COLUMN',@level2name=N'KindID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'当前逃跑次数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGrantClearFlee', @level2type=N'COLUMN',@level2name=N'CurFlee'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'理由' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGrantClearFlee', @level2type=N'COLUMN',@level2name=N'Reason'
GO

/****** Object:  Table [dbo].[RecordGameDiamond]    Script Date: 2017/7/17 15:59:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RecordGameDiamond](
	[RecordID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[TypeID] [tinyint] NOT NULL,
	[ServerID] [int] NOT NULL,
	[RoomID] [int] NOT NULL,
	[BeforeDiamond] [bigint] NOT NULL,
	[Diamond] [int] NOT NULL,
	[ClientIP] [nvarchar](15) NOT NULL,
	[CollectDate] [datetime] NOT NULL,
 CONSTRAINT [PK_RecordGameDiamond] PRIMARY KEY CLUSTERED 
(
	[RecordID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[RecordGameDiamond] ADD  CONSTRAINT [DF_RecordGameDiamond_UserID]  DEFAULT ((0)) FOR [UserID]
GO
ALTER TABLE [dbo].[RecordGameDiamond] ADD  CONSTRAINT [DF_RecordGameDiamond_TypeID]  DEFAULT ((0)) FOR [TypeID]
GO
ALTER TABLE [dbo].[RecordGameDiamond] ADD  CONSTRAINT [DF_RecordGameDiamond_ServerID]  DEFAULT ((0)) FOR [ServerID]
GO
ALTER TABLE [dbo].[RecordGameDiamond] ADD  CONSTRAINT [DF_RecordGameDiamond_RoomID]  DEFAULT ((0)) FOR [RoomID]
GO
ALTER TABLE [dbo].[RecordGameDiamond] ADD  CONSTRAINT [DF_RecordGameDiamond_BeforeDiamond]  DEFAULT ((0)) FOR [BeforeDiamond]
GO
ALTER TABLE [dbo].[RecordGameDiamond] ADD  CONSTRAINT [DF_RecordGameDiamond_Diamond]  DEFAULT ((0)) FOR [Diamond]
GO
ALTER TABLE [dbo].[RecordGameDiamond] ADD  CONSTRAINT [DF_RecordGameDiamond_ClientIP]  DEFAULT ('') FOR [ClientIP]
GO
ALTER TABLE [dbo].[RecordGameDiamond] ADD  CONSTRAINT [DF_RecordGameDiamond_CollectDate]  DEFAULT (getdate()) FOR [CollectDate]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGameDiamond', @level2type=N'COLUMN',@level2name=N'RecordID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGameDiamond', @level2type=N'COLUMN',@level2name=N'UserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录类型（0、AA制游戏扣钻石  1、退房返还钻石）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGameDiamond', @level2type=N'COLUMN',@level2name=N'TypeID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'游戏房间标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGameDiamond', @level2type=N'COLUMN',@level2name=N'ServerID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'房间编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGameDiamond', @level2type=N'COLUMN',@level2name=N'RoomID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'操作前钻石数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGameDiamond', @level2type=N'COLUMN',@level2name=N'BeforeDiamond'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'钻石数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGameDiamond', @level2type=N'COLUMN',@level2name=N'Diamond'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'操作地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGameDiamond', @level2type=N'COLUMN',@level2name=N'ClientIP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'操作时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGameDiamond', @level2type=N'COLUMN',@level2name=N'CollectDate'
GO

/****** Object:  Table [dbo].[RecordEveryDayCurrency]    Script Date: 2017/7/17 15:59:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RecordEveryDayCurrency](
	[DateID] [int] NOT NULL,
	[FirstDiamond] [bigint] NOT NULL,
	[SecondDiamond] [bigint] NOT NULL,
	[ThirdDiamond] [bigint] NOT NULL,
	[TotalDiamond] [bigint] NOT NULL,
	[SysPresentDiamond] [bigint] NOT NULL,
	[AdminPresentDiamond] [bigint] NOT NULL,
	[PayDiamond] [bigint] NOT NULL,
	[RoomCostDiamond] [bigint] NOT NULL,
	[PropCostDiamond] [bigint] NOT NULL,
	[AAGCostDiamond] [bigint] NOT NULL,
	[CollectDate] [datetime] NOT NULL,
 CONSTRAINT [PK_RecordEveryDayCurrency] PRIMARY KEY CLUSTERED 
(
	[DateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[RecordEveryDayCurrency] ADD  CONSTRAINT [DF_RecordEveryDayCurrency_FirstDiamond]  DEFAULT ((0)) FOR [FirstDiamond]
GO
ALTER TABLE [dbo].[RecordEveryDayCurrency] ADD  CONSTRAINT [DF_RecordEveryDayCurrency_SecondDiamond]  DEFAULT ((0)) FOR [SecondDiamond]
GO
ALTER TABLE [dbo].[RecordEveryDayCurrency] ADD  CONSTRAINT [DF_RecordEveryDayCurrency_ThirdDiamond]  DEFAULT ((0)) FOR [ThirdDiamond]
GO
ALTER TABLE [dbo].[RecordEveryDayCurrency] ADD  CONSTRAINT [DF_RecordEveryDayCurrency_TotalDiamond]  DEFAULT ((0)) FOR [TotalDiamond]
GO
ALTER TABLE [dbo].[RecordEveryDayCurrency] ADD  CONSTRAINT [DF_RecordEveryDayCurrency_PresentDiamond]  DEFAULT ((0)) FOR [SysPresentDiamond]
GO
ALTER TABLE [dbo].[RecordEveryDayCurrency] ADD  CONSTRAINT [DF_RecordEveryDayCurrency_AdminPresentDiamond]  DEFAULT ((0)) FOR [AdminPresentDiamond]
GO
ALTER TABLE [dbo].[RecordEveryDayCurrency] ADD  CONSTRAINT [DF_RecordEveryDayCurrency_PayDiamond]  DEFAULT ((0)) FOR [PayDiamond]
GO
ALTER TABLE [dbo].[RecordEveryDayCurrency] ADD  CONSTRAINT [DF_RecordEveryDayCurrency_RoomCostDiamond]  DEFAULT ((0)) FOR [RoomCostDiamond]
GO
ALTER TABLE [dbo].[RecordEveryDayCurrency] ADD  CONSTRAINT [DF_RecordEveryDayCurrency_PropCostDiamond]  DEFAULT ((0)) FOR [PropCostDiamond]
GO
ALTER TABLE [dbo].[RecordEveryDayCurrency] ADD  CONSTRAINT [DF_RecordEveryDayCurrency_AAGCostDiamond]  DEFAULT ((0)) FOR [AAGCostDiamond]
GO
ALTER TABLE [dbo].[RecordEveryDayCurrency] ADD  CONSTRAINT [DF_RecordEveryDayCurrency_CollectDate]  DEFAULT (getdate()) FOR [CollectDate]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'一级代理钻石总量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordEveryDayCurrency', @level2type=N'COLUMN',@level2name=N'FirstDiamond'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'二级代理钻石总量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordEveryDayCurrency', @level2type=N'COLUMN',@level2name=N'SecondDiamond'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'三级代理钻石总量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordEveryDayCurrency', @level2type=N'COLUMN',@level2name=N'ThirdDiamond'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'平台钻石总量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordEveryDayCurrency', @level2type=N'COLUMN',@level2name=N'TotalDiamond'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'系统奖励钻石数量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordEveryDayCurrency', @level2type=N'COLUMN',@level2name=N'SysPresentDiamond'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'系统管理员赠送钻石总量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordEveryDayCurrency', @level2type=N'COLUMN',@level2name=N'AdminPresentDiamond'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'充值钻石总量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordEveryDayCurrency', @level2type=N'COLUMN',@level2name=N'PayDiamond'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'钻石创建房间消耗总量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordEveryDayCurrency', @level2type=N'COLUMN',@level2name=N'RoomCostDiamond'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'钻石购买道具消耗总量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordEveryDayCurrency', @level2type=N'COLUMN',@level2name=N'PropCostDiamond'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'AA制游戏消耗钻石' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordEveryDayCurrency', @level2type=N'COLUMN',@level2name=N'AAGCostDiamond'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'统计时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordEveryDayCurrency', @level2type=N'COLUMN',@level2name=N'CollectDate'
GO
/****** Object:  Table [dbo].[RecordDiamondSerial]    Script Date: 2017/7/17 15:59:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RecordDiamondSerial](
	[SerialNumber] [nvarchar](19) NOT NULL,
	[MasterID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[TypeID] [int] NOT NULL,
	[CurDiamond] [bigint] NOT NULL,
	[ChangeDiamond] [int] NOT NULL,
	[ClientIP] [nvarchar](15) NOT NULL,
	[CollectDate] [datetime] NOT NULL,
 CONSTRAINT [PK_RecordDiamondSerial] PRIMARY KEY CLUSTERED 
(
	[SerialNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[RecordDiamondSerial] ADD  CONSTRAINT [DF_RecordDiamondSerial_SerialNumber]  DEFAULT ('') FOR [SerialNumber]
GO
ALTER TABLE [dbo].[RecordDiamondSerial] ADD  CONSTRAINT [DF_RecordDiamondSerial_MasterID]  DEFAULT ((0)) FOR [MasterID]
GO
ALTER TABLE [dbo].[RecordDiamondSerial] ADD  CONSTRAINT [DF_RecordDiamondSerial_UserID]  DEFAULT ((0)) FOR [UserID]
GO
ALTER TABLE [dbo].[RecordDiamondSerial] ADD  CONSTRAINT [DF_RecordDiamondSerial_TypeID]  DEFAULT ((0)) FOR [TypeID]
GO
ALTER TABLE [dbo].[RecordDiamondSerial] ADD  CONSTRAINT [DF_RecordDiamondSerial_CurDiamond]  DEFAULT ((0)) FOR [CurDiamond]
GO
ALTER TABLE [dbo].[RecordDiamondSerial] ADD  CONSTRAINT [DF_RecordDiamondSerial_ChangeDiamond]  DEFAULT ((0)) FOR [ChangeDiamond]
GO
ALTER TABLE [dbo].[RecordDiamondSerial] ADD  CONSTRAINT [DF_RecordDiamondSerial_ClientIP]  DEFAULT ('') FOR [ClientIP]
GO
ALTER TABLE [dbo].[RecordDiamondSerial] ADD  CONSTRAINT [DF_RecordDiamondSerial_CollectDate]  DEFAULT (getdate()) FOR [CollectDate]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'流水号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordDiamondSerial', @level2type=N'COLUMN',@level2name=N'SerialNumber'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0 系统标识   大于0表示操作管理员或操作员' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordDiamondSerial', @level2type=N'COLUMN',@level2name=N'MasterID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordDiamondSerial', @level2type=N'COLUMN',@level2name=N'UserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'操作类型（0 后台赠送  1 注册赠送  2、推广奖励  3、充值赠送  4、绑定推广赠送 5、排行榜奖励  6、实名认证赠送  7、代理赠送  8、被代理赠送  9、购买道具  10、创建房间  11、AA制游戏 ）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordDiamondSerial', @level2type=N'COLUMN',@level2name=N'TypeID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'操作前钻石' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordDiamondSerial', @level2type=N'COLUMN',@level2name=N'CurDiamond'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'操作钻石（正数表示加，负数表示减）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordDiamondSerial', @level2type=N'COLUMN',@level2name=N'ChangeDiamond'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'操作地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordDiamondSerial', @level2type=N'COLUMN',@level2name=N'ClientIP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'操作时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordDiamondSerial', @level2type=N'COLUMN',@level2name=N'CollectDate'
GO
/****** Object:  Table [dbo].[RecordBuyNewProperty]    Script Date: 08/03/2018 10:25:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RecordBuyNewProperty](
	[RecordID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[PropertyID] [int] NOT NULL,
	[PropertyName] [nvarchar](31) NOT NULL,
	[ExchangeType] [tinyint] NOT NULL,
	[ExchangeRatio] [int] NOT NULL,
	[BuyNum] [int] NOT NULL,
	[BeforeCurrency] [bigint] NOT NULL,
	[Currency] [bigint] NOT NULL,
	[ClinetIP] [nvarchar](15) NOT NULL,
	[CollectDate] [datetime] NOT NULL,
 CONSTRAINT [PK_RecordBuyNewProperty] PRIMARY KEY CLUSTERED 
(
	[RecordID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordBuyNewProperty', @level2type=N'COLUMN',@level2name=N'RecordID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordBuyNewProperty', @level2type=N'COLUMN',@level2name=N'UserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'道具标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordBuyNewProperty', @level2type=N'COLUMN',@level2name=N'PropertyID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'道具名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordBuyNewProperty', @level2type=N'COLUMN',@level2name=N'PropertyName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'兑换类别（0、钻石  1、游戏币）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordBuyNewProperty', @level2type=N'COLUMN',@level2name=N'ExchangeType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'兑道具比率（type 为0表示1钻石买多少道具  为1表示多少游戏币买1道具）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordBuyNewProperty', @level2type=N'COLUMN',@level2name=N'ExchangeRatio'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'购买数量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordBuyNewProperty', @level2type=N'COLUMN',@level2name=N'BuyNum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'购买前货币数（钻石或游戏币）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordBuyNewProperty', @level2type=N'COLUMN',@level2name=N'BeforeCurrency'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'花费货币数（钻石或游戏币）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordBuyNewProperty', @level2type=N'COLUMN',@level2name=N'Currency'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'购买地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordBuyNewProperty', @level2type=N'COLUMN',@level2name=N'ClinetIP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'购买时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordBuyNewProperty', @level2type=N'COLUMN',@level2name=N'CollectDate'
GO
/****** Object:  Default [DF_RecordBuyNewProperty_UserID]    Script Date: 08/03/2018 10:25:17 ******/
ALTER TABLE [dbo].[RecordBuyNewProperty] ADD  CONSTRAINT [DF_RecordBuyNewProperty_UserID]  DEFAULT ((0)) FOR [UserID]
GO
/****** Object:  Default [DF_RecordBuyNewProperty_PropertyID]    Script Date: 08/03/2018 10:25:17 ******/
ALTER TABLE [dbo].[RecordBuyNewProperty] ADD  CONSTRAINT [DF_RecordBuyNewProperty_PropertyID]  DEFAULT ((0)) FOR [PropertyID]
GO
/****** Object:  Default [DF_RecordBuyNewProperty_PropertyName]    Script Date: 08/03/2018 10:25:17 ******/
ALTER TABLE [dbo].[RecordBuyNewProperty] ADD  CONSTRAINT [DF_RecordBuyNewProperty_PropertyName]  DEFAULT ('') FOR [PropertyName]
GO
/****** Object:  Default [DF_RecordBuyNewProperty_PropertyPrice]    Script Date: 08/03/2018 10:25:17 ******/
ALTER TABLE [dbo].[RecordBuyNewProperty] ADD  CONSTRAINT [DF_RecordBuyNewProperty_PropertyPrice]  DEFAULT ((0)) FOR [ExchangeType]
GO
/****** Object:  Default [DF_RecordBuyNewProperty_ExchangeRatio]    Script Date: 08/03/2018 10:25:17 ******/
ALTER TABLE [dbo].[RecordBuyNewProperty] ADD  CONSTRAINT [DF_RecordBuyNewProperty_ExchangeRatio]  DEFAULT ((0)) FOR [ExchangeRatio]
GO
/****** Object:  Default [DF_RecordBuyNewProperty_BuyNum]    Script Date: 08/03/2018 10:25:17 ******/
ALTER TABLE [dbo].[RecordBuyNewProperty] ADD  CONSTRAINT [DF_RecordBuyNewProperty_BuyNum]  DEFAULT ((0)) FOR [BuyNum]
GO
/****** Object:  Default [DF_RecordBuyNewProperty_BeforeDiamond]    Script Date: 08/03/2018 10:25:17 ******/
ALTER TABLE [dbo].[RecordBuyNewProperty] ADD  CONSTRAINT [DF_RecordBuyNewProperty_BeforeDiamond]  DEFAULT ((0)) FOR [BeforeCurrency]
GO
/****** Object:  Default [DF_RecordBuyNewProperty_Diamond]    Script Date: 08/03/2018 10:25:17 ******/
ALTER TABLE [dbo].[RecordBuyNewProperty] ADD  CONSTRAINT [DF_RecordBuyNewProperty_Diamond]  DEFAULT ((0)) FOR [Currency]
GO
/****** Object:  Default [DF_RecordBuyNewProperty_ClinetIP]    Script Date: 08/03/2018 10:25:17 ******/
ALTER TABLE [dbo].[RecordBuyNewProperty] ADD  CONSTRAINT [DF_RecordBuyNewProperty_ClinetIP]  DEFAULT ('') FOR [ClinetIP]
GO
/****** Object:  Default [DF_RecordBuyNewProperty_CollectDate]    Script Date: 08/03/2018 10:25:17 ******/
ALTER TABLE [dbo].[RecordBuyNewProperty] ADD  CONSTRAINT [DF_RecordBuyNewProperty_CollectDate]  DEFAULT (getdate()) FOR [CollectDate]
GO
/****** 对象:  Table [dbo].[RecordGrantExperience]    脚本日期: 03/17/2017 10:12:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RecordGrantExperience](
	[RecordID] [int] IDENTITY(1,1) NOT NULL,
	[MasterID] [int] NOT NULL,
	[ClientIP] [varchar](15) NOT NULL CONSTRAINT [DF_RecordGrantExperience_ClientIP]  DEFAULT ('000.000.000.000'),
	[CollectDate] [datetime] NOT NULL CONSTRAINT [DF_RecordGrantExperience_CollectDate]  DEFAULT (getdate()),
	[UserID] [int] NOT NULL,
	[CurExperience] [int] NOT NULL CONSTRAINT [DF_RecordGrantExperience_CurExperience]  DEFAULT ((0)),
	[AddExperience] [int] NOT NULL CONSTRAINT [DF_RecordGrantExperience_AddExperience]  DEFAULT ((0)),
	[Reason] [nvarchar](32) NOT NULL CONSTRAINT [DF_RecordGrantExperience_Reason]  DEFAULT (N''),
 CONSTRAINT [PK_RecordGrantExperience] PRIMARY KEY CLUSTERED 
(
	[RecordID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGrantExperience', @level2type=N'COLUMN',@level2name=N'RecordID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'管理员标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGrantExperience', @level2type=N'COLUMN',@level2name=N'MasterID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'赠予地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGrantExperience', @level2type=N'COLUMN',@level2name=N'ClientIP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'赠予时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGrantExperience', @level2type=N'COLUMN',@level2name=N'CollectDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGrantExperience', @level2type=N'COLUMN',@level2name=N'UserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'当前经验' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGrantExperience', @level2type=N'COLUMN',@level2name=N'CurExperience'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'补加经验' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGrantExperience', @level2type=N'COLUMN',@level2name=N'AddExperience'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'赠予原因' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGrantExperience', @level2type=N'COLUMN',@level2name=N'Reason'
GO
/****** 对象:  Table [dbo].[RecordAuthentPresent]    脚本日期: 03/17/2017 10:12:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RecordAuthentPresent](
	[RecordID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[PassPortID] [nvarchar](18) NOT NULL,
	[Compellation] [nvarchar](16) NOT NULL,
	[IpAddress] [nvarchar](15) NOT NULL,
	[CollectDate] [datetime] NOT NULL CONSTRAINT [DF_RecordAuthentPresent_CollectDate]  DEFAULT (getdate()),
 CONSTRAINT [PK_RecordAuthentPresent] PRIMARY KEY CLUSTERED 
(
	[RecordID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'实名认证标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordAuthentPresent', @level2type=N'COLUMN',@level2name=N'RecordID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordAuthentPresent', @level2type=N'COLUMN',@level2name=N'UserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'身份证' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordAuthentPresent', @level2type=N'COLUMN',@level2name=N'PassPortID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'真实姓名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordAuthentPresent', @level2type=N'COLUMN',@level2name=N'Compellation'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'IP地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordAuthentPresent', @level2type=N'COLUMN',@level2name=N'IpAddress'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'插入日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordAuthentPresent', @level2type=N'COLUMN',@level2name=N'CollectDate'
GO
/****** 对象:  Table [dbo].[RecordUserSendPresent]    脚本日期: 03/17/2017 10:13:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RecordUserSendPresent](
	[RecordID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[ReceiverUserID] [int] NOT NULL,
	[PropID] [int] NOT NULL,
	[PropCount] [int] NOT NULL,
	[SendTime] [datetime] NOT NULL,
	[ReceiveTime] [datetime] NULL,
	[PropStatus] [smallint] NOT NULL,
	[ClientIP] [nvarchar](15) NOT NULL,
	[ReceiverClientIP] [nvarchar](15) NULL CONSTRAINT [DF_RecordUserSendPresent_ReceiverClientIP]  DEFAULT (' '),
 CONSTRAINT [PK_RecordUserSendPresent] PRIMARY KEY CLUSTERED 
(
	[RecordID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录信息ID号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordUserSendPresent', @level2type=N'COLUMN',@level2name=N'RecordID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'发送道具方ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordUserSendPresent', @level2type=N'COLUMN',@level2name=N'UserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'接收赠送方ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordUserSendPresent', @level2type=N'COLUMN',@level2name=N'ReceiverUserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'道具ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordUserSendPresent', @level2type=N'COLUMN',@level2name=N'PropID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'赠送的道具数量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordUserSendPresent', @level2type=N'COLUMN',@level2name=N'PropCount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'赠送道具的时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordUserSendPresent', @level2type=N'COLUMN',@level2name=N'SendTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'接收者 接收道具的时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordUserSendPresent', @level2type=N'COLUMN',@level2name=N'ReceiveTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0 表示道具已赠送，还未被接收。   1表示道具已被接收。' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordUserSendPresent', @level2type=N'COLUMN',@level2name=N'PropStatus'
GO
/****** 对象:  Table [dbo].[RecordGrantMember]    脚本日期: 03/17/2017 10:12:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RecordGrantMember](
	[RecordID] [int] IDENTITY(1,1) NOT NULL,
	[MasterID] [int] NOT NULL CONSTRAINT [DF_RecordGrantMenber_MasterID]  DEFAULT ((0)),
	[ClientIP] [varchar](15) NOT NULL CONSTRAINT [DF_RecordGrantMenber_ClientIP]  DEFAULT ('000.000.000.000'),
	[CollectDate] [datetime] NOT NULL CONSTRAINT [DF_RecordGrantMenber_CollectDate]  DEFAULT (getdate()),
	[UserID] [int] NOT NULL CONSTRAINT [DF_RecordGrantMenber_UserID]  DEFAULT ((0)),
	[GrantCardType] [int] NOT NULL CONSTRAINT [DF_Table_1_CardType]  DEFAULT ((0)),
	[Reason] [nvarchar](32) NOT NULL CONSTRAINT [DF_RecordGrantMenber_Reason]  DEFAULT (''),
	[MemberDays] [int] NOT NULL CONSTRAINT [DF_RecordGrantMember_MemberDays]  DEFAULT ((0)),
 CONSTRAINT [PK_RecordGrantMenber] PRIMARY KEY CLUSTERED 
(
	[RecordID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGrantMember', @level2type=N'COLUMN',@level2name=N'RecordID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'管理员' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGrantMember', @level2type=N'COLUMN',@level2name=N'MasterID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'客户端IP' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGrantMember', @level2type=N'COLUMN',@level2name=N'ClientIP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'赠送时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGrantMember', @level2type=N'COLUMN',@level2name=N'CollectDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'玩家标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGrantMember', @level2type=N'COLUMN',@level2name=N'UserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'赠送的会员卡类别' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGrantMember', @level2type=N'COLUMN',@level2name=N'GrantCardType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'赠送会员卡原因' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGrantMember', @level2type=N'COLUMN',@level2name=N'Reason'
GO
/****** 对象:  Table [dbo].[RecordUseProperty]    脚本日期: 03/17/2017 10:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RecordUseProperty](
	[RecordID] [int] IDENTITY(1,1) NOT NULL,
	[SourceUserID] [int] NOT NULL,
	[TargetUserID] [int] NOT NULL,
	[PropertyID] [int] NOT NULL,
	[PropertyName] [nvarchar](31) NOT NULL,
	[PropertyCount] [int] NOT NULL,
	[LovelinessRcv] [int] NOT NULL CONSTRAINT [DF_RecordUseProperty_LovelinessRcv]  DEFAULT ((0)),
	[LovelinessSend] [int] NOT NULL CONSTRAINT [DF_RecordUseProperty_LovelinessSend]  DEFAULT ((0)),
	[UseResultsGold] [bigint] NOT NULL CONSTRAINT [DF_RecordUseProperty_UseResultsGold]  DEFAULT ((0)),
	[KindID] [int] NOT NULL CONSTRAINT [DF_RecordUseProperty_KindID]  DEFAULT ((0)),
	[ServerID] [int] NOT NULL CONSTRAINT [DF_RecordUseProperty_ServerID]  DEFAULT ((0)),
	[ClientIP] [nvarchar](15) NOT NULL CONSTRAINT [DF_RecordUseProperty_ClinetIP]  DEFAULT (''),
	[UseDate] [datetime] NOT NULL CONSTRAINT [DF_RecordUseProperty_UseDate]  DEFAULT (getdate()),
 CONSTRAINT [PK_RecordUseProperty] PRIMARY KEY CLUSTERED 
(
	[RecordID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'源用户标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordUseProperty', @level2type=N'COLUMN',@level2name=N'SourceUserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'目标用户标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordUseProperty', @level2type=N'COLUMN',@level2name=N'TargetUserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'道具标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordUseProperty', @level2type=N'COLUMN',@level2name=N'PropertyID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'道具名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordUseProperty', @level2type=N'COLUMN',@level2name=N'PropertyName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'道具数量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordUseProperty', @level2type=N'COLUMN',@level2name=N'PropertyCount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'接受魅力' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordUseProperty', @level2type=N'COLUMN',@level2name=N'LovelinessRcv'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'发送魅力' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordUseProperty', @level2type=N'COLUMN',@level2name=N'LovelinessSend'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'使用赠送金币' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordUseProperty', @level2type=N'COLUMN',@level2name=N'UseResultsGold'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'游戏标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordUseProperty', @level2type=N'COLUMN',@level2name=N'KindID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'房间标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordUseProperty', @level2type=N'COLUMN',@level2name=N'ServerID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'使用地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordUseProperty', @level2type=N'COLUMN',@level2name=N'ClientIP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'使用时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordUseProperty', @level2type=N'COLUMN',@level2name=N'UseDate'
GO
/****** 对象:  Table [dbo].[RecordGrantGameID]    脚本日期: 03/17/2017 10:12:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RecordGrantGameID](
	[RecordID] [int] IDENTITY(1,1) NOT NULL,
	[MasterID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[CurGameID] [int] NOT NULL,
	[ReGameID] [int] NOT NULL,
	[IDLevel] [int] NOT NULL CONSTRAINT [DF_RecordGrantGameID_IDLevel]  DEFAULT ((0)),
	[ClientIP] [varchar](15) NOT NULL CONSTRAINT [DF_RecordGrantGameID_ClientIP]  DEFAULT ('000.000.000.000'),
	[CollectDate] [datetime] NOT NULL CONSTRAINT [DF_RecordGrantGameID_CollectDate]  DEFAULT (getdate()),
	[Reason] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_RecordGrantGameID] PRIMARY KEY CLUSTERED 
(
	[RecordID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGrantGameID', @level2type=N'COLUMN',@level2name=N'RecordID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGrantGameID', @level2type=N'COLUMN',@level2name=N'UserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'原游戏标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGrantGameID', @level2type=N'COLUMN',@level2name=N'CurGameID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'赠予标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGrantGameID', @level2type=N'COLUMN',@level2name=N'ReGameID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID级别' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGrantGameID', @level2type=N'COLUMN',@level2name=N'IDLevel'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'赠予地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGrantGameID', @level2type=N'COLUMN',@level2name=N'ClientIP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'赠予时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGrantGameID', @level2type=N'COLUMN',@level2name=N'CollectDate'
GO
/****** 对象:  Table [dbo].[RecordLottery]    脚本日期: 03/17/2017 10:13:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RecordLottery](
	[RecordID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[ChargeFee] [int] NOT NULL,
	[ItemIndex] [int] NOT NULL CONSTRAINT [DF_RecordLottery_ItemIndex]  DEFAULT ((0)),
	[ItemType] [int] NOT NULL CONSTRAINT [DF_RecordLottery_ItemType]  DEFAULT ((0)),
	[ItemQuota] [int] NOT NULL CONSTRAINT [DF_RecordLottery_ItemQuota]  DEFAULT ((0)),
	[CollectDate] [datetime] NOT NULL CONSTRAINT [DF_RecordLottery_CollectDate]  DEFAULT (getdate()),
 CONSTRAINT [PK_RecordLottery] PRIMARY KEY CLUSTERED 
(
	[RecordID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_RecordLottery_UserID] ON [dbo].[RecordLottery] 
(
	[UserID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** 对象:  Table [dbo].[RecordPasswdExpend]    脚本日期: 03/17/2017 10:13:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RecordPasswdExpend](
	[RecordID] [int] IDENTITY(1,1) NOT NULL,
	[OperMasterID] [int] NOT NULL,
	[UserID] [int] NOT NULL CONSTRAINT [DF_RecordPasswdExpend_UserID]  DEFAULT ((0)),
	[ReLogonPasswd] [nvarchar](32) NOT NULL CONSTRAINT [DF_RecordPasswdExpend_ReLogonPass]  DEFAULT (N'--'),
	[ReInsurePasswd] [nvarchar](32) NOT NULL CONSTRAINT [DF_RecordPasswdExpend_ReInsurePass]  DEFAULT (N'--'),
	[ClientIP] [nvarchar](15) NOT NULL CONSTRAINT [DF_RecordPasswdExpend_ClientIP]  DEFAULT ('000.000.000.000'),
	[CollectDate] [datetime] NOT NULL CONSTRAINT [DF_RecordPasswdExpend_CollectDate]  DEFAULT (getdate()),
 CONSTRAINT [PK_RecordPasswdExpend] PRIMARY KEY CLUSTERED 
(
	[RecordID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordPasswdExpend', @level2type=N'COLUMN',@level2name=N'RecordID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'操作网管' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordPasswdExpend', @level2type=N'COLUMN',@level2name=N'OperMasterID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordPasswdExpend', @level2type=N'COLUMN',@level2name=N'UserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登录密码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordPasswdExpend', @level2type=N'COLUMN',@level2name=N'ReLogonPasswd'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'银行密码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordPasswdExpend', @level2type=N'COLUMN',@level2name=N'ReInsurePasswd'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordPasswdExpend', @level2type=N'COLUMN',@level2name=N'ClientIP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordPasswdExpend', @level2type=N'COLUMN',@level2name=N'CollectDate'
GO
/****** 对象:  Table [dbo].[RecordConvertUserMedal]    脚本日期: 03/17/2017 10:12:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RecordConvertUserMedal](
	[RecordID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[CurInsureScore] [bigint] NOT NULL CONSTRAINT [DF_RecordConvertUserMedal_CurInsureScore]  DEFAULT ((0)),
	[CurUserMedal] [int] NOT NULL CONSTRAINT [DF_RecordConvertUserMedal_CurUserMedal]  DEFAULT ((0)),
	[ConvertUserMedal] [int] NOT NULL CONSTRAINT [DF_RecordConvertUserMedal_ConvertUserMedal]  DEFAULT ((0)),
	[ConvertRate] [decimal](18, 2) NOT NULL CONSTRAINT [DF_RecordConvertUserMedal_ConvertRate]  DEFAULT ((0)),
	[IsGamePlaza] [tinyint] NOT NULL CONSTRAINT [DF_RecordConvertUserMedal_IsGamePlaza]  DEFAULT ((0)),
	[ClientIP] [varchar](15) NOT NULL CONSTRAINT [DF_RecordConvertUserMedal_ClientIP]  DEFAULT (''),
	[CollectDate] [datetime] NOT NULL CONSTRAINT [DF_RecordConvertUserMedal_CollectDate]  DEFAULT (getdate()),
 CONSTRAINT [PK_RecordConvertUserMedal] PRIMARY KEY CLUSTERED 
(
	[RecordID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordConvertUserMedal', @level2type=N'COLUMN',@level2name=N'RecordID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordConvertUserMedal', @level2type=N'COLUMN',@level2name=N'UserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'当前银行金币' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordConvertUserMedal', @level2type=N'COLUMN',@level2name=N'CurInsureScore'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'当前奖牌' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordConvertUserMedal', @level2type=N'COLUMN',@level2name=N'CurUserMedal'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'兑换奖牌' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordConvertUserMedal', @level2type=N'COLUMN',@level2name=N'ConvertUserMedal'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'兑换比例' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordConvertUserMedal', @level2type=N'COLUMN',@level2name=N'ConvertRate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否大厅(0:大厅,1:网站)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordConvertUserMedal', @level2type=N'COLUMN',@level2name=N'IsGamePlaza'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'兑换地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordConvertUserMedal', @level2type=N'COLUMN',@level2name=N'ClientIP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'兑换时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordConvertUserMedal', @level2type=N'COLUMN',@level2name=N'CollectDate'
GO
/****** 对象:  Table [dbo].[RecordEveryDayData]    脚本日期: 03/17/2017 10:12:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RecordEveryDayData](
	[DateID] [int] NOT NULL,
	[UserTotal] [int] NOT NULL CONSTRAINT [DF_RecordEveryDayData_UserTotal]  DEFAULT ((0)),
	[PayUserTotal] [int] NOT NULL CONSTRAINT [DF_RecordEveryDayData_PayUserTotal]  DEFAULT ((0)),
	[ActiveUserTotal] [int] NOT NULL CONSTRAINT [DF_RecordEveryDayData_ActiveUserNum]  DEFAULT ((0)),
	[LossUser] [int] NOT NULL CONSTRAINT [DF_RecordEveryDayData_LossUser]  DEFAULT ((0)),
	[LossUserTotal] [int] NOT NULL CONSTRAINT [DF_RecordEveryDayData_LossUserTotal]  DEFAULT ((0)),
	[LossPayUser] [int] NOT NULL CONSTRAINT [DF_RecordEveryDayData_LossPayUser]  DEFAULT ((0)),
	[LossPayUserTotal] [int] NOT NULL CONSTRAINT [DF_RecordEveryDayData_LossPayUserTotal]  DEFAULT ((0)),
	[PayTotalAmount] [int] NOT NULL CONSTRAINT [DF_RecordEveryDayData_PayTotalAmount]  DEFAULT ((0)),
	[PayAmountForCurrency] [int] NOT NULL CONSTRAINT [DF_RecordEveryDayData_PayAmountForCurrency]  DEFAULT ((0)),
	[GoldTotal] [bigint] NOT NULL CONSTRAINT [DF_RecordEveryDayData_GoldTotal]  DEFAULT ((0)),
	[CurrencyTotal] [bigint] NOT NULL CONSTRAINT [DF_RecordEveryDayData_CurrencyTotal]  DEFAULT ((0)),
	[GameTax] [bigint] NOT NULL CONSTRAINT [DF_RecordEveryDayData_GameTax]  DEFAULT ((0)),
	[GameTaxTotal] [bigint] NOT NULL CONSTRAINT [DF_RecordEveryDayData_GameTaxTotal]  DEFAULT ((0)),
	[BankTax] [bigint] NOT NULL CONSTRAINT [DF_RecordEveryDayData_ThatDayBankTax]  DEFAULT ((0)),
	[Waste] [bigint] NOT NULL CONSTRAINT [DF_RecordEveryDayData_Waste]  DEFAULT ((0)),
	[UserAVGOnlineTime] [int] NOT NULL CONSTRAINT [DF_RecordEveryDayData_UserAVGOnlineTime]  DEFAULT ((0)),
	[CollectDate] [datetime] NOT NULL CONSTRAINT [DF_Table_1_InputDate]  DEFAULT (getdate()),
 CONSTRAINT [PK_RecordEveryDayData_1] PRIMARY KEY CLUSTERED 
(
	[DateID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'日期标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordEveryDayData', @level2type=N'COLUMN',@level2name=N'DateID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'玩家总数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordEveryDayData', @level2type=N'COLUMN',@level2name=N'UserTotal'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'充值玩家' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordEveryDayData', @level2type=N'COLUMN',@level2name=N'PayUserTotal'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'活跃用户' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordEveryDayData', @level2type=N'COLUMN',@level2name=N'ActiveUserTotal'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'当日流失玩家数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordEveryDayData', @level2type=N'COLUMN',@level2name=N'LossUser'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户流失总数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordEveryDayData', @level2type=N'COLUMN',@level2name=N'LossUserTotal'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'当日流失充值玩家数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordEveryDayData', @level2type=N'COLUMN',@level2name=N'LossPayUser'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'充值用户流失总数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordEveryDayData', @level2type=N'COLUMN',@level2name=N'LossPayUserTotal'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'充值金额' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordEveryDayData', @level2type=N'COLUMN',@level2name=N'PayTotalAmount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'充值货币金额' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordEveryDayData', @level2type=N'COLUMN',@level2name=N'PayAmountForCurrency'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'金币总数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordEveryDayData', @level2type=N'COLUMN',@level2name=N'GoldTotal'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'平台币总数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordEveryDayData', @level2type=N'COLUMN',@level2name=N'CurrencyTotal'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'当日游戏服务比例' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordEveryDayData', @level2type=N'COLUMN',@level2name=N'GameTax'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'服务比例总额' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordEveryDayData', @level2type=N'COLUMN',@level2name=N'GameTaxTotal'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'当日银行服务比例' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordEveryDayData', @level2type=N'COLUMN',@level2name=N'BankTax'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'当日损耗' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordEveryDayData', @level2type=N'COLUMN',@level2name=N'Waste'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'平均在线时长' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordEveryDayData', @level2type=N'COLUMN',@level2name=N'UserAVGOnlineTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'统计时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordEveryDayData', @level2type=N'COLUMN',@level2name=N'CollectDate'
GO
/****** 对象:  Table [dbo].[RecordAccountsExpend]    脚本日期: 03/17/2017 10:12:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RecordAccountsExpend](
	[RecordID] [int] IDENTITY(1,1) NOT NULL,
	[OperMasterID] [int] NOT NULL CONSTRAINT [DF_RecordAccountsExpend_OperMasterID]  DEFAULT ((0)),
	[UserID] [int] NOT NULL,
	[ReAccounts] [nvarchar](31) NOT NULL,
	[Type] [tinyint] NOT NULL CONSTRAINT [DF_RecordAccountsExpend_Type]  DEFAULT ((0)),
	[ClientIP] [nvarchar](15) NOT NULL CONSTRAINT [DF_RecordAccountsExpend_ClientIP]  DEFAULT (N'000.000.000.000'),
	[CollectDate] [datetime] NOT NULL CONSTRAINT [DF_RecordAccountsExpend_CollectDate]  DEFAULT (getdate()),
 CONSTRAINT [PK_RecordAccountsExpend] PRIMARY KEY CLUSTERED 
(
	[RecordID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordAccountsExpend', @level2type=N'COLUMN',@level2name=N'RecordID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'操作网管' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordAccountsExpend', @level2type=N'COLUMN',@level2name=N'OperMasterID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordAccountsExpend', @level2type=N'COLUMN',@level2name=N'UserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'历史账号或昵称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordAccountsExpend', @level2type=N'COLUMN',@level2name=N'ReAccounts'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'历史记录类型 0:历史账号 1:历史昵称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordAccountsExpend', @level2type=N'COLUMN',@level2name=N'Type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordAccountsExpend', @level2type=N'COLUMN',@level2name=N'ClientIP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordAccountsExpend', @level2type=N'COLUMN',@level2name=N'CollectDate'
GO
/****** 对象:  Table [dbo].[RecordEncashPresent]    脚本日期: 03/17/2017 10:12:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RecordEncashPresent](
	[UserID] [int] NOT NULL,
	[CurGold] [bigint] NOT NULL,
	[CurPresent] [int] NOT NULL,
	[EncashGold] [int] NOT NULL,
	[EncashPresent] [int] NOT NULL,
	[KindID] [int] NOT NULL,
	[ServerID] [int] NOT NULL,
	[ClientIP] [nvarchar](15) NOT NULL,
	[EncashTime] [datetime] NOT NULL CONSTRAINT [DF_RecordEncashPresent_EncashTime]  DEFAULT (getdate())
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordEncashPresent', @level2type=N'COLUMN',@level2name=N'UserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'当前金币数目' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordEncashPresent', @level2type=N'COLUMN',@level2name=N'CurGold'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'当前礼物数目' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordEncashPresent', @level2type=N'COLUMN',@level2name=N'CurPresent'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'兑换金币数目' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordEncashPresent', @level2type=N'COLUMN',@level2name=N'EncashGold'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'兑换礼物数目' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordEncashPresent', @level2type=N'COLUMN',@level2name=N'EncashPresent'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'类型标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordEncashPresent', @level2type=N'COLUMN',@level2name=N'KindID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'房间标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordEncashPresent', @level2type=N'COLUMN',@level2name=N'ServerID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'玩家IP' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordEncashPresent', @level2type=N'COLUMN',@level2name=N'ClientIP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'兑换时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordEncashPresent', @level2type=N'COLUMN',@level2name=N'EncashTime'
GO
/****** 对象:  Table [dbo].[RecordConvertPresent]    脚本日期: 03/17/2017 10:12:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RecordConvertPresent](
	[RecordID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[KindID] [int] NOT NULL CONSTRAINT [DF_RecordConvertPresent_KindID]  DEFAULT ((0)),
	[ServerID] [int] NOT NULL CONSTRAINT [DF_RecordConvertPresent_ServerID]  DEFAULT ((0)),
	[CurInsureScore] [bigint] NOT NULL CONSTRAINT [DF_RecordConvertPresent_CurInsureScore]  DEFAULT ((0)),
	[CurPresent] [int] NOT NULL CONSTRAINT [DF_RecordConvertPresent_CurPresent]  DEFAULT ((0)),
	[ConvertPresent] [int] NOT NULL,
	[ConvertRate] [int] NOT NULL,
	[IsGamePlaza] [tinyint] NOT NULL CONSTRAINT [DF_RecordConvertPresent_IsGamePlaza]  DEFAULT ((0)),
	[ClientIP] [varchar](15) NOT NULL,
	[CollectDate] [datetime] NOT NULL CONSTRAINT [DF_RecordConvertPresent_CollectDate]  DEFAULT (getdate()),
 CONSTRAINT [PK_RecordConvertPresent] PRIMARY KEY CLUSTERED 
(
	[RecordID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordConvertPresent', @level2type=N'COLUMN',@level2name=N'UserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'游戏标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordConvertPresent', @level2type=N'COLUMN',@level2name=N'KindID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'房间标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordConvertPresent', @level2type=N'COLUMN',@level2name=N'ServerID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'兑换前银行' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordConvertPresent', @level2type=N'COLUMN',@level2name=N'CurInsureScore'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'兑换前魅力点' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordConvertPresent', @level2type=N'COLUMN',@level2name=N'CurPresent'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'兑换点数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordConvertPresent', @level2type=N'COLUMN',@level2name=N'ConvertPresent'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'兑换比例' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordConvertPresent', @level2type=N'COLUMN',@level2name=N'ConvertRate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'兑换场所(0:大厅,1:网页)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordConvertPresent', @level2type=N'COLUMN',@level2name=N'IsGamePlaza'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'兑换地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordConvertPresent', @level2type=N'COLUMN',@level2name=N'ClientIP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'兑换日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordConvertPresent', @level2type=N'COLUMN',@level2name=N'CollectDate'
GO
/****** Object:  Table [dbo].[RecordRoomCard]    Script Date: 2017/4/20 12:00:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[RecordRoomCard](
	[RecordID] [int] IDENTITY(1,1) NOT NULL,
	[SourceUserID] [int] NOT NULL,
	[TargetUserID] [int] NOT NULL,
	[SBeforeCard] [int] NOT NULL,
	[TBeforeCard] [int] NOT NULL,
	[RoomCard] [int] NOT NULL,	
	[Gold] [bigint] NOT NULL,
	[SBeforeGold] [bigint] NOT NULL,
	[ClientIP] [nvarchar](15) NOT NULL,
	[CollectDate] [datetime] NOT NULL,
	[Remarks] [nvarchar](80) NOT NULL,
 CONSTRAINT [PK_RecordRoomCard] PRIMARY KEY CLUSTERED 
(
	[RecordID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[RecordRoomCard] ADD  CONSTRAINT [DF_RecordRoomCard_SourceUserID]  DEFAULT ((0)) FOR [SourceUserID]
GO
ALTER TABLE [dbo].[RecordRoomCard] ADD  CONSTRAINT [DF_RecordRoomCard_TargetUserID]  DEFAULT ((0)) FOR [TargetUserID]
GO
ALTER TABLE [dbo].[RecordRoomCard] ADD  CONSTRAINT [DF_RecordRoomCard_SBeforeCard]  DEFAULT ((0)) FOR [SBeforeCard]
GO
ALTER TABLE [dbo].[RecordRoomCard] ADD  CONSTRAINT [DF_RecordRoomCard_TBeforeCard]  DEFAULT ((0)) FOR [TBeforeCard]
GO
ALTER TABLE [dbo].[RecordRoomCard] ADD  CONSTRAINT [DF_RecordRoomCard_RoomCard]  DEFAULT ((0)) FOR [RoomCard]
GO
ALTER TABLE [dbo].[RecordRoomCard] ADD  CONSTRAINT [DF_RecordRoomCard_Gold]  DEFAULT ((0)) FOR [Gold]
GO
ALTER TABLE [dbo].[RecordRoomCard] ADD  CONSTRAINT [DF_RecordRoomCard_SBeforeGold]  DEFAULT ((0)) FOR [SBeforeGold]
GO
ALTER TABLE [dbo].[RecordRoomCard] ADD  CONSTRAINT [DF_RecordRoomCard_ClientIP]  DEFAULT ('') FOR [ClientIP]
GO
ALTER TABLE [dbo].[RecordRoomCard] ADD  CONSTRAINT [DF_RecordRoomCard_CollectDate]  DEFAULT (getdate()) FOR [CollectDate]
GO
ALTER TABLE [dbo].[RecordRoomCard] ADD  CONSTRAINT [DF_RecordRoomCard_Remarks]  DEFAULT ('') FOR [Remarks]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordRoomCard', @level2type=N'COLUMN',@level2name=N'RecordID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'源用户标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordRoomCard', @level2type=N'COLUMN',@level2name=N'SourceUserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'目标用户标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordRoomCard', @level2type=N'COLUMN',@level2name=N'TargetUserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'源用户操作前钻石' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordRoomCard', @level2type=N'COLUMN',@level2name=N'SBeforeCard'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'目标用户操作前钻石' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordRoomCard', @level2type=N'COLUMN',@level2name=N'TBeforeCard'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'操作钻石数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordRoomCard', @level2type=N'COLUMN',@level2name=N'RoomCard'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'兑换游戏币' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordRoomCard', @level2type=N'COLUMN',@level2name=N'Gold'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'源用户操作前游戏币（身上）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordRoomCard', @level2type=N'COLUMN',@level2name=N'SBeforeGold'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'操作地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordRoomCard', @level2type=N'COLUMN',@level2name=N'ClientIP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'操作时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordRoomCard', @level2type=N'COLUMN',@level2name=N'CollectDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordRoomCard', @level2type=N'COLUMN',@level2name=N'Remarks'
GO
/****** 对象:  Table [dbo].[RecordGrantTreasure]    脚本日期: 03/17/2017 10:12:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RecordGrantTreasure](
	[RecordID] [int] IDENTITY(1,1) NOT NULL,
	[MasterID] [int] NOT NULL,
	[ClientIP] [varchar](15) NOT NULL CONSTRAINT [DF_RecordGrantScore_VisitIP]  DEFAULT (N'000.000.000.000'),
	[CollectDate] [datetime] NOT NULL CONSTRAINT [DF_RecordGrantScore_CreateDatetime]  DEFAULT (getdate()),
	[UserID] [int] NOT NULL,
	[CurGold] [bigint] NOT NULL CONSTRAINT [DF_RecordGrantScore_CurScore]  DEFAULT ((0)),
	[AddGold] [bigint] NOT NULL CONSTRAINT [DF_RecordGrantScore_AddScore]  DEFAULT ((0)),
	[Reason] [nvarchar](32) NOT NULL CONSTRAINT [DF_RecordGrantScore_Reason]  DEFAULT (N''),
 CONSTRAINT [PK_RecordGrantScore] PRIMARY KEY CLUSTERED 
(
	[RecordID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGrantTreasure', @level2type=N'COLUMN',@level2name=N'RecordID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'管理员标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGrantTreasure', @level2type=N'COLUMN',@level2name=N'MasterID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'来访地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGrantTreasure', @level2type=N'COLUMN',@level2name=N'ClientIP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'操作日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGrantTreasure', @level2type=N'COLUMN',@level2name=N'CollectDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGrantTreasure', @level2type=N'COLUMN',@level2name=N'UserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'当前金币' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGrantTreasure', @level2type=N'COLUMN',@level2name=N'CurGold'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'增加金币' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGrantTreasure', @level2type=N'COLUMN',@level2name=N'AddGold'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'操作理由' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGrantTreasure', @level2type=N'COLUMN',@level2name=N'Reason'
GO
/****** Object:  Table [dbo].[RecordGameSignIn]    Script Date: 2018/7/16 19:45:52 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[RecordGameSignIn](
	[RecordID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[SignType] [tinyint] NOT NULL,
	[PackageName] [nvarchar](30) NOT NULL,
	[PackageGoods] [nvarchar](200) NOT NULL,
	[Probability] [int] NOT NULL,
	[NeedDay] [int] NOT NULL,
	[TotalDay] [int] NOT NULL,
	[ClinetIP] [nvarchar](15) NOT NULL,
	[CollectDate] [datetime] NOT NULL,
 CONSTRAINT [PK_RecordGameSignIn] PRIMARY KEY CLUSTERED 
(
	[RecordID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[RecordGameSignIn] ADD  CONSTRAINT [DF_RecordGameSignIn_UserID]  DEFAULT ((0)) FOR [UserID]
GO

ALTER TABLE [dbo].[RecordGameSignIn] ADD  CONSTRAINT [DF_RecordGameSignIn_SignType]  DEFAULT ((0)) FOR [SignType]
GO

ALTER TABLE [dbo].[RecordGameSignIn] ADD  CONSTRAINT [DF_RecordGameSignIn_PackageName]  DEFAULT ((0)) FOR [PackageName]
GO

ALTER TABLE [dbo].[RecordGameSignIn] ADD  CONSTRAINT [DF_RecordGameSignIn_PackageGoods]  DEFAULT ((0)) FOR [PackageGoods]
GO

ALTER TABLE [dbo].[RecordGameSignIn] ADD  CONSTRAINT [DF_RecordGameSignIn_Probability]  DEFAULT ((0)) FOR [Probability]
GO

ALTER TABLE [dbo].[RecordGameSignIn] ADD  CONSTRAINT [DF_RecordGameSignIn_NeedDay]  DEFAULT ((0)) FOR [NeedDay]
GO

ALTER TABLE [dbo].[RecordGameSignIn] ADD  CONSTRAINT [DF_RecordGameSignIn_TotalSignDay]  DEFAULT ((0)) FOR [TotalDay]
GO

ALTER TABLE [dbo].[RecordGameSignIn] ADD  CONSTRAINT [DF_RecordGameSignIn_ClinetIP]  DEFAULT ('') FOR [ClinetIP]
GO

ALTER TABLE [dbo].[RecordGameSignIn] ADD  CONSTRAINT [DF_RecordGameSignIn_CollectDate]  DEFAULT (getdate()) FOR [CollectDate]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGameSignIn', @level2type=N'COLUMN',@level2name=N'RecordID'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGameSignIn', @level2type=N'COLUMN',@level2name=N'UserID'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'签到类型（0、每日签到  1、累计签到）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGameSignIn', @level2type=N'COLUMN',@level2name=N'SignType'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'获取礼包名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGameSignIn', @level2type=N'COLUMN',@level2name=N'PackageName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'礼包详情' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGameSignIn', @level2type=N'COLUMN',@level2name=N'PackageGoods'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'签到抽奖获得礼包的概率（百分比）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGameSignIn', @level2type=N'COLUMN',@level2name=N'Probability'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'累计签到所需天数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGameSignIn', @level2type=N'COLUMN',@level2name=N'NeedDay'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'累计签到天数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGameSignIn', @level2type=N'COLUMN',@level2name=N'TotalDay'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGameSignIn', @level2type=N'COLUMN',@level2name=N'ClinetIP'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGameSignIn', @level2type=N'COLUMN',@level2name=N'CollectDate'
GO

/****** Object:  Table [dbo].[RecordTask]    Script Date: 2018/5/14 19:54:03 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[RecordTask](
	[RecordID] [int] IDENTITY(1,1) NOT NULL,
	[DateID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[TaskID] [int] NOT NULL,
	[TimeType] [tinyint] NOT NULL,
	[TaskAward] [nvarchar](100) NOT NULL,
	[CollectDate] [datetime] NOT NULL,
 CONSTRAINT [PK_RecordTask] PRIMARY KEY CLUSTERED 
(
	[RecordID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[RecordTask] ADD  CONSTRAINT [DF_RecardTask_DateID]  DEFAULT ((0)) FOR [DateID]
GO

ALTER TABLE [dbo].[RecordTask] ADD  CONSTRAINT [DF_RecardTask_UserID]  DEFAULT ((0)) FOR [UserID]
GO

ALTER TABLE [dbo].[RecordTask] ADD  CONSTRAINT [DF_RecardTask_TaskID]  DEFAULT ((0)) FOR [TaskID]
GO

ALTER TABLE [dbo].[RecordTask] ADD  CONSTRAINT [DF_RecordTask_TimeType]  DEFAULT ((0)) FOR [TimeType]
GO

ALTER TABLE [dbo].[RecordTask] ADD  CONSTRAINT [DF_RecordTask_TaskAward]  DEFAULT ('') FOR [TaskAward]
GO

ALTER TABLE [dbo].[RecordTask] ADD  CONSTRAINT [DF_RecordTask_CollectDate]  DEFAULT (getdate()) FOR [CollectDate]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordTask', @level2type=N'COLUMN',@level2name=N'RecordID'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'日期标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordTask', @level2type=N'COLUMN',@level2name=N'DateID'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordTask', @level2type=N'COLUMN',@level2name=N'UserID'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'任务标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordTask', @level2type=N'COLUMN',@level2name=N'TaskID'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'时间模式(0x01:一次任务，0x02:每日任务，0x04:每周任务，0x08:每月任务)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordTask', @level2type=N'COLUMN',@level2name=N'TimeType'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'任务奖励' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordTask', @level2type=N'COLUMN',@level2name=N'TaskAward'
GO

--------------------------------------------------------------------------------------------------------------------------------
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[RecordAwardTicketSerial](
	[SerialNumber] [nvarchar](19) NOT NULL,
	[MasterID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[TypeID] [int] NOT NULL,
	[CurAwardTicket] [bigint] NOT NULL,
	[ChangeAwardTicket] [int] NOT NULL,
	[ClientIP] [nvarchar](15) NOT NULL,
	[CollectDate] [datetime] NOT NULL,
 CONSTRAINT [PK_RecordAwardTicketSerial] PRIMARY KEY CLUSTERED 
(
	[SerialNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[RecordAwardTicketSerial] ADD  CONSTRAINT [DF_RecordAwardTicketSerial_SerialNumber]  DEFAULT ('') FOR [SerialNumber]
GO

ALTER TABLE [dbo].[RecordAwardTicketSerial] ADD  CONSTRAINT [DF_RecordAwardTicketSerial_MasterID]  DEFAULT ((0)) FOR [MasterID]
GO

ALTER TABLE [dbo].[RecordAwardTicketSerial] ADD  CONSTRAINT [DF_RecordAwardTicketSerial_UserID]  DEFAULT ((0)) FOR [UserID]
GO

ALTER TABLE [dbo].[RecordAwardTicketSerial] ADD  CONSTRAINT [DF_RecordAwardTicketSerial_TypeID]  DEFAULT ((0)) FOR [TypeID]
GO

ALTER TABLE [dbo].[RecordAwardTicketSerial] ADD  CONSTRAINT [DF_RecordAwardTicketSerial_CurAwardTicket]  DEFAULT ((0)) FOR [CurAwardTicket]
GO

ALTER TABLE [dbo].[RecordAwardTicketSerial] ADD  CONSTRAINT [DF_RecordAwardTicketSerial_ChangeAwardTicket]  DEFAULT ((0)) FOR [ChangeAwardTicket]
GO

ALTER TABLE [dbo].[RecordAwardTicketSerial] ADD  CONSTRAINT [DF_RecordAwardTicketSerial_ClientIP]  DEFAULT ('') FOR [ClientIP]
GO

ALTER TABLE [dbo].[RecordAwardTicketSerial] ADD  CONSTRAINT [DF_RecordAwardTicketSerial_CollectDate]  DEFAULT (getdate()) FOR [CollectDate]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'流水号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordAwardTicketSerial', @level2type=N'COLUMN',@level2name=N'SerialNumber'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0 系统标识   大于0表示操作管理员或操作员' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordAwardTicketSerial', @level2type=N'COLUMN',@level2name=N'MasterID'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordAwardTicketSerial', @level2type=N'COLUMN',@level2name=N'UserID'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'操作类型（0 后台赠送,10兑换花费）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordAwardTicketSerial', @level2type=N'COLUMN',@level2name=N'TypeID'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'操作前奖券' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordAwardTicketSerial', @level2type=N'COLUMN',@level2name=N'CurAwardTicket'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'操作奖券（正数表示加，负数表示减）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordAwardTicketSerial', @level2type=N'COLUMN',@level2name=N'ChangeAwardTicket'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'操作地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordAwardTicketSerial', @level2type=N'COLUMN',@level2name=N'ClientIP'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'操作时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordAwardTicketSerial', @level2type=N'COLUMN',@level2name=N'CollectDate'
GO

/****** Object:  Table [dbo].[RecordGrantAwardTicket]    Script Date: 2018/8/14 16:26:16 ******/


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[RecordGrantAwardTicket](
	[RecordID] [int] IDENTITY(1,1) NOT NULL,
	[MasterID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[TypeID] [int] NOT NULL,
	[CurAwardTicket] [bigint] NOT NULL,
	[AddAwardTicket] [int] NOT NULL,
	[ClientIP] [nvarchar](15) NOT NULL,
	[CollectDate] [datetime] NOT NULL,
	[CollectNote] [nvarchar](63) NOT NULL,
 CONSTRAINT [PK_RecordGrantAwardTicket] PRIMARY KEY CLUSTERED 
(
	[RecordID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[RecordGrantAwardTicket] ADD  CONSTRAINT [DF_RecordGrantAwardTicket_MasterID]  DEFAULT ((1)) FOR [MasterID]
GO

ALTER TABLE [dbo].[RecordGrantAwardTicket] ADD  CONSTRAINT [DF_RecordGrantAwardTicket_UserID]  DEFAULT ((0)) FOR [UserID]
GO

ALTER TABLE [dbo].[RecordGrantAwardTicket] ADD  CONSTRAINT [DF_RecordGrantAwardTicket_TypeID]  DEFAULT ((0)) FOR [TypeID]
GO

ALTER TABLE [dbo].[RecordGrantAwardTicket] ADD  CONSTRAINT [DF_RecordGrantAwardTicket_CurAwardTicket]  DEFAULT ((0)) FOR [CurAwardTicket]
GO

ALTER TABLE [dbo].[RecordGrantAwardTicket] ADD  CONSTRAINT [DF_RecordGrantAwardTicket_AddAwardTicket]  DEFAULT ((0)) FOR [AddAwardTicket]
GO

ALTER TABLE [dbo].[RecordGrantAwardTicket] ADD  CONSTRAINT [DF_RecordGrantAwardTicket_ClientIP]  DEFAULT ('') FOR [ClientIP]
GO

ALTER TABLE [dbo].[RecordGrantAwardTicket] ADD  CONSTRAINT [DF_RecordGrantAwardTicket_CollectDate]  DEFAULT (getdate()) FOR [CollectDate]
GO

ALTER TABLE [dbo].[RecordGrantAwardTicket] ADD  CONSTRAINT [DF_RecordGrantAwardTicket_Reason]  DEFAULT ('') FOR [CollectNote]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'管理员标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGrantAwardTicket', @level2type=N'COLUMN',@level2name=N'MasterID'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'赠送用户' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGrantAwardTicket', @level2type=N'COLUMN',@level2name=N'UserID'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'赠送类型（0、系统后台赠送 ）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGrantAwardTicket', @level2type=N'COLUMN',@level2name=N'TypeID'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'赠送前奖券' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGrantAwardTicket', @level2type=N'COLUMN',@level2name=N'CurAwardTicket'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'赠送奖券' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGrantAwardTicket', @level2type=N'COLUMN',@level2name=N'AddAwardTicket'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'赠送地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGrantAwardTicket', @level2type=N'COLUMN',@level2name=N'ClientIP'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'赠送时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGrantAwardTicket', @level2type=N'COLUMN',@level2name=N'CollectDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'赠送备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordGrantAwardTicket', @level2type=N'COLUMN',@level2name=N'CollectNote'
GO
