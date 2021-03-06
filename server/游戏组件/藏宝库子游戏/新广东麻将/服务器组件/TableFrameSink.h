#ifndef TABLE_FRAME_SINK_HEAD_FILE
#define TABLE_FRAME_SINK_HEAD_FILE

#pragma once

#include "Stdafx.h"
#include "AfxTempl.h"
#include "GameLogic.h"
#include "HistoryScore.h"
#include "DlgCustomRule.h"
#include "GameVideo.h"
#include <vector>

#pragma warning(disable : 4244)

using namespace std;
//////////////////////////////////////////////////////////////////////////////////

//效验类型
enum enEstimatKind
{
	EstimatKind_OutCard,			//出牌效验
	EstimatKind_GangCard,			//杠牌效验
};

//发牌状态
enum enSendStatus
{
	Not_Send = 0,					//无
	OutCard_Send,					//出牌后发牌
	Gang_Send,						//杠牌后发牌
	BuHua_Send,						//补花后发牌
};

//////////////////////////////////////////////////////////////////////////////////

//游戏桌子
class CTableFrameSink : public ITableFrameSink, public ITableUserAction
{
	
protected://房卡配置
	bool							m_bQiangGangHu;									//能否抢杠胡
	bool							m_bHuQiDui;										//能否胡七对
	bool							m_bNoMagicDouble;								//无鬼加倍
	bool							m_bHaveZiCard;									//是否带字牌

	BYTE							m_cbMagicMode;									//鬼牌模式 0无鬼，1白板鬼，2翻鬼，3翻双鬼
	BYTE							m_cbMaCount;									//码数 
	CMD_S_RECORD					m_stRecord;										//游戏记录
	std::vector<LONGLONG> 			m_vecRecord[GAME_PLAYER];
	//游戏变量
protected:
	BYTE							m_cbAllCardCount;								//牌数量
	BYTE							m_cbPlayerCount;								//游戏人数
	BYTE							m_cbFanCardData;								//翻鬼牌
	WORD							m_wSiceCount;									//骰子点数
	WORD							m_wBankerUser;									//庄家用户
	bool							m_bTing[GAME_PLAYER];							//是否听牌
	bool							m_bTrustee[GAME_PLAYER];						//是否托管
	BYTE							m_cbMagicIndex[MAX_MAGIC_COUNT];				//财神索引
	bool							m_bPlayStatus[GAME_PLAYER];						//是否参与游戏
	bool							m_bCanDiHu[GAME_PLAYER];						//是否能地胡
	bool							m_bGenZhuangSucceed;							//跟庄成功
	time_t							m_tActionStartTime;								//动作计时开始时间
	//属性变量
protected:
	WORD							m_wPlayerCount;									//游戏人数
	BYTE							m_cbWaitTime;									//等待时间

	//堆立变量
protected:
	WORD							m_wHeapHead;									//堆立头部
	WORD							m_wHeapTail;									//堆立尾部
	BYTE							m_cbHeapCardInfo[GAME_PLAYER][2];				//堆牌信息
	BYTE							m_cbHeapCount[GAME_PLAYER];						//堆牌总数
	//运行变量
protected:
	WORD							m_wResumeUser;									//还原用户
	WORD							m_wCurrentUser;									//当前用户
	WORD							m_wProvideUser;									//供应用户
	BYTE							m_cbProvideCard;								//供应扑克
	WORD							m_wLastCatchCardUser;							//最后一个摸牌的用户
	bool							m_bUserActionDone;
	//状态变量
protected:
	bool							m_bGangOutCard;									//杠后出牌
	enSendStatus					m_enSendStatus;									//发牌状态
	BYTE							m_cbGangStatus;									//杠牌状态
	WORD							m_wProvideGangUser;								//供杠用户
	bool							m_bEnjoinChiHu[GAME_PLAYER];					//禁止吃胡
	bool							m_bEnjoinChiPeng[GAME_PLAYER];					//禁止吃碰
	bool							m_bEnjoinGang[GAME_PLAYER];						//禁止杠牌
	bool							m_bGangCard[GAME_PLAYER];						//杠牌状态
	BYTE							m_cbGangCount[GAME_PLAYER];						//杠牌次数	
	BYTE							m_cbChiPengCount[GAME_PLAYER];					//吃碰杠次数	
	vector<BYTE>					m_vecEnjoinChiHu[GAME_PLAYER];					//禁止吃胡
	vector<BYTE>					m_vecEnjoinChiPeng[GAME_PLAYER];				//禁止吃碰
	BYTE							m_cbHuCardCount[GAME_PLAYER];					//胡牌个数
	BYTE							m_cbHuCardData[GAME_PLAYER][MAX_INDEX];			//胡牌数据

	//用户状态
public:
	bool							m_bResponse[GAME_PLAYER];						//响应标志
	BYTE							m_cbUserAction[GAME_PLAYER];					//用户动作
	BYTE							m_cbOperateCard[GAME_PLAYER][3];				//操作扑克
	BYTE							m_cbPerformAction[GAME_PLAYER];					//执行动作
	SCORE							m_lUserGangScore[GAME_PLAYER];					//游戏中杠的输赢
	//结束信息
protected:
	BYTE							m_cbChiHuCard;									//吃胡扑克
	DWORD							m_dwChiHuKind[GAME_PLAYER];						//吃胡结果
	CChiHuRight						m_ChiHuRight[GAME_PLAYER];						//吃胡权位
	//游戏视频
protected:
	HINSTANCE						m_hVideoInst;
	IGameVideo*						m_pGameVideo;
	//出牌信息
protected:
	WORD							m_wOutCardUser;									//出牌用户
	BYTE							m_cbOutCardData;								//出牌扑克
	BYTE							m_cbOutCardCount;								//出牌数目
	BYTE							m_cbDiscardCount[GAME_PLAYER];					//丢弃数目
	BYTE							m_cbDiscardCard[GAME_PLAYER][60];				//丢弃记录

	//发牌信息
protected:
	BYTE							m_cbSendCardData;								//发牌扑克
	BYTE							m_cbSendCardCount;								//发牌数目	

	BYTE							m_cbRepertoryCard[MAX_REPERTORY];				//库存扑克
	BYTE							m_cbEndLeftCount;								//荒庄牌数
	BYTE							m_cbMinusHeadCount;								//头部空缺
	BYTE							m_cbMinusLastCount;								//尾部空缺
	BYTE							m_cbLeftCardCount;								//剩余数目

	//用户扑克
protected:
	BYTE							m_cbCardIndex[GAME_PLAYER][MAX_INDEX];			//用户扑克
	BYTE							m_cbHandCardCount[GAME_PLAYER];					//扑克数目
	
	//组合扑克
protected:
	BYTE							m_cbWeaveItemCount[GAME_PLAYER];				//组合数目
	tagWeaveItem					m_WeaveItemArray[GAME_PLAYER][MAX_WEAVE];		//组合扑克

	//组件变量
protected:
	CGameLogic						m_GameLogic;									//游戏逻辑
	CHistoryScore					m_HistoryScore;									//历史成绩

#ifdef  CARD_DISPATCHER_CONTROL

	//控制变量
protected:
	BYTE							m_cbControlGameCount;							//控制局数
	WORD							m_wControBankerUser;							//控制庄家
	BYTE							m_cbControlRepertoryCard[MAX_REPERTORY];		//控制库存

#endif
	//组件接口
protected:
	ITableFrame	*					m_pITableFrame;									//框架接口
	tagCustomRule *					m_pGameCustomRule;								//自定规则
	tagGameServiceOption *			m_pGameServiceOption;							//游戏配置
	tagGameServiceAttrib *			m_pGameServiceAttrib;							//游戏属性

	//函数定义
public:
	//构造函数
	CTableFrameSink();
	//析构函数
	virtual ~CTableFrameSink();

	//基础接口
public:
	//释放对象
	virtual VOID Release() { delete this; }
	//接口查询
	virtual VOID * QueryInterface(REFGUID Guid, DWORD dwQueryVer);

	//管理接口
public:
	//复位桌子
	virtual VOID RepositionSink();
	//配置桌子
	virtual bool Initialization(IUnknownEx * pIUnknownEx);

	//查询接口
public:
	//查询限额
	virtual SCORE QueryConsumeQuota(IServerUserItem * pIServerUserItem);
	//最少积分
	virtual SCORE QueryLessEnterScore(WORD wChairID, IServerUserItem * pIServerUserItem);
	//查询是否扣服务费
	virtual bool QueryBuckleServiceCharge(WORD wChairID){return true;}

	//游戏事件
public:
	//游戏开始
	virtual bool OnEventGameStart();
	//游戏结束
	virtual bool OnEventGameConclude(WORD wChairID, IServerUserItem * pIServerUserItem, BYTE cbReason);
	//发送场景
	virtual bool OnEventSendGameScene(WORD wChairID, IServerUserItem * pIServerUserItem, BYTE cbGameStatus, bool bSendSecret);


	//事件接口
public:
	//时间事件
	virtual bool OnTimerMessage(DWORD wTimerID, WPARAM wBindParam);
	//数据事件
	virtual bool OnDataBaseMessage(WORD wRequestID, VOID * pData, WORD wDataSize);
	//积分事件
	virtual bool OnUserScroeNotify(WORD wChairID, IServerUserItem * pIServerUserItem, BYTE cbReason);

	//网络接口
public:
	//游戏消息
	virtual bool OnGameMessage(WORD wSubCmdID, VOID * pData, WORD wDataSize, IServerUserItem * pIServerUserItem);
	//框架消息
	virtual bool OnFrameMessage(WORD wSubCmdID, VOID * pData, WORD wDataSize, IServerUserItem * pIServerUserItem);

	//比赛接口
public:
	//设置基数
	virtual void SetGameBaseScore(LONG lBaseScore);

	//用户事件
public:
	//用户断线
	virtual bool OnActionUserOffLine(WORD wChairID, IServerUserItem * pIServerUserItem);
	//用户重入
	virtual bool OnActionUserConnect(WORD wChairID, IServerUserItem * pIServerUserItem) { return true; }
	//用户坐下
	virtual bool OnActionUserSitDown(WORD wChairID, IServerUserItem * pIServerUserItem, bool bLookonUser);
	//用户起立
	virtual bool OnActionUserStandUp(WORD wChairID, IServerUserItem * pIServerUserItem, bool bLookonUser);
	//用户同意
	virtual bool OnActionUserOnReady(WORD wChairID, IServerUserItem * pIServerUserItem, VOID * pData, WORD wDataSize) { return true; }

protected://游戏事件
	//用户出牌
	bool OnUserOutCard(WORD wChairID, BYTE cbCardData,bool bSysOut=false);
	//用户操作
	bool OnUserOperateCard(WORD wChairID, BYTE cbOperateCode, BYTE cbOperateCard[3]);
	//用户听牌
	bool OnUserListenCard(WORD wChairID, bool bListenCard);
	//用户托管
	bool OnUserTrustee(WORD wChairID, bool bTrustee);
	//玩家逃跑
	bool OnUserFlee(WORD wChairID);
	
	void WriteDebugInfo(LPCTSTR pszString);
protected://辅助函数
	//发送操作
	bool SendOperateNotify();
	//取得扑克
	BYTE GetSendCard(bool bTail = false);
	//派发扑克
	bool DispatchCardData(WORD wSendCardUser,bool bTail = false);
	//响应判断
	bool EstimateUserRespond(WORD wCenterUser, BYTE cbCenterCard, enEstimatKind EstimatKind);
	//算输赢分
	void CalGameScore(CMD_S_GameConclude &GameConclude);
	//算杠分
	void CalGangScore();
	//是否无鬼
	bool IsNoMagicCard(WORD wHuUser);
	//权位过滤
	void FiltrateRight(WORD wWinner, CChiHuRight &chr);
	//获取中码个数
	BYTE GetUserZhongMaCount(WORD wChairId,BYTE cbData[]);
	//获取胡牌翻数
	BYTE GetUserHuFan(WORD wChairId);
	//获取指定玩家某张牌未出数量
	BYTE GetRemainingCount(WORD wChairID,BYTE cbCardData);
	//发送听牌数据，打哪些牌胡哪些牌 
	void SendTingData(WORD wChairID,const BYTE cbCardIndex[MAX_INDEX], const tagWeaveItem WeaveItem[], BYTE cbWeaveCount);
	//发送胡牌数据
	void SendHuData(WORD wChairID);
	//判断约占房间
	bool IsRoomCard();
	//判断积分约占房间
	bool IsRoomCardScoreType();
	//判断金币约占房间
	bool IsRoomCardTreasureType();

};

#endif