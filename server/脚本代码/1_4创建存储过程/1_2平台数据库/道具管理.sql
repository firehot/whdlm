
----------------------------------------------------------------------------------------------------

USE WHQJPlatformDB
GO
IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[dbo].[GSP_GP_LoadGamePropertyTypeItem]') and OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[GSP_GP_LoadGamePropertyTypeItem]
GO

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[dbo].[GSP_GP_LoadGamePropertyRelatItem]') and OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[GSP_GP_LoadGamePropertyRelatItem]
GO

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[dbo].[GSP_GP_LoadGamePropertyItem]') and OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[GSP_GP_LoadGamePropertyItem]
GO

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[dbo].[GSP_GP_LoadGamePropertySubItem]') and OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[GSP_GP_LoadGamePropertySubItem]
GO

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[dbo].[GSP_GP_BuyProperty]') and OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[GSP_GP_BuyProperty]
GO

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[dbo].[GSP_GP_BuyGameProperty]') and OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[GSP_GP_BuyGameProperty]
GO

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[dbo].[GSP_GP_LoadUserGameBuff]') and OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[GSP_GP_LoadUserGameBuff]
GO

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[dbo].[GSP_GP_LoadUserGameTrumpet]') and OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[GSP_GP_LoadUserGameTrumpet]
GO

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[dbo].[GSP_GP_QuerySendPresent]') and OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[GSP_GP_QuerySendPresent]
GO

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[dbo].[GSP_GP_UserSendPresentByID]') and OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[GSP_GP_UserSendPresentByID]
GO

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[dbo].[GSP_GP_UserSendPresentByNickName]') and OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[GSP_GP_UserSendPresentByNickName]
GO

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[dbo].[GSP_GP_GetSendPresent]') and OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[GSP_GP_GetSendPresent]
GO

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[dbo].[GSP_GP_PropertQuerySingle]') and OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[GSP_GP_PropertQuerySingle]
GO

SET QUOTED_IDENTIFIER ON 
GO

SET ANSI_NULLS ON 
GO

----------------------------------------------------------------------------------------------------

-- ????????
CREATE PROC GSP_GP_LoadGamePropertyTypeItem
WITH ENCRYPTION AS

-- ????????
SET NOCOUNT ON

-- ????????
BEGIN

	SELECT * FROM GamePropertyType(NOLOCK) WHERE Nullity=0 AND TagID = 0
	
END

RETURN 0

GO

----------------------------------------------------------------------------------------------------

-- ????????
CREATE PROC GSP_GP_LoadGamePropertyRelatItem
WITH ENCRYPTION AS

-- ????????
SET NOCOUNT ON

-- ????????
BEGIN

	SELECT * FROM GamePropertyRelat(NOLOCK) WHERE  TagID = 0
	
END

RETURN 0

GO

----------------------------------------------------------------------------------------------------

-- ????????
CREATE PROC GSP_GP_LoadGamePropertyItem
WITH ENCRYPTION AS

-- ????????
SET NOCOUNT ON

-- ????????
BEGIN
	-- ????????
	SELECT * FROM GameProperty(NOLOCK) WHERE Nullity=0 AND Kind <> 11
	
END

RETURN 0

GO

----------------------------------------------------------------------------------------------------

-- ????????
CREATE PROC GSP_GP_LoadGamePropertySubItem
WITH ENCRYPTION AS

-- ????????
SET NOCOUNT ON

-- ????????
BEGIN
	-- ????????
	SELECT * FROM GamePropertySub(NOLOCK) 
	
END

RETURN 0

GO

----------------------------------------------------------------------------------------------------

SET QUOTED_IDENTIFIER ON 
GO

SET ANSI_NULLS ON 
GO


-- ????????
CREATE PROC GSP_GP_BuyProperty
	@dwUserID INT,								-- ????????
	@dwPropertyID INT,							-- ????????
	@cbUseKind SMALLINT,						-- ????????
	@dwPropCount INT,							-- ????????
	@strPassword NCHAR(32),						-- ????????
	@strClientIP NVARCHAR(15),					-- ????????
	@strMachineID NVARCHAR(32),					-- ????????
	@strErrorDescribe NVARCHAR(127) OUTPUT		-- ????????

WITH ENCRYPTION AS

-- ????????
SET NOCOUNT ON

-- ????????
BEGIN

	-- ????????
	DECLARE @ExchangeType TINYINT
	DECLARE @ExchangeRatio INT
	DECLARE @iProPerty BIGINT	
	DECLARE @PropertyName AS NVARCHAR(31)
	DECLARE @Nullity BIT
	DECLARE @CurrMemberOrder SMALLINT	
	
	
	SELECT @Nullity=Nullity FROM  WHQJAccountsDB.dbo.AccountsInfo WHERE UserID=@dwUserID AND LogonPass=@strPassword

	-- ????????
	IF @Nullity IS NULL
	BEGIN
		SET @strErrorDescribe=N'????????????????????????????????????????????'
		RETURN 1
	END	

	-- ????????
	IF @Nullity<>0
	BEGIN
		SET @strErrorDescribe=N'??????????????????????????????????????????????????????'
		RETURN 2
	END

	-- ????????
	SET	@iProPerty= 0
	SET @ExchangeType = 0
	SET @ExchangeRatio = 0

	-- ????????
	SELECT @PropertyName=Name,@ExchangeType=ExchangeType, @ExchangeRatio=ExchangeRatio FROM GameProperty(NOLOCK) WHERE Nullity=0 AND ID=@dwPropertyID  AND ExchangeType = @cbUseKind
	IF @PropertyName IS NULL
	BEGIN
		SET @strErrorDescribe=N'????????????????????????????????????'
		RETURN 3
	END
		
	IF @ExchangeType = 1 AND @cbUseKind=0
	BEGIN
		SET @strErrorDescribe=N'??????????????????????????'
		RETURN 3
	END
	
	IF @ExchangeType = 0 AND @cbUseKind=1
	BEGIN
		SET @strErrorDescribe=N'??????????????????????????'
		RETURN 3
	END

	IF @dwPropCount < 1
	BEGIN
		SET @strErrorDescribe=N'??????????????????'
		RETURN 8
	END
	
	-- ????????
	SET @iProPerty=@dwPropCount*@ExchangeRatio
	
	DECLARE @TotalDiamond BIGINT
	DECLARE @Gold AS BIGINT
	-- ????????
	IF @cbUseKind=0
	BEGIN
		-- ????????
		SELECT @TotalDiamond=Diamond FROM  WHQJTreasureDB.dbo.UserCurrency WHERE UserID=@dwUserID

		-- ????????
		IF @TotalDiamond<@iProPerty OR @TotalDiamond IS NULL
		BEGIN
			-- ????????
			SET @strErrorDescribe=N'??????????????????????????????????????????????????????????????????'
			RETURN 4
		END
		-- ????????	
		UPDATE  WHQJTreasureDB.dbo.UserCurrency SET Diamond=Diamond-@iProPerty WHERE UserID=@dwUserID
	END
	ELSE 
	BEGIN
		--????????
		SELECT @Gold=Score FROM  WHQJTreasureDB.dbo.GameScoreInfo WHERE UserID=@dwUserID
				
		-- ????????
		IF @Gold<@iProPerty OR @Gold IS NULL
		BEGIN
			-- ????????
			SET @strErrorDescribe=N'????????????????????????????????'
			RETURN 4
		END
		-- ????????
		UPDATE  WHQJTreasureDB.dbo.GameScoreInfo SET Score=Score-@iProPerty WHERE UserID=@dwUserID	
	END
	
	
	--????????
	UPDATE  WHQJAccountsDB.dbo.AccountsPackage SET GoodShowID=0, GoodsCount=GoodsCount+ @dwPropCount, PushTime=GETDATE() WHERE UserID=@dwUserID AND GoodsID=@dwPropertyID
	IF @@ROWCOUNT = 0
	BEGIN
		INSERT  WHQJAccountsDB.dbo.AccountsPackage(UserID,GoodsID,GoodShowID,GoodsCount,PushTime)	VALUES(@dwUserID, @dwPropertyID,0,@dwPropCount,GETDATE())
	END

	--????????
	DECLARE @DateTime DATETIME
	DECLARE @SerialNumber NVARCHAR(20)
	SET @DateTime = GETDATE()
	SELECT @SerialNumber=dbo.WF_GetSerialNumber()
	
	IF @cbUseKind=0
	BEGIN
		INSERT WHQJRecordDB.dbo.RecordBuyNewProperty(UserID,PropertyID,PropertyName,ExchangeType,ExchangeRatio,BuyNum,BeforeCurrency,Currency,ClinetIP,CollectDate)
		VALUES(@dwUserID,@dwPropertyID,@PropertyName,@ExchangeType,@ExchangeRatio,@dwPropCount,@TotalDiamond,@iProPerty,@strClientIP,GETDATE())
		
		--????????	
		INSERT INTO WHQJRecordDB.dbo.RecordDiamondSerial(SerialNumber,MasterID,UserID,TypeID,CurDiamond,ChangeDiamond,ClientIP,CollectDate) 
		VALUES(@SerialNumber,0,@dwUserID,9,@TotalDiamond,-@iProPerty,@strClientIP,@DateTime)
	END
	ELSE
	BEGIN
		INSERT WHQJRecordDB.dbo.RecordBuyNewProperty(UserID,PropertyID,PropertyName,ExchangeType,ExchangeRatio,BuyNum,BeforeCurrency,Currency,ClinetIP,CollectDate)
		VALUES(@dwUserID,@dwPropertyID,@PropertyName,@ExchangeType,@ExchangeRatio,@dwPropCount,@Gold,@iProPerty,@strClientIP,GETDATE())

		--????????		
		DECLARE @CurInsureScore AS BIGINT
		--????????
		SELECT @CurInsureScore=InsureScore FROM  WHQJTreasureDB.dbo.GameScoreInfo WHERE UserID=@dwUserID
		
		INSERT INTO WHQJRecordDB.dbo.RecordTreasureSerial(SerialNumber,MasterID,UserID,TypeID,CurScore,CurInsureScore,ChangeScore,ClientIP,CollectDate) 
		VALUES(@SerialNumber,0,@dwUserID,4,@Gold,@CurInsureScore,-@iProPerty,@strClientIP,@DateTime)		
	END
	
	SET @strErrorDescribe=N'????????????' + @PropertyName + N' ??' + CAST(@dwPropCount AS NVARCHAR) +N' ' + N'??????'
	
	DECLARE @lDiamond BIGINT
	DECLARE @lScore AS BIGINT
	SELECT @lDiamond=Diamond FROM  WHQJTreasureDB.dbo.UserCurrency WHERE UserID = @dwUserID
	SELECT @lScore=Score FROM  WHQJTreasureDB.dbo.GameScoreInfo WHERE UserID = @dwUserID
	IF @lDiamond IS NULL SET @lDiamond=0
	IF @lScore IS NULL SET @lScore=0
	--????????
	SELECT @dwPropertyID AS PropertyID,@dwPropCount AS ItemCount,@lDiamond AS Diamond,@lScore AS Score 
	
	RETURN 0
END

RETURN 0

GO

----------------------------------------------------------------------------------------------------

SET QUOTED_IDENTIFIER ON 
GO

SET ANSI_NULLS ON 
GO


-- ????????
CREATE PROC GSP_GP_BuyGameProperty
	@dwUserID INT,								-- ????????
	@dwPropertyID INT,							-- ????????
	@cbUseKind SMALLINT,						-- ????????
	@dwPropCount INT,							-- ????????
	@strPassword NCHAR(32),						-- ????????
	@strClientIP NVARCHAR(15),					-- ????????
	@strMachineID NVARCHAR(32),					-- ????????
	@strErrorDescribe NVARCHAR(127) OUTPUT		-- ????????

WITH ENCRYPTION AS

-- ????????
SET NOCOUNT ON

-- ????????
BEGIN

	-- ????????
	DECLARE @ExchangeType TINYINT
	DECLARE @ExchangeRatio INT
	DECLARE @iProPerty BIGINT	
	DECLARE @PropertyName AS NVARCHAR(31)
	DECLARE @Nullity BIT
	DECLARE @CurrMemberOrder SMALLINT	
	
	
	SELECT @Nullity=Nullity FROM  WHQJAccountsDB.dbo.AccountsInfo WHERE UserID=@dwUserID AND LogonPass=@strPassword

	-- ????????
	IF @Nullity IS NULL
	BEGIN
		SET @strErrorDescribe=N'????????????????????????????????????????????'
		RETURN 1
	END	

	-- ????????
	IF @Nullity<>0
	BEGIN
		SET @strErrorDescribe=N'??????????????????????????????????????????????????????'
		RETURN 2
	END

	-- ????????
	SET	@iProPerty= 0
	SET @ExchangeType = 0
	SET @ExchangeRatio = 0

	-- ????????
	SELECT @PropertyName=Name,@ExchangeType=ExchangeType, @ExchangeRatio=ExchangeRatio FROM GameProperty(NOLOCK) WHERE Nullity=0 AND ID=@dwPropertyID
	IF @PropertyName IS NULL
	BEGIN
		SET @strErrorDescribe=N'????????????????????????????????????'
		RETURN 3
	END
		
	IF @ExchangeType = 1 AND @cbUseKind=0
	BEGIN
		SET @strErrorDescribe=N'??????????????????????????'
		RETURN 3
	END
	
	IF @ExchangeType = 0 AND @cbUseKind=1
	BEGIN
		SET @strErrorDescribe=N'??????????????????????????'
		RETURN 3
	END

	IF @dwPropCount < 1
	BEGIN
		SET @strErrorDescribe=N'??????????????????'
		RETURN 8
	END
	
	-- ????????
	SET @iProPerty=@dwPropCount*@ExchangeRatio
	
	DECLARE @TotalDiamond BIGINT
	DECLARE @InsureGold AS BIGINT
	-- ????????
	IF @cbUseKind=0
	BEGIN
		-- ????????
		SELECT @TotalDiamond=Diamond FROM  WHQJTreasureDB.dbo.UserCurrency WHERE UserID=@dwUserID

		-- ????????
		IF @TotalDiamond<@iProPerty OR @TotalDiamond IS NULL
		BEGIN
			-- ????????
			SET @strErrorDescribe=N'??????????????????????????????????????????????????????????????????'
			RETURN 4
		END
		-- ????????	
		UPDATE  WHQJTreasureDB.dbo.UserCurrency SET Diamond=Diamond-@iProPerty WHERE UserID=@dwUserID
	END
	ELSE 
	BEGIN
		--????????
		SELECT @InsureGold=InsureScore FROM  WHQJTreasureDB.dbo.GameScoreInfo WHERE UserID=@dwUserID
				
		-- ????????
		IF @InsureGold<@iProPerty OR @InsureGold IS NULL
		BEGIN
			-- ????????
			SET @strErrorDescribe=N'????????????????????????????????????'
			RETURN 4
		END
		-- ????????
		UPDATE  WHQJTreasureDB.dbo.GameScoreInfo SET InsureScore=InsureScore-@iProPerty WHERE UserID=@dwUserID	
	END
	
	
	--????????
	UPDATE  WHQJAccountsDB.dbo.AccountsPackage SET GoodShowID=0, GoodsCount=GoodsCount+ @dwPropCount, PushTime=GETDATE() WHERE UserID=@dwUserID AND GoodsID=@dwPropertyID
	IF @@ROWCOUNT = 0
	BEGIN
		INSERT  WHQJAccountsDB.dbo.AccountsPackage(UserID,GoodsID,GoodShowID,GoodsCount,PushTime)	VALUES(@dwUserID, @dwPropertyID,0,@dwPropCount,GETDATE())
	END

	--????????
	DECLARE @DateTime DATETIME
	DECLARE @SerialNumber NVARCHAR(20)
	SET @DateTime = GETDATE()
	SELECT @SerialNumber=dbo.WF_GetSerialNumber()
	
	IF @cbUseKind=0
	BEGIN
		INSERT WHQJRecordDB.dbo.RecordBuyNewProperty(UserID,PropertyID,PropertyName,ExchangeType,ExchangeRatio,BuyNum,BeforeCurrency,Currency,ClinetIP,CollectDate)
		VALUES(@dwUserID,@dwPropertyID,@PropertyName,@ExchangeType,@ExchangeRatio,@dwPropCount,@TotalDiamond,@iProPerty,@strClientIP,GETDATE())
	
		--????????	
		INSERT INTO WHQJRecordDB.dbo.RecordDiamondSerial(SerialNumber,MasterID,UserID,TypeID,CurDiamond,ChangeDiamond,ClientIP,CollectDate) 
		VALUES(@SerialNumber,0,@dwUserID,9,@TotalDiamond,-@iProPerty,@strClientIP,@DateTime)
	END
	ELSE
	BEGIN
		INSERT WHQJRecordDB.dbo.RecordBuyNewProperty(UserID,PropertyID,PropertyName,ExchangeType,ExchangeRatio,BuyNum,BeforeCurrency,Currency,ClinetIP,CollectDate)
		VALUES(@dwUserID,@dwPropertyID,@PropertyName,@ExchangeType,@ExchangeRatio,@dwPropCount,@InsureGold,@iProPerty,@strClientIP,GETDATE())
		
		--????????		
		DECLARE @CurInsureScore AS BIGINT
		DECLARE @CurScore AS BIGINT
		--????????
		SELECT @CurScore = Score, @CurInsureScore=InsureScore FROM  WHQJTreasureDB.dbo.GameScoreInfo WHERE UserID=@dwUserID
		
		INSERT INTO WHQJRecordDB.dbo.RecordTreasureSerial(SerialNumber,MasterID,UserID,TypeID,CurScore,CurInsureScore,ChangeScore,ClientIP,CollectDate) 
		VALUES(@SerialNumber,0,@dwUserID,4,@CurScore,@CurInsureScore,-@iProPerty,@strClientIP,@DateTime)		
	END
	
	SET @strErrorDescribe=N'????????????' + @PropertyName + N' ??' + CAST(@dwPropCount AS NVARCHAR) +N' ' + N'??????'
	
	DECLARE @lDiamond BIGINT
	DECLARE @lScore  BIGINT
	DECLARE @lInsureScore  BIGINT
	SELECT @lDiamond=Diamond FROM  WHQJTreasureDB.dbo.UserCurrency WHERE UserID = @dwUserID
	SELECT @lInsureScore=InsureScore FROM  WHQJTreasureDB.dbo.GameScoreInfo WHERE UserID = @dwUserID
	IF @lDiamond IS NULL SET @lDiamond=0
	IF @lScore IS NULL SET @lScore=0
	--????????
	SELECT @dwPropertyID AS PropertyID,@dwPropCount AS ItemCount,@lDiamond AS Diamond,@lScore AS Score , @lInsureScore AS InsureScore
	
	RETURN 0
END

RETURN 0

GO

----------------------------------------------------------------------------------------------------

SET QUOTED_IDENTIFIER ON 
GO

SET ANSI_NULLS ON 
GO

-- ????Buff
CREATE PROC GSP_GP_LoadUserGameBuff
	@dwUserID	INT						-- ???? I D
WITH ENCRYPTION AS

-- ????????
SET NOCOUNT ON

-- ????????
BEGIN
	--????????
	DELETE  WHQJAccountsDB.dbo.AccountsInfoPoperty WHERE UserID=@dwUserID and dateadd(second,UseResultsValidTime,UseTime) < GETDATE()
	--????????
	SELECT * FROM  WHQJAccountsDB.dbo.AccountsInfoPoperty  WHERE UserID=@dwUserID and dateadd(second,UseResultsValidTime,UseTime) > GETDATE()
	RETURN 0
END

RETURN 0

GO

----------------------------------------------------------------------------------------------------

SET QUOTED_IDENTIFIER ON 
GO

SET ANSI_NULLS ON 
GO

-- ????Buff
CREATE PROC GSP_GP_LoadUserGameTrumpet
	@dwUserID	INT						-- ???? I D
WITH ENCRYPTION AS

-- ????????
SET NOCOUNT ON

-- ????????
BEGIN
	DECLARE @TrumpetCount INT 
	DECLARE @TyphonCount INT 
	SET @TrumpetCount = 0
	SET @TyphonCount = 0
	SELECT @TrumpetCount=GoodsCount FROM  WHQJAccountsDB.dbo.AccountsPackage WHERE UserID=@dwUserID and GoodsID=307
	SELECT @TyphonCount=GoodsCount FROM  WHQJAccountsDB.dbo.AccountsPackage WHERE UserID=@dwUserID and GoodsID=306
	SELECT @TrumpetCount as TrumpetCount, @TyphonCount as TyphonCount
END

RETURN 0

GO
----------------------------------------------------------------------------------------------------


SET QUOTED_IDENTIFIER ON 
GO

SET ANSI_NULLS ON 
GO

--????????
CREATE PROC GSP_GP_QuerySendPresent
	@dwUserID				INT			-- ????ID
WITH ENCRYPTION AS

-- ????????
SET NOCOUNT ON

-- ????????
BEGIN

	SELECT * FROM  WHQJAccountsDB.dbo.AccountsSendPresent AS a, GameProperty AS b 
	WHERE a.ReceiverUserID=@dwUserID and a.PropID = b.ID
	
END

RETURN 0

GO

----------------------------------------------------------------------------------------------------

SET QUOTED_IDENTIFIER ON 
GO

SET ANSI_NULLS ON 
GO

--???????? ????????ID
CREATE PROC GSP_GP_UserSendPresentByID
	@dwUserID				INT,			-- ??????????ID
	@dwReceiverGameID		INT,			-- ??????????ID
	@dwPropID				INT,			-- ??????????ID
	@dwPropCount			INT,			-- ??????????
	@strClientIP			NVARCHAR(15),	-- ????????IP 
	@strErrorDescribe NVARCHAR(127) OUTPUT	-- ????????
WITH ENCRYPTION AS

-- ????????
SET NOCOUNT ON

-- ????????
BEGIN

	--????????
	DECLARE @dwReceiverUserID INT
	SELECT @dwReceiverUserID=UserID FROM  WHQJAccountsDB.dbo.AccountsInfo WHERE GameID=@dwReceiverGameID
	IF @dwReceiverUserID is null
	BEGIN
		set @strErrorDescribe = N'??????????????????'
		RETURN 1
	END

	if @dwPropCount <= 0
	BEGIN
		set @strErrorDescribe = N'??????????????????????'
		RETURN 2
	END
	
	IF @dwReceiverUserID=@dwUserID
	BEGIN
		set @strErrorDescribe = N'??????????????????'
		RETURN 3
	END
	
	--????????
	DECLARE @UserPropCount INT
	SELECT @UserPropCount=GoodsCount FROM  WHQJAccountsDB.dbo.AccountsPackage where UserID=@dwUserID and GoodsID=@dwPropID
	IF @UserPropCount is null or @UserPropCount < @dwPropCount
	BEGIN
		set @strErrorDescribe = N'??????????????????????????????????????'
		RETURN 4
	END
	
	--????????
	UPDATE  WHQJAccountsDB.dbo.AccountsPackage set GoodsCount=GoodsCount-@dwPropCount where UserID=@dwUserID and GoodsID=@dwPropID
	
	--????????
	INSERT  WHQJAccountsDB.dbo.AccountsSendPresent(UserID, ReceiverUserID, PropID, PropCount, SendTime, PropStatus, ClientIP) 
	VALUES (@dwUserID, @dwReceiverUserID, @dwPropID, @dwPropCount, GETDATE(), 0, @strClientIP)
	
	--????????
	INSERT WHQJRecordDB.dbo.RecordUserSendPresent(UserID,ReceiverUserID,PropID,PropCount,SendTime,PropStatus,ClientIP)
	VALUES(@dwUserID,@dwReceiverUserID,@dwPropID,@dwPropCount,GETDATE(),0,@strClientIP)
	
	set @strErrorDescribe = N'????????'
	
	SELECT @dwReceiverUserID AS RecvUserID
END

RETURN 0

GO

----------------------------------------------------------------------------------------------------

SET QUOTED_IDENTIFIER ON 
GO

SET ANSI_NULLS ON 
GO

--???????? ???? ????
CREATE PROC GSP_GP_UserSendPresentByNickName
	@dwUserID				INT,			-- ??????????ID
	@strReceiverNickName	NVARCHAR(16),	-- ??????????
	@dwPropID				INT,			-- ??????????ID
	@dwPropCount			INT,			-- ??????????
	@strClientIP			NVARCHAR(16),	-- ????????IP 
	@strErrorDescribe NVARCHAR(64) OUTPUT	-- ????????
WITH ENCRYPTION AS

-- ????????
SET NOCOUNT ON

-- ????????
BEGIN

	--????????
	DECLARE @dwReceiverUserID INT
	SELECT @dwReceiverUserID=UserID FROM  WHQJAccountsDB.dbo.AccountsInfo WHERE NickName=@strReceiverNickName
	IF @dwReceiverUserID is null
	BEGIN
		set @strErrorDescribe = N'??????????????????'
		RETURN 1
	END
	
	if @dwPropCount <= 0
	BEGIN
		set @strErrorDescribe = N'??????????????????????'
		RETURN 2
	END
	
	IF @dwReceiverUserID=@dwUserID
	BEGIN
		set @strErrorDescribe = N'??????????????????'
		RETURN 3
	END
	
	--????????????????????????????????
	DECLARE @UserPropCount INT
	SELECT @UserPropCount=GoodsCount FROM  WHQJAccountsDB.dbo.AccountsPackage where UserID=@dwUserID and GoodsID=@dwPropID
	IF @UserPropCount is null or @UserPropCount < @dwPropCount
	BEGIN
		set @strErrorDescribe = N'??????????????????????????????????????'
		RETURN 4
	END
	
	--????????????????????
	UPDATE  WHQJAccountsDB.dbo.AccountsPackage set GoodsCount=GoodsCount-@dwPropCount where UserID=@dwUserID and GoodsID=@dwPropID
	
	--??????????????
	INSERT  WHQJAccountsDB.dbo.AccountsSendPresent(UserID, ReceiverUserID, PropID, PropCount, SendTime, PropStatus, ClientIP) 
	VALUES (@dwUserID, @dwReceiverUserID, @dwPropID, @dwPropCount, GETDATE(), 0, @strClientIP)
	
	--????????
	INSERT WHQJRecordDB.dbo.RecordUserSendPresent(UserID,ReceiverUserID,PropID,PropCount,SendTime,PropStatus,ClientIP)
	VALUES(@dwUserID,@dwReceiverUserID,@dwPropID,@dwPropCount,GETDATE(),0,@strClientIP)
	
	set @strErrorDescribe = N'????????'
	
	SELECT @dwReceiverUserID AS RecvUserID
	
END

RETURN 0

GO

----------------------------------------------------------------------------------------------------

--????????
SET QUOTED_IDENTIFIER ON 
GO

SET ANSI_NULLS ON 
GO

--????????
CREATE PROC GSP_GP_GetSendPresent
	@dwUserID				INT,			-- ????ID
	@szPassword			NVARCHAR(33),		-- ????????
	@strClientIP		NVARCHAR(15)		-- ????IP 
WITH ENCRYPTION AS

-- ????????
SET NOCOUNT ON

-- ????????
BEGIN

	DECLARE @Password NVARCHAR(33)
	SELECT @Password = LogonPass FROM  WHQJAccountsDB.dbo.AccountsInfo where UserID=@dwUserID
	--????????
	IF @Password is null
		RETURN 1
	
	--????????
	IF @szPassword != @Password
		RETURN 2
	
	DECLARE @PresentCount INT
	SELECT @PresentCount = COUNT(*) FROM  WHQJAccountsDB.dbo.AccountsSendPresent
	WHERE ReceiverUserID=@dwUserID and PropStatus=0
	--????????
	IF @PresentCount = 0
		RETURN 3
	
	--????????
	DECLARE @PropID INT
	DECLARE @PropCount INT
	DECLARE @ItemCount INT
	DECLARE auth_cur CURSOR FOR
	SELECT PropID,PropCount FROM  WHQJAccountsDB.dbo.AccountsSendPresent AS a, GameProperty AS b 
	WHERE a.ReceiverUserID=@dwUserID and a.PropID = b.ID and a.PropStatus=0
	OPEN auth_cur
	FETCH NEXT FROM auth_cur INTO @PropID,@PropCount
	WHILE (@@fetch_status=0)
	BEGIN
		SELECT @ItemCount=COUNT(*) FROM  WHQJAccountsDB.dbo.AccountsPackage WHERE UserID=@dwUserID and GoodsID=@PropID
		IF @ItemCount = 0
		BEGIN
			INSERT  WHQJAccountsDB.dbo.AccountsPackage(UserID,GoodsID,GoodShowID,GoodsSortID,GoodsCount,PushTime)
			VALUES(@dwUserID,@PropID,0,0,@PropCount,GETDATE())
		END
		ELSE
		BEGIN
			UPDATE  WHQJAccountsDB.dbo.AccountsPackage SET GoodsCount=GoodsCount+@PropCount
			WHERE UserID=@dwUserID and GoodsID=@PropID
		END
		FETCH NEXT FROM auth_cur INTO @PropID,@PropCount
	END
	close auth_cur
	deallocate auth_cur
	
	--????????
	UPDATE WHQJRecordDB.dbo.RecordUserSendPresent SET ReceiveTime=GETDATE(), ReceiverClientIP=@strClientIP, PropStatus=1 
	WHERE  ReceiverUserID = @dwUserID and PropStatus=0
	
	--????????
	SELECT * FROM  WHQJAccountsDB.dbo.AccountsSendPresent AS a, GameProperty AS b 
	WHERE a.ReceiverUserID=@dwUserID and a.PropID = b.ID and a.PropStatus=0
	
	--????????
	DELETE  WHQJAccountsDB.dbo.AccountsSendPresent WHERE  ReceiverUserID=@dwUserID and PropStatus=0
	
END

RETURN 0

GO

----------------------------------------------------------------------------------------------------


SET QUOTED_IDENTIFIER ON 
GO

SET ANSI_NULLS ON 
GO

--????????
CREATE PROC GSP_GP_PropertQuerySingle
	@dwUserID INT,								-- ????????
	@dwPropertyID INT,							-- ????????
	@strPassword NCHAR(32)						-- ????????
WITH ENCRYPTION AS

-- ????????
SET NOCOUNT ON

-- ????????
BEGIN

	DECLARE @Nullity INT
	SELECT @Nullity=Nullity FROM  WHQJAccountsDB.dbo.AccountsInfo WHERE UserID=@dwUserID AND DynamicPass=@strPassword

	-- ????????
	IF @Nullity IS NULL
	BEGIN
		RETURN 1
	END	

	-- ????????
	IF @Nullity<>0
	BEGIN
		RETURN 2
	END
	DECLARE @GoodsCount INT
	SET @GoodsCount = 0
	SELECT @GoodsCount = GoodsCount	FROM  WHQJAccountsDB.dbo.AccountsPackage WHERE UserID=@dwUserID and GoodsID=@dwPropertyID
	
	SELECT @dwPropertyID AS PropertyID,@GoodsCount AS ItemCount
	
END

RETURN 0

GO

----------------------------------------------------------------------------------------------------