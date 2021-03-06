 #ifndef APPLY_USER_LIST_HEAD_FILE
#define APPLY_USER_LIST_HEAD_FILE

#pragma once

#include "Stdafx.h"

#include "CMyListCtrl.h"

#include "../游戏服务器/GameLogic.h"

#define  WM_VIEWLBTUP WM_USER+1


//////////////////////////////////////////////////////////////////////////

//
struct tagApplyUser
{
	//玩家信息
	CString							strUserName;						//玩家帐号
	SCORE						lUserScore;							//玩家金币
};


//////////////////////////////////////////////////////////////////////////

//游戏记录
class CApplyUser : public CDialog
{
	//控件变量
public:
	CMyListCtrl					m_AppyUserList;					//游戏列表
	HWND						m_viewHandle;

	CRect						m_OrtRect;


	//函数定义
public:
	//构造函数
	CApplyUser();

	void MySetRect(CRect aRect);
	//析构函数
	virtual ~CApplyUser();

	//重载函数
protected:
	//控件绑定
	virtual void DoDataExchange(CDataExchange * pDX);
	//初始化函数
	virtual BOOL OnInitDialog();
	//确定消息
	virtual void OnOK() { return; }
	//取消消息
	virtual void OnCancel() { return; }

	//功能函数
public:
	//插入列表
	void InserUser(tagApplyUser & ApplyUser);
	//删除列表
	void DeleteUser(tagApplyUser & ApplyUser);
	//更新列表
	void UpdateUser( tagApplyUser & ApplyUser );

	int  GetItemCount();

	//查找玩家
	bool CApplyUser::FindUser(LPCTSTR lpszUserName);
	//清空列表
	void ClearAll();
   //listctrlUp消息
	LRESULT OnLBtUp(WPARAM wParam,LPARAM lParam);

	//消息映射
protected:
	//位置变化
	afx_msg void OnSize(UINT nType, int cx, int cy);

	DECLARE_MESSAGE_MAP()
};

//////////////////////////////////////////////////////////////////////////

#endif
