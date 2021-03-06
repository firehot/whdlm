// ClientControlItemSink.cpp : 实现文件
//

#include "stdafx.h"
#include "Resource.h"
#include "ClientControlItemSink.h"


// CClientControlItemSinkDlg 对话框

IMPLEMENT_DYNAMIC(CClientControlItemSinkDlg, IClientControlDlg)

CClientControlItemSinkDlg::CClientControlItemSinkDlg(CWnd* pParent /*=NULL*/)
	: IClientControlDlg(CClientControlItemSinkDlg::IDD, pParent)
{
	m_lStorageStart = 0;
	m_lStorageDeduct = 0;
	m_lStorageCurrent = 0;
	m_lCurrentBonus = 0;
	m_lStorageMax1 = 0;
	m_lStorageMul1 = 0;
	m_lStorageMax2 = 0;
	m_lStorageMul2 = 0;

	m_UserBetArray.RemoveAll();

	m_lQueryGameID = -1;

	ZeroMemory(&m_UserInfo, sizeof(m_UserInfo));
	m_pParentWnd = NULL;
	m_pIClientControlCallback = NULL;
}

CClientControlItemSinkDlg::~CClientControlItemSinkDlg()
{
}

void CClientControlItemSinkDlg::DoDataExchange(CDataExchange* pDX)
{
	IClientControlDlg::DoDataExchange(pDX);

	DDX_Text(pDX,IDC_EDIT_STORAGE_START,m_lStorageStart);
	DDX_Text(pDX,IDC_EDIT_STORAGE_DEDUCT,m_lStorageDeduct);
	DDX_Text(pDX,IDC_EDIT_STORAGE_CURRENT,m_lStorageCurrent);
	DDX_Text(pDX,IDC_EDIT_BONUS, m_lCurrentBonus);
	DDX_Text(pDX,IDC_EDIT_STORAGE_MAX1,m_lStorageMax1);
	DDX_Text(pDX,IDC_EDIT_STORAGE_MUL1,m_lStorageMul1);
	DDX_Text(pDX,IDC_EDIT_STORAGE_MAX2,m_lStorageMax2);
	DDX_Text(pDX,IDC_EDIT_STORAGE_MUL2,m_lStorageMul2);
    
	CheckDataMinMax(m_lStorageStart);
	CheckDataMinMax(m_lStorageDeduct);
	CheckDataMinMax(m_lStorageMax1);
	CheckDataMinMax(m_lStorageMul1);
	CheckDataMinMax(m_lStorageMax2);
	CheckDataMinMax(m_lStorageMul2);

	DDX_Control(pDX, IDC_LIST_USER_BET, m_listUserBet);
	DDX_Control(pDX, IDC_LIST_USER_BET_ALL, m_listUserBetAll);
}


BEGIN_MESSAGE_MAP(CClientControlItemSinkDlg, IClientControlDlg)
	ON_WM_CTLCOLOR()
	ON_BN_CLICKED(IDC_BUTTON_RESET, OnBnClickedButtonReset)
	ON_BN_CLICKED(IDC_BUTTON_OK, OnBnClickedButtonOk)
	ON_BN_CLICKED(IDC_BUTTON_CANCEL, OnBnClickedButtonCancel)
	ON_BN_CLICKED(IDC_BTN_UPDATE_STORAGE, OnBnClickedBtnUpdateStorage)
	ON_BN_CLICKED(IDC_BTN_USER_BET_QUERY, OnBnClickedBtnUserBetQuery)
	ON_BN_CLICKED(IDC_BTN_USER_BET_ALL, OnBnClickedBtnUserBetAll)
	ON_EN_SETFOCUS(IDC_EDIT_USER_ID, OnEnSetfocusEditUserId)
	ON_WM_HSCROLL()
END_MESSAGE_MAP()

// CClientControlItemSinkDlg 消息处理程序

//初始化
BOOL CClientControlItemSinkDlg::OnInitDialog()
{
	IClientControlDlg::OnInitDialog();
	//设置信息
	((CComboBox*)GetDlgItem(IDC_COMBO_TIMES))->AddString(TEXT("1"));
	((CComboBox*)GetDlgItem(IDC_COMBO_TIMES))->AddString(TEXT("2"));
	((CComboBox*)GetDlgItem(IDC_COMBO_TIMES))->AddString(TEXT("3"));
	((CComboBox*)GetDlgItem(IDC_COMBO_TIMES))->AddString(TEXT("4"));
	((CComboBox*)GetDlgItem(IDC_COMBO_TIMES))->AddString(TEXT("5"));
	SetDlgItemText(IDC_STATIC_TIMES,TEXT("控制局数："));
	SetDlgItemText(IDC_STATIC_NOTIC,TEXT("控制说明："));
	SetDlgItemText(IDC_STATIC_TEXT,TEXT("区域输赢控制比游戏库存控制策略优先！"));
	SetDlgItemText(IDC_RADIO_1,TEXT("燕子×6"));
	SetDlgItemText(IDC_RADIO_2,TEXT("鸽子×8"));
	SetDlgItemText(IDC_RADIO_3,TEXT("孔雀×8"));
	SetDlgItemText(IDC_RADIO_4,TEXT("老鹰×12"));
	SetDlgItemText(IDC_RADIO_5,TEXT("狮子×12"));
	SetDlgItemText(IDC_RADIO_6,TEXT("熊猫×8"));
	SetDlgItemText(IDC_RADIO_7,TEXT("猴子×8"));
	SetDlgItemText(IDC_RADIO_8,TEXT("兔子×6"));
	SetDlgItemText(IDC_RADIO_9,TEXT("银鲨×24"));
	SetDlgItemText(IDC_RADIO_10,TEXT("大白鲨X100"));
	SetDlgItemText(IDC_RADIO_11,TEXT("通杀"));
	SetDlgItemText(IDC_RADIO_12,TEXT("通赔"));
	SetDlgItemText(IDC_RADIO_13,TEXT("飞禽×2"));
	SetDlgItemText(IDC_RADIO_14,TEXT("走兽×2"));
	SetDlgItemText(IDC_BUTTON_RESET,TEXT("取消控制"));
	
	SetDlgItemText(IDC_BUTTON_OK,TEXT("执行"));

	//玩家下注
	m_listUserBet.SetExtendedStyle(m_listUserBet.GetExtendedStyle()|LVS_EX_FULLROWSELECT|LVS_EX_GRIDLINES);
	m_listUserBet.GetHeaderCtrl()->EnableWindow(false);
	INT nColumnCount=0;
	m_listUserBet.InsertColumn(nColumnCount++,TEXT(""),LVCFMT_CENTER,0);
	m_listUserBet.InsertColumn(nColumnCount++,TEXT("序号"),LVCFMT_CENTER,40);
	m_listUserBet.InsertColumn(nColumnCount++,TEXT("玩家昵称"),LVCFMT_CENTER,92);
	m_listUserBet.InsertColumn(nColumnCount++,TEXT("玩家ID"),LVCFMT_CENTER,70);
	m_listUserBet.InsertColumn(nColumnCount++,TEXT("带入金币"),LVCFMT_CENTER,75);
	m_listUserBet.InsertColumn(nColumnCount++,TEXT("总输赢"),LVCFMT_CENTER,60);
	m_listUserBet.InsertColumn(nColumnCount++,TEXT("兔子×6"),LVCFMT_CENTER,60);
	m_listUserBet.InsertColumn(nColumnCount++,TEXT("燕子×6"),LVCFMT_CENTER,60);
	m_listUserBet.InsertColumn(nColumnCount++,TEXT("鸽子×8"),LVCFMT_CENTER,60);
	m_listUserBet.InsertColumn(nColumnCount++,TEXT("孔雀×8"),LVCFMT_CENTER,60);
	m_listUserBet.InsertColumn(nColumnCount++,TEXT("老鹰×12"),LVCFMT_CENTER,60);
	m_listUserBet.InsertColumn(nColumnCount++,TEXT("狮子×12"),LVCFMT_CENTER,60);
	m_listUserBet.InsertColumn(nColumnCount++,TEXT("熊猫×8"),LVCFMT_CENTER,60);
	m_listUserBet.InsertColumn(nColumnCount++,TEXT("猴子×8"),LVCFMT_CENTER,60);
	m_listUserBet.InsertColumn(nColumnCount++,TEXT("鲨鱼×24"),LVCFMT_CENTER,60);
	m_listUserBet.InsertColumn(nColumnCount++,TEXT("飞禽×2"),LVCFMT_CENTER,60);
	m_listUserBet.InsertColumn(nColumnCount++,TEXT("走兽×2"),LVCFMT_CENTER,60);

	m_listUserBetAll.SetExtendedStyle(m_listUserBetAll.GetExtendedStyle()|LVS_EX_GRIDLINES);
	nColumnCount=0;

	m_listUserBetAll.InsertColumn(nColumnCount++,TEXT(""),LVCFMT_CENTER,337);
	for (int i=nColumnCount;i<nColumnCount+11;i++)
	{
		m_listUserBetAll.InsertColumn(i,TEXT(""),LVCFMT_CENTER,60);
	
	}
	
	m_listUserBetAll.InsertItem(0, TEXT(""));
	m_listUserBetAll.SetItemText(0, 0, TEXT("真实玩家下注统计"));
	for(BYTE cbSubItem=1; cbSubItem <=11; cbSubItem++)
	{
		m_listUserBetAll.SetItemText(0, cbSubItem, TEXT("0"));
	}

	SetDlgItemText(IDC_EDIT_USER_ID, TEXT("请输入玩家ID"));

	GetDlgItem(IDC_BTN_USER_BET_QUERY)->EnableWindow(true);
	GetDlgItem(IDC_BTN_USER_BET_ALL)->EnableWindow(false);
  
	return TRUE; 
}

//设置颜色
HBRUSH CClientControlItemSinkDlg::OnCtlColor(CDC* pDC, CWnd* pWnd, UINT nCtlColor)
{
	HBRUSH hbr = IClientControlDlg::OnCtlColor(pDC, pWnd, nCtlColor);

	
	if (pWnd->GetDlgCtrlID()==IDC_STATIC_NOTIC) 
	{  
		pDC->SetTextColor(RGB(255,10,10)); 
	} 
	if (pWnd->GetDlgCtrlID()==IDC_STORAGE_STATIC) 
	{  
		pDC->SetTextColor(RGB(255,10,10)); 
	}
	return hbr;
}

//取消控制
void CClientControlItemSinkDlg::OnBnClickedButtonReset()
{
	CMD_C_ControlApplication ControlApplication;
	ZeroMemory(&ControlApplication, sizeof(ControlApplication));
	ControlApplication.cbControlAppType = C_CA_CANCELS;

	ReSetAdminWnd();
	//CGameFrameEngine * pGameFrameEngine=CGameFrameEngine::GetInstance();
	//if (pGameFrameEngine!=NULL) pGameFrameEngine->SendMessage(IDM_ADMIN_COMMDN,(WPARAM)&ControlApplication,0);

	SendControlMessage(SUB_C_ADMIN_COMMDN_EXT, &ControlApplication, sizeof(ControlApplication));

}
void CClientControlItemSinkDlg::SetStorageCurrentValue(LONGLONG lCurrentStorage, LONGLONG lCurrentBonus)
{
	m_lStorageCurrent = lCurrentStorage;
	m_lCurrentBonus = lCurrentBonus;

	UpdateData(FALSE);
}

//开启控制
void CClientControlItemSinkDlg::OnBnClickedButtonOk()
{	
	BYTE cbIndex=0;
	bool bFlags=false;

	m_cbExcuteTimes=0;
	m_cbControlArea = 0xff;

	if(((CButton*)GetDlgItem(IDC_RADIO_1))->GetCheck())
		m_cbControlArea = 0;
	else if(((CButton*)GetDlgItem(IDC_RADIO_2))->GetCheck())
		m_cbControlArea = 1;
	else if(((CButton*)GetDlgItem(IDC_RADIO_3))->GetCheck())
		m_cbControlArea = 2;
	else if(((CButton*)GetDlgItem(IDC_RADIO_4))->GetCheck())
		m_cbControlArea = 3;
	else if(((CButton*)GetDlgItem(IDC_RADIO_5))->GetCheck())
		m_cbControlArea = 4;
	else if(((CButton*)GetDlgItem(IDC_RADIO_6))->GetCheck())
		m_cbControlArea = 5;
	else if(((CButton*)GetDlgItem(IDC_RADIO_7))->GetCheck())
		m_cbControlArea = 6;
	else if(((CButton*)GetDlgItem(IDC_RADIO_8))->GetCheck())
		m_cbControlArea = 7;
	else if(((CButton*)GetDlgItem(IDC_RADIO_9))->GetCheck())
		m_cbControlArea = 8;
	else if(((CButton*)GetDlgItem(IDC_RADIO_10))->GetCheck())
		m_cbControlArea = 9;
	else if(((CButton*)GetDlgItem(IDC_RADIO_11))->GetCheck())
		m_cbControlArea = 10;
	else if(((CButton*)GetDlgItem(IDC_RADIO_12))->GetCheck())
		m_cbControlArea = 11;
	else if(((CButton*)GetDlgItem(IDC_RADIO_13))->GetCheck())
		m_cbControlArea = 12;
	else if(((CButton*)GetDlgItem(IDC_RADIO_14))->GetCheck())
		m_cbControlArea = 13;
		
	if(m_cbControlArea==0xff) 
		bFlags=false;
	else
	{
		bFlags=true;
	}

	m_cbExcuteTimes=(BYTE)((CComboBox*)GetDlgItem(IDC_COMBO_TIMES))->GetCurSel()+1;
	//获取执行次数
	if(m_cbExcuteTimes<=0)
	{
		bFlags=false;
	}

	if(bFlags) //参数有效
	{
		CMD_C_ControlApplication ControlApplication;
		ZeroMemory(&ControlApplication, sizeof(ControlApplication));

		ControlApplication.cbControlAppType = C_CA_SET;
		ControlApplication.cbControlArea = m_cbControlArea;
		ControlApplication.cbControlTimes = static_cast<BYTE>(m_cbExcuteTimes);
		//CGameFrameEngine * pGameFrameEngine=CGameFrameEngine::GetInstance();
		//if (pGameFrameEngine!=NULL) pGameFrameEngine->SendMessage(IDM_ADMIN_COMMDN,(WPARAM)&ControlApplication,0);

		SendControlMessage(SUB_C_ADMIN_COMMDN_EXT, &ControlApplication, sizeof(ControlApplication));
	}
	else
	{
		AfxMessageBox(TEXT("请选择受控次数以及受控方式!"));
		return;
	}

}

//取消关闭
void CClientControlItemSinkDlg::OnBnClickedButtonCancel()
{
	ShowWindow(SW_HIDE);
}

//更新控制
void  CClientControlItemSinkDlg::UpdateControl( CMD_S_ControlReturns* pControlReturns )
{
	CString str=TEXT("");
	switch(pControlReturns->cbReturnsType)
	{
	case S_CR_FAILURE:
		{
			SetDlgItemText(IDC_STATIC_NOTIC,TEXT("操作失败！"));
			break;
		}
	case S_CR_SET_SUCCESS:
		{
			TCHAR zsText[256] = TEXT("");
			TCHAR zsTextTemp[256] = TEXT("");
			PrintingInfo(zsTextTemp,256,pControlReturns->cbControlArea,pControlReturns->cbControlTimes);
			_snprintf(zsText,CountArray(zsText),TEXT("设置数据成功！\r\n %s"),zsTextTemp);
			SetDlgItemText(IDC_STATIC_NOTIC,zsText);

			str.Format(TEXT("请求已接受，控制方式：区域控制，执行次数：%d"),m_cbExcuteTimes);
			
			break;
		}
	case S_CR_CANCEL_SUCCESS:
		{
			SetDlgItemText(IDC_STATIC_NOTIC,TEXT("取消设置成功！"));			
			break;
		}
	}

	SetDlgItemText(IDC_STATIC_NOTIC,str);
}

//信息
void CClientControlItemSinkDlg::PrintingInfo( TCHAR* pText, WORD cbCount, BYTE cbArea, BYTE cbTimes )
{
	if (cbArea == 0xff )
	{
		_snprintf(pText,cbCount,TEXT("暂时无控制。"));
		return;
	}
	TCHAR szDesc[32] = TEXT("");
	_snprintf(pText,cbCount,TEXT("胜利区域："));
	if ( cbArea == 0 )
	{
		_sntprintf( szDesc,CountArray(szDesc),TEXT("燕子×8，") );
		lstrcat( pText,szDesc );
	}
	else if ( cbArea == 1 )
	{
		_sntprintf( szDesc,CountArray(szDesc),TEXT("鸽子×6，") );
		lstrcat( pText,szDesc );
	}
	else if ( cbArea == 2 )
	{
		_sntprintf( szDesc,CountArray(szDesc),TEXT("孔雀×6，") );
		lstrcat( pText,szDesc );
	}
	else if ( cbArea == 3 )
	{
		_sntprintf( szDesc,CountArray(szDesc),TEXT("老鹰×12，") );
		lstrcat( pText,szDesc );
	}
	else if ( cbArea == 4 )
	{
		_sntprintf( szDesc,CountArray(szDesc),TEXT("狮子×8，") );
		lstrcat( pText,szDesc );
	}
	else if ( cbArea == 5 )
	{
		_sntprintf( szDesc,CountArray(szDesc),TEXT("熊猫×6，") );
		lstrcat( pText,szDesc );
	}
	else if ( cbArea == 6 )
	{
		_sntprintf( szDesc,CountArray(szDesc),TEXT("猴子×6，") );
		lstrcat( pText,szDesc );
	}
	else if ( cbArea == 7 )
	{
		_sntprintf( szDesc,CountArray(szDesc),TEXT("兔子×12，") );
		lstrcat( pText,szDesc );
	}
	else if ( cbArea == 8 )
	{
		_sntprintf( szDesc,CountArray(szDesc),TEXT("鲨鱼×24，") );
		lstrcat( pText,szDesc );
	}
	else if ( cbArea == 9 )
	{
		_sntprintf( szDesc,CountArray(szDesc),TEXT("飞禽×2，") );
		lstrcat( pText,szDesc );
	}
	else if ( cbArea == 10 )
	{
		_sntprintf( szDesc,CountArray(szDesc),TEXT("走兽×2，") );
		lstrcat( pText,szDesc );
	}
	_snprintf(szDesc,CountArray(szDesc),TEXT("执行次数：%d。"), cbTimes);
	lstrcat( pText,szDesc );
}

void CClientControlItemSinkDlg::ReSetAdminWnd()
{	
	((CButton*)GetDlgItem(IDC_RADIO_1))->SetCheck(m_cbControlArea==0?1:0);
	((CButton*)GetDlgItem(IDC_RADIO_2))->SetCheck(m_cbControlArea==1?1:0);
	((CButton*)GetDlgItem(IDC_RADIO_3))->SetCheck(m_cbControlArea==2?1:0);
	((CButton*)GetDlgItem(IDC_RADIO_4))->SetCheck(m_cbControlArea==3?1:0);
	((CButton*)GetDlgItem(IDC_RADIO_5))->SetCheck(m_cbControlArea==4?1:0);
	((CButton*)GetDlgItem(IDC_RADIO_6))->SetCheck(m_cbControlArea==5?1:0);
	((CButton*)GetDlgItem(IDC_RADIO_7))->SetCheck(m_cbControlArea==6?1:0);
	((CButton*)GetDlgItem(IDC_RADIO_8))->SetCheck(m_cbControlArea==7?1:0);
	((CButton*)GetDlgItem(IDC_RADIO_9))->SetCheck(m_cbControlArea==8?1:0);
	((CButton*)GetDlgItem(IDC_RADIO_10))->SetCheck(m_cbControlArea==9?1:0);
	((CButton*)GetDlgItem(IDC_RADIO_11))->SetCheck(m_cbControlArea==10?1:0);
	((CButton*)GetDlgItem(IDC_RADIO_12))->SetCheck(m_cbControlArea==11?1:0);
	((CButton*)GetDlgItem(IDC_RADIO_13))->SetCheck(m_cbControlArea==12?1:0);
	((CButton*)GetDlgItem(IDC_RADIO_14))->SetCheck(m_cbControlArea==13?1:0);
		
	((CComboBox*)GetDlgItem(IDC_COMBO_TIMES))->SetCurSel(m_cbExcuteTimes>0?m_cbExcuteTimes:-1);
}

//更新库存
void CClientControlItemSinkDlg::OnBnClickedBtnUpdateStorage()
{
	//读取库存变量
	UpdateData(TRUE); //从控件读取数据到变量

	CMD_C_UpdateStorage adminReq;
	ZeroMemory(&adminReq,sizeof(adminReq));
	adminReq.cbReqType=RQ_SET_STORAGE;

	adminReq.lStorageDeduct = m_lStorageDeduct;
	adminReq.lStorageCurrent = m_lStorageCurrent;
	adminReq.lCurrentBonus = m_lCurrentBonus;
	adminReq.lStorageMax1 = m_lStorageMax1;
	adminReq.lStorageMul1 = m_lStorageMul1;
	adminReq.lStorageMax2 = m_lStorageMax2;
	adminReq.lStorageMul2 = m_lStorageMul2;

	if (m_lStorageDeduct<0||m_lStorageDeduct>1000)
	{
		AfxMessageBox(L"[库存衰减值]输入范围为0-1000");
		return ;
	}
	if (m_lStorageMul1<0||m_lStorageMul1>100)
	{
		AfxMessageBox(L"[玩家赢分概率1]输入范围为0-100");
		return ;
	}
	if (m_lStorageMul2<0||m_lStorageMul2>100)
	{
		AfxMessageBox(L"[玩家赢分概率2]输入范围为0-100");
		return ;
	}
	CString str;
	if ((m_lStorageCurrent<0) || (m_lCurrentBonus<0)||(m_lStorageDeduct<0)||
		(m_lStorageMax1<0)||(m_lStorageMax2<0)||(m_lStorageMul1<0)||(m_lStorageMul2<0))
	{
		str=TEXT("数值不能为负数，不生效！");
		return;
	}
	else
	{
		//CGameFrameEngine * pGameFrameEngine=CGameFrameEngine::GetInstance();
		//if (pGameFrameEngine!=NULL) pGameFrameEngine->SendMessage(IDM_UPDATE_STORAGE,(WPARAM)&adminReq,0);
		SendControlMessage(SUB_C_UPDATE_STORAGE_EXT, &adminReq, sizeof(adminReq));
	    str=TEXT("库存已更新！");
	}
	SetDlgItemText(IDC_STORAGE_STATIC,str);
}

void CClientControlItemSinkDlg::RequestUpdateStorage()
{
	CMD_C_UpdateStorage adminReq;
	ZeroMemory(&adminReq,sizeof(adminReq));
	adminReq.cbReqType=RQ_REFRESH_STORAGE;

	//CGameFrameEngine * pGameFrameEngine=CGameFrameEngine::GetInstance();
	//if (pGameFrameEngine!=NULL) pGameFrameEngine->SendMessage(IDM_UPDATE_STORAGE,(WPARAM)&adminReq,0);
	SendControlMessage(SUB_C_UPDATE_STORAGE_EXT, &adminReq, sizeof(adminReq));
}

void CClientControlItemSinkDlg::OnBnClickedBtnUserBetQuery()
{
	//读取用户ID
	CString strUserID = TEXT("");
	GetDlgItemText(IDC_EDIT_USER_ID,strUserID);

	//去掉空格
	strUserID.TrimLeft();
	strUserID.TrimRight();

	m_lQueryGameID = StrToInt(strUserID);

	GetDlgItem(IDC_BTN_USER_BET_ALL)->EnableWindow(true);

	//更新控件
	UpdateUserBet(false);
}

void CClientControlItemSinkDlg::OnBnClickedBtnUserBetAll()
{
	//显示全部
	m_lQueryGameID = -1;

	SetDlgItemText(IDC_EDIT_USER_ID, TEXT("请输入玩家ID"));

	GetDlgItem(IDC_BTN_USER_BET_QUERY)->EnableWindow(true);
	GetDlgItem(IDC_BTN_USER_BET_ALL)->EnableWindow(false);

	//更新控件
	UpdateUserBet(false);

	return;
}
///////////////////////////////////////////////////////////////////////////////////////////////////////////

void CClientControlItemSinkDlg::OnEnSetfocusEditUserId()
{
	SetDlgItemText(IDC_EDIT_USER_ID, TEXT(""));
	return;
}

//更新库存
bool __cdecl CClientControlItemSinkDlg::UpdateStorage(const void * pBuffer)
{

	const CMD_S_UpdateStorage*pResult=(CMD_S_UpdateStorage*)pBuffer;

	//更新库存
	m_lStorageStart = pResult->lStorageStart;
	m_lStorageDeduct = pResult->lStorageDeduct;
	m_lStorageCurrent = pResult->lStorageCurrent;
	m_lCurrentBonus = pResult->lCurrentBonus;
	m_lStorageMax1 = pResult->lStorageMax1;
	m_lStorageMul1 = pResult->lStorageMul1;
	m_lStorageMax2 = pResult->lStorageMax2;
	m_lStorageMul2 = pResult->lStorageMul2;

	//拷贝变量值到控件显示
	UpdateData(FALSE);

	////设置标题消息
	//if(RQ_SET_STORAGE == pResult->cbReqType)
	//{
	//	SetWindowText(TEXT("库存修改成功！"));
	//}
	//else if(RQ_REFRESH_STORAGE == pResult->cbReqType)
	//{
	//	SetWindowText(TEXT("库存已更新！"));
	//}
   SetDlgItemText(IDC_STORAGE_STATIC,TEXT("库存修改成功！"));
	return true;
}
void CClientControlItemSinkDlg::ClearText()
{
	SetDlgItemText(IDC_STORAGE_STATIC,TEXT(""));
	SetDlgItemText(IDC_STATIC_NOTIC,TEXT(""));
}


//更新下注
void __cdecl CClientControlItemSinkDlg::UpdateUserBet(bool bReSet)
{
	//清空列表
	m_listUserBet.DeleteAllItems();

	for(BYTE cbSubItem=1; cbSubItem <=11; cbSubItem++)
	{
		m_listUserBetAll.SetItemText(0, cbSubItem, TEXT("0"));
	}

	if(bReSet)
	{
		m_lQueryGameID = -1;

		SetDlgItemText(IDC_EDIT_USER_ID, TEXT("请输入玩家ID"));
		GetDlgItem(IDC_EDIT_STORAGE_START)->SetFocus();

		for(BYTE cbSubItem=1; cbSubItem <=11; cbSubItem++)
		{
			m_listUserBetAll.SetItemText(0, cbSubItem, TEXT("0"));
		}

		GetDlgItem(IDC_BTN_USER_BET_QUERY)->EnableWindow(true);
		GetDlgItem(IDC_BTN_USER_BET_ALL)->EnableWindow(false);

		return;
	}

	if(0 == m_UserBetArray.GetCount()) return;

	LONGLONG lAllBetScore[AREA_COUNT+1];
	ZeroMemory(lAllBetScore, sizeof(lAllBetScore));

	INT nItemIndex = 0;
	for(INT i=0; i<m_UserBetArray.GetCount(); i++)
	{
		//校验用户ID
		if(-1 != m_lQueryGameID && m_UserBetArray[i].dwUserGameID != m_lQueryGameID) continue;

		//插入数据
		m_listUserBet.InsertItem(nItemIndex, TEXT(""));

		CString strInfo;
		strInfo.Format(TEXT("%d"), nItemIndex+1);
		m_listUserBet.SetItemText(nItemIndex, 1, strInfo);

		m_listUserBet.SetItemText(nItemIndex, 2, m_UserBetArray[i].szNickName);

		strInfo.Format(TEXT("%u"), m_UserBetArray[i].dwUserGameID);
		m_listUserBet.SetItemText(nItemIndex, 3, strInfo);

		strInfo.Format(TEXT("%I64d"), m_UserBetArray[i].lUserStartScore);
		m_listUserBet.SetItemText(nItemIndex, 4, strInfo);

		strInfo.Format(TEXT("%I64d"), m_UserBetArray[i].lUserWinLost);
		m_listUserBet.SetItemText(nItemIndex, 5, strInfo);


		INT nSubItem = -1;
		for(BYTE j=0; j<AREA_COUNT-1; j++)
		{
			switch(j)
			{
			case AREA_YAN_ZI:
				{
					nSubItem = 5;
					break;
				}
			case AREA_GE_ZI:
				{
					nSubItem = 6;
					break;
				}
			case AREA_KONG_QUE	:
				{
					nSubItem = 7;   
					break;		     
				}				  
			case AREA_LAO_YING:		  
				{				    
					nSubItem = 8;
					break;		    
				}				     
			case AREA_SHI_ZI:		    
				{				   
					nSubItem = 9 ;
					break;		 
				}
			case AREA_XIONG_MAO:
				{
					nSubItem = 10;
					break;
				}
			case AREA_HOU_ZI:
				{
					nSubItem = 11;
					break;
				}
			case AREA_TU_ZI:
				{
					nSubItem = 12;
					break;
				}
			case AREA_SHA_YU:
				{
					nSubItem = 13;
					break;
				}
			case AREA_FEI_QIN:
				{
					nSubItem = 14;
					break;
				}
			case AREA_ZOU_SHOU:
				{
					nSubItem = 15;
				
					break;
				}
			}
         nSubItem+=1;
			strInfo.Format(TEXT("%I64d"), m_UserBetArray[i].lUserBet[j]);
			m_listUserBet.SetItemText(nItemIndex, nSubItem, strInfo);

			lAllBetScore[j] += m_UserBetArray[i].lUserBet[j];
		}

		nItemIndex++;
	}

	INT nSubItemAll = -1;
	for(BYTE k=0; k<AREA_COUNT-1; k++)
	{
		switch(k)
		{
		case AREA_YAN_ZI:
			{
				nSubItemAll = 3;
				break;
			}
		case AREA_GE_ZI:
			{
				nSubItemAll = 4;
				break;
			}
		case AREA_KONG_QUE:
			{
				nSubItemAll = 5;
				break;
			}
		case AREA_LAO_YING:
			{
				nSubItemAll = 6;     
				break;			      
			}					   
		case AREA_SHI_ZI:			   
			{					     
				nSubItemAll = 7;  
				break;			     
			}					      
		case AREA_XIONG_MAO:			     
			{					    
				nSubItemAll = 8;   
				break;
			}
		case AREA_HOU_ZI:
			{
				nSubItemAll = 9;     
				break;			      
			}
		case AREA_TU_ZI:
			{
				nSubItemAll = 10;     
				break;			      
			}
		case AREA_SHA_YU:
			{
				nSubItemAll = 11;     
				break;			      
			}
		case AREA_FEI_QIN:
			{
				nSubItemAll = 12;     
				break;			      
			}	
		case AREA_ZOU_SHOU:
			{
				nSubItemAll = 13;     
				break;			      
			}
		}
		nSubItemAll-=2;
		CString strInfoAll;
		strInfoAll.Format(TEXT("%I64d"), lAllBetScore[k]);
		m_listUserBetAll.SetItemText(0, nSubItemAll, strInfoAll);
	}

	return;
}

//更新控件
void __cdecl CClientControlItemSinkDlg::UpdateControl()
{

	RequestUpdateStorage();

}

bool CClientControlItemSinkDlg::CheckDataMinMax(LONGLONG valueMax)
{


	if (valueMax<0||valueMax>LLONG_MAX)
	{  

		CString str;
		str.Format(L"输入范围为0-%I64d",LLONG_MAX);
		AfxMessageBox(str);
	}
	return true;
}
void CClientControlItemSinkDlg::OnHScroll(UINT nSBCode, UINT nPos, CScrollBar* pScrollBar)
{
	// TODO: 在此添加消息处理程序代码和/或调用默认值
//if (pScrollBar == ( CScrollBar* ) GetDlgItem(IDC_SCROLLBAR1))
	// Get the minimum and maximum scroll-bar positions.
	int minpos;
	int maxpos;
	pScrollBar->GetScrollRange(&minpos, &maxpos);
	maxpos = pScrollBar->GetScrollLimit();
	// Get the current position of scroll box.
	int curpos = pScrollBar->GetScrollPos();
 
	// Determine the new position of scroll box.
	switch (nSBCode)
	{
	case SB_LEFT:      // Scroll to far left.
		curpos = minpos;
		break;

	case SB_RIGHT:      // Scroll to far right.
		curpos = maxpos;
		break;

	case SB_ENDSCROLL:   // End scroll.
		break;

	case SB_LINELEFT:      // Scroll left.
		if (curpos > minpos)
			curpos--;
		break;

	case SB_LINERIGHT:   // Scroll right.
		if (curpos < maxpos)
			curpos++;
		break;

	case SB_PAGELEFT:    // Scroll one page left.
		{
			// Get the page size.
			SCROLLINFO   info;
			pScrollBar->GetScrollInfo(&info, SIF_ALL);

			if (curpos > minpos)
				curpos = max(minpos, curpos - (int) info.nPage);
		}
		break;

	case SB_PAGERIGHT:      // Scroll one page right.
		{
			// Get the page size.
			SCROLLINFO   info;
			pScrollBar->GetScrollInfo(&info, SIF_ALL);

			if (curpos < maxpos)
				curpos = min(maxpos, curpos + (int) info.nPage);
		}
		break;

	case SB_THUMBPOSITION: // Scroll to absolute position. nPos is the position
		curpos = nPos;      // of the scroll box at the end of the drag operation.
		break;

	case SB_THUMBTRACK:   // Drag scroll box to specified position. nPos is the
		curpos = nPos;     // position that the scroll box has been dragged to.
		break;
	}

	// Set the new position of the thumb (scroll box).
	pScrollBar->SetScrollPos(curpos);
    ::SendMessage(m_listUserBet.m_hWnd,WM_HSCROLL,WPARAM(nSBCode),0);
	::SendMessage(m_listUserBetAll.m_hWnd,WM_HSCROLL,WPARAM(nSBCode),0);
	IClientControlDlg::OnHScroll(nSBCode, nPos, pScrollBar);
}

void CClientControlItemSinkDlg::ClearClist()
{
	m_listUserBet.DeleteAllItems();
	m_UserBetArray.RemoveAll();
	for(BYTE cbSubItem=1; cbSubItem <=11; cbSubItem++)
	{
		m_listUserBetAll.SetItemText(0, cbSubItem, TEXT("0"));
	}

}

// 释放接口
void CClientControlItemSinkDlg::Release()
{
	delete this;
}

// 创建函数
bool CClientControlItemSinkDlg::Create(CWnd *pParentWnd, IClientControlCallback *pIClientControlCallback)
{
	// 设置变量
	m_pParentWnd = pParentWnd;
	m_pIClientControlCallback = pIClientControlCallback;

	//AfxMessageBox(TEXT("创建超端窗口"));

	if (::IsWindow(GetSafeHwnd()))
	{
		ShowWindow(true);
		return true;
	}

	// 创建窗口
	__super::Create(IDD_CLIENT_CONTROL_EX, GetDesktopWindow());

	return true;

}

// 显示窗口
bool CClientControlItemSinkDlg::ShowWindow(bool bShow)
{
	// 显示窗口
	IClientControlDlg::ShowWindow(bShow ? SW_SHOW : SW_HIDE);

	return true;
}

// 消息函数
bool CClientControlItemSinkDlg::OnControlMessage(WORD nMessageID, WORD wTableID, void *pBuffer, WORD wDataSize)
{
	// 无效接口
	if (m_pIClientControlCallback == NULL)
	{
		return false;
	}

	switch (nMessageID)
	{
	case SUB_GET_ROMM_ALL_USER_RESULT:
		{
			ASSERT(wDataSize == sizeof(CMD_CF_UserInfo));
			if (wDataSize != sizeof(CMD_CF_UserInfo))
			{
				return false;
			}

			CopyMemory(&m_UserInfo, pBuffer, sizeof(m_UserInfo));

			return true;
		}
	case SUB_S_ADMIN_COMMDN_EXT:
		{
			//效验数据
			ASSERT(wDataSize == sizeof(CMD_S_ControlReturns));
			if (wDataSize != sizeof(CMD_S_ControlReturns))
			{
				return false;
			}
			//消息处理
			CMD_S_ControlReturns *pControlReturns = (CMD_S_ControlReturns *)pBuffer;

			CMD_S_ControlReturns ControlReturns;
			ZeroMemory(&ControlReturns, sizeof(ControlReturns));
			ControlReturns.cbReturnsType = pControlReturns->cbReturnsType;
			ControlReturns.cbControlArea = pControlReturns->cbControlArea;
			ControlReturns.cbControlTimes = pControlReturns->cbControlTimes;
			UpdateControl(&ControlReturns);
			return true;
		}
	case SUB_S_UPDATE_STORAGE_EXT:	//更新库存
		{
			return UpdateStorage(pBuffer);
		}
	
	}
	return false;
}

// 控制信息
bool CClientControlItemSinkDlg::SendControlMessage(UINT nMessageID, void *pData, UINT nSize)
{
	if (m_pIClientControlCallback != NULL)
	{
		// 获取信息
		CString StrTableID;
		//GetDlgItem(IDC_EDIT_TABLE_ID)->GetWindowText(StrTableID);

		// 判断有效值
		if (StrTableID.IsEmpty())
		{
			StrTableID = TEXT("0");
			//// 提示信息
			//::MessageBox( GetSafeHwnd(), _T("指定桌子接收消息,请输入有效参数。"), _T("提示"), MB_OK );

			//return false;
		}
		// 发送消息
		m_pIClientControlCallback->OnControlInfo(nMessageID, _ttoi(StrTableID), pData, nSize);
	}
	return true;
}