#ifndef GAME_LOGIC_HEAD_FILE
#define GAME_LOGIC_HEAD_FILE

#pragma once

#include "Stdafx.h"
//数值掩码
#define	LOGIC_MASK_COLOR			0xF0								//花色掩码
#define	LOGIC_MASK_VALUE			0x0F								//数值掩码

//扑克类型
#define CT_SINGLE					1									//单牌类型
#define CT_ONE_LONG					2									//对子类型
#define CT_TWO_LONG					3									//两对类型
#define CT_THREE_TIAO				4									//三条类型
#define	CT_SHUN_ZI					5									//顺子类型
#define CT_TONG_HUA					6									//同花类型
#define CT_HU_LU					7									//葫芦类型
#define CT_TIE_ZHI					8									//铁支类型
#define CT_TONG_HUA_SHUN			9									//同花顺型
#define CT_KING_TONG_HUA_SHUN		10									//皇家同花顺

//////////////////////////////////////////////////////////////////////////

//胜利信息结构
struct UserWinList
{
	BYTE bSameCount;
	WORD wWinerList[GAME_PLAYER];
};

//分析结构
struct tagAnalyseResult
{
	BYTE 							cbFourCount;						//四张数目
	BYTE 							cbThreeCount;						//三张数目
	BYTE 							cbLONGCount;						//两张数目
	BYTE							cbSignedCount;						//单张数目
	BYTE 							cbFourLogicVolue[1];				//四张列表
	BYTE 							cbThreeLogicVolue[1];				//三张列表
	BYTE 							cbLONGLogicVolue[2];				//两张列表
	BYTE 							cbSignedLogicVolue[5];				//单张列表
	BYTE							cbFourCardData[MAX_CENTER_COUNT];			//四张列表
	BYTE							cbThreeCardData[MAX_CENTER_COUNT];			//三张列表
	BYTE							cbLONGCardData[MAX_CENTER_COUNT];		//两张列表
	BYTE							cbSignedCardData[MAX_CENTER_COUNT];		//单张数目
};
//////////////////////////////////////////////////////////////////////////

//游戏逻辑
class CGameLogic
{
	//函数定义
public:
	//构造函数
	CGameLogic();
	//析构函数
	virtual ~CGameLogic();

	//变量定义
private:
	static BYTE						m_cbCardData[FULL_COUNT];				//扑克定义

	//调试函数
public:
	//排列扑克
	void SortCardList(BYTE cbCardData[], BYTE cbCardCount);
	//混乱扑克
	VOID RandCardList(BYTE cbCardBuffer[], BYTE cbBufferCount);

	//类型函数
public:
	//获取类型
	BYTE GetCardType(BYTE cbCardData[], BYTE cbCardCount);
	//获取数值
	BYTE GetCardValue(BYTE cbCardData) { return cbCardData&LOGIC_MASK_VALUE; }
	//获取花色
	BYTE GetCardColor(BYTE cbCardData) { return cbCardData&LOGIC_MASK_COLOR; }
	//查找扑克
	BYTE GetSameCard(const BYTE bCardData[],const BYTE bMaxCard[],BYTE bCardCount,BYTE bMaxCardCount,BYTE bResultData[]);

	//功能函数
public:
	//逻辑数值
	BYTE GetCardLogicValue(BYTE cbCardData);
	//对比扑克
	BYTE CompareCard(BYTE cbFirstData[], BYTE cbNextData[], BYTE cbCardCount);
	//分析扑克
	void AnalysebCardData(const BYTE cbCardData[], BYTE cbCardCount, tagAnalyseResult & AnalyseResult);
	//7返5
	BYTE FiveFromSeven(BYTE cbHandCardData[],BYTE cbHandCardCount,BYTE cbCenterCardData[],BYTE cbCenterCardCount,BYTE cbLastCardData[],BYTE cbLastCardCount);
	//查找最大
	bool SelectMaxUser(BYTE bCardData[GAME_PLAYER][MAX_CENTER_COUNT],UserWinList &EndResult,const SCORE lAddScore[]);
	//转换信息
	void ChangeUserInfo(BYTE bCardData[],BYTE bCardCount,CString &CardInfo);
	//获取当前牌权重
	BYTE GetCurCardWeight(BYTE cbHandCard[2], BYTE cbCenterCard[MAX_CENTER_COUNT], BYTE cbCenterCardCount);
	//加一张成顺子
	bool IsAddOneBeShun(BYTE *pData, BYTE cbCardCount);
	//加一张成同花
	bool IsAddOneBeHua(BYTE *pData, BYTE cbCardCount);
};

//////////////////////////////////////////////////////////////////////////

#endif
