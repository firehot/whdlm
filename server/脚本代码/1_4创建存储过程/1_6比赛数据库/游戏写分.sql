
----------------------------------------------------------------------------------------------------

USE WHQJGameMatchDB
GO

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[dbo].[GSP_GR_WriteGameScore]') and OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[GSP_GR_WriteGameScore]
GO

SET QUOTED_IDENTIFIER ON 
GO

SET ANSI_NULLS ON 
GO

----------------------------------------------------------------------------------------------------

-- 游戏写分
CREATE PROC GSP_GR_WriteGameScore

	-- 系统信息
	@dwUserID INT,								-- 用户 I D
	@dwDBQuestID INT,							-- 请求标识
	@dwInoutIndex INT,							-- 进出索引

	-- 变更成绩
	@lVariationScore BIGINT,					-- 用户分数
	@lVariationGrade BIGINT,					-- 用户成绩
	@lVariationInsure BIGINT,					-- 用户银行
	@lVariationRevenue BIGINT,					-- 游戏服务比例
	@lVariationChipSerialScore BIGINT,			-- 用户流水
	@lVariationWinCount INT,					-- 胜利盘数
	@lVariationLostCount INT,					-- 失败盘数
	@lVariationDrawCount INT,					-- 和局盘数
	@lVariationFleeCount INT,					-- 逃跑数目
	@lVariationIntegralCount BIGINT,			-- 游戏积分	
	@lVariationUserMedal INT,					-- 用户奖牌
	@lVariationExperience INT,					-- 用户经验
	@lVariationLoveLiness INT,					-- 用户魅力
	@dwVariationPlayTimeCount INT,				-- 游戏时间
	@dwVariationGroupID INT,					-- 大联盟ID

	-- 比赛信息
	@dwMatchID INT,							    -- 比赛 I D
	@lMatchNo BIGINT,							-- 比赛场次

	-- 属性信息
	@wKindID INT,								-- 游戏 I D
	@wServerID INT,								-- 房间 I D
	@strClientIP NVARCHAR(15)					-- 连接地址

WITH ENCRYPTION AS

-- 属性设置
SET NOCOUNT ON

-- 执行逻辑
BEGIN

	-- 比赛分数
	UPDATE MatchScoreInfo SET Score=Score+@lVariationScore, WinCount=WinCount+@lVariationWinCount, LostCount=LostCount+@lVariationLostCount,
		DrawCount=DrawCount+@lVariationDrawCount, FleeCount=FleeCount+@lVariationFleeCount, PlayTimeCount=PlayTimeCount+@dwVariationPlayTimeCount
	WHERE UserID=@dwUserID AND ServerID=@wServerID AND MatchID=@dwMatchID AND MatchNo=@lMatchNo

	-- 游戏时长
	UPDATE GameScoreInfo SET PlayTimeCount=PlayTimeCount+@dwVariationPlayTimeCount WHERE UserID=@dwUserID	

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

	
	-- 全局信息
	--IF @lVariationExperience>0 OR @lVariationLoveLiness<>0 OR @lVariationUserMedal>0
	--BEGIN
	--	UPDATE  WHQJAccountsDB.dbo.AccountsInfo SET Experience=Experience+@lVariationExperience, LoveLiness=LoveLiness+@lVariationLoveLiness,
	--		UserMedal=UserMedal+@lVariationUserMedal
	--	WHERE UserID=@dwUserID
	--END

END

RETURN 0

GO

----------------------------------------------------------------------------------------------------