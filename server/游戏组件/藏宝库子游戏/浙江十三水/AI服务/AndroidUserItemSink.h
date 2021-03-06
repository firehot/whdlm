#ifndef ANDROID_USER_ITEM_SINK_HEAD_FILE
#define ANDROID_USER_ITEM_SINK_HEAD_FILE

#pragma once

#include "Stdafx.h"
#include "..\游戏服务器\GameLogic.h"

#pragma warning(disable : 4244)

#define MAX_COUNT 13

//辅助时间
#define TIME_LESS					2									//最少时间

//时间定义
#define TIMER_START_GAME			5									//准备时间
#define	TIMER_SHUFFLECARD			4									//洗牌时间
#define TIMER_COMPARECARD			17									//比牌时间
#define TIMER_RANGECARD				2									//理牌时间
#define TIMER_DISPATCHCARDFINISH	12								//发牌时间
//游戏时间
#define IDI_START_GAME					1									//开始定时器
#define IDI_RANGE_CARD					2									//理牌定时器
#define IDI_COMPARECARD				3									//比牌定时器
#define IDI_DISPATCHCARDFINISH	4									//发牌定时器

//////////////////////////////////////////////////////////////////////////

//机器人类
class CAndroidUserItemSink : public IAndroidUserItemSink
{

	//时间定义
protected:
	BYTE							m_cbTimeStartGame;					//开始时间
	BYTE							m_cbTimeCallBanker;					//叫庄时间
	BYTE							m_cbTimeSetChip;					//下注时间
	BYTE							m_cbTimeRangeCard;					//理牌时间
	BYTE							m_cbTimeShowCard;					//开牌时间

	BYTE                            m_cbUserCount;						//玩家人数
	//游戏变量
protected:
	
	BYTE							m_cbHandCardData[HAND_CARD_COUNT];	//手上扑克
	BYTE							m_cbHandCardCount ;					//扑克数目
	BYTE							m_cbSegmentCard[GAME_PLAYER][3][5];	//分段扑克
	tagSegInfo						m_tagSegInfo;						//临时分段

	bool							m_bFinishSegment;					//完成分段

	//控件变量
protected:
	CGameLogic						m_GameLogic;						//游戏逻辑
	IAndroidUserItem *				m_pIAndroidUserItem;				//用户接口
	
	//机器人存取款
	LONGLONG						m_lRobotScoreRange[2];					//最大范围
	LONGLONG						m_lRobotBankGetScore;					//提款数额
	LONGLONG						m_lRobotBankGetScoreBanker;				//提款数额 (庄家)
	int								m_nRobotBankStorageMul;					//存款倍数
	WORD							m_wServerID;							//房间标识

	//函数定义
public:
	//构造函数
	CAndroidUserItemSink();
	//析构函数
	virtual ~CAndroidUserItemSink();

	//基础接口
public:
	//释放对象
	virtual VOID Release() { delete this; }
	//接口查询
	virtual VOID * QueryInterface(REFGUID Guid, DWORD dwQueryVer);

	//控制接口
public:
	//初始接口
	virtual bool Initialization(IUnknownEx * pIUnknownEx);
	//重置接口
	virtual bool RepositionSink();

	//游戏事件
public:
	//时间消息
	virtual bool OnEventTimer(UINT nTimerID);
	//游戏消息
	virtual bool OnEventGameMessage(WORD wSubCmdID, VOID * pData, WORD wDataSize);
	//游戏消息
	virtual bool OnEventFrameMessage(WORD wSubCmdID, VOID * pData, WORD wDataSize);
	//场景消息
	virtual bool OnEventSceneMessage(BYTE cbGameStatus, bool bLookonOther, VOID * pData, WORD wDataSize);

	//用户事件
public:
	//用户进入
	virtual VOID OnEventUserEnter(IAndroidUserItem * pIAndroidUserItem, bool bLookonUser);
	//用户离开
	virtual VOID OnEventUserLeave(IAndroidUserItem * pIAndroidUserItem, bool bLookonUser);
	//用户积分
	virtual VOID OnEventUserScore(IAndroidUserItem * pIAndroidUserItem, bool bLookonUser);
	//用户状态
	virtual VOID OnEventUserStatus(IAndroidUserItem * pIAndroidUserItem, bool bLookonUser);
	//用户段位
	virtual VOID OnEventUserSegment(IAndroidUserItem * pIAndroidUserItem, bool bLookonUser);

	//消息处理
protected:
	//发送扑克
	bool OnSubSendCardEx(const void * pBuffer, WORD wDataSize);
	//游戏结束
	bool OnSubGameEnd(const void * pBuffer, WORD wDataSize) ;
	//比较扑克
	bool OnSubCompareCard(const void * pBuffer , WORD wDataSize) ;
private:
	//自动代打
	void AutomaticOutCard() ;
protected:
	void GetCardIndex(BYTE cbSrcIdx[], BYTE cbDstCard[], BYTE cbDstLen);
	//库存操作
private:
	//读取配置
	void ReadConfigInformation();
	//银行操作
	void BankOperate(BYTE cbType);

	void WriteDebugInfo(LPCTSTR pszString);
};

//////////////////////////////////////////////////////////////////////////

#endif