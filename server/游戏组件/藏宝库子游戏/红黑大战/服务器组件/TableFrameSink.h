#ifndef TABLE_FRAME_SINK_HEAD_FILE
#define TABLE_FRAME_SINK_HEAD_FILE

#pragma once

#include "Stdafx.h"
#include "AfxTempl.h"
#include "GameLogic.h"

#include "ServerControl.h"
//////////////////////////////////////////////////////////////////////////
//历史记录
#define MAX_SCORE_HISTORY			20									//历史个数
//////////////////////////////////////////////////////////////////////////////////

//游戏桌子
class CTableFrameSink : public ITableFrameSink, public ITableUserAction
{
	//用户信息
protected:
	LONGLONG						m_lUserStartScore[GAME_PLAYER];		//起始分数
	//总下注数
protected:
	LONGLONG						m_lAllJettonScore[AREA_COUNT+1];		//全体总注
	//个人下注
protected:
	LONGLONG						m_lUserJettonScore[AREA_COUNT+1][GAME_PLAYER];	//个人总注
	//上局信息				
public:
	LONGLONG						m_lLastAllJettonPlace[AREA_COUNT + 1][GAME_PLAYER]; //上局总下注
	LONGLONG						m_lLastAllJettonArea[AREA_COUNT + 1][GAME_PLAYER];  //本局最后一次操作

	//控制变量
protected:
	bool							m_bRefreshCfg;							//每盘刷新
	TCHAR							m_szRoomName[32];						//配置房间
	TCHAR							m_szConfigFileName[MAX_PATH];			//配置文件
	LONGLONG						m_lAreaLimitScore[2];					//区域限制
	LONGLONG						m_lUserLimitScore;						//区域限制

	//坐庄控制
	LONGLONG						m_lApplyBankerCondition;				//申请条件
	int								m_nBankerTimeLimit;						//次数限制
	LONGLONG						m_lPlayerBankerMAX;						//玩家最大庄家数
	int								m_nBankerTimeAdd;						//增加次数 (金币大于其他玩家时)
	LONGLONG						m_lExtraBankerScore;					//额外条件 (大于此值时可以无视条件额外坐庄)
	int								m_nExtraBankerTime;						//额外次数

	//库存控制
	LONGLONG						m_lStorageStart;						//库存数值
	LONGLONG						m_lStorageCurrent;						//库存数值
	int								m_nStorageDeduct;						//扣取比例
	LONGLONG						m_lStorageMax1;							//库存封顶1
	LONGLONG						m_lStorageMul1;							//系统输钱概率
	LONGLONG						m_lStorageMax2;							//库存封顶2
	LONGLONG						m_lStorageMul2;							//系统输钱概率

	bool							m_bControl;								//是否控制
	TCHAR							m_szControlName[LEN_NICKNAME];			//房间名称

	//时间控制
	int								m_nFreeTime;							//空闲时间
	int								m_nPlaceJettonTime;						//下注时间
	int								m_nGameEndTime;							//结束时间

	//机器人控制
	int								m_nMaxChipRobot;						//最大数目 (下注机器人)
	int								m_nChipRobotCount;						//人数统计 (下注机器人)
	LONGLONG						m_lRobotAreaLimit;						//区域统计 (机器人)
	LONGLONG						m_lRobotAreaScore[AREA_COUNT+1];		//区域统计 (机器人)
	int								m_nRobotListMaxCount;					//最多人数

	//玩家成绩
protected:
	bool							m_bWinRed;
	bool							m_bWinBlack;
	bool							m_bWinPoker;
	BYTE							m_cbPokerType[2];
	LONGLONG						m_lUserWinScore[GAME_PLAYER];			//玩家成绩
	LONGLONG						m_lUserReturnScore[GAME_PLAYER];		//返回下注
	LONGLONG						m_lUserRevenue[GAME_PLAYER];			//玩家税收
	tagStatisticsRecordList			m_tagUserRecord[GAME_PLAYER];			//玩家最近二十局的统计信息

	//扑克信息
protected:
    BYTE							m_cbTableCardArray[2][3];				//桌面扑克
	BYTE							m_cbTableCard[52];						//桌面扑克

	//状态变量
protected:
	DWORD							m_dwJettonTime;							//开始时间
	bool							m_bExchangeBanker;						//变换庄家
	WORD							m_wAddTime;								//额外坐庄 

	//庄家信息
protected:
	CWHArray<WORD>					m_ApplyUserArray;						//申请玩家
	WORD							m_wCurrentBanker;						//当前庄家
	WORD							m_wOfflineBanker;						//离线庄家
	WORD							m_wBankerTime;							//做庄次数
	LONGLONG						m_lBankerScore;							//
	LONGLONG						m_lBankerWinScore;						//累计成绩
	LONGLONG						m_lBankerCurGameScore;					//当前成绩
	bool							m_bEnableSysBanker;						//系统做庄
	//占位
	OCCUPYSEATCONFIG				m_occupyseatConfig;									//占位配置
	BYTE							m_cbDeskChairID[MAX_OCCUPY_SEAT_COUNT];	//占位椅子I

	//控制变量
protected:
	BYTE							m_cbWinSideControl;						//控制输赢
	int								m_nSendCardCount;						//发送次数

	//记录变量
protected:
	int								m_nRBCurrentColumn;
	int								m_nRBCurrentRow;
	BYTE							m_cbRBHistory[20][6];					//牌路走势
	tagServerGameRecord				m_GameRecordArrary[MAX_SCORE_HISTORY];	//游戏记录
	int								m_nRecordFirst;							//开始记录
	int								m_nRecordLast;							//最后记录
	DWORD							m_dwRecordCount;						//记录数目

	//组件变量
protected:
	CGameLogic						m_GameLogic;							//游戏逻辑
	ITableFrame						* m_pITableFrame;						//框架接口
	tagGameServiceOption			* m_pGameServiceOption;					//配置参数
	tagGameServiceAttrib *			m_pGameServiceAttrib;					//游戏属性

	//服务控制
protected:
	HINSTANCE						m_hInst;
	IServerControl*					m_pServerContro;

	//属性变量
protected:
	static const WORD				m_wPlayerCount;							//游戏人数

	//函数定义
public:
	//构造函数
	CTableFrameSink();
	//析构函数
	virtual ~CTableFrameSink();

	//基础接口
public:
	//释放对象
	virtual VOID Release();
	//接口查询
	virtual VOID * QueryInterface(REFGUID Guid, DWORD dwQueryVer);

	//管理接口
public:
	//复位接口
	virtual VOID RepositionSink();
	//配置接口
	virtual bool Initialization(IUnknownEx * pIUnknownEx);
	//比赛接口
public:
	//设置基数
	virtual void SetGameBaseScore(LONG lBaseScore){};
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
	//游戏消息
	virtual bool OnGameMessage(WORD wSubCmdID, VOID * pData, WORD wDataSize, IServerUserItem * pIServerUserItem);
	//框架消息
	virtual bool OnFrameMessage(WORD wSubCmdID, VOID * pData, WORD wDataSize, IServerUserItem * pIServerUserItem);

	//用户事件
public:
	//用户断线
	virtual bool OnActionUserOffLine(WORD wChairID,IServerUserItem * pIServerUserItem);
	//用户重入
	virtual bool OnActionUserConnect(WORD wChairID,IServerUserItem * pIServerUserItem) { return true; }
	//用户坐下
	virtual bool OnActionUserSitDown(WORD wChairID,IServerUserItem * pIServerUserItem, bool bLookonUser);
	//用户起立
	virtual bool OnActionUserStandUp(WORD wChairID,IServerUserItem * pIServerUserItem, bool bLookonUser);
	//用户同意
	virtual bool OnActionUserOnReady(WORD wChairID,IServerUserItem * pIServerUserItem, VOID * pData, WORD wDataSize) { return true; }
	//查询接口
public:
	//查询限额
	virtual SCORE QueryConsumeQuota(IServerUserItem * pIServerUserItem);
	//最少积分
	virtual SCORE QueryLessEnterScore(WORD wChairID, IServerUserItem * pIServerUserItem){return 0;}
	//数据事件
	virtual bool OnDataBaseMessage(WORD wRequestID, VOID * pData, WORD wDataSize){return false;}
	//积分事件
	virtual bool OnUserScroeNotify(WORD wChairID, IServerUserItem * pIServerUserItem, BYTE cbReason);
	//查询是否扣服务费
	virtual bool QueryBuckleServiceCharge(WORD wChairID);	

	//游戏事件
protected:
	//加注事件
	bool OnUserPlaceJetton(WORD wChairID, BYTE cbJettonArea, LONGLONG lJettonScore);
	//申请庄家
	bool OnUserApplyBanker(IServerUserItem *pIApplyServerUserItem);
	//取消申请
	bool OnUserCancelBanker(IServerUserItem *pICancelServerUserItem);
	//用户占位
	bool OnUserOccupySeat(WORD wOccupyChairID, BYTE cbOccupySeatIndex);

	//辅助函数
private:
	//发送扑克
	bool DispatchTableCard();
	//发送庄家
	void SendApplyUser( IServerUserItem *pServerUserItem );
	//更换庄家
	bool ChangeBanker(bool bCancelCurrentBanker);
	//轮换判断
	void TakeTurns();
	//发送记录
	void SendGameRecord(IServerUserItem *pIServerUserItem);
	//发送消息
	void SendGameMessage(WORD wChairID, LPCTSTR pszTipMsg);
	//读取配置
	void ReadConfigInformation();
	//是否衰减
	bool NeedDeductStorage();
	//发送下注信息
	void SendUserBetInfo( IServerUserItem *pIServerUserItem );

	//输赢处理
protected:
	// 库存优化
	VOID StorageOptimize();
	//计算系统及机器人坐庄时真人玩家得分
	LONGLONG CalSysOrAndroidBankerScore();
	//计算真人玩家坐庄时真人的得分
	LONGLONG CalRealPlayerBankerScore();

	//下注计算
private:
	//最大下注
	LONGLONG GetUserMaxJetton(WORD wChairID, BYTE cbJettonArea);

	//游戏统计
private:
	//计算得分
	LONGLONG CalculateScore();
	//推断赢家
	void DeduceWinner(bool &bWinRed, bool &bWinBlack, bool &bWinPoker, BYTE cbPokerType[]);

	bool ReJetton(IServerUserItem *pIServerUserItem);
};


//////////////////////////////////////////////////////////////////////////////////

#endif