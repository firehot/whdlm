#pragma once
#include "TableFrameSink.h"

//自定义配置
struct tagCustomGeneral
{
    //上庄信息
    LONGLONG						lApplyBankerCondition;			//申请条件
    LONGLONG						lBankerTime;					//坐庄次数
    LONGLONG						lBankerTimeAdd;					//庄家增加数
    LONGLONG						lBankerScoreMAX;				//三次坐庄金币数
    LONGLONG						lBankerTimeExtra;				//三次坐庄次数
    BOOL							nEnableSysBanker;				//系统做庄

    //时间
    LONGLONG						cbFreeTime;						//空闲时间
    LONGLONG						cbBetTime;						//下注时间
    LONGLONG						cbEndTime;						//结束时间

    //下注限制
    LONGLONG						lAreaLimitScore;				//区域限制
    LONGLONG						lUserLimitScore;				//区域限制

    //消息
    TCHAR							szMessageItem1[64];				//消息1
    TCHAR							szMessageItem2[64];				//消息2
    TCHAR							szMessageItem3[64];				//消息3

    SCORE							lChipArray[MAX_CHIP_COUNT];		//筹码配置
    LONGLONG						lOccupySeatFree;				//免费占位金币条件

    SCORE							lSysCtrlSysStorage;				//系统库存(系统要赢的钱)
    SCORE							lSysCtrlPlayerStorage;			//玩家库存(玩家要赢的钱)
    SCORE							lSysCtrlParameterK;				//调节系数(百分比):
    SCORE							lConfigAnChouRate;				//暗抽比例
    SCORE							lSysCtrlSysStorResetRate;		//系统库存重置比例

    SCORE							lConfigMosgoldRate;				//大奖抽取比例
    SCORE							lConfigMosgoldStorage;			//大奖库存
    SCORE							lConfigMosgoldDispatchCon;		//派奖起点
    SCORE							lConfigMosgoldDispatchRate;		//派奖概率
    SCORE							lConfigMosgoldStorageRate;		//大奖库存比例

    //构造函数
    tagCustomGeneral()
    {
        PrimaryDefaultCustomRule();
    }

    //初级配置
    void PrimaryDefaultCustomRule()
    {
        lApplyBankerCondition = 1000;
        lBankerTime = 10;
        lBankerTimeAdd = 10;
        lBankerScoreMAX = 10000;
        lBankerTimeExtra = 10;
        nEnableSysBanker = TRUE;

        cbFreeTime = 5;
        cbBetTime = 15;
        cbEndTime = 10;

        lAreaLimitScore = 10000;
        lUserLimitScore = 8000;

        CopyMemory(szMessageItem1, TEXT("让我们给他点颜色看看"), sizeof(TEXT("让我们给他点颜色看看")));
        CopyMemory(szMessageItem2, TEXT("掌声欢迎"), sizeof(TEXT("掌声欢迎")));
        CopyMemory(szMessageItem3, TEXT("大家尽情游戏吧"), sizeof(TEXT("大家尽情游戏吧")));


        SCORE lTempChipArray[MAX_CHIP_COUNT] = {1, 5, 10, 50, 100, 500};
        CopyMemory(lChipArray, lTempChipArray, sizeof(lTempChipArray));

        lOccupySeatFree = 100000;

        lSysCtrlSysStorage = 200000;
        lSysCtrlPlayerStorage = 250000;
        lSysCtrlParameterK = 10;
        lConfigAnChouRate = 2;
        lSysCtrlSysStorResetRate = 5;

        lConfigMosgoldRate = 3;
        lConfigMosgoldStorage = 0;
        lConfigMosgoldDispatchCon = 0;
        lConfigMosgoldDispatchRate = 8;
        lConfigMosgoldStorageRate = 20;
    }

    //中级配置
    void MidDefaultCustomRule()
    {
        lApplyBankerCondition = 10000;
        lBankerTime = 10;
        lBankerTimeAdd = 10;
        lBankerScoreMAX = 100000;
        lBankerTimeExtra = 10;
        nEnableSysBanker = TRUE;

        cbFreeTime = 5;
        cbBetTime = 15;
        cbEndTime = 10;

        lAreaLimitScore = 100000;
        lUserLimitScore = 80000;

        CopyMemory(szMessageItem1, TEXT("让我们给他点颜色看看"), sizeof(TEXT("让我们给他点颜色看看")));
        CopyMemory(szMessageItem2, TEXT("掌声欢迎"), sizeof(TEXT("掌声欢迎")));
        CopyMemory(szMessageItem3, TEXT("大家尽情游戏吧"), sizeof(TEXT("大家尽情游戏吧")));


        SCORE lTempChipArray[MAX_CHIP_COUNT] = {10, 50, 100, 500, 1000, 5000};
        CopyMemory(lChipArray, lTempChipArray, sizeof(lTempChipArray));

        lOccupySeatFree = 1000000;

        lSysCtrlSysStorage = 2000000;
        lSysCtrlPlayerStorage = 2500000;
        lSysCtrlParameterK = 10;
        lConfigAnChouRate = 2;
        lSysCtrlSysStorResetRate = 5;

        lConfigMosgoldRate = 3;
        lConfigMosgoldStorage = 0;
        lConfigMosgoldDispatchCon = 0;
        lConfigMosgoldDispatchRate = 8;
        lConfigMosgoldStorageRate = 20;
    }

    //高级配置
    void SeniorDefaultCustomRule()
    {
        lApplyBankerCondition = 100000;
        lBankerTime = 10;
        lBankerTimeAdd = 10;
        lBankerScoreMAX = 1000000;
        lBankerTimeExtra = 10;
        nEnableSysBanker = TRUE;

        cbFreeTime = 5;
        cbBetTime = 15;
        cbEndTime = 10;

        lAreaLimitScore = 1000000;
        lUserLimitScore = 800000;

        CopyMemory(szMessageItem1, TEXT("让我们给他点颜色看看"), sizeof(TEXT("让我们给他点颜色看看")));
        CopyMemory(szMessageItem2, TEXT("掌声欢迎"), sizeof(TEXT("掌声欢迎")));
        CopyMemory(szMessageItem3, TEXT("大家尽情游戏吧"), sizeof(TEXT("大家尽情游戏吧")));


        SCORE lTempChipArray[MAX_CHIP_COUNT] = {100, 500, 1000, 5000, 10000, 50000};
        CopyMemory(lChipArray, lTempChipArray, sizeof(lTempChipArray));

        lOccupySeatFree = 10000000;

        lSysCtrlSysStorage = 20000000;
        lSysCtrlPlayerStorage = 25000000;
        lSysCtrlParameterK = 10;
        lConfigAnChouRate = 2;
        lSysCtrlSysStorResetRate = 5;

        lConfigMosgoldRate = 3;
        lConfigMosgoldStorage = 0;
        lConfigMosgoldDispatchCon = 0;
        lConfigMosgoldDispatchRate = 8;
        lConfigMosgoldStorageRate = 20;
    }
};

struct tagCustomConfig
{
    bool							bEnableBanker;					//上庄功能
    tagCustomGeneral				CustomGeneral;					//通用功能
    tagCustomAndroid				CustomAndroid;					//机器人

    //构造函数
    tagCustomConfig()
    {
        PrimaryDefaultCustomRule();
    }

    void PrimaryDefaultCustomRule()
    {
        bEnableBanker = true;
        CustomGeneral.PrimaryDefaultCustomRule();
        CustomAndroid.PrimaryDefaultCustomRule();
    }

    void MidDefaultCustomRule()
    {
        bEnableBanker = true;
        CustomGeneral.MidDefaultCustomRule();
        CustomAndroid.MidDefaultCustomRule();
    }

    void SeniorDefaultCustomRule()
    {
        bEnableBanker = true;
        CustomGeneral.SeniorDefaultCustomRule();
        CustomAndroid.SeniorDefaultCustomRule();
    }
};

class CDlgCustomRule;
////////////////////////////////////////////////////////////////////////////////////////////
class CDlgCustomGeneral : public CDialog
{
    //配置结构
public:
    tagCustomGeneral					m_CustomGeneral;						//自定配置
    CDlgCustomRule*						m_pDlgCustomRule;

    //函数定义
public:
    //构造函数
    CDlgCustomGeneral();
    //析构函数
    virtual ~CDlgCustomGeneral();

    //重载函数
protected:
    //控件绑定
    virtual VOID DoDataExchange(CDataExchange * pDX);
    //初始化函数
    virtual BOOL OnInitDialog();

public:
    //激活坐庄相关
    void EnableBankerFun(BOOL bEnable);
    //上庄功能
    void CheckBankerCtrl(BOOL bEnable);
    //自定义回调
    void SetDlgCustomRuleSink(CDlgCustomRule* pDialog) { m_pDlgCustomRule = pDialog; }
    DECLARE_MESSAGE_MAP()
    afx_msg void OnBnClickedCheckCombebanker();
  
};
////////////////////////////////////////////////////////////////////////////////////////////
class CDlgCustomAndroid : public CDialog
{
    //配置结构
public:
    tagCustomAndroid					m_CustomAndroid;						//自定配置

    //函数定义
public:
    //构造函数
    CDlgCustomAndroid();
    //析构函数
    virtual ~CDlgCustomAndroid();

    //重载函数
protected:
    //控件绑定
    virtual VOID DoDataExchange(CDataExchange * pDX);
    //初始化函数
    virtual BOOL OnInitDialog();

public:
    //激活坐庄相关
    void EnableBankerFun(BOOL bEnable);
  
};

////////////////////////////////////////////////////////////////////////////////////////////
class CDlgCustomRule : public CDialog
{
    //控件变量
public:
    CDlgCustomGeneral				m_DlgCustomGeneral;					//通用配置
    CDlgCustomAndroid				m_DlgCustomAndroid;					//机器配置

    //配置变量
protected:
    WORD							m_wCustomSize;						//配置大小
    LPBYTE							m_pcbCustomRule;					//配置缓冲

    //配置结构
protected:
    tagCustomConfig					m_CustomConfig;						//自定配置

    //函数定义
public:
    //构造函数
    CDlgCustomRule();
    //析构函数
    virtual ~CDlgCustomRule();

    //重载函数
protected:
    //控件绑定
    virtual VOID DoDataExchange(CDataExchange * pDX);
    //初始化函数
    virtual BOOL OnInitDialog();
    //确定函数
    virtual VOID OnOK();
    //取消消息
    virtual VOID OnCancel();
    //更新数据
    BOOL UpdateConfigData(BOOL bSaveAndValidate);

    //功能函数
public:
    //设置配置
    bool SetCustomRule(LPBYTE pcbCustomRule, WORD wCustomSize);
    //保存数据
    bool SaveCustomRule(LPBYTE pcbCustomRule, WORD wCustomSize);
    //默认数据
    bool DefaultCustomRule(LPBYTE pcbCustomRule, WORD wCustomSize, EM_DEFAULT_CUSTOM_RULE emCurRule);
    //删除机器人配置选项
    void DeleteAndroid();
    //激活坐庄相关
    void EnableBankerFun(BOOL bEnable);
    afx_msg void OnTcnSelchangeTab(NMHDR *pNMHDR, LRESULT *pResult);

    DECLARE_MESSAGE_MAP()
};
////////////////////////////////////////////////////////////////////////////////////////////