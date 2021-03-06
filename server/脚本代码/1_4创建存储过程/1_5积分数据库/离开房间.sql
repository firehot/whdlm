
----------------------------------------------------------------------------------------------------

USE WHQJGameScoreDB
GO

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[dbo].[GSP_GR_LeaveGameServer]') and OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[GSP_GR_LeaveGameServer]
GO

SET QUOTED_IDENTIFIER ON 
GO

SET ANSI_NULLS ON 
GO

----------------------------------------------------------------------------------------------------

-- 离开房间
CREATE PROC GSP_GR_LeaveGameServer

	-- 用户信息
	@dwUserID INT,								-- 用户 I D
	@dwOnLineTimeCount INT,						-- 在线时间
	@dwDayPlayTime INT,							-- 游戏时间
	-- 系统信息
	@dwInoutIndex INT,							-- 进出索引
	@dwLeaveReason INT,							-- 离开原因

	-- 记录成绩
	@lRecordScore BIGINT,						-- 用户分数
	@lRecordGrade BIGINT,						-- 用户成绩
	@lRecordInsure BIGINT,						-- 用户银行
	@lRecordRevenue BIGINT,						-- 游戏服务比例
	@lRecordChipSerialScore BIGINT,				-- 用户流水
	@lRecordWinCount INT,						-- 胜利盘数
	@lRecordLostCount INT,						-- 失败盘数
	@lRecordDrawCount INT,						-- 和局盘数
	@lRecordFleeCount INT,						-- 断线数目
	@lRecordUserMedal INT,						-- 用户奖牌
	@lRecordExperience INT,						-- 用户经验
	@lRecordLoveLiness INT,						-- 用户魅力
	@dwRecordPlayTimeCount INT,					-- 游戏时间

	-- 变更成绩
	@lVariationScore BIGINT,					-- 用户分数
	@lVariationGrade BIGINT,					-- 用户成绩
	@lVariationInsure BIGINT,					-- 用户银行
	@lVariationRevenue BIGINT,					-- 游戏服务比例
	@lVariationChipSerialScore BIGINT,			-- 用户流水
	@lVariationWinCount INT,					-- 胜利盘数
	@lVariationLostCount INT,					-- 失败盘数
	@lVariationDrawCount INT,					-- 和局盘数
	@lVariationFleeCount INT,					-- 断线数目
	@lVariationIntegralCount BIGINT,				-- 游戏积分		
	@lVariationUserMedal INT,					-- 用户奖牌
	@lVariationExperience INT,					-- 用户经验
	@lVariationLoveLiness INT,					-- 用户魅力
	@dwVariationPlayTimeCount INT,				-- 游戏时间

	-- 属性信息
	@wKindID INT,								-- 游戏 I D
	@wServerID INT,								-- 房间 I D
	@strClientIP NVARCHAR(15),					-- 连接地址
	@strMachineSerial NVARCHAR(32),				-- 机器标识
	@cbIsPersonalRoom TINYINT					-- 是否为私人房间			

WITH ENCRYPTION AS

-- 属性设置
SET NOCOUNT ON

-- 执行逻辑
BEGIN

	-- 用户积分
	UPDATE GameScoreInfo SET Score=Score+@lVariationScore, WinCount=WinCount+@lVariationWinCount, LostCount=LostCount+@lVariationLostCount,
		DrawCount=DrawCount+@lVariationDrawCount, FleeCount=FleeCount+@lVariationFleeCount, PlayTimeCount=PlayTimeCount+@dwVariationPlayTimeCount,
		OnLineTimeCount=OnLineTimeCount+@dwOnLineTimeCount
	WHERE UserID=@dwUserID

	-- 房间参数
	UPDATE GameScoreAttribute SET  
	IntegralCount=IntegralCount+@lVariationIntegralCount,
	WinCount=WinCount+@lVariationWinCount, 
	LostCount=LostCount+@lVariationLostCount, 
	DrawCount=DrawCount+@lVariationDrawCount,
	FleeCount=FleeCount+@lVariationFleeCount 
	WHERE UserID=@dwUserID And ServerID=@wServerID And KindID = @wKindID 
	IF @@ROWCOUNT=0
	BEGIN
		INSERT INTO GameScoreAttribute (UserID,KindID,ServerID,IntegralCount,WinCount,LostCount,DrawCount,FleeCount) 
		VALUES (@dwUserID,@wKindID,@wServerID,@lVariationIntegralCount,@lVariationWinCount,@lVariationLostCount,@lVariationDrawCount,@lVariationFleeCount)
	END

	IF @cbIsPersonalRoom <> 0
	BEGIN
		-- 锁定解除
		DELETE  WHQJTreasureDB.dbo.GameScoreLocker WHERE UserID=@dwUserID AND ServerID=@wServerID
	END
	ELSE
	BEGIN
		-- 锁定解除
		DELETE GameScoreLocker WHERE UserID=@dwUserID AND ServerID=@wServerID
	END
	
	--游戏时间
	IF @strClientIP<>N'0.0.0.0'
	BEGIN
		DECLARE @DateID	INT
		SET @DateID = CAST(CAST(GETDATE() AS FLOAT) AS INT)

		IF NOT EXISTS(SELECT UserID FROM WHQJAccountsDB.dbo.AccountsDayPlayTime WHERE DateID=@DateID AND UserID=@dwUserID)
		BEGIN
			INSERT INTO WHQJAccountsDB.dbo.AccountsDayPlayTime(DateID,UserID,DayPlayTimeCount)
			VALUES(@DateID,@dwUserID,@dwDayPlayTime)
		END
		ELSE
		BEGIN
			UPDATE WHQJAccountsDB.dbo.AccountsDayPlayTime SET DayPlayTimeCount=@dwDayPlayTime,CollectDate=GETDATE()
			WHERE DateID=@DateID AND UserID=@dwUserID	
		END
	END

	-- 离开记录
	UPDATE RecordUserInout SET LeaveTime=GetDate(), LeaveReason=@dwLeaveReason, LeaveMachine=@strMachineSerial, LeaveClientIP=@strClientIP,
		Score=@lRecordScore, Insure=@lRecordInsure, Revenue=@lRecordRevenue, WinCount=@lRecordWinCount, LostCount=@lRecordLostCount,
		DrawCount=@lRecordDrawCount, FleeCount=@lRecordFleeCount, 
		PlayTimeCount=@dwRecordPlayTimeCount, OnLineTimeCount=@dwOnLineTimeCount
	WHERE ID=@dwInoutIndex AND UserID=@dwUserID
END

RETURN 0

GO

----------------------------------------------------------------------------------------------------