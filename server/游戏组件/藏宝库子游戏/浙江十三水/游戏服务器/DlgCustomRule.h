#ifndef GAME_DLG_CUSTOM_RULE_HEAD_FILE
#define GAME_DLG_CUSTOM_RULE_HEAD_FILE

#pragma once

#include "Stdafx.h"

#pragma warning(disable : 4244)
//////////////////////////////////////////////////////////////////////////////////

//配置结构
struct tagCustomRule
{
	SCORE									lRoomStorageStart;			//库存起始值
	SCORE									lRoomStorageDeduct;			//衰减值
	SCORE									lRoomStorageMax1;			//库存封顶值1
	SCORE									lRoomStorageMul1;			//赢分百分比1
	SCORE									lRoomStorageMax2;			//库存封顶值1
	SCORE									lRoomStorageMul2;			//赢分百分比1

	//机器人存款取款
	SCORE									lRobotScoreMin;
	SCORE									lRobotScoreMax;
	SCORE	                                lRobotBankGet;
	SCORE									lRobotBankGetBanker;
	SCORE									lRobotBankStoMul;

	//时间定义
	BYTE							cbTimeStartGame;					//开始时间
	BYTE							cbTimeCallBanker;					//叫庄时间
	BYTE							cbTimeSetChip;						//下注时间
	BYTE							cbTimeRangeCard;					//理牌时间
	BYTE							cbTimeShowCard;						//开牌时间

	bool							bHaveBanker;						//霸王庄
	BYTE							cbPlayerCount;						//玩家人数
	BYTE							cbMaCard;							//码牌
	BYTE							cbTongHuaMode;						//0同花先比点数，1同花先比花色
	BYTE							cbQuickMode;						//快速比牌0普通，1快速

};

//////////////////////////////////////////////////////////////////////////////////

//配置窗口
class CDlgCustomRule : public CDialog
{
	//配置变量
protected:
	tagCustomRule					m_CustomRule;						//配置结构

	//函数定义
public:
	//构造函数
	CDlgCustomRule();
	//析构函数
	virtual ~CDlgCustomRule();

	//重载函数
protected:
	//配置函数
	virtual BOOL OnInitDialog();
	//确定函数
	virtual VOID OnOK();
	//取消消息
	virtual VOID OnCancel();

	//功能函数
public:
	//更新控件
	bool FillDataToControl();
	//更新数据
	bool FillControlToData();

	//配置函数
public:
	//读取配置
	bool GetCustomRule(tagCustomRule & CustomRule);
	//设置配置
	bool SetCustomRule(tagCustomRule & CustomRule);

	DECLARE_MESSAGE_MAP()
};

//////////////////////////////////////////////////////////////////////////////////

#endif