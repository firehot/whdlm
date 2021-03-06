#include "Stdafx.h"
#include "Resource.h"
#include "DlgCustomRule.h"

//////////////////////////////////////////////////////////////////////////////////

BEGIN_MESSAGE_MAP(CDlgCustomRule, CDialog)
END_MESSAGE_MAP()

//////////////////////////////////////////////////////////////////////////////////

//构造函数
CDlgCustomRule::CDlgCustomRule() : CDialog(IDD_CUSTOM_RULE)
{
	//设置变量
	ZeroMemory(&m_CustomRule,sizeof(m_CustomRule));

	m_CustomRule.lRoomStorageStart = 100000;
	m_CustomRule.lRoomStorageDeduct = 0;
	m_CustomRule.lRoomStorageMax1 = 1000000;
	m_CustomRule.lRoomStorageMul1 = 50;
	m_CustomRule.lRoomStorageMax2 = 5000000;
	m_CustomRule.lRoomStorageMul2 = 80;

	//AI存款取款
	m_CustomRule.lRobotScoreMin = 100000;
	m_CustomRule.lRobotScoreMax = 1000000;
	m_CustomRule.lRobotBankGet = 1000000;
	m_CustomRule.lRobotBankGetBanker = 10000000;
	m_CustomRule.lRobotBankStoMul = 10;
    
	m_CustomRule.nButtonValue1[0] = 2;
	m_CustomRule.nButtonValue1[1] = 5;
	m_CustomRule.nButtonValue1[2] = 8;
	m_CustomRule.nButtonValue1[3] = 10;

	m_CustomRule.nButtonValue2[0] = 4;
	m_CustomRule.nButtonValue2[1] = 8;
	m_CustomRule.nButtonValue2[2] = 10;
	m_CustomRule.nButtonValue2[3] = 15;

	m_CustomRule.nButtonValue3[0] = 5;
	m_CustomRule.nButtonValue3[1] = 10;
	m_CustomRule.nButtonValue3[2] = 15;
	m_CustomRule.nButtonValue3[3] = 20;

	m_CustomRule.nMinAllinTurnCount = 3;
	return;
}

//析构函数
CDlgCustomRule::~CDlgCustomRule()
{
}

//配置函数
BOOL CDlgCustomRule::OnInitDialog()
{
	__super::OnInitDialog();
	
	//设置控件
	((CEdit *)GetDlgItem(IDC_EDIT_ROOMSTORAGE_START))->LimitText(9);
	((CEdit *)GetDlgItem(IDC_EDIT_ROOMSTORAGE_DEDUCT))->LimitText(3);
	((CEdit *)GetDlgItem(IDC_EDIT_ROOMSTORAGE_MAX1))->LimitText(9);
	((CEdit *)GetDlgItem(IDC_EDIT_ROOMSTORAGE_MUL1))->LimitText(2);
	((CEdit *)GetDlgItem(IDC_EDIT_ROOMSTORAGE_MAX2))->LimitText(9);
	((CEdit *)GetDlgItem(IDC_EDIT_ROOMSTORAGE_MUL2))->LimitText(2);

	((CEdit *)GetDlgItem(IDC_ROBOT_SCOREMIN))->LimitText(9);
	((CEdit *)GetDlgItem(IDC_ROBOT_BANKERGETBANKER))->LimitText(9);
	((CEdit *)GetDlgItem(IDC_ROBOT_SCOREMAX))->LimitText(9);
	((CEdit *)GetDlgItem(IDC_ROBOT_BANKGET))->LimitText(9);
	((CEdit *)GetDlgItem(IDC_ROBOT_STOMUL))->LimitText(2);

	//更新参数
	FillDataToDebug();

	return FALSE;
}

//确定函数
VOID CDlgCustomRule::OnOK() 
{ 
	//投递消息
	GetParent()->PostMessage(WM_COMMAND,MAKELONG(IDOK,0),0);

	return;
}

//取消消息
VOID CDlgCustomRule::OnCancel() 
{ 
	//投递消息
	GetParent()->PostMessage(WM_COMMAND,MAKELONG(IDCANCEL,0),0);

	return;
}

//更新控件
bool CDlgCustomRule::FillDataToDebug()
{
	//设置数据
	SetDlgItemInt(IDC_EDIT_ROOMSTORAGE_START, m_CustomRule.lRoomStorageStart);
	SetDlgItemInt(IDC_EDIT_ROOMSTORAGE_DEDUCT, m_CustomRule.lRoomStorageDeduct);
	SetDlgItemInt(IDC_EDIT_ROOMSTORAGE_MAX1, m_CustomRule.lRoomStorageMax1);
	SetDlgItemInt(IDC_EDIT_ROOMSTORAGE_MUL1, m_CustomRule.lRoomStorageMul1);
	SetDlgItemInt(IDC_EDIT_ROOMSTORAGE_MAX2, m_CustomRule.lRoomStorageMax2);
	SetDlgItemInt(IDC_EDIT_ROOMSTORAGE_MUL2, m_CustomRule.lRoomStorageMul2);

	//AI调试
	SetDlgItemInt(IDC_ROBOT_SCOREMIN, m_CustomRule.lRobotScoreMin);
	SetDlgItemInt(IDC_ROBOT_SCOREMAX, m_CustomRule.lRobotScoreMax);
	SetDlgItemInt(IDC_ROBOT_BANKERGETBANKER, m_CustomRule.lRobotBankGetBanker);
	SetDlgItemInt(IDC_ROBOT_BANKGET, m_CustomRule.lRobotBankGet);
	SetDlgItemInt(IDC_ROBOT_STOMUL, m_CustomRule.lRobotBankStoMul);

	SetDlgItemInt(IDC_ADD_11, m_CustomRule.nButtonValue1[0]);
	SetDlgItemInt(IDC_ADD_12, m_CustomRule.nButtonValue1[1]);
	SetDlgItemInt(IDC_ADD_13, m_CustomRule.nButtonValue1[2]);
	SetDlgItemInt(IDC_ADD_14, m_CustomRule.nButtonValue1[3]);

	SetDlgItemInt(IDC_ADD_21, m_CustomRule.nButtonValue2[0]);
	SetDlgItemInt(IDC_ADD_22, m_CustomRule.nButtonValue2[1]);
	SetDlgItemInt(IDC_ADD_23, m_CustomRule.nButtonValue2[2]);
	SetDlgItemInt(IDC_ADD_24, m_CustomRule.nButtonValue2[3]);

	SetDlgItemInt(IDC_ADD_31, m_CustomRule.nButtonValue3[0]);
	SetDlgItemInt(IDC_ADD_32, m_CustomRule.nButtonValue3[1]);
	SetDlgItemInt(IDC_ADD_33, m_CustomRule.nButtonValue3[2]);
	SetDlgItemInt(IDC_ADD_34, m_CustomRule.nButtonValue3[3]);

	SetDlgItemInt(IDC_MIN_ALLIN, m_CustomRule.nMinAllinTurnCount);
	return true;
}

//更新数据
bool CDlgCustomRule::FillDebugToData()
{
	//设置数据
	m_CustomRule.lRoomStorageStart = (SCORE)GetDlgItemInt(IDC_EDIT_ROOMSTORAGE_START);
	m_CustomRule.lRoomStorageDeduct = (SCORE)GetDlgItemInt(IDC_EDIT_ROOMSTORAGE_DEDUCT);
	m_CustomRule.lRoomStorageMax1 = (SCORE)GetDlgItemInt(IDC_EDIT_ROOMSTORAGE_MAX1);
	m_CustomRule.lRoomStorageMul1 = (SCORE)GetDlgItemInt(IDC_EDIT_ROOMSTORAGE_MUL1);
	m_CustomRule.lRoomStorageMax2 = (SCORE)GetDlgItemInt(IDC_EDIT_ROOMSTORAGE_MAX2);
	m_CustomRule.lRoomStorageMul2 = (SCORE)GetDlgItemInt(IDC_EDIT_ROOMSTORAGE_MUL2);

	//AI调试
	m_CustomRule.lRobotScoreMin = (SCORE)GetDlgItemInt(IDC_ROBOT_SCOREMIN);
	m_CustomRule.lRobotScoreMax = (SCORE)GetDlgItemInt(IDC_ROBOT_SCOREMAX);
	m_CustomRule.lRobotBankGetBanker = (SCORE)GetDlgItemInt(IDC_ROBOT_BANKERGETBANKER);
	m_CustomRule.lRobotBankGet = (SCORE)GetDlgItemInt(IDC_ROBOT_BANKGET);
	m_CustomRule.lRobotBankStoMul = (SCORE)GetDlgItemInt(IDC_ROBOT_STOMUL);

	m_CustomRule.nButtonValue1[0] = GetDlgItemInt(IDC_ADD_11);
	m_CustomRule.nButtonValue1[1] = GetDlgItemInt(IDC_ADD_12);
	m_CustomRule.nButtonValue1[2] = GetDlgItemInt(IDC_ADD_13);
	m_CustomRule.nButtonValue1[3] = GetDlgItemInt(IDC_ADD_14);

	m_CustomRule.nButtonValue2[0] = GetDlgItemInt(IDC_ADD_21);
	m_CustomRule.nButtonValue2[1] = GetDlgItemInt(IDC_ADD_22);
	m_CustomRule.nButtonValue2[2] = GetDlgItemInt(IDC_ADD_23);
	m_CustomRule.nButtonValue2[3] = GetDlgItemInt(IDC_ADD_24);

	m_CustomRule.nButtonValue3[0] = GetDlgItemInt(IDC_ADD_31);
	m_CustomRule.nButtonValue3[1] = GetDlgItemInt(IDC_ADD_32);
	m_CustomRule.nButtonValue3[2] = GetDlgItemInt(IDC_ADD_33);
	m_CustomRule.nButtonValue3[3] = GetDlgItemInt(IDC_ADD_34);

	m_CustomRule.nMinAllinTurnCount = 3;// GetDlgItemInt(IDC_MIN_ALLIN);

	for (int i = 0; i < 3; i++)
	{
		if (m_CustomRule.nButtonValue1[i] >= m_CustomRule.nButtonValue1[i + 1] || m_CustomRule.nButtonValue2[i] >= m_CustomRule.nButtonValue2[i + 1] || m_CustomRule.nButtonValue3[i] >= m_CustomRule.nButtonValue3[i + 1])
		{
			AfxMessageBox(TEXT("加注额度应从小到大，请重新设置！"), MB_ICONSTOP);
			return false;
		}
	}
	//数据校验
	if ((m_CustomRule.lRoomStorageMax1 > m_CustomRule.lRoomStorageMax2))
	{
		AfxMessageBox(TEXT("库存封顶值1应小于库存封顶值2，请重新设置！"),MB_ICONSTOP);
		return false;
	}

	if ((m_CustomRule.lRoomStorageMul1 > m_CustomRule.lRoomStorageMul2))
	{
		AfxMessageBox(TEXT("赢分概率1应小于赢分概率2，请重新设置！"),MB_ICONSTOP);
		return false;
	}

	if ((m_CustomRule.lRobotScoreMin > m_CustomRule.lRobotScoreMax))
	{
		AfxMessageBox(TEXT("AI分数最小值应小于最大值，请重新设置！"),MB_ICONSTOP);
		return false;
	}

	if (m_CustomRule.nMinAllinTurnCount < 0)
	{
		AfxMessageBox(TEXT("最小全压轮数不能为负数，请重新设置！"), MB_ICONSTOP);
		return false;
	}

	return true;
}

//读取配置
bool CDlgCustomRule::GetCustomRule(tagCustomRule & CustomRule)
{
	//读取参数
	if (FillDebugToData()==true)
	{
		CustomRule=m_CustomRule;
		return true;
	}

	return false;
}

//设置配置
bool CDlgCustomRule::SetCustomRule(tagCustomRule & CustomRule)
{
	//设置变量
	m_CustomRule=CustomRule;

	//更新参数
	if (m_hWnd!=NULL) FillDataToDebug();

	return true;
}

//////////////////////////////////////////////////////////////////////////////////
