#pragma once

//游戏控制基类
class IClientControlDlg : public CDialog 
{
public:
	CUserBetArray					m_UserBetArray;					//用户下注
public:
	IClientControlDlg(UINT UID, CWnd* pParent) : CDialog(UID, pParent){}
	virtual ~IClientControlDlg(void){}

public:
	//更新控制
	virtual void  OnAllowControl(bool bEnable) = NULL;
	//申请结果
	virtual bool  ReqResult(const void * pBuffer) = NULL;
	//更新下注
	virtual void __cdecl UpdateUserBet(bool bReSet) = NULL;
	//更新库存
	virtual bool __cdecl UpdateStorage(const void * pBuffer) = NULL;
	//控制输赢
	virtual bool __cdecl UpdateControlWin(const void * pBuffer) = NULL;
	//更新控件
	virtual void __cdecl UpdateControl() = NULL;
};
