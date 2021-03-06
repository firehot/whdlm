#ifndef GAME_CLIENT_ENGINE_HEAD_FILE
#define GAME_CLIENT_ENGINE_HEAD_FILE

#pragma once

#include "Stdafx.h"
#include "GameLogic.h"
#include "HistoryRecord.h"
#include "GameClientView.h"
//////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////////

//游戏引擎
class CGameClientEngine : public CGameFrameEngine
{
	//辅助变量
protected:
	int								m_bTrusteeCount;					//托管计数
	bool							m_bTrustee;							//托管标志
	bool							m_bLastTurn;						//上轮标志
	BYTE							m_cbSortType;						//排序类型
	bool							m_bBackGroundSound;					//背景声音

	//游戏变量
protected:
	WORD							m_wBankerUser;						//庄家用户
	WORD							m_wCurrentUser;						//当前用户
	WORD							m_wMostCardUser;					//最大玩家
	WORD							m_wXuanZhanUser;				//宣战玩家
	WORD							m_wAskUser;							//询问玩家
	WORD							m_wFriend[GAME_PLAYER];	//队友信息
	BYTE								m_cbFriendFlag;						//队友标记
	bool								m_bDoneAddTimes[GAME_PLAYER];	//是否完成加倍操作
	bool								m_bSelfDoneAddTimes;			//自己是否完成加倍操作
	//时间定义
protected:
	BYTE							m_cbTimeStartGame;
	BYTE							m_cbTimeOutCard;					//出牌时间
	BYTE							m_cbTimeXuanZhan;					//宣战时间
	BYTE							m_cbTimeFindFriend;					//找同盟时间
	BYTE							m_cbTimeAskFriend;					//问同盟时间
	BYTE							m_cbTimeAddTimes;					//加倍时间

	//搜索变量
protected:
	BYTE							m_cbSearchResultIndex;				//搜索结果索引
	tagSearchCardResult				m_SearchCardResult;					//搜索结果

	int								m_nCurSearchType;					//当前搜索状态
	BYTE							m_cbEachSearchIndex;				//单项搜索索引
	tagSearchCardResult				m_EachSearchResult;					//单项搜索结果

	//出牌变量
protected:
	BYTE							m_cbTurnCardCount;					//出牌数目
	BYTE							m_cbTurnCardData[MAX_CARD_COUNT];	//出牌列表

	//扑克变量
protected:
	BYTE							m_cbHandCardData[MAX_CARD_COUNT];	//手上扑克
	BYTE							m_cbHandCardCount[GAME_PLAYER];		//扑克数目

	//组件变量
protected:
	CHistoryCard					m_HistoryCard;						//历史扑克
	CHistoryScore					m_HistoryScore;						//历史积分

	//组件变量
public:
	CGameLogic						m_GameLogic;						//游戏逻辑
	CGameClientView					m_GameClientView;					//游戏视图

	//函数定义
public:
	//构造函数
	CGameClientEngine();
	//析构函数
	virtual ~CGameClientEngine();

	//系统事件
public:
	//创建函数
	virtual bool OnInitGameEngine();
	//重置函数
	virtual bool OnResetGameEngine();

	//时钟事件
public:
	//时钟删除
	virtual bool OnEventGameClockKill(WORD wChairID);
	//时钟信息
	virtual bool OnEventGameClockInfo(WORD wChairID, UINT nElapse, WORD wClockID);
	//声音控制
	virtual bool AllowBackGroundSound(bool bAllowSound);

	//游戏事件
public:
	//旁观消息
	virtual bool OnEventLookonMode(VOID * pData, WORD wDataSize);
	//游戏消息
	virtual bool OnEventGameMessage(WORD wSubCmdID, VOID * pData, WORD wDataSize);
	//场景消息
	virtual bool OnEventSceneMessage(BYTE cbGameStatus, bool bLookonUser, VOID * pData, WORD wDataSize);

	//消息处理
protected:
	//游戏开始
	bool OnSubGameStart(VOID * pData, WORD wDataSize);
	//用户宣战
	bool OnSubXuanZhan(VOID * pData, WORD wDataSize);
	//用户找同盟
	bool OnSubFindFriend(VOID * pData, WORD wDataSize);
	//用户问同盟
	bool OnSubAskFriend(VOID * pData, WORD wDataSize);
	//用户加倍
	bool OnSubAddTimes(VOID * pData, WORD wDataSize);
	//用户出牌
	bool OnSubOutCard(VOID * pData, WORD wDataSize);
	//用户放弃
	bool OnSubPassCard(VOID * pData, WORD wDataSize);
	//用户托管
	bool OnSubTrustee(VOID * pData, WORD wDataSize);
	//游戏结束
	bool OnSubGameConclude(VOID * pData, WORD wDataSize);
	//收到同盟关系
	bool OnSubFriend(VOID * pData, WORD wDataSize);
	//功能函数
public:
	//出牌判断
	bool VerdictOutCard();
	//自动开始
	bool PerformAutoStart();
	//当前扑克
	bool SwitchToCurrentCard();
	//自动出牌
	bool AutomatismOutCard();
	//更新按钮
	VOID UpdateButtonControl();
	//设置同盟标签
	VOID SetFriendFlag();
	//声音函数
public:
	//播放声音
	VOID PlayOutCardSound(WORD wChairID, BYTE cbCardData[], BYTE cbCardCount);

	//用户事件
public:
	//用户状态
	virtual VOID OnEventUserStatus(IClientUserItem * pIClientUserItem, bool bLookonUser);

	//消息映射
protected:
	//时间消息
	VOID OnTimer(UINT nIDEvent);
	//开始消息
	LRESULT OnStart(WPARAM wParam, LPARAM lParam);
	//出牌消息
	LRESULT OnOutCard(WPARAM wParam, LPARAM lParam);
	//PASS消息
	LRESULT OnPassCard(WPARAM wParam, LPARAM lParam);
	//提示消息
	LRESULT OnOutPrompt(WPARAM wParam, LPARAM lParam);
	//叫分消息
	LRESULT OnCallScore(WPARAM wParam, LPARAM lParam);
	//左键扑克
	LRESULT OnLeftHitCard(WPARAM wParam, LPARAM lParam);
	//排列扑克
	LRESULT OnSortHandCard(WPARAM wParam, LPARAM lParam);
	//查看上轮
	LRESULT OnLastTurnCard(WPARAM wParam, LPARAM lParam);
	//拖管控制
	LRESULT OnTrusteeControl(WPARAM wParam, LPARAM lParam);
	//宣战消息
	LRESULT OnXuanZhan(WPARAM wParam, LPARAM lParam);
	//找同盟消息
	LRESULT OnFindFriend(WPARAM wParam, LPARAM lParam);
	//问同盟消息
	LRESULT OnAskFriend(WPARAM wParam, LPARAM lParam);
	//加倍消息
	LRESULT OnAddTimes(WPARAM wParam, LPARAM lParam);
	//辅助消息
protected:
	//启用上轮
	LRESULT OnEnableHistory(WPARAM wParam, LPARAM lParam);
	//出牌完成
	LRESULT OnOutCardFinish(WPARAM wParam, LPARAM lParam);
	//发牌完成
	LRESULT OnDispatchFinish(WPARAM wParam, LPARAM lParam);

	DECLARE_MESSAGE_MAP()
};

//////////////////////////////////////////////////////////////////////////////////

#endif