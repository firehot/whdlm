#pragma once
#include "../游戏客户端/ClientControl.h"
#include "stdafx.h"

#define CONTROL_AREA		3
// CClientControlItemSinkDlg 对话框

#define IDM_ADMIN_COMMDN WM_USER+1000

class AFX_EXT_CLASS CClientControlItemSinkDlg : public IClientControlDlg
{
	DECLARE_DYNAMIC(CClientControlItemSinkDlg)

protected:
	BYTE m_cbControlStyle;
	BYTE m_cbExcuteTimes;

	bool m_bWinArea[CONTROL_AREA];
	CString m_strCaption;
	LONGLONG						m_lStorageStart;				//起始库存
	LONGLONG						m_lStorageDeduct;				//库存衰减
	LONGLONG						m_lStorageCurrent;				//当前库存
	LONGLONG						m_lStorageMax1;					//库存上限1
	LONGLONG						m_lStorageMul1;					//系统输分概率1
	LONGLONG						m_lStorageMax2;					//库存上限2
	LONGLONG						m_lStorageMul2;					//系统输分概率2
	BYTE							m_cbTotalCount;					//骰子总点数

	CListCtrl						m_listUserBet;					//列表控件
	LONGLONG						m_lQueryGameID;					//查询ID

public:
	CClientControlItemSinkDlg(CWnd* pParent = NULL);   // 标准构造函数
	virtual ~CClientControlItemSinkDlg();

// 对话框数据
	enum { IDD = IDD_DIALOG_ADMIN };

protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV 支持

	DECLARE_MESSAGE_MAP()

public:
	//更新控制
	virtual void  OnAllowControl(bool bEnable);
	//申请结果
	virtual bool  ReqResult(const void * pBuffer);
	//更新下注
	virtual void __cdecl UpdateUserBet(bool bReSet);
	//更新库存
	virtual bool __cdecl UpdateStorage(const void * pBuffer);	
	//控制输赢
	virtual bool __cdecl UpdateControlWin(const void * pBuffer);
	//更新控件
	virtual void __cdecl UpdateControl();

public:
	//重置界面
	void ReSetAdminWnd();

public:
	//显示状态
	void PrintCurStatus();
	void RequestUpdateStorage();

public:
	afx_msg void  OnReSet();
	afx_msg void  OnRefresh();
	afx_msg void  OnExcute();
	afx_msg void  OnFreshStorage();

public:
	virtual BOOL OnInitDialog();
	
	afx_msg void OnBnClickedControl();
	afx_msg void OnEnSetfocusEditUserId();
	afx_msg void OnBnClickedBtnUserBetQuery();
	afx_msg void OnBnClickedBtnUserBetAll();
	afx_msg void OnBnClickedSureWinlose();
	afx_msg void OnNMClickListUserBet(NMHDR *pNMHDR, LRESULT *pResult);
	afx_msg HBRUSH OnCtlColor(CDC* pDC, CWnd* pWnd, UINT nCtlColor);
	afx_msg void OnEnUpdateEditUserId();
};
