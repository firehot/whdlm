#ifndef ANDROID_USER_ITEM_SINK_HEAD_FILE
#define ANDROID_USER_ITEM_SINK_HEAD_FILE

#pragma once

#include "Stdafx.h"
#include "GameLogic.h"

//////////////////////////////////////////////////////////////////////////
//宏定义

#ifndef _UNICODE
#define myprintf	_snprintf
#define mystrcpy	strcpy
#define mystrlen	strlen
#define myscanf		_snscanf
#define	myLPSTR		LPCSTR
#else
#define myprintf	swprintf
#define mystrcpy	wcscpy
#define mystrlen	wcslen
#define myscanf		_snwscanf
#define	myLPSTR		LPWSTR
#endif

//最大下注次数
#define MAX_CHIP_TIME								50

#define AREA_COUNT					                12					//区域数目

//机器人信息
//struct tagRobotInfo
//{
//	int nChip[6];														//筹码定义
//	int nAreaChance[AREA_COUNT];										//区域几率
//	TCHAR szCfgFileName[MAX_PATH];										//配置文件
//	int	nMaxTime;														//最大赔率
//
//	tagRobotInfo()
//	{
//		int nTmpChip[6] = {100, 1000, 10000, 100000, 1000000, 5000000};
//		int nTmpAreaChance[AREA_COUNT] = {3, 0, 3, 1, 1};
//		TCHAR szTmpCfgFileName[MAX_PATH] = _T("BaccaratConfig.ini");
//
//		nMaxTime = 2;
//		memcpy(nChip, nTmpChip, sizeof(nChip));
//		memcpy(nAreaChance, nTmpAreaChance, sizeof(nAreaChance));
//		memcpy(szCfgFileName, szTmpCfgFileName, sizeof(szCfgFileName));
//	}
//};
//////////////////////////////////////////////////////////////////////////

//机器人类
class CAndroidUserItemSink : public IAndroidUserItemSink
{
	//游戏变量
protected:
	BYTE                            m_cbScene;
	LONGLONG						m_lPlayScore;							//玩家分数
	LONGLONG						m_lPlayChip[GAME_PLAYER];				//玩家筹码
	LONGLONG						m_lAreaChip[ANIMAL_MAX];				//区域下注 
	int								m_nAreaChance[ANIMAL_MAX];				//区域下注比例 
	LONGLONG						m_lMaxChipUser;							//最大下注 (个人)

	//组件接口
protected:
	ITableFrame	*					m_pITableFrame;							//框架接口
	tagGameServiceOption*			m_pGameServiceOption;					//配置参数
	IUnknownEx * pIUnknownEx;

	//配置变量  (全局配置)
protected:
	tagRobotInfo					m_RobotInfo;						//全局配置
	TCHAR							m_szRoomName[32];					//配置房间
	TCHAR							m_szRoomId[32];						//配置房间ID

	int								m_nChipLimit[2];					//下注范围 (0-AREA_COUNT)
	int								m_nChipTime;						//下注次数 (本局)
	int								m_nChipTimeCount;					//已下次数 (本局)
	//配置变量  (机器人配置)
protected:
	LONGLONG						m_lRobotJettonLimit[2];				//筹码限制	
	int								m_nRobotBetTimeLimit[2];			//次数限制	
	bool							m_bRefreshCfg;							//每盘刷新

	//机器人存取款
	LONGLONG						m_lRobotScoreRange[2];				//最大范围
	LONGLONG						m_lRobotBankGetScore;				//提款数额
	LONGLONG						m_lRobotBankGetScoreBanker;			//提款数额
	int								m_nRobotBankStorageMul;				//存款倍数
	bool							m_bReduceJettonLimit;				//降低限制


	//控件变量
protected:
	//CGameLogic						m_GameLogic;						//游戏逻辑
	IAndroidUserItem *					m_pIAndroidUserItem;				//用户接口

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
	//重置接口
	virtual bool RepositionSink();
	//初始接口
	virtual bool Initialization(IUnknownEx * pIUnknownEx);

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

	//消息处理
public:
	//游戏空闲
	bool OnSubGameFree(const void * pBuffer, WORD wDataSize);
	//游戏开始
	bool OnSubGameStart(const void * pBuffer, WORD wDataSize);
	//用户加注
	bool OnSubPlaceJetton(const void * pBuffer, WORD wDataSize);
	//下注失败
	bool OnSubPlaceJettonFail(const void * pBuffer, WORD wDataSize);
	//游戏结束
	bool OnSubGameEnd(const void * pBuffer, WORD wDataSize);
	//申请做庄
	bool OnSubUserApplyBanker(const void * pBuffer, WORD wDataSize);
	//取消做庄
	bool OnSubUserCancelBanker(const void * pBuffer, WORD wDataSize);
	//切换庄家
	bool OnSubChangeBanker(const void * pBuffer, WORD wDataSize);

	//功能函数
public:
	//读取配置
	void ReadConfigInformation();
	//计算范围
	bool CalcJettonRange(LONGLONG lMaxScore, LONGLONG lChipLmt[], int & nChipTime, int lJetLmt[]);
	//随机数函数
	LONGLONG ProduceRandom(LONGLONG lMinCount, LONGLONG lMaxCount);
};

//////////////////////////////////////////////////////////////////////////

#endif
