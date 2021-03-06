#include "StdAfx.h"
#include "Resource.h"
#include "DlgMatchWizard.h"

//////////////////////////////////////////////////////////////////////////
//常量定义

#define TAB_OPTION_SIGNUP1					0
#define TAB_OPTION_SIGNUP2					1
#define TAB_OPTION_RANKINGMODE				2
#define TAB_OPTION_DISTRIBUTE				3
#define TAB_OPTION_ANDROID_BASE				4
#define TAB_OPTION_ANDROID_JOIN				5
#define TAB_OPTION_REWARD					6

//////////////////////////////////////////////////////////////////////////
//消息映射

BEGIN_MESSAGE_MAP(CDlgMatchItem, CDialog)
	ON_WM_SIZE()
END_MESSAGE_MAP()

BEGIN_MESSAGE_MAP(CDlgMatchWizardItem, CDialog)
	ON_WM_SIZE()
END_MESSAGE_MAP()

BEGIN_MESSAGE_MAP(CDlgMatchSignup1, CDlgMatchItem)
	ON_CBN_SELCHANGE(IDC_COMBO_FROM_MATCH, OnCbnSelchangeComboFromMatch)
    ON_BN_CLICKED(IDC_ADD_REWARD, OnBnClickedAddReward)
    ON_BN_CLICKED(IDC_MODIFY_REWARD, OnBnClickedModifyReward)
    ON_BN_CLICKED(IDC_DELETE_REWARD, OnBnClickedDeleteReward)
    ON_NOTIFY(LVN_ITEMCHANGED, IDC_LIST_REWARD, OnLvnItemchangedListReward)
    ON_EN_KILLFOCUS(IDC_RANKID_END, &CDlgMatchSignup1::OnEnKillfocusRankidEnd)
END_MESSAGE_MAP()


BEGIN_MESSAGE_MAP(CDlgMatchWizardStep1, CDlgMatchWizardItem)	
	ON_CBN_SELCHANGE(IDC_COMBO_MATCH_TYPE, OnCbnSelchangeComboMatchType)
ON_BN_CLICKED(IDC_BUTTON1, &CDlgMatchWizardStep1::OnBnClickedButton1)
ON_BN_CLICKED(IDC_BUTTON2, &CDlgMatchWizardStep1::OnBnClickedButton2)
ON_BN_CLICKED(IDC_BUTTON3, &CDlgMatchWizardStep1::OnBnClickedButton3)
ON_BN_CLICKED(IDC_BUTTON4, &CDlgMatchWizardStep1::OnBnClickedButton4)
END_MESSAGE_MAP()

BEGIN_MESSAGE_MAP(CDlgMatchWizard, CDialog)
	ON_BN_CLICKED(IDC_LAST, OnBnClickedLast)
	ON_BN_CLICKED(IDC_NEXT, OnBnClickedNext)
	ON_BN_CLICKED(IDC_FINISH, OnBnClickedFinish)
END_MESSAGE_MAP()

//////////////////////////////////////////////////////////////////////////
//构造函数
CDlgMatchItem::CDlgMatchItem(UINT nIDTemplate): CDialog(nIDTemplate)
{
	//设置变量		
	m_pGameMatchOption=NULL;
	m_pMatchInfoBuffer=NULL;
	m_pRewardInfoBuffer=NULL;
}

//析构函数
CDlgMatchItem::~CDlgMatchItem()
{
}

//设置比赛
VOID CDlgMatchItem::SetMatchInfoBuffer(CMatchInfoBuffer * pMatchInfoBuffer)
{
	m_pMatchInfoBuffer=pMatchInfoBuffer;
}

//设置奖励
VOID CDlgMatchItem::SetRewardInfoBuffer(CRewardInfoBuffer * pRewardInfoBuffer)
{
	m_pRewardInfoBuffer=pRewardInfoBuffer;
}

//设置配置
VOID CDlgMatchItem::SetGameMatchOption(tagGameMatchOption * pGameMatchOption)
{
	m_pGameMatchOption=pGameMatchOption;
}

//创建向导
bool CDlgMatchItem::ShowMatchItem(const CRect & rcRect, CWnd * pParentWnd)
{
	//创建窗口
	if (m_hWnd==NULL) CreateMatchItem(rcRect,pParentWnd);

	//显示窗口
	ShowWindow(SW_SHOW);

	return true;
}

//创建子项
VOID CDlgMatchItem::CreateMatchItem(const CRect & rcRect, CWnd * pParentWnd)
{
	//设置资源
	AfxSetResourceHandle(GetModuleHandle(MODULE_MANAGER_DLL_NAME));

	//创建窗口
	BOOL bSuccess=Create(m_lpszTemplateName,pParentWnd);
    //ASSERT(bSuccess);
	SetWindowPos(NULL,rcRect.left,rcRect.top,rcRect.Width(),rcRect.Height(),SWP_NOZORDER|SWP_NOACTIVATE);

	//设置资源
	AfxSetResourceHandle(GetModuleHandle(NULL));
}

//类型变更
VOID CDlgMatchItem::OnEventMatchTypeChanged(BYTE cbMatchType)
{
}

//位置消息
VOID CDlgMatchItem::OnSize(UINT nType, INT cx, INT cy)
{
	__super::OnSize(nType, cx, cy);

	//调整控件
	RectifyControl(cx,cy);

	return;
}

//////////////////////////////////////////////////////////////////////////

//构造函数
CDlgMatchSignup1::CDlgMatchSignup1() : CDlgMatchItem(IDD_MATCH_SIGNUP1)
{
}

//析构函数
CDlgMatchSignup1::~CDlgMatchSignup1()
{
}

//初始化函数
BOOL CDlgMatchSignup1::OnInitDialog()
{
	__super::OnInitDialog();

	//设置控件
	((CEdit *)GetDlgItem(IDC_EDIT_SIGNUP_FEE))->LimitText(9);

	GetLocalTime(&m_pGameMatchOption->MatchEndDate);
	GetLocalTime(&m_pGameMatchOption->MatchStartDate);

	//默认选择
	CheckRadioButton(IDC_RADIO_GOLD,IDC_RADIO_MEDAL,IDC_RADIO_GOLD);
	CheckRadioButton(IDC_RADIO_SERVER,IDC_RADIO_WEBSITE,IDC_RADIO_SERVER);	

	//比赛费用
	SetDlgItemInt(IDC_EDIT_SIGNUP_FEE,(UINT)m_pGameMatchOption->lSignupFee);

	//报名费用
	if (m_pGameMatchOption->cbSignupMode&SIGNUP_MODE_SIGNUP_FEE)
	{
		//设置选择
		((CButton *)GetDlgItem(IDC_CHECK_SIGNUP_FEE))->SetCheck(TRUE);

		//报名费用
		SetDlgItemInt(IDC_EDIT_SIGNUP_FEE,(int)m_pGameMatchOption->lSignupFee);

		//费用类型
		CheckRadioButton(IDC_RADIO_GOLD,IDC_RADIO_MEDAL,IDC_RADIO_GOLD+(m_pGameMatchOption->cbFeeType-FEE_TYPE_GOLD));

		//缴费位置
		CheckRadioButton(IDC_RADIO_SERVER,IDC_RADIO_WEBSITE,IDC_RADIO_SERVER+(m_pGameMatchOption->cbDeductArea-DEDUCT_AREA_SERVER));		
	}

	//比赛晋级
	if (m_pGameMatchOption->cbSignupMode&SIGNUP_MODE_MATCH_USER)
	{
		//设置选择
		((CButton *)GetDlgItem(IDC_CHECK_MATCH_USER))->SetCheck(TRUE);		

		//结束日期
		CDateTimeCtrl * pEndtDate=(CDateTimeCtrl *)GetDlgItem(IDC_DATE_MATCH_END);
		pEndtDate->SetTime(&m_pGameMatchOption->MatchEndDate);

		//开始日期
		CDateTimeCtrl * pStartDate=(CDateTimeCtrl *)GetDlgItem(IDC_DATE_MATCH_START);
		pStartDate->SetTime(&m_pGameMatchOption->MatchStartDate);		

		//单轮排名
		if (m_pGameMatchOption->cbFilterType==FILTER_TYPE_SINGLE_TURN)
		{			
			SetDlgItemInt(IDC_EDIT_SINGLE_RANK,m_pGameMatchOption->wMaxRankID);
			CheckRadioButton(IDC_RADIO_SINGLE_TURN,IDC_RADIO_TOTAL_RANKING,IDC_RADIO_SINGLE_TURN);			
		}

		//总排名次
		if (m_pGameMatchOption->cbFilterType==FILTER_TYPE_TOTAL_RANKING)
		{
			SetDlgItemInt(IDC_EDIT_TOTAL_RANK,m_pGameMatchOption->wMaxRankID);
			CheckRadioButton(IDC_RADIO_SINGLE_TURN,IDC_RADIO_TOTAL_RANKING,IDC_RADIO_TOTAL_RANKING);			
		}		
	}
	else
	{
		//默认设置
		CheckRadioButton(IDC_RADIO_SINGLE_TURN,IDC_RADIO_TOTAL_RANKING,IDC_RADIO_SINGLE_TURN);
	}

	//获取控件
	CComboBox * pComboBox=(CComboBox *)GetDlgItem(IDC_COMBO_FROM_MATCH);
	if (pComboBox!=NULL)
	{
		//加载比赛
		if (m_pMatchInfoBuffer!=NULL)
		{
			//遍历赛事
			for (INT_PTR i=0;i<m_pMatchInfoBuffer->m_GameMatchOptionArray.GetCount();i++)
			{
				//获取对象
				tagGameMatchOption * pGameMatchOption=m_pMatchInfoBuffer->m_GameMatchOptionArray[i];
				if (pGameMatchOption->dwMatchID==m_pGameMatchOption->dwMatchID) continue;
			
				//添加赛事
				int nIndex=pComboBox->AddString(pGameMatchOption->szMatchName);
				pComboBox->SetItemDataPtr(nIndex,pGameMatchOption);
				if (pGameMatchOption->dwMatchID==m_pGameMatchOption->dwFromMatchID)
				{
					if (m_pGameMatchOption->cbSignupMode&SIGNUP_MODE_MATCH_USER)
					{
						pComboBox->SetCurSel(nIndex);
					}
				}
			}
		}

		//模拟选择
		OnCbnSelchangeComboFromMatch();
	}

    //添加奖励
    if(m_pRewardInfoBuffer != NULL)
    {
        for(INT_PTR i = 0; i<m_pRewardInfoBuffer->m_MatchRewardInfoArray.GetCount(); i++)
        {
            m_RewardListControl.InsertMatchReward(m_pRewardInfoBuffer->m_MatchRewardInfoArray[i]);
        }
    }
	
	return FALSE;
}

//控件绑定
VOID CDlgMatchSignup1::DoDataExchange(CDataExchange * pDX)
{
    __super::DoDataExchange(pDX);

    //奖励列表
    DDX_Control(pDX, IDC_LIST_REWARD, m_RewardListControl);
}

//保存输入
bool CDlgMatchSignup1::SaveInputInfo()
{
	//扣除金币
	if (IsDlgButtonChecked(IDC_CHECK_SIGNUP_FEE))
	{
		//费用额度
		m_pGameMatchOption->cbSignupMode|=SIGNUP_MODE_SIGNUP_FEE;
		m_pGameMatchOption->lSignupFee=GetDlgItemInt(IDC_EDIT_SIGNUP_FEE);

		//缴费区域
		if (IsDlgButtonChecked(IDC_RADIO_SERVER)) m_pGameMatchOption->cbDeductArea=DEDUCT_AREA_SERVER;
		if (IsDlgButtonChecked(IDC_RADIO_WEBSITE)) m_pGameMatchOption->cbDeductArea=DEDUCT_AREA_WEBSITE;

		//费用类型
		if (IsDlgButtonChecked(IDC_RADIO_GOLD)) m_pGameMatchOption->cbFeeType=FEE_TYPE_GOLD;
		if (IsDlgButtonChecked(IDC_RADIO_MEDAL)) m_pGameMatchOption->cbFeeType=FEE_TYPE_MEDAL;
	}
	else
	{
		m_pGameMatchOption->cbSignupMode&=~SIGNUP_MODE_SIGNUP_FEE;
	}

	//比赛用户
	if (IsDlgButtonChecked(IDC_CHECK_MATCH_USER))
	{
		m_pGameMatchOption->cbSignupMode|=SIGNUP_MODE_MATCH_USER;

		//获取控件
		CComboBox * pComboBox=(CComboBox *)GetDlgItem(IDC_COMBO_FROM_MATCH);
		if (pComboBox!=NULL && pComboBox->GetCurSel()!=LB_ERR)
		{
			tagGameMatchOption * pGameMatchOption=(tagGameMatchOption *)pComboBox->GetItemData(pComboBox->GetCurSel());
			if (pGameMatchOption!=NULL) m_pGameMatchOption->dwFromMatchID=pGameMatchOption->dwMatchID;
		}

		//结束日期
		CDateTimeCtrl * pEndtDate=(CDateTimeCtrl *)GetDlgItem(IDC_DATE_MATCH_END);
		pEndtDate->GetTime(&m_pGameMatchOption->MatchEndDate);

		//开始日期 
		CDateTimeCtrl * pStartDate=(CDateTimeCtrl *)GetDlgItem(IDC_DATE_MATCH_START);
		pStartDate->GetTime(&m_pGameMatchOption->MatchStartDate);

		//单轮排名
		if (IsDlgButtonChecked(IDC_RADIO_SINGLE_TURN))
		{			
			m_pGameMatchOption->cbFilterType=FILTER_TYPE_SINGLE_TURN;
			m_pGameMatchOption->wMaxRankID=GetDlgItemInt(IDC_EDIT_SINGLE_RANK);
		}

		//总排名次
		if (IsDlgButtonChecked(IDC_RADIO_TOTAL_RANKING))
		{
			m_pGameMatchOption->cbFilterType=FILTER_TYPE_TOTAL_RANKING;
			m_pGameMatchOption->wMaxRankID=GetDlgItemInt(IDC_EDIT_TOTAL_RANK);
		}
	}
	else
	{
		m_pGameMatchOption->cbSignupMode&=~SIGNUP_MODE_MATCH_USER;
	}

	//报名方式
	if (m_pGameMatchOption->cbSignupMode==0)
	{
		AfxMessageBox(TEXT("报名方式不能为空，请重新选择！"));

		return false;
	}

	//比赛用户
	if (m_pGameMatchOption->cbSignupMode&SIGNUP_MODE_MATCH_USER)
	{
		if (m_pGameMatchOption->dwFromMatchID==0)
		{
			AfxMessageBox(TEXT("您勾选了参加特定比赛作为报名方式，必须选择一场赛事来确定比赛用户的来源！"));

			return false;
		}

		//查找比赛
		tagGameMatchOption * pGameMatchOption=m_pMatchInfoBuffer->SearchMatchOption(m_pGameMatchOption->dwFromMatchID);
		if (pGameMatchOption!=NULL)
		{
			if (pGameMatchOption->cbMatchType==MATCH_TYPE_IMMEDIATE)
			{
				if (m_pGameMatchOption->cbFilterType!=FILTER_TYPE_SINGLE_TURN)
				{
					AfxMessageBox(TEXT("您选择了即时赛作为比赛用户的来源，筛选方式必须为单轮比赛排名！"));

					return false;
				}
			}

			if (pGameMatchOption->cbMatchType==MATCH_TYPE_LOCKTIME)
			{
				if (m_pGameMatchOption->cbFilterType!=FILTER_TYPE_TOTAL_RANKING)
				{
					AfxMessageBox(TEXT("您选择了定时赛作为比赛用户的来源，筛选方式必须为比赛总排名！"));

					return false;
				}
			}
		}
	}

	//特殊判断
	if (m_pGameMatchOption->cbMatchType==MATCH_TYPE_IMMEDIATE && m_pGameMatchOption->cbSignupMode&SIGNUP_MODE_MATCH_USER)
	{
		AfxMessageBox(TEXT("即时赛不能选择比赛金币作为报名方式，请重新选择！"));

		return false;
	}

	return true;
}

//调整控件
VOID CDlgMatchSignup1::RectifyControl(INT nWidth, INT nHeight)
{
	return;
}

//设置配置
VOID CDlgMatchSignup1::SetMatchRewardOption(tagMatchRewardInfo * pMatchRewardInfo)
{
    //参数校验
    //ASSERT(pMatchRewardInfo != NULL);
    if(pMatchRewardInfo == NULL) return;

    //设置名次
    SetDlgItemInt(IDC_RANKID_END, (UINT)pMatchRewardInfo->wRankID);
    SetDlgItemInt(IDC_RANKID_START, (UINT)pMatchRewardInfo->wRankID);

    //金币奖励
    SetDlgItemInt(IDC_REWARD_GOLD, (UINT)pMatchRewardInfo->lRewardGold);

    //奖牌奖励
    SetDlgItemInt(IDC_REWARD_INGOT, (UINT)pMatchRewardInfo->lRewardIngot);

    //经验奖励
    SetDlgItemInt(IDC_REWARD_EXPERIENCE, (UINT)pMatchRewardInfo->dwRewardTicket);
}

//奖励配置
bool CDlgMatchSignup1::GetMatchRewardOption(tagMatchRewardInfo & MatchRewardInfo, WORD & wStartRankID, WORD & wEndRankID)
{
    //获取名次
    wEndRankID = GetDlgItemInt(IDC_RANKID_END);
    wStartRankID = GetDlgItemInt(IDC_RANKID_START);

    //调整名次
    if(wEndRankID == 0) wEndRankID = wStartRankID;

    //奖励金币
    MatchRewardInfo.lRewardGold = GetDlgItemInt(IDC_REWARD_GOLD);

    //奖励元宝
    MatchRewardInfo.lRewardIngot = GetDlgItemInt(IDC_REWARD_INGOT);

    //奖励经验
    MatchRewardInfo.dwRewardTicket = GetDlgItemInt(IDC_REWARD_EXPERIENCE);

    //名次校验
    if(wStartRankID == 0 || wEndRankID<wStartRankID)
    {
        AfxMessageBox(TEXT("您输入的比赛名次不合法，请重新输入！"));

        //设置焦点
        GetDlgItem(IDC_RANKID_START)->SetFocus();

        return false;
    }

    if(MatchRewardInfo.lRewardGold>0 && MatchRewardInfo.lRewardIngot > 0 && MatchRewardInfo.dwRewardTicket > 0)
    {
        AfxMessageBox(TEXT("奖励最多设置两项！"));

        //设置焦点
        GetDlgItem(IDC_REWARD_GOLD)->SetFocus();

        return false;
    }

    return true;
}


//添加奖励
VOID CDlgMatchSignup1::OnBnClickedAddReward()
{
    //变量定义
    WORD wStartRankID, wEndRankID;
    tagMatchRewardInfo MatchRewardInfo;

    //获取配置
    if(GetMatchRewardOption(MatchRewardInfo, wStartRankID, wEndRankID) == false) return;

    for(WORD wRankID = wStartRankID; wRankID <= wEndRankID; wRankID++)
    {
        //设置名次
        MatchRewardInfo.wRankID = wRankID;

        //存在判断
        if(m_pRewardInfoBuffer->SearchMatchReward(MatchRewardInfo.wRankID) != NULL)
        {
            AfxMessageBox(TEXT("抱歉，该名次的奖励已存在,如要修改请点击修改奖励按钮！"));

            return;
        }

        //插入奖励
        tagMatchRewardInfo * pMatchRewardInfo = NULL;
        if(pMatchRewardInfo = m_pRewardInfoBuffer->InsertMatchRewardInfo(MatchRewardInfo))
        {
            m_RewardListControl.InsertMatchReward(pMatchRewardInfo);
        }
    }
}

//修改奖励
VOID CDlgMatchSignup1::OnBnClickedModifyReward()
{
    //变量定义
    WORD wStartRankID, wEndRankID;
    tagMatchRewardInfo MatchRewardInfo;

    //获取配置
    if(GetMatchRewardOption(MatchRewardInfo, wStartRankID, wEndRankID) == false) return;

    for(WORD wRankID = wStartRankID; wRankID <= wEndRankID; wRankID++)
    {
        //设置名次
        MatchRewardInfo.wRankID = wRankID;

        //存在判断
        tagMatchRewardInfo * pMatchRewardInfo = m_pRewardInfoBuffer->SearchMatchReward(wRankID);
        if(pMatchRewardInfo == NULL)
        {
            AfxMessageBox(TEXT("抱歉，该名次的奖励不存在,如要添加请点击添加奖励按钮！"));
            return;
        }

        //更新数据
        CopyMemory(pMatchRewardInfo, &MatchRewardInfo, sizeof(tagMatchRewardInfo));

        //更新控件
        m_RewardListControl.UpdateMatchReward(pMatchRewardInfo);
    }
}

//删除奖励
VOID CDlgMatchSignup1::OnBnClickedDeleteReward()
{
    //变量定义
    WORD wStartRankID, wEndRankID;
    tagMatchRewardInfo MatchRewardInfo;

    //获取配置
    if(GetMatchRewardOption(MatchRewardInfo, wStartRankID, wEndRankID) == false) return;

    for(WORD wRankID = wStartRankID; wRankID <= wEndRankID; wRankID++)
    {
        //设置名次
        MatchRewardInfo.wRankID = wRankID;

        //存在判断
        tagMatchRewardInfo * pMatchRewardInfo = m_pRewardInfoBuffer->SearchMatchReward(wRankID);
        if(pMatchRewardInfo == NULL)
        {
            AfxMessageBox(TEXT("抱歉，该名次的奖励不存在,如要添加请点击添加奖励按钮！"));
            return;
        }

        //更新控件
        m_RewardListControl.DeleteMatchReward(pMatchRewardInfo);
        m_pRewardInfoBuffer->DeleteMatchRewardInfo(pMatchRewardInfo->wRankID);
    }
}

//子项变更
VOID CDlgMatchSignup1::OnLvnItemchangedListReward(NMHDR *pNMHDR, LRESULT *pResult)
{
    LPNMLISTVIEW pNMLV = reinterpret_cast<LPNMLISTVIEW>(pNMHDR);

    //变量定义
    if(pNMLV->iItem != LB_ERR)
    {
        //设置配置
        tagMatchRewardInfo * pMatchRewardInfo = (tagMatchRewardInfo *)m_RewardListControl.GetItemData(pNMLV->iItem);
        if(pMatchRewardInfo != NULL) SetMatchRewardOption(pMatchRewardInfo);
    }

    *pResult = 0;
}


//类型变更
VOID CDlgMatchSignup1::OnEventMatchTypeChanged(BYTE cbMatchType)
{
	//设置控件
	CButton * pCheckButton=(CButton *)GetDlgItem(IDC_CHECK_MATCH_USER);
	if (pCheckButton!=NULL)
	{
		pCheckButton->SetCheck(FALSE);
		pCheckButton->EnableWindow(cbMatchType==MATCH_TYPE_LOCKTIME);
	}	
}

//选择变更
void CDlgMatchSignup1::OnCbnSelchangeComboFromMatch()
{
	//获取对象
	CComboBox * pComboBox=(CComboBox *)GetDlgItem(IDC_COMBO_FROM_MATCH);
	if (pComboBox!=NULL && pComboBox->GetCurSel()!=LB_ERR)
	{
		tagGameMatchOption * pGameMatchOption=(tagGameMatchOption *)pComboBox->GetItemDataPtr(pComboBox->GetCurSel());

		//设置控件
		GetDlgItem(IDC_DATE_MATCH_START)->EnableWindow(TRUE);
		GetDlgItem(IDC_EDIT_SINGLE_RANK)->EnableWindow(TRUE);
		GetDlgItem(IDC_RADIO_SINGLE_TURN)->EnableWindow(TRUE);		
		GetDlgItem(IDC_EDIT_TOTAL_RANK)->EnableWindow(TRUE);
		GetDlgItem(IDC_RADIO_TOTAL_RANKING)->EnableWindow(TRUE);				

		//即时赛类型
		if (pGameMatchOption->cbMatchType==MATCH_TYPE_IMMEDIATE)
		{
			//禁用控件
			GetDlgItem(IDC_EDIT_TOTAL_RANK)->EnableWindow(FALSE);
			GetDlgItem(IDC_RADIO_TOTAL_RANKING)->EnableWindow(FALSE);			

			//设置选择
			CheckRadioButton(IDC_RADIO_SINGLE_TURN,IDC_RADIO_TOTAL_RANKING,IDC_RADIO_SINGLE_TURN);
		}

		//定时赛类型
		if (pGameMatchOption->cbMatchType==MATCH_TYPE_LOCKTIME)
		{
			//禁用控件
			GetDlgItem(IDC_DATE_MATCH_START)->EnableWindow(FALSE);
			GetDlgItem(IDC_RADIO_SINGLE_TURN)->EnableWindow(FALSE);
			GetDlgItem(IDC_EDIT_SINGLE_RANK)->EnableWindow(FALSE);

			//设置选择
			CheckRadioButton(IDC_RADIO_SINGLE_TURN,IDC_RADIO_TOTAL_RANKING,IDC_RADIO_TOTAL_RANKING);
		}		
	}	
}


//////////////////////////////////////////////////////////////////////////

//构造函数
CDlgMatchSignup2::CDlgMatchSignup2() : CDlgMatchItem(IDD_MATCH_SIGNUP2)
{
}

//析构函数
CDlgMatchSignup2::~CDlgMatchSignup2()
{
}

//初始化函数
BOOL CDlgMatchSignup2::OnInitDialog()
{
	__super::OnInitDialog();

	//用户经验
	if (m_pGameMatchOption->cbJoinCondition&MATCH_JOINCD_EXPERIENCE)
	{
		//设置选择
		((CButton *)GetDlgItem(IDC_CHECK_EXPERIENCE))->SetCheck(TRUE);

		//设置经验
		SetDlgItemInt(IDC_EDIT_EXPERIENCE,m_pGameMatchOption->dwExperience);
	}

    //会员等级
	if (m_pGameMatchOption->cbJoinCondition&MATCH_JOINCD_MEMBER_ORDER)
	{
		//设置空控件
		((CButton *)GetDlgItem(IDC_CHECK_MEMBER_ORDER))->SetCheck(TRUE);
		CheckRadioButton(IDC_RADIO_NOAMAL,IDC_RADIO_MEMBER_V7,IDC_RADIO_NOAMAL+m_pGameMatchOption->cbMemberOrder);		
	}
	else
	{
		//默认设置
		CheckRadioButton(IDC_RADIO_NOAMAL,IDC_RADIO_MEMBER_V7,IDC_RADIO_NOAMAL);		
	}	

	return FALSE;
}

//保存输入
bool CDlgMatchSignup2::SaveInputInfo()
{
	//用户经验
	if (IsDlgButtonChecked(IDC_CHECK_EXPERIENCE))
	{
		m_pGameMatchOption->cbJoinCondition|=MATCH_JOINCD_EXPERIENCE;

		//设置经验
		m_pGameMatchOption->dwExperience=GetDlgItemInt(IDC_EDIT_EXPERIENCE);
	}
	else
	{
		m_pGameMatchOption->cbJoinCondition&=~MATCH_JOINCD_EXPERIENCE;
	}

	//会员等级
	if (IsDlgButtonChecked(IDC_CHECK_MEMBER_ORDER))
	{
		m_pGameMatchOption->cbJoinCondition|=MATCH_JOINCD_MEMBER_ORDER;		

		//设置等级	
		UINT nCheckedID=GetCheckedRadioButton(IDC_RADIO_NOAMAL,IDC_RADIO_MEMBER_V7);
		m_pGameMatchOption->cbMemberOrder=nCheckedID-IDC_RADIO_NOAMAL;
	}
	else
	{
		m_pGameMatchOption->cbJoinCondition&=~MATCH_JOINCD_MEMBER_ORDER;
	}	

	//报名方式
	if (m_pGameMatchOption->cbSignupMode==0)
	{
		AfxMessageBox(TEXT("报名方式不能为空，请重新选择！"));

		return false;
	}

	return true;
}

//调整控件
VOID CDlgMatchSignup2::RectifyControl(INT nWidth, INT nHeight)
{
	return;
}

//////////////////////////////////////////////////////////////////////////

//构造函数
CDlgMatchDistribute::CDlgMatchDistribute() : CDlgMatchItem(IDD_MATCH_DISTRIBUTE)
{
}

//析构函数
CDlgMatchDistribute::~CDlgMatchDistribute()
{
}

//初始化函数
BOOL CDlgMatchDistribute::OnInitDialog()
{
	__super::OnInitDialog();

	//设置控件
	((CEdit *)GetDlgItem(IDC_DISTRIBUTE_MINCOUNT))->LimitText(3);
	((CEdit *)GetDlgItem(IDC_DISTRIBUTE_TIMESPACE))->LimitText(3);
	((CEdit *)GetDlgItem(IDC_PARTAKE_MIN_GAMEUSER))->LimitText(2);
	((CEdit *)GetDlgItem(IDC_PARTAKE_MAX_GAMEUSER))->LimitText(2);	

	//同桌选项
	if ((m_pGameMatchOption->cbDistributeRule&DISTRIBUTE_LAST_TABLE)!=0)
	{
		((CButton *)GetDlgItem(IDC_ALLOW_LAST_SAMETABLE))->SetCheck(TRUE);
	}
	else
	{
		((CButton *)GetDlgItem(IDC_ALLOW_LAST_SAMETABLE))->SetCheck(FALSE);
	}

	//地址选项
	if ((m_pGameMatchOption->cbDistributeRule&DISTRIBUTE_SAME_ADDRESS)!=0)
	{
		((CButton *)GetDlgItem(IDC_ALLOW_SAME_ADDRESS))->SetCheck(TRUE);
	}
	else
	{
		((CButton *)GetDlgItem(IDC_ALLOW_SAME_ADDRESS))->SetCheck(FALSE);
	}

	//配桌人数
	if (m_pGameMatchOption->wMinDistributeUser!=0)
	{
		SetDlgItemInt(IDC_DISTRIBUTE_MINCOUNT,m_pGameMatchOption->wMinDistributeUser);
	}

	//分组间隔
	if (m_pGameMatchOption->wDistributeTimeSpace!=0)
	{
		SetDlgItemInt(IDC_DISTRIBUTE_TIMESPACE,m_pGameMatchOption->wDistributeTimeSpace);
	}

	//最小人数
	if (m_pGameMatchOption->wMinPartakeGameUser!=0)
	{
		SetDlgItemInt(IDC_PARTAKE_MIN_GAMEUSER,m_pGameMatchOption->wMinPartakeGameUser);
	}

	//最大人数
	if (m_pGameMatchOption->wMaxPartakeGameUser!=0)
	{
		SetDlgItemInt(IDC_PARTAKE_MAX_GAMEUSER,m_pGameMatchOption->wMaxPartakeGameUser);
	}

	return FALSE;
}

//保存输入
bool CDlgMatchDistribute::SaveInputInfo()
{
	//配桌参数
	m_pGameMatchOption->wMinDistributeUser=GetDlgItemInt(IDC_DISTRIBUTE_MINCOUNT);
	m_pGameMatchOption->wDistributeTimeSpace=GetDlgItemInt(IDC_DISTRIBUTE_TIMESPACE);
	m_pGameMatchOption->wMinPartakeGameUser=GetDlgItemInt(IDC_PARTAKE_MIN_GAMEUSER);
	m_pGameMatchOption->wMaxPartakeGameUser=GetDlgItemInt(IDC_PARTAKE_MAX_GAMEUSER);

	//同桌选项
	if (((CButton *)GetDlgItem(IDC_ALLOW_LAST_SAMETABLE))->GetCheck()==BST_CHECKED)
	{
		m_pGameMatchOption->cbDistributeRule|=DISTRIBUTE_LAST_TABLE;
	}
	else
	{
		m_pGameMatchOption->cbDistributeRule&=~DISTRIBUTE_LAST_TABLE;
	}

	//地址选项
	if (((CButton *)GetDlgItem(IDC_ALLOW_SAME_ADDRESS))->GetCheck()==BST_CHECKED)
	{
		m_pGameMatchOption->cbDistributeRule|=DISTRIBUTE_SAME_ADDRESS;
	}
	else
	{
		m_pGameMatchOption->cbDistributeRule&=~DISTRIBUTE_SAME_ADDRESS;
	}

	return true;
}

//调整控件
VOID CDlgMatchDistribute::RectifyControl(INT nWidth, INT nHeight)
{
	return;
}

//////////////////////////////////////////////////////////////////////////

//构造函数
CDlgMatchRankingMode::CDlgMatchRankingMode() : CDlgMatchItem(IDD_MATCH_RANKING_MODE)
{
}

//析构函数
CDlgMatchRankingMode::~CDlgMatchRankingMode()
{
}

//初始化函数
BOOL CDlgMatchRankingMode::OnInitDialog()
{
	__super::OnInitDialog();

	//设置控件
	((CEdit *)GetDlgItem(IDC_EDIT_COUNT_INNINGS))->LimitText(3);

	//设置控件
	CheckRadioButton(IDC_RADIO_TOTAL_GRADES,IDC_RADIO_SPECIALLY_GRADES,IDC_RADIO_TOTAL_GRADES+(m_pGameMatchOption->cbRankingMode-RANKING_MODE_TOTAL_GRADES));

	//特定局数排名
	if (IsDlgButtonChecked(IDC_RADIO_SPECIALLY_GRADES))
	{
		//统计局数
		SetDlgItemInt(IDC_EDIT_COUNT_INNINGS,m_pGameMatchOption->wCountInnings);

		//设置控件
		CheckRadioButton(IDC_RADIO_BEST_GRADES,IDC_RADIO_AVERAGEEX_GRADES,IDC_RADIO_BEST_GRADES+(m_pGameMatchOption->cbFilterGradesMode-FILTER_GRADES_MODE_BEST));
	}
	else
	{
		CheckRadioButton(IDC_RADIO_BEST_GRADES,IDC_RADIO_AVERAGEEX_GRADES,IDC_RADIO_BEST_GRADES);
	}

	return FALSE;
}

//保存输入
bool CDlgMatchRankingMode::SaveInputInfo()
{
	//排名方式
	if (IsDlgButtonChecked(IDC_RADIO_TOTAL_GRADES)) m_pGameMatchOption->cbRankingMode=RANKING_MODE_TOTAL_GRADES;
	if (IsDlgButtonChecked(IDC_RADIO_SPECIALLY_GRADES)) m_pGameMatchOption->cbRankingMode=RANKING_MODE_SPECIAL_GRADES;

	//特定局数
	if (m_pGameMatchOption->cbRankingMode==RANKING_MODE_SPECIAL_GRADES)
	{
		//统计局数
		m_pGameMatchOption->wCountInnings=GetDlgItemInt(IDC_EDIT_COUNT_INNINGS);

		//合法校验
		if (m_pGameMatchOption->wCountInnings==0)
		{
			AfxMessageBox(TEXT("统计局数设置不合法，请重新设置！"));

			return false;
		}

		//筛选模式
		if (IsDlgButtonChecked(IDC_RADIO_BEST_GRADES)) m_pGameMatchOption->cbFilterGradesMode=FILTER_GRADES_MODE_BEST;
		if (IsDlgButtonChecked(IDC_RADIO_AVERAGE_GRADES)) m_pGameMatchOption->cbFilterGradesMode=FILTER_GRADES_MODE_AVERAGE;
		if (IsDlgButtonChecked(IDC_RADIO_AVERAGEEX_GRADES)) m_pGameMatchOption->cbFilterGradesMode=FILTER_GRADES_MODE_AVERAGEEX;
	}	

	return true;
}

//调整控件
VOID CDlgMatchRankingMode::RectifyControl(INT nWidth, INT nHeight)
{
	return;
}

//类型变更
VOID CDlgMatchRankingMode::OnEventMatchTypeChanged(BYTE cbMatchType)
{
	//设置控件
	GetDlgItem(IDC_RADIO_SPECIALLY_GRADES)->EnableWindow(cbMatchType==MATCH_TYPE_LOCKTIME);
}

//////////////////////////////////////////////////////////////////////////

BEGIN_MESSAGE_MAP(CDlgMatchAndroidBase, CDlgMatchItem)
	ON_BN_CLICKED(IDC_CHECK_ANDROID_WIN, &CDlgMatchAndroidBase::OnBnClickedCheckAndroidWin)
    ON_EN_KILLFOCUS(IDC_EDIT_TOTAL_SECTION, &CDlgMatchAndroidBase::OnEnKillfocusEditTotalSection)
    ON_EN_CHANGE(IDC_EDIT_TOTAL_SECTION, &CDlgMatchAndroidBase::OnEnChangeEditTotalSection)
    ON_WM_KILLFOCUS()
ON_EN_KILLFOCUS(IDC_EDIT_INIT_ANDROID_MAX, &CDlgMatchAndroidBase::OnEnKillfocusEditInitAndroidMax)
END_MESSAGE_MAP()


void CDlgMatchAndroidBase::OnBnClickedCheckAndroidWin()
{
	// TODO:  在此添加控件通知处理程序代码
    SetDlgItemInt(IDC_EDIT_NO1_RATIO1, 10);
    SetDlgItemInt(IDC_EDIT_NO1_RATIO2, 5);
    SetDlgItemInt(IDC_EDIT_NO1_RATIO3, 3);
}

//构造函数
CDlgMatchAndroidBase::CDlgMatchAndroidBase() : CDlgMatchItem(IDD_MATCH_ANDROID_BASE)
{
}

//析构函数
CDlgMatchAndroidBase::~CDlgMatchAndroidBase()
{
}

//初始化函数
BOOL CDlgMatchAndroidBase::OnInitDialog()
{
	__super::OnInitDialog();
	
	//设置控件
	((CEdit *)GetDlgItem(IDC_EDIT_ANDROID_MAX_COUNT))->LimitText(3);
	((CEdit *)GetDlgItem(IDC_EDIT_INIT_ANDROID_MIN))->LimitText(3);
	((CEdit *)GetDlgItem(IDC_EDIT_INIT_ANDROID_MAX))->LimitText(3);
	((CEdit *)GetDlgItem(IDC_EDIT_NO1_RATIO1))->LimitText(2);
	((CEdit *)GetDlgItem(IDC_EDIT_NO1_RATIO2))->LimitText(2);
	((CEdit *)GetDlgItem(IDC_EDIT_NO1_RATIO3))->LimitText(2);

	//变量定义
	tagImmediateMatch * pImmediateMatch = (tagImmediateMatch *)m_pGameMatchOption->cbMatchRule;

	//AI数
	if (pImmediateMatch->wAndroidUserCount != 0)
	{
		SetDlgItemInt(IDC_EDIT_ANDROID_MAX_COUNT, (UINT)pImmediateMatch->wAndroidUserCount);
	}
    else
    {
        SetDlgItemInt(IDC_EDIT_ANDROID_MAX_COUNT, 10);
    }
    //初始AI最小值
    if(pImmediateMatch->cbInitAndroidMax != 0)
    {
        SetDlgItemInt(IDC_EDIT_INIT_ANDROID_MIN, (UINT)pImmediateMatch->cbInitAndroidMin);
        SetDlgItemInt(IDC_EDIT_INIT_ANDROID_MAX, (UINT)pImmediateMatch->cbInitAndroidMax);
    }
    else
    {
        SetDlgItemInt(IDC_EDIT_INIT_ANDROID_MIN, 5);
        SetDlgItemInt(IDC_EDIT_INIT_ANDROID_MAX, 10);
    }
	
	//AI调试
	((CButton *)GetDlgItem(IDC_CHECK_ANDROID_WIN))->SetCheck(pImmediateMatch->bAndroidDebug);
	//高出第一名百分比
	if (pImmediateMatch->cbNo1Ratio1 != 0)
	{
		SetDlgItemInt(IDC_EDIT_NO1_RATIO1, (UINT)pImmediateMatch->cbNo1Ratio1);
	}
	if (pImmediateMatch->cbNo1Ratio2 != 0)
	{
		SetDlgItemInt(IDC_EDIT_NO1_RATIO2, (UINT)pImmediateMatch->cbNo1Ratio2);
	}
	if (pImmediateMatch->cbNo1Ratio3 != 0)
	{
		SetDlgItemInt(IDC_EDIT_NO1_RATIO3, (UINT)pImmediateMatch->cbNo1Ratio3);
	}
    //设置控件
    ((CEdit *)GetDlgItem(IDC_EDIT_ANDROID_FULL_TIME))->LimitText(5);
    ((CEdit *)GetDlgItem(IDC_EDIT_TOTAL_SECTION))->LimitText(2);
    for(int i = 0; i < MAX_MATCH_SECTION; i++)
    {
        ((CEdit *)GetDlgItem(IDC_EDIT_SECTION1 + i))->LimitText(2);
    }

    ////变量定义
    //tagImmediateMatch * pImmediateMatch = (tagImmediateMatch *)m_pGameMatchOption->cbMatchRule;

    //机器填满时间
    if(pImmediateMatch->wAndroidFullTime != 0)
    {
        SetDlgItemInt(IDC_EDIT_ANDROID_FULL_TIME, (UINT)pImmediateMatch->wAndroidFullTime);
    }
    else
    {
        //设置默认时间1分钟
        SetDlgItemInt(IDC_EDIT_ANDROID_FULL_TIME, 1);
    }
    //总阶段数
    if(pImmediateMatch->cbTotalSection != 0)
    {
        SetDlgItemInt(IDC_EDIT_TOTAL_SECTION, (UINT)pImmediateMatch->cbTotalSection);
    }
    //每个阶段AI数
    for(int i = 0; i < MAX_MATCH_SECTION; i++)
    {
        SetDlgItemInt(IDC_EDIT_SECTION1 + i, (UINT)pImmediateMatch->cbSectionCount[i]);
    }

	return FALSE;
}

//保存输入
bool CDlgMatchAndroidBase::SaveInputInfo()
{
	//变量定义
	tagImmediateMatch * pImmediateMatch = (tagImmediateMatch *)m_pGameMatchOption->cbMatchRule;

	if (m_pGameMatchOption->cbMatchType == 0) return true;

	pImmediateMatch->wAndroidUserCount = GetDlgItemInt(IDC_EDIT_ANDROID_MAX_COUNT);
	pImmediateMatch->cbInitAndroidMax = GetDlgItemInt(IDC_EDIT_INIT_ANDROID_MAX);
	pImmediateMatch->cbInitAndroidMin = GetDlgItemInt(IDC_EDIT_INIT_ANDROID_MIN);
	//AI调试
	pImmediateMatch->bAndroidDebug = ((CButton *)GetDlgItem(IDC_CHECK_ANDROID_WIN))->GetCheck();

	pImmediateMatch->cbNo1Ratio1 = GetDlgItemInt(IDC_EDIT_NO1_RATIO1);
	pImmediateMatch->cbNo1Ratio2 = GetDlgItemInt(IDC_EDIT_NO1_RATIO2);
	pImmediateMatch->cbNo1Ratio3 = GetDlgItemInt(IDC_EDIT_NO1_RATIO3);
    ////变量定义
    //tagImmediateMatch * pImmediateMatch = (tagImmediateMatch *)m_pGameMatchOption->cbMatchRule;
    if(pImmediateMatch->bAndroidDebug)
    {
        if(pImmediateMatch->cbNo1Ratio1 == 0 )
        {
            AfxMessageBox(TEXT("AI赢得比赛配置分数配置为空！"));
            return false;
        }
    }

    if(pImmediateMatch->cbNo1Ratio1 < pImmediateMatch->cbNo1Ratio2 || pImmediateMatch->cbNo1Ratio2 < pImmediateMatch->cbNo1Ratio3 || pImmediateMatch->cbNo1Ratio1 < pImmediateMatch->cbNo1Ratio3)
    {
        AfxMessageBox(TEXT("AI赢得比赛配置分数应该逐级递减！"));
        return false;
    }


    if(m_pGameMatchOption->cbMatchType == 0) return true;

    //机器填满时间
    pImmediateMatch->wAndroidFullTime = GetDlgItemInt(IDC_EDIT_ANDROID_FULL_TIME);

    //总阶段数
    pImmediateMatch->cbTotalSection = GetDlgItemInt(IDC_EDIT_TOTAL_SECTION);

    //每个阶段AI数
    for(int i = 0; i < MAX_MATCH_SECTION; i++)
    {
        pImmediateMatch->cbSectionCount[i] = GetDlgItemInt(IDC_EDIT_SECTION1 + i);
    }

	return true;
}

//调整控件
VOID CDlgMatchAndroidBase::RectifyControl(INT nWidth, INT nHeight)
{
	return;
}


//////////////////////////////////////////////////////////////////////////

//构造函数
CDlgMatchLockTime::CDlgMatchLockTime() : CDlgMatchItem(IDD_MATCH_LOCKTIME)
{
}

//析构函数
CDlgMatchLockTime::~CDlgMatchLockTime()
{
}

//初始化函数
BOOL CDlgMatchLockTime::OnInitDialog()
{
	__super::OnInitDialog();

	//输入限制
	((CEdit *)GetDlgItem(IDC_INITIAL_BASE_LOCK))->LimitText(8);
	((CEdit *)GetDlgItem(IDC_INIT_SCORE))->LimitText(8);
//	((CEdit *)GetDlgItem(IDC_CULL_SCORE))->LimitText(8);
	((CEdit *)GetDlgItem(IDC_MIN_PLAYCOUNT))->LimitText(4);
	((CEdit *)GetDlgItem(IDC_MAX_PLAYCOUNT))->LimitText(4);
//	((CEdit *)GetDlgItem(IDD_END_DELAY_TIME))->LimitText(8);

	//变量定义
	tagLockTimeMatch * pLockTimeMatch=(tagLockTimeMatch *)m_pGameMatchOption->cbMatchRule;

	//开赛模式
	LPCTSTR pszMatchMode[]={TEXT("常规开赛")/*, TEXT("循环开赛")*/};
	BYTE cbMatchMode[]={MATCH_MODE_NORMAL/*, MATCH_MODE_ROUND*/};
	
	pLockTimeMatch->cbMatchMode = MATCH_MODE_NORMAL; //暂时只留这模式

	//获取控件
	CComboBox * pComboBox=(CComboBox *)GetDlgItem(IDC_COMBO_MATCH_MODE);

	//设置控件
	for (int i=0; i<CountArray(pszMatchMode); i++)
	{
		int nIndex=pComboBox->SetItemData(pComboBox->InsertString(i,pszMatchMode[i]),cbMatchMode[i]);
		if (cbMatchMode[i]==pLockTimeMatch->cbMatchMode)
		{
			pComboBox->SetCurSel(nIndex);
		}
	}

	//默认设置
	if (pComboBox->GetCurSel()==-1) pComboBox->SetCurSel(0);

	//开赛人数
	if (pLockTimeMatch->wStartUserCount!=0)
	{
		SetDlgItemInt(IDC_MIN_MATCH_USER,(UINT)pLockTimeMatch->wStartUserCount);
	}

	//报名人数
	if (pLockTimeMatch->wMaxSignupUser!=0)
	{
		SetDlgItemInt(IDD_MAX_SIGNUP_USER,(UINT)pLockTimeMatch->wMaxSignupUser);
	}

	//初始分数
	if (pLockTimeMatch->lMatchInitScore!=0)
	{
		SetDlgItemInt(IDC_INIT_SCORE,(UINT)pLockTimeMatch->lMatchInitScore);
	}
	//初始底分
	if (pLockTimeMatch->lInitalBase != 0)
	{
		SetDlgItemInt(IDC_INITIAL_BASE_LOCK, (UINT)pLockTimeMatch->lInitalBase);
	}

	//淘汰分数
	//if (pLockTimeMatch->lMatchCullScore!=0)
	//{
	//	SetDlgItemInt(IDC_CULL_SCORE,(UINT)pLockTimeMatch->lMatchCullScore);
	//}

	////有效局数
	//if (pLockTimeMatch->wMinPlayCount!=0)
	//{
	//	SetDlgItemInt(IDC_MIN_PLAYCOUNT,pLockTimeMatch->wMinPlayCount);
	//}

	////最大局数
	//if (pLockTimeMatch->wMaxPlayCount!=0)
	//{
	//	SetDlgItemInt(IDC_MAX_PLAYCOUNT,pLockTimeMatch->wMaxPlayCount);
	//}

	////报名人数
	//if (pLockTimeMatch->wEndDelayTime != 0)
	//{
	//	SetDlgItemInt(IDD_END_DELAY_TIME, (UINT)pLockTimeMatch->wEndDelayTime);
	//}
   
	//比赛时间
//	SYSTEMTIME MatchEndTime=pLockTimeMatch->MatchEndTime;
	SYSTEMTIME MatchStartTime=pLockTimeMatch->MatchStartTime;	
//	SYSTEMTIME SignupEndTime=pLockTimeMatch->SignupEndTime;	
	SYSTEMTIME SignupStartTime=pLockTimeMatch->SignupStartTime;	

	//开始日期
	CDateTimeCtrl * pStartDate=(CDateTimeCtrl *)GetDlgItem(IDC_MATCH_START_DATE);
	pStartDate->SetTime(&MatchStartTime);

	//结束日期
//	CDateTimeCtrl * pEndDate=(CDateTimeCtrl *)GetDlgItem(IDC_MATCH_END_DATE);
//	pEndDate->SetTime(&MatchEndTime);

	//开始时间
	CDateTimeCtrl * pStartTime=(CDateTimeCtrl *)GetDlgItem(IDC_MATCH_START_TIME);
	pStartTime->SetTime(&MatchStartTime);

	//结束时间
//	CDateTimeCtrl * pEndTime=(CDateTimeCtrl *)GetDlgItem(IDC_MATCH_END_TIME);
//	pEndTime->SetTime(&MatchEndTime);

	//开始日期
	CDateTimeCtrl * pSignupStartDate=(CDateTimeCtrl *)GetDlgItem(IDC_SIGNUP_START_DATE);
	pSignupStartDate->SetTime(&SignupStartTime);

	//开始时间
	CDateTimeCtrl * pSignupStartTime=(CDateTimeCtrl *)GetDlgItem(IDC_SIGNUP_START_TIME);
	pSignupStartTime->SetTime(&SignupStartTime);

	//截止日期
//	CDateTimeCtrl * pSignupEndDate=(CDateTimeCtrl *)GetDlgItem(IDC_SIGNUP_END_DATE);
//	pSignupEndDate->SetTime(&SignupEndTime);

	//截止时间
//	CDateTimeCtrl * pSignupEndTime=(CDateTimeCtrl *)GetDlgItem(IDC_SIGNUP_END_TIME);
//	pSignupEndTime->SetTime(&SignupEndTime);

	for (INT i = 0; i < MAX_MATCH_ROUNDS; i++)
	{
		//局数初始化
		CComboBox *pPlayCount = (CComboBox *)GetDlgItem(IDC_COMBO_JUSHU1 + i);
		for (INT index = 0; index < 5; index++)
		{
			TCHAR szString[20] = TEXT("");
			_sntprintf(szString, CountArray(szString), TEXT("%d局"), index);

			pPlayCount->SetItemData(pPlayCount->InsertString(index, szString), index);
		}
		pPlayCount->SetCurSel(0);
		if (pLockTimeMatch->hMatchRounds[i].cbPlayCount > 0)
		{
			pPlayCount->SetCurSel(pLockTimeMatch->hMatchRounds[i].cbPlayCount);
		}

		SetDlgItemInt(IDC_EDIT_PROMOTION1 + i, (int)pLockTimeMatch->hMatchRounds[i].wPromotion);		
	}

	////复活机制
	//if (pLockTimeMatch->cbReviveEnabled)
	//{
	//	//保险卡设置
	//	if (pLockTimeMatch->cbSafeCardEnabled)
	//	{
	//		((CButton *)GetDlgItem(IDC_CHECK_SAFECARD_ENABLED))->SetCheck(TRUE);
	//	}

	//	//设置控件
	//	((CButton *)GetDlgItem(IDC_CHECK_REVIVE_ENABLED))->SetCheck(TRUE);

	//	//设置控件
	//	SetDlgItemInt(IDC_REVIVE_FEE,(int)pLockTimeMatch->lReviveFee);
	//	SetDlgItemInt(IDC_SAFECARD_FEE,(int)pLockTimeMatch->lSafeCardFee);		
	//	SetDlgItemInt(IDC_REVIVE_TIMES,pLockTimeMatch->cbReviveTimes);		
	//}

	return FALSE;
}

//保存输入
bool CDlgMatchLockTime::SaveInputInfo()
{
	//变量定义
	tagLockTimeMatch * pLockTimeMatch=(tagLockTimeMatch *)m_pGameMatchOption->cbMatchRule;

	//获取控件
	CComboBox * pComboBox=(CComboBox *)GetDlgItem(IDC_COMBO_MATCH_MODE);
	
	//基础配置
	pLockTimeMatch->lInitalBase = GetDlgItemInt(IDC_INITIAL_BASE_LOCK);
	pLockTimeMatch->lMatchInitScore=GetDlgItemInt(IDC_INIT_SCORE);
	/*pLockTimeMatch->lMatchCullScore=GetDlgItemInt(IDC_CULL_SCORE);
	pLockTimeMatch->wMinPlayCount=GetDlgItemInt(IDC_MIN_PLAYCOUNT);
	pLockTimeMatch->wMaxPlayCount=GetDlgItemInt(IDC_MAX_PLAYCOUNT);*/
	pLockTimeMatch->wStartUserCount=GetDlgItemInt(IDC_MIN_MATCH_USER);
	pLockTimeMatch->wMaxSignupUser=GetDlgItemInt(IDD_MAX_SIGNUP_USER);
	//pLockTimeMatch->wEndDelayTime=GetDlgItemInt(IDD_END_DELAY_TIME);	
	pLockTimeMatch->cbMatchMode=(BYTE)(pComboBox->GetItemData(pComboBox->GetCurSel()));

	//开赛人数
	if (pLockTimeMatch->wStartUserCount==0)
	{
		AfxMessageBox(TEXT("开赛人数设置不合法，请重新输入！"));

		GetDlgItem(IDC_MIN_MATCH_USER)->SetFocus();

		return false;
	}

	//报名人数
	if (pLockTimeMatch->wMaxSignupUser<pLockTimeMatch->wStartUserCount)
	{
		AfxMessageBox(TEXT("报名人数不能少于开赛人数，请重新输入！"));

		GetDlgItem(IDD_MAX_SIGNUP_USER)->SetFocus();

		return false;
	}
	
	//初始分数
	if (pLockTimeMatch->lInitalBase == 0)
	{
		AfxMessageBox(TEXT("初始底分设置不合法，请重新输入！"));

		GetDlgItem(IDC_INITIAL_BASE_LOCK)->SetFocus();

		return false;
	}
	//初始分数
	if (pLockTimeMatch->lMatchInitScore==0)
	{
		AfxMessageBox(TEXT("初始分数设置不合法，请重新输入！"));

		GetDlgItem(IDC_INIT_SCORE)->SetFocus();

		return false;
	}
	if (pLockTimeMatch->lInitalBase * 99 > pLockTimeMatch->lMatchInitScore)
	{
		AfxMessageBox(TEXT("初始分数必须是底分的100倍以上，请重新输入！"));

		GetDlgItem(IDC_INIT_SCORE)->SetFocus();
		
		return false;
	}
	INT iTotalRounds = 0;
	INT iTotalPlayCount = 0;
	//比赛配置
	for (INT i = 0; i < MAX_MATCH_ROUNDS; i++)
	{
		//局数
		CComboBox *pPlayCount = (CComboBox *)GetDlgItem(IDC_COMBO_JUSHU1 + i);
		pLockTimeMatch->hMatchRounds[i].cbPlayCount = pPlayCount->GetCurSel();
		
		if (pLockTimeMatch->hMatchRounds[i].cbPlayCount > 0)
		{
			iTotalRounds++;
			iTotalPlayCount += pLockTimeMatch->hMatchRounds[i].cbPlayCount;
		}
		else
			break;

		//晋级人数		
		pLockTimeMatch->hMatchRounds[i].wPromotion = GetDlgItemInt(IDC_EDIT_PROMOTION1 + i);		
		if (m_wKindID == 200) //斗地主
		{
			if (pLockTimeMatch->hMatchRounds[i].wPromotion % 3 != 0)
			{
				AfxMessageBox(TEXT("晋级人数必须是3的倍数，请重新输入！"));
				return false;
			}
		}

	}
	pLockTimeMatch->cbTotalRounds = iTotalRounds;
	pLockTimeMatch->cbTotalPlayCount = iTotalPlayCount;

	////有效局数
	//if (pLockTimeMatch->wMinPlayCount==0)
	//{
	//	AfxMessageBox(TEXT("有效局数设置不合法，请重新输入！"));

	//	GetDlgItem(IDC_MIN_PLAYCOUNT)->SetFocus();

	//	return false;
	//}

	//
	////最大局数
	//if (pLockTimeMatch->wMaxPlayCount!=0 && pLockTimeMatch->wMaxPlayCount<pLockTimeMatch->wMinPlayCount)
	//{
	//	AfxMessageBox(TEXT("最大局数设置不合法，请重新输入！"));

	//	GetDlgItem(IDC_MIN_PLAYCOUNT)->SetFocus();

	//	return false;
	//}
	
    
	//时间定义
	CTimeSpan DateSpad,TimeSpad;
	CTime StartSignupTime,StartSignupDate,BeginTime,BeginDate;		
	CDateTimeCtrl * pStartSignupDate,* pBeginDate,* pStartSignupTime,* pBeginTime;
    
	//开始比赛日期
	pBeginDate=(CDateTimeCtrl *)GetDlgItem(IDC_MATCH_START_DATE);
    pBeginDate->GetTime(BeginDate);

    //开始报名时间
    pStartSignupDate = (CDateTimeCtrl *)GetDlgItem(IDC_SIGNUP_START_DATE);
    pStartSignupDate->GetTime(StartSignupDate);

	//开始比赛时间
    pBeginTime = (CDateTimeCtrl *)GetDlgItem(IDC_MATCH_START_TIME);
	pBeginTime->GetTime(BeginTime);

	//开始报名时间
    pStartSignupTime = (CDateTimeCtrl *)GetDlgItem(IDC_SIGNUP_START_TIME);
    pStartSignupTime->GetTime(StartSignupTime);


	//合并时间
	CTime EndDateTime(BeginDate.GetYear(),BeginDate.GetMonth(),BeginDate.GetDay(),BeginTime.GetHour(),BeginTime.GetMinute(),BeginTime.GetSecond());
	CTime StartDateTime(StartSignupDate.GetYear(),StartSignupDate.GetMonth(),StartSignupDate.GetDay(),StartSignupTime.GetHour(),StartSignupTime.GetMinute(),StartSignupTime.GetSecond());	

	//比赛时间
	EndDateTime.GetAsSystemTime(pLockTimeMatch->MatchStartTime);
	StartDateTime.GetAsSystemTime(pLockTimeMatch->SignupStartTime);


	//日期校验
	DateSpad=BeginDate-StartSignupDate;
	if (DateSpad.GetTimeSpan() < 0)
	{
		AfxMessageBox(TEXT("游戏开始日期设置不合法，请重新输入！"));

		GetDlgItem(IDC_SIGNUP_END_DATE)->SetFocus();

		return false;
	}

	//时间校验
	TimeSpad=BeginTime-StartSignupTime;
	if (TimeSpad.GetTimeSpan() <= 0)
	{
		AfxMessageBox(TEXT("游戏开始时间设置不合法，请重新输入！"));

		GetDlgItem(IDC_SIGNUP_END_TIME)->SetFocus();

		return false;
	}

	////复活设置
	//if (IsDlgButtonChecked(IDC_CHECK_REVIVE_ENABLED))
	//{
	//	//设置变量
	//	pLockTimeMatch->cbReviveEnabled=TRUE;		

	//	//保险卡设置
	//	if (IsDlgButtonChecked(IDC_CHECK_SAFECARD_ENABLED)) 
	//	{
	//		pLockTimeMatch->cbSafeCardEnabled=TRUE;
	//	}
	//	else
	//	{
	//		pLockTimeMatch->cbSafeCardEnabled=FALSE;
	//	}

	//	//复活参数
	//	pLockTimeMatch->lReviveFee=GetDlgItemInt(IDC_REVIVE_FEE);
	//	pLockTimeMatch->lSafeCardFee=GetDlgItemInt(IDC_SAFECARD_FEE);		
	//	pLockTimeMatch->cbReviveTimes=GetDlgItemInt(IDC_REVIVE_TIMES);
	//}
	//else
	//{
	//	pLockTimeMatch->cbReviveEnabled=FALSE;
	//	pLockTimeMatch->cbSafeCardEnabled=FALSE;
	//}

	return true;
}

//调整控件
VOID CDlgMatchLockTime::RectifyControl(INT nWidth, INT nHeight)
{
	return;
}

//////////////////////////////////////////////////////////////////////////

//构造函数
CDlgMatchImmediate::CDlgMatchImmediate(): CDlgMatchItem(IDD_MATCH_IMMEDIATE)
{
}

//析构函数
CDlgMatchImmediate::~CDlgMatchImmediate()
{
}

BEGIN_MESSAGE_MAP(CDlgMatchImmediate, CDlgMatchItem)
    ON_EN_KILLFOCUS(IDC_INITIAL_SCORE1, &CDlgMatchImmediate::OnEnKillfocusInitialScore1)
    ON_EN_KILLFOCUS(IDC_START_USERCOUNT, &CDlgMatchImmediate::OnEnKillfocusStartUsercount)
END_MESSAGE_MAP()

//初始化函数
BOOL CDlgMatchImmediate::OnInitDialog()
{
	__super::OnInitDialog();

	//输入限制
	((CEdit *)GetDlgItem(IDC_START_USERCOUNT))->LimitText(3);
	((CEdit *)GetDlgItem(IDC_ANDROID_USERCOUNT))->LimitText(2);
	((CEdit *)GetDlgItem(IDC_INITIAL_BASE))->LimitText(8);
//	((CEdit *)GetDlgItem(IDC_INITIAL_SCORE))->LimitText(8);
	((CEdit *)GetDlgItem(IDC_PLAY_COUNT))->LimitText(3);
	((CEdit *)GetDlgItem(IDC_SWITCH_TABLE_COUNT))->LimitText(3);

	//变量定义
	tagImmediateMatch * pImmediateMatch=(tagImmediateMatch *)m_pGameMatchOption->cbMatchRule;

	//开赛人数
	if (pImmediateMatch->wStartUserCount!=0)
	{
		SetDlgItemInt(IDC_START_USERCOUNT,pImmediateMatch->wStartUserCount);
	}

	//AI数
	if (pImmediateMatch->wAndroidUserCount!=0)
	{
		SetDlgItemInt(IDC_ANDROID_USERCOUNT,pImmediateMatch->wAndroidUserCount);
	}

	//机器等待
	if (pImmediateMatch->wAndroidDelaySignupTime!=0)
	{
		SetDlgItemInt(IDC_ANDROID_DELAYTIME,pImmediateMatch->wAndroidDelaySignupTime);
	}

	//游戏底分
	if (pImmediateMatch->lInitalBase!=0)
	{
		SetDlgItemInt(IDC_INITIAL_BASE,(UINT)pImmediateMatch->lInitalBase);
	}

	//初始底分
	if(pImmediateMatch->lInitalScore != 0)
	{
	    SetDlgItemInt(IDC_INITIAL_SCORE1, (UINT)pImmediateMatch->lInitalScore);
	}

	////游戏局数
	//if(pImmediateMatch->wPlayCount != 0)
	//{
	//    SetDlgItemInt(IDC_PLAY_COUNT, pImmediateMatch->wPlayCount);
	//}
	
	for (INT i = 0; i < MAX_MATCH_ROUNDS; i++)
	{
		//局数初始化
		CComboBox *pPlayCount = (CComboBox *)GetDlgItem(IDC_COMBO_JUSHU1 + i);
		for (INT index = 0; index < 5; index++)
		{
			TCHAR szString[20] = TEXT("");
			_sntprintf(szString, CountArray(szString), TEXT("%d局"), index);

			pPlayCount->SetItemData(pPlayCount->InsertString(index, szString), index);
		}
		pPlayCount->SetCurSel(0);
		if (pImmediateMatch->hMatchRounds[i].cbPlayCount > 0)
		{
			pPlayCount->SetCurSel(pImmediateMatch->hMatchRounds[i].cbPlayCount);
		}
		
		//晋级初始化
		INT playcount = 3;
		if (m_wKindID == 200) //斗地主
			playcount = 3;

		CComboBox *pPromotion = (CComboBox *)GetDlgItem(IDC_COMBO_PROMOTION1 + i);
		for (INT index = 0; index < 6; index++)
		{			
			int temp = playcount + playcount * index;
			TCHAR szString[20] = TEXT("");
			_sntprintf(szString, CountArray(szString), TEXT("%d人"), temp);

			pPromotion->SetItemData(pPromotion->InsertString(index, szString), temp);
		}
		pPromotion->SetCurSel(0);	
		int iSel = pImmediateMatch->hMatchRounds[i].wPromotion / playcount -1;
		if (iSel >= 0)
		{
			pPromotion->SetCurSel(iSel);
		}
		else
			pPromotion->SetCurSel(0);

		//初始积分初始化
	//	SetDlgItemInt(IDC_INITIAL_SCORE1 + i, pImmediateMatch->hMatchRounds[i].lInitalScore);
	}
	/*for (INT i = 0; i < MAX_MATCH_ROUNDS - 1; i++)
	{
		((CButton *)GetDlgItem(IDC_RADIO_CUMULATIVE2 + i))->SetCheck(!pImmediateMatch->hMatchRounds[i].bResetFlag);
		((CButton *)GetDlgItem(IDC_RADIO_RESET2 + i))->SetCheck(pImmediateMatch->hMatchRounds[i].bResetFlag);
	}*/

	////换桌局数
	//if (pImmediateMatch->cbSwitchTableCount!=0)
	//{
	//	SetDlgItemInt(IDC_SWITCH_TABLE_COUNT,pImmediateMatch->cbSwitchTableCount);
	//}

	return TRUE;
}

//保存输入
bool CDlgMatchImmediate::SaveInputInfo()
{
    int iCount = 0;
    UINT uPromotion[10] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
    UINT uJushu[10] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
    UINT uPlayers = GetDlgItemInt(IDC_START_USERCOUNT);
    UINT uInitialScore = GetDlgItemInt(IDC_INITIAL_SCORE1);
    UINT uBaseScore = GetDlgItemInt(IDC_INITIAL_BASE);
    if(uBaseScore * 100 > uInitialScore)
    {
        AfxMessageBox(TEXT("初始底分至少为游戏底分的100倍，请重新输入！"), MB_ICONWARNING);
        GetDlgItem(IDC_INITIAL_SCORE1)->SetFocus();
        return false;
    }
    for(int i = IDC_COMBO_PROMOTION1; i < IDC_COMBO_PROMOTION10; i++)
    {
        uPromotion[iCount] = GetDlgItemInt(i);
        iCount++;
    }
    if(uPlayers < uPromotion[0])
    {
        AfxMessageBox(TEXT("晋级人数应该小于参赛玩家数，请重新输入！"), MB_ICONWARNING);
        return false;
    }
    iCount = 0;
    for(int i = IDC_COMBO_JUSHU1; i < IDC_COMBO_JUSHU10; i++)
    {
        uJushu[iCount] = GetDlgItemInt(i);
        iCount++;
    }
    if(uJushu[0] == 0)
    {
        AfxMessageBox(TEXT("晋级赛至少进行一轮且局数不为0，请重新输入！"), MB_ICONWARNING);
        return false;
    }
    //局数设置不为0的话，则要求每一轮晋级人数是递减或者不变
    for(int i = 0; i < 9; i++)
    {
        if(uJushu[i+1] != 0)
        {
            if(uPromotion[i + 1] > uPromotion[i])
            {
                AfxMessageBox(TEXT("晋级人数设置有误，晋级人数应每轮递减，请重新输入！"), MB_ICONWARNING);
                return false;
            }
        }
    }
	//变量定义
	tagImmediateMatch * pImmediateMatch=(tagImmediateMatch *)m_pGameMatchOption->cbMatchRule;

	INT iTotalRounds	= 0;
	INT iTotalPlayCount = 0;
	//比赛配置
	for (INT i = 0; i < MAX_MATCH_ROUNDS; i++)
	{
		//局数
		CComboBox *pPlayCount = (CComboBox *)GetDlgItem(IDC_COMBO_JUSHU1 + i);
		pImmediateMatch->hMatchRounds[i].cbPlayCount = pPlayCount->GetCurSel();

		if (pImmediateMatch->hMatchRounds[i].cbPlayCount > 0)
		{
			iTotalRounds++;
			iTotalPlayCount += pImmediateMatch->hMatchRounds[i].cbPlayCount;
		}
		else
			break;

		//晋级人数
		CComboBox *pPromotion = (CComboBox *)GetDlgItem(IDC_COMBO_PROMOTION1 + i);
		pImmediateMatch->hMatchRounds[i].wPromotion = (WORD)pPromotion->GetItemData(pPromotion->GetCurSel());

		//初始积分
	//	pImmediateMatch->hMatchRounds[i].lInitalScore = GetDlgItemInt(IDC_INITIAL_SCORE1 + i);
	}
	/*for (INT i = 0; i < MAX_MATCH_ROUNDS - 1; i++)
	{
		if (((CButton *)GetDlgItem(IDC_RADIO_RESET2 + i))->GetCheck() == BST_CHECKED)
		{
			pImmediateMatch->hMatchRounds[i].bResetFlag = TRUE;
		}
		else
		{
			pImmediateMatch->hMatchRounds[i].bResetFlag = FALSE;
		}
	}*/
	//pImmediateMatch->wPlayCount = GetDlgItemInt(IDC_PLAY_COUNT);
	pImmediateMatch->cbTotalRounds = iTotalRounds;
	pImmediateMatch->cbTotalPlayCount = iTotalPlayCount;

	pImmediateMatch->lInitalBase = GetDlgItemInt(IDC_INITIAL_BASE);
	pImmediateMatch->lInitalScore = GetDlgItemInt(IDC_INITIAL_SCORE1);
	pImmediateMatch->wStartUserCount=GetDlgItemInt(IDC_START_USERCOUNT);
	pImmediateMatch->wAndroidUserCount=GetDlgItemInt(IDC_ANDROID_USERCOUNT);	
	//pImmediateMatch->cbSwitchTableCount=GetDlgItemInt(IDC_SWITCH_TABLE_COUNT);
	pImmediateMatch->wAndroidDelaySignupTime=GetDlgItemInt(IDC_ANDROID_DELAYTIME);

	//比赛人数
	if (pImmediateMatch->wStartUserCount==0)
	{
		AfxMessageBox(TEXT("开赛人数设置不合法，请重新输入！"));

		//设置焦点
		GetDlgItem(IDC_START_USERCOUNT)->SetFocus();

		return false;
	}

	//游戏底分
	if (pImmediateMatch->lInitalBase==0)
	{
		AfxMessageBox(TEXT("游戏底分设置不合法，请重新输入！"));

		//设置焦点
		GetDlgItem(IDC_INITIAL_BASE)->SetFocus();

		return false;
	}

	//初始底分
	if(pImmediateMatch->lInitalScore == 0)
	{
	    AfxMessageBox(TEXT("初始底分设置不合法，请重新输入！"));

	    //设置焦点
	    GetDlgItem(IDC_INITIAL_SCORE1)->SetFocus();

	    return false;
	}

	////游戏局数
	//if(pImmediateMatch->wPlayCount == 0)
	//{
	//    AfxMessageBox(TEXT("游戏局数设置不合法，请重新输入！"));

	//    //设置焦点
	//    GetDlgItem(IDC_PLAY_COUNT)->SetFocus();

	//    return false;
	//}

	return true;
}

//调整控件
VOID CDlgMatchImmediate::RectifyControl(INT nWidth, INT nHeight)
{
	return;
}

//////////////////////////////////////////////////////////////////////////

//构造函数
CDlgMatchWizardItem::CDlgMatchWizardItem(UINT nIDTemplate) : CDialog(nIDTemplate)
{
	//设置变量
	m_bSaveData=true;

	//设置变量
	m_pDlgMatchWizard=NULL;
	m_pGameMatchOption=NULL;
	m_pMatchInfoBuffer=NULL;
	m_pRewardInfoBuffer=NULL;

	return;
}

//析构函数
CDlgMatchWizardItem::~CDlgMatchWizardItem()
{
}

//保存数据
bool CDlgMatchWizardItem::SaveItemData()
{
	//保存数据
	if ((m_hWnd!=NULL)&&(m_bSaveData==false))
	{
		//保存数据
		m_bSaveData=SaveInputInfo();

		//结果判断
		if (m_bSaveData==false) return false;
	}

	return true;
}

//创建向导
bool CDlgMatchWizardItem::ShowWizardItem(const CRect & rcRect, CWnd * pParentWnd)
{
	//创建窗口
	if (m_hWnd==NULL) 
	{
		//设置资源
		AfxSetResourceHandle(GetModuleHandle(MODULE_MANAGER_DLL_NAME));

		//创建窗口
		Create(m_lpszTemplateName,pParentWnd);
		SetWindowPos(NULL,rcRect.left,rcRect.top,rcRect.Width(),rcRect.Height(),SWP_NOZORDER|SWP_NOACTIVATE);

		//设置资源
		AfxSetResourceHandle(GetModuleHandle(NULL));
	}

	//设置变量
	m_bSaveData=false;

	//激活子项
	OnMatchItemActive();

	//显示窗口
	ShowWindow(SW_SHOW);

	return true;
}

//确定函数
VOID CDlgMatchWizardItem::OnOK() 
{ 
	//投递消息
	GetParent()->PostMessage(WM_COMMAND,MAKELONG(IDOK,0),0);

	return;
}

//取消消息
VOID CDlgMatchWizardItem::OnCancel() 
{ 
	//投递消息
	GetParent()->PostMessage(WM_COMMAND,MAKELONG(IDCANCEL,0),0);

	return;
}

//位置消息
VOID CDlgMatchWizardItem::OnSize(UINT nType, INT cx, INT cy)
{
	__super::OnSize(nType, cx, cy);

	//调整控件
	RectifyControl(cx,cy);

	return;
}

//////////////////////////////////////////////////////////////////////////

//构造函数
CDlgMatchWizardStep1::CDlgMatchWizardStep1() : CDlgMatchWizardItem(IDD_MATCH_WIZARD_1)
{
	//变量定义
	ZeroMemory(m_pDlgMatchItem,sizeof(m_pDlgMatchItem));

	return;
}

//析构函数
CDlgMatchWizardStep1::~CDlgMatchWizardStep1()
{
}

//控件绑定
VOID CDlgMatchWizardStep1::DoDataExchange(CDataExchange * pDX)
{
	__super::DoDataExchange(pDX);
}

//初始化函数
BOOL CDlgMatchWizardStep1::OnInitDialog()
{
	__super::OnInitDialog();

   CRect   temprect(0, 0, 1500, 1200);
   SetWindowPos(NULL, 0, 0, temprect.Width(), temprect.Height(), SWP_NOZORDER | SWP_NOMOVE);

	//初始化配置
	InitBaseOption();

    //添加子项
    m_pDlgMatchItem[0] = &m_DlgMatchSignup1;
    m_pDlgMatchItem[1] = &m_DlgMatchImmediate;
    m_pDlgMatchItem[2] = &m_DlgMatchAndroidBase;
    m_pDlgMatchItem[3] = &m_DlgMatchLockTime;
    //获取对象
    CComboBox * pComboBox = (CComboBox *)GetDlgItem(IDC_COMBO_MATCH_TYPE);
    if(pComboBox != NULL && pComboBox->GetCurSel() != LB_ERR)
    {
        //比赛类型
        BYTE cbMatchType = (BYTE)pComboBox->GetItemData(pComboBox->GetCurSel());
        if(cbMatchType == MATCH_TYPE_IMMEDIATE)
        {
            GetDlgItem(IDC_BUTTON3)->ShowWindow(TRUE);
            //GetDlgItem(IDC_BUTTON4)->ShowWindow(TRUE);
            GetDlgItem(IDC_BUTTON1)->ShowWindow(TRUE);
            GetDlgItem(IDC_BUTTON2)->ShowWindow(TRUE);
           
        }
        else
        {
            GetDlgItem(IDC_BUTTON3)->ShowWindow(FALSE);
            //GetDlgItem(IDC_BUTTON4)->ShowWindow(FALSE);
            GetDlgItem(IDC_BUTTON1)->ShowWindow(TRUE);
            GetDlgItem(IDC_BUTTON2)->ShowWindow(TRUE);
            
        }
        //事件通知
        for(int i = 0; i<CountArray(m_pDlgMatchItem); i++)
        {
            m_pDlgMatchItem[i]->OnEventMatchTypeChanged(cbMatchType);
        }
    }
    //变量定义
    CRect rcCreate(0, 0, 0, 0);

    //设置子项
    for(int i = 0; i<CountArray(m_pDlgMatchItem); i++)
    {
        //指针判断
        if(m_pDlgMatchItem[i] == NULL) continue;

        //设置控件		
        m_pDlgMatchItem[i]->SetGameMatchOption(m_pGameMatchOption);
        m_pDlgMatchItem[i]->SetMatchInfoBuffer(m_pMatchInfoBuffer);
        m_pDlgMatchItem[i]->SetRewardInfoBuffer(m_pRewardInfoBuffer);

        //创建子项		
        m_pDlgMatchItem[i]->CreateMatchItem(rcCreate, this);
    }

    //激活子项
    ActiveOptionItem(TAB_OPTION_SIGNUP1);
   
	return TRUE;
}

//保存输入
bool CDlgMatchWizardStep1::SaveInputInfo()
{
	//保存输入
	if (SaveBaseOption()==false) return false;

    CComboBox * pComboBox = (CComboBox *)GetDlgItem(IDC_COMBO_MATCH_TYPE);
    if(pComboBox != NULL && pComboBox->GetCurSel() != LB_ERR)
    {
        //比赛类型
        BYTE cbMatchType = (BYTE)pComboBox->GetItemData(pComboBox->GetCurSel());
        if(cbMatchType == MATCH_TYPE_IMMEDIATE)
        {
            //遍历子项
            for(int i = 0; i<CountArray(m_pDlgMatchItem); i++)
            {
                if(i == 3)
                    break;
                if(m_pDlgMatchItem[i]->SaveInputInfo() == false) return false;
            }
        }
        else
        {
            //遍历子项
            for(int i = 0; i<CountArray(m_pDlgMatchItem); i++)
            {
                if(i == 1)
                {
                    continue;
                }
                if(m_pDlgMatchItem[i]->SaveInputInfo() == false) return false;
            }
        }
    }
	

	return true;
}

//激活子项
VOID CDlgMatchWizardStep1::OnMatchItemActive()
{
	return;
}

//调整控件
VOID CDlgMatchWizardStep1::RectifyControl(INT nWidth, INT nHeight)
{
	return;
}

//基础配置
VOID CDlgMatchWizardStep1::InitBaseOption()
{
	//输入限制
	((CEdit *)GetDlgItem(IDC_EDIT_MATCH_NAME))->LimitText(8);		

	//比赛名称
	SetDlgItemText(IDC_EDIT_MATCH_NAME,m_pGameMatchOption->szMatchName);

	//比赛类型
	CComboBox * pComboBox=(CComboBox *)GetDlgItem(IDC_COMBO_MATCH_TYPE);
	if (pComboBox!=NULL)
	{
		//变量定义
        BYTE cbMatchType[] = {MATCH_TYPE_IMMEDIATE ,MATCH_TYPE_LOCKTIME, };
        LPCTSTR pszMatchType[] = {TEXT("即时赛类型"),TEXT("定时赛类型")};

		//构造类型
		for (INT i=0;i<CountArray(cbMatchType);i++)
		{
			int nIndex=pComboBox->AddString(pszMatchType[i]);
			pComboBox->SetItemData(nIndex,cbMatchType[i]);
			if (m_pGameMatchOption->cbMatchType==cbMatchType[i])
			{
				pComboBox->SetCurSel(nIndex);
			}
		}

		//默认选择
		if (pComboBox->GetCurSel()==CB_ERR) pComboBox->SetCurSel(1);
		if (m_pGameMatchOption->dwMatchID!=0) pComboBox->EnableWindow(FALSE);
	}

	//关联赛事
	//pComboBox=(CComboBox *)GetDlgItem(IDC_COMBO_RELATED_MATCH);
	//if (pComboBox!=NULL)
	//{
	//	//默认设置
	//	pComboBox->EnableWindow(FALSE);

	//	//定时赛
	//	if (m_pGameMatchOption->cbMatchType==MATCH_TYPE_LOCKTIME)
	//	{
	//		//加载比赛
	//		if (m_pMatchInfoBuffer!=NULL)
	//		{
	//			//变量定义
	//			tagGameMatchOption * pGameMatchOption=NULL;

	//			for(INT_PTR i=0;i<m_pMatchInfoBuffer->m_GameMatchOptionArray.GetCount();i++)
	//			{
	//				//获取对象
	//				pGameMatchOption=m_pMatchInfoBuffer->m_GameMatchOptionArray[i];
	//				if (pGameMatchOption->cbMatchType!=MATCH_TYPE_LOCKTIME) continue;
	//				if (pGameMatchOption->dwMatchID==m_pGameMatchOption->dwMatchID) continue;

	//				//变量定义
	//				bool bBreakLoop=false;
	//				tagGameMatchOption * pGameMatchOption1=NULL;
	//				for(INT_PTR j=0;j<m_pMatchInfoBuffer->m_GameMatchOptionArray.GetCount();j++)
	//				{
	//					//获取对象
	//					pGameMatchOption1=m_pMatchInfoBuffer->m_GameMatchOptionArray[j];
	//					if (pGameMatchOption->cbMatchType!=MATCH_TYPE_LOCKTIME) continue;

	//					if ((pGameMatchOption1->dwRelatedMatchID==pGameMatchOption->dwMatchID) && 
	//						(pGameMatchOption1->dwMatchID!=m_pGameMatchOption->dwMatchID))
	//					{
	//						bBreakLoop=true;
	//						break;
	//					}
	//				}

	//				//退出判断
	//				if (bBreakLoop==true) continue;
	//			
	//				//已经关联
	//				if (m_pGameMatchOption->dwMatchID!=0 && pGameMatchOption->dwRelatedMatchID!=0)
	//				{
	//					//变量定义
	//					bBreakLoop=false;
	//					pGameMatchOption1=pGameMatchOption;

	//					do
	//					{							
	//						if (pGameMatchOption1->dwRelatedMatchID==m_pGameMatchOption->dwMatchID)
	//						{
	//							bBreakLoop=true;
	//							break;
	//						}								
	//					}while (pGameMatchOption1=m_pMatchInfoBuffer->SearchMatchOption(pGameMatchOption1->dwRelatedMatchID));	

	//					//退出判断
	//					if (bBreakLoop==true) continue;
	//				}				

	//				//添加赛事
	//				int nIndex=pComboBox->AddString(pGameMatchOption->szMatchName);
	//				pComboBox->SetItemData(nIndex,pGameMatchOption->dwMatchID);
	//				if (pGameMatchOption->dwMatchID==m_pGameMatchOption->dwRelatedMatchID)
	//				{
	//					pComboBox->SetCurSel(nIndex);
	//				}
	//			}
	//		}
	//	}
	//}	
}

//保存配置
bool CDlgMatchWizardStep1::SaveBaseOption()
{
	//比赛信息	
	GetDlgItemText(IDC_EDIT_MATCH_NAME,m_pGameMatchOption->szMatchName,CountArray(m_pGameMatchOption->szMatchName));

	//验证名称
	if (m_pGameMatchOption->szMatchName[0]==0)
	{
		AfxMessageBox(TEXT("比赛名称不能为空，请重新输入！"));

		//设置焦点
		GetDlgItem(IDC_EDIT_MATCH_NAME)->SetFocus();

		return false;
	}

	//比赛类型
	CComboBox * pComboBox=(CComboBox *)GetDlgItem(IDC_COMBO_MATCH_TYPE);
	m_pGameMatchOption->cbMatchType=(BYTE)pComboBox->GetItemData(pComboBox->GetCurSel());	

	return true;
}

//激活子项
VOID CDlgMatchWizardStep1::ActiveOptionItem(BYTE cbItemIndex)
{
	//控件区域
    CWnd* pParent = GetParent();
    CRect rt;
    if(pParent)
    {
      
        pParent->GetWindowRect(&rt);
    }

	//设置控件
	if (m_pDlgMatchItem[cbItemIndex]->m_hWnd!=NULL)
	{
		m_pDlgMatchItem[cbItemIndex]->SetWindowPos(NULL,25,140,rt.Width()-20,rt.Height()-40,SWP_NOZORDER|SWP_SHOWWINDOW);
	}
	//设置控件
	for (int i=0; i<CountArray(m_pDlgMatchItem); i++)
	{
		if (i==cbItemIndex) continue;
		if (m_pDlgMatchItem[i]->m_hWnd!=NULL) 
        m_pDlgMatchItem[i]->ShowWindow(SW_HIDE);
	}

}

//选择变更
void CDlgMatchWizardStep1::OnCbnSelchangeComboMatchType()
{
	//获取对象
	CComboBox * pComboBox=(CComboBox *)GetDlgItem(IDC_COMBO_MATCH_TYPE);
	if (pComboBox!=NULL && pComboBox->GetCurSel()!=LB_ERR)
	{
		//比赛类型
		BYTE cbMatchType=(BYTE)pComboBox->GetItemData(pComboBox->GetCurSel());
        if(cbMatchType == MATCH_TYPE_IMMEDIATE)
        {
            GetDlgItem(IDC_BUTTON3)->ShowWindow(TRUE);
           // GetDlgItem(IDC_BUTTON4)->ShowWindow(TRUE);
            GetDlgItem(IDC_BUTTON1)->ShowWindow(TRUE);
            GetDlgItem(IDC_BUTTON2)->ShowWindow(TRUE);
           
        }
        else
        {
            GetDlgItem(IDC_BUTTON3)->ShowWindow(FALSE);
            //GetDlgItem(IDC_BUTTON4)->ShowWindow(FALSE);
            GetDlgItem(IDC_BUTTON1)->ShowWindow(TRUE);
            GetDlgItem(IDC_BUTTON2)->ShowWindow(TRUE);
        }
		//事件通知
		for (int i=0; i<CountArray(m_pDlgMatchItem); i++)
		{
			m_pDlgMatchItem[i]->OnEventMatchTypeChanged(cbMatchType);
		}
	}
}

//////////////////////////////////////////////////////////////////////////

//构造函数
CDlgMatchWizardStep2::CDlgMatchWizardStep2() : CDlgMatchWizardItem(IDD_MATCH_WIZARD_2)
{
	//设置变量
	m_pDlgMatchItem=NULL;
}

//析构函数
CDlgMatchWizardStep2::~CDlgMatchWizardStep2()
{
}

//控件绑定
VOID CDlgMatchWizardStep2::DoDataExchange(CDataExchange * pDX)
{
	__super::DoDataExchange(pDX);
}

//初始化函数
BOOL CDlgMatchWizardStep2::OnInitDialog()
{
	__super::OnInitDialog();	
	
	return FALSE;
}

//保存输入
bool CDlgMatchWizardStep2::SaveInputInfo()
{
	//保存输入
	if (m_pDlgMatchItem->SaveInputInfo() == false) return false;

	return true;
}

//激活子项
VOID CDlgMatchWizardStep2::OnMatchItemActive()
{
	//隐藏窗口
	if (m_pDlgMatchItem!=NULL) m_pDlgMatchItem->ShowWindow(SW_HIDE);

	//获取位置
	CRect rcItemRect;
	GetDlgItem(IDC_MATCH_OPTION_FRAME)->GetWindowRect(rcItemRect);
	ScreenToClient(&rcItemRect);

	//选择子项
	if (m_pGameMatchOption->cbMatchType==MATCH_TYPE_LOCKTIME)
	{
		m_pDlgMatchItem=&m_DlgMatchLockTime;
	}
	else
	{
		m_pDlgMatchItem=&m_DlgMatchImmediate;
	}

	//设置变量
	m_pDlgMatchItem->SetGameMatchOption(m_pGameMatchOption);
	m_pDlgMatchItem->SetGameKindID(GetDlgMatchWizard()->GetGameKindID());
	//显示子项
	rcItemRect.DeflateRect(2,12,2,2);
	m_pDlgMatchItem->ShowMatchItem(rcItemRect,this);
}

//调整控件
VOID CDlgMatchWizardStep2::RectifyControl(INT nWidth, INT nHeight)
{
	return;
}

//////////////////////////////////////////////////////////////////////////

//构造函数
CDlgMatchWizard::CDlgMatchWizard() : CDialog(IDD_MATCH_WIZARD)
{
	//设置变量
	m_wActiveIndex=INVALID_WORD;
	m_pWizardItem[0]=&m_MatchWizardStep1;
	m_pWizardItem[1]=&m_MatchWizardStep2;

	//配置信息
	m_RewardInfoBuffer.ResetMatchRewardInfo();
	ZeroMemory(&m_GameMatchOption,sizeof(m_GameMatchOption));
	m_GameMatchOption.cbSignupMode = SIGNUP_MODE_SIGNUP_FEE;
	m_GameMatchOption.cbJoinCondition = MATCH_JOINCD_MEMBER_ORDER;	
	m_GameMatchOption.cbDistributeRule =DISTRIBUTE_ALLOW|DISTRIBUTE_LAST_TABLE;
  
	return;
}

//析构函数
CDlgMatchWizard::~CDlgMatchWizard()
{
}

//初始化函数
BOOL CDlgMatchWizard::OnInitDialog()
{
	__super::OnInitDialog();

	//变量定义
	CMatchInfoManager MatchInfoManager;

	//获取机器码
	TCHAR szServiceMachine[LEN_MACHINE_ID];
	CWHService::GetMachineID(szServiceMachine);

	//读取信息
	MatchInfoManager.LoadGameMatchOption(m_wKindID,szServiceMachine,m_MatchInfoBuffer);

	//读取奖励
	if (m_GameMatchOption.dwMatchID!=0)
	{
		MatchInfoManager.LoadGameMatchReward(m_GameMatchOption.dwMatchID,m_RewardInfoBuffer);
	}	

	//激活向导
	ActiveWizardItem(0);

	return FALSE;
}

//确定函数
VOID CDlgMatchWizard::OnOK()
{
	if ((m_wActiveIndex+1)<CountArray(m_pWizardItem))
	{
		OnBnClickedNext();
	}
	else
	{
		OnBnClickedFinish();
	}

	return;
}


//获取配置
VOID CDlgMatchWizard::GetGameMatchOption(tagGameMatchOption & GameMatchOption)
{
	//设置变量
	GameMatchOption=m_GameMatchOption;
}

//设置配置
VOID CDlgMatchWizard::SetGameMatchOption(tagGameMatchOption & GameMatchOption)
{
	//设置变量
	m_GameMatchOption=GameMatchOption;
}

//激活向导
bool CDlgMatchWizard::ActiveWizardItem(WORD wIndex)
{
	//判断状态
	if (m_wActiveIndex==wIndex)
	{
		m_pWizardItem[m_wActiveIndex]->SetFocus();
		return true;
	}

	//保存旧项
	CDlgMatchWizardItem * pItemWizard=NULL;
	if (m_wActiveIndex<CountArray(m_pWizardItem))
	{
		//设置变量
		pItemWizard=m_pWizardItem[m_wActiveIndex];

		//保存数据
		if ((wIndex>m_wActiveIndex)&&(m_pWizardItem[m_wActiveIndex]->SaveItemData()==false)) return false;
	}

	//获取位置
	CRect rcItemRect;
	GetDlgItem(IDC_MATCH_FRAME)->GetWindowRect(rcItemRect);
	ScreenToClient(&rcItemRect);

	//设置新项
	m_pWizardItem[wIndex]->m_pDlgMatchWizard=this;
	m_pWizardItem[wIndex]->m_pGameMatchOption=&m_GameMatchOption;
	m_pWizardItem[wIndex]->m_pMatchInfoBuffer=&m_MatchInfoBuffer;
	m_pWizardItem[wIndex]->m_pRewardInfoBuffer=&m_RewardInfoBuffer;

	//创建新项
	m_wActiveIndex=wIndex;
	m_pWizardItem[m_wActiveIndex]->ShowWizardItem(rcItemRect,this);

	//激活新项
	m_pWizardItem[m_wActiveIndex]->SetFocus();
	if (pItemWizard!=NULL) pItemWizard->ShowWindow(SW_HIDE);

	//界面变量
	CButton * pButtonLast=(CButton * )GetDlgItem(IDC_LAST);
	CButton * pButtonNext=(CButton * )GetDlgItem(IDC_NEXT);
	CButton * pButtonFinish=(CButton * )GetDlgItem(IDC_FINISH);

	//进度界面
	pButtonFinish->EnableWindow(TRUE);
	pButtonNext->EnableWindow(((m_wActiveIndex+1)<CountArray(m_pWizardItem))?TRUE:FALSE);
	pButtonLast->EnableWindow((m_wActiveIndex>0)?TRUE:FALSE);

	//构造标题
	TCHAR szTitle[128]=TEXT("");
	_sntprintf_s(szTitle,CountArray(szTitle),TEXT("比赛配置向导 --- [ 步骤 %d ]"),m_wActiveIndex+1);
	
	//设置标题
	SetWindowText(szTitle);

	return true;
}

//奖励转换
VOID CDlgMatchWizard::TransferMatchReward(CString & strRewardGold,CString & strRewardIngot,CString & szRewardExperience)
{
	//设置参数
	strRewardGold.Empty();
	strRewardIngot.Empty();
	szRewardExperience.Empty();

	//变量定义
	CString strRewardItem;
	tagMatchRewardInfo * pMatchRewardInfo=NULL;

	//转换奖励
	for (WORD wRandID=1; wRandID<=m_RewardInfoBuffer.GetMatchRewardCount(); wRandID++)
	{
		//奖励信息
		pMatchRewardInfo=m_RewardInfoBuffer.SearchMatchReward(wRandID);

		//金币奖励
		strRewardItem.Format(TEXT("%I64d|"),pMatchRewardInfo->lRewardGold);
		strRewardGold.Append(strRewardItem);

		//元宝奖励
		strRewardItem.Format(TEXT("%I64d|"),pMatchRewardInfo->lRewardIngot);
		strRewardIngot.Append(strRewardItem);

		//经验奖励
		strRewardItem.Format(TEXT("%d|"), pMatchRewardInfo->dwRewardTicket);
		szRewardExperience.Append(strRewardItem);
	}
}

//上一步
VOID CDlgMatchWizard::OnBnClickedLast()
{
	//效验参数
	//ASSERT(m_wActiveIndex>0);
	//ASSERT(m_wActiveIndex<CountArray(m_pWizardItem));

	//切换页面
	ActiveWizardItem(m_wActiveIndex-1);

	return;
}

//下一步
VOID CDlgMatchWizard::OnBnClickedNext()
{
	//效验参数
	//ASSERT((m_wActiveIndex+1)<CountArray(m_pWizardItem));

	//激活页面
	ActiveWizardItem(m_wActiveIndex+1);

	return;
}

//完成按钮
VOID CDlgMatchWizard::OnBnClickedFinish()
{
	//保存设置
	////ASSERT(m_wActiveIndex>=1);
	if (m_pWizardItem[m_wActiveIndex]->SaveItemData()==false) return;

    //获取对象
    CComboBox * pComboBox = (CComboBox *)GetDlgItem(IDC_COMBO_MATCH_TYPE);
    if(pComboBox != NULL && pComboBox->GetCurSel() != LB_ERR)
    {
        //比赛类型
        BYTE cbMatchType = (BYTE)pComboBox->GetItemData(pComboBox->GetCurSel());
        if(cbMatchType == MATCH_TYPE_IMMEDIATE)
        {
            //保存子项
            for(WORD i = 0; i<CountArray(m_pWizardItem); i++)
            {
                if(i == 3)
                {
                    break;
                }
                if((m_pWizardItem[i] != NULL) && (m_pWizardItem[i]->SaveItemData() == false))
                {
                    ActiveWizardItem(i);
                    return;
                }
            }
        }
        else
        {
            //保存子项
            for(WORD i = 0; i<CountArray(m_pWizardItem); i++)
            {
                if(i == 1)
                {
                    continue;
                }
                if((m_pWizardItem[i] != NULL) && (m_pWizardItem[i]->SaveItemData() == false))
                {
                    ActiveWizardItem(i);
                    return;
                }
            }
        }
		
	}
    tagImmediateMatch * pImmediateMatch = (tagImmediateMatch *)m_GameMatchOption.cbMatchRule;
    if(pImmediateMatch->wStartUserCount < 15 && pImmediateMatch->bAndroidDebug)
    {
        m_pWizardItem[m_wActiveIndex]->m_bSaveData = false;
       
        AfxMessageBox(TEXT("设置比赛人数过少，设置AI赢得比赛不生效!"));
        return;
    }

	//房间信息
	tagCreateMatchInfo CreateMatchInfo;
	ZeroMemory(&CreateMatchInfo,sizeof(CreateMatchInfo));

	//基础信息
	CreateMatchInfo.wKindID=m_wKindID;
	CreateMatchInfo.dwMatchID=m_GameMatchOption.dwMatchID;
	CreateMatchInfo.lMatchNo=m_GameMatchOption.lMatchNo;	
	CreateMatchInfo.cbMatchType=m_GameMatchOption.cbMatchType;	

	//报名信息
	CreateMatchInfo.cbFeeType=m_GameMatchOption.cbFeeType;	
	CreateMatchInfo.lSignupFee=m_GameMatchOption.lSignupFee;
	CreateMatchInfo.cbDeductArea=m_GameMatchOption.cbDeductArea;
	CreateMatchInfo.cbSignupMode=m_GameMatchOption.cbSignupMode;	
	CreateMatchInfo.cbJoinCondition=m_GameMatchOption.cbJoinCondition;	
	CreateMatchInfo.cbMemberOrder=m_GameMatchOption.cbMemberOrder;	
	CreateMatchInfo.dwExperience=m_GameMatchOption.dwExperience;	
	CreateMatchInfo.dwFromMatchID=m_GameMatchOption.dwFromMatchID;	
	CreateMatchInfo.cbFilterType=m_GameMatchOption.cbFilterType;
	CreateMatchInfo.wMaxRankID=m_GameMatchOption.wMaxRankID;	
	CreateMatchInfo.MatchEndDate=m_GameMatchOption.MatchEndDate;
	CreateMatchInfo.MatchStartDate=m_GameMatchOption.MatchStartDate;

	//排名方式
	CreateMatchInfo.cbRankingMode=m_GameMatchOption.cbRankingMode;
	CreateMatchInfo.wCountInnings=m_GameMatchOption.wCountInnings;
	CreateMatchInfo.cbFilterGradesMode=m_GameMatchOption.cbFilterGradesMode;

	//拷贝信息
	lstrcpyn(CreateMatchInfo.szMatchName,m_GameMatchOption.szMatchName,CountArray(CreateMatchInfo.szMatchName));

	//分组配置
	CreateMatchInfo.cbDistributeRule=m_GameMatchOption.cbDistributeRule;
	CreateMatchInfo.wMinDistributeUser=m_GameMatchOption.wMinDistributeUser;
	CreateMatchInfo.wDistributeTimeSpace=m_GameMatchOption.wDistributeTimeSpace;
	CreateMatchInfo.wMinPartakeGameUser=m_GameMatchOption.wMinPartakeGameUser;
	CreateMatchInfo.wMaxPartakeGameUser=m_GameMatchOption.wMaxPartakeGameUser;

	//转换奖励
	CString strRewardGold,strRewardIngot,strRewardExperience;
	TransferMatchReward(strRewardGold,strRewardIngot,strRewardExperience);

	//比赛奖励
	lstrcpyn(CreateMatchInfo.szRewardGold,strRewardGold,CountArray(CreateMatchInfo.szRewardGold));
	lstrcpyn(CreateMatchInfo.szRewardIngot,strRewardIngot,CountArray(CreateMatchInfo.szRewardIngot));
	lstrcpyn(CreateMatchInfo.szRewardExperience,strRewardExperience,CountArray(CreateMatchInfo.szRewardExperience));

	//扩展配置
	CWHService::GetMachineID(CreateMatchInfo.szServiceMachine);
	CopyMemory(&CreateMatchInfo.cbMatchRule,&m_GameMatchOption.cbMatchRule,sizeof(CreateMatchInfo.cbMatchRule));

	//比赛时间
	if (CreateMatchInfo.cbMatchType==MATCH_TYPE_IMMEDIATE)
	{
		lstrcpyn(CreateMatchInfo.szMatchDate,TEXT("全天24小时循环开赛"),CountArray(CreateMatchInfo.szMatchDate));
	}

//	//比赛时间
	//if (CreateMatchInfo.cbMatchType==MATCH_TYPE_LOCKTIME)
//	{
//		tagLockTimeMatch * pLockTimeMatch=(tagLockTimeMatch *)m_GameMatchOption.cbMatchRule;
//		_sntprintf_s(CreateMatchInfo.szMatchDate,CountArray(CreateMatchInfo.szMatchDate),TEXT("%4d-%02d-%02d -- %04d-%02d-%02d"),pLockTimeMatch->MatchStartTime.wYear,pLockTimeMatch->MatchStartTime.wMonth,pLockTimeMatch->MatchStartTime.wDay,pLockTimeMatch->MatchEndTime.wYear,pLockTimeMatch->MatchEndTime.wMonth,pLockTimeMatch->MatchEndTime.wDay);
//	}

	//变量定义
	tagGameMatchOption GameMatchResult;
	CMatchInfoManager MatchInfoManager;
	
	//插入比赛
	if (CreateMatchInfo.dwMatchID==0)
	{
		if (MatchInfoManager.InsertGameMatchOption(&CreateMatchInfo,GameMatchResult)==false) return;

		//提示消息
		CTraceService::TraceString(TEXT("游戏比赛创建成功"),TraceLevel_Normal);
	}

	//修改比赛
	if (CreateMatchInfo.dwMatchID!=0)
	{
		//修改房间
		if (MatchInfoManager.ModifyGameMatchOption(&CreateMatchInfo,GameMatchResult)==false) return;

		//提示消息
		CTraceService::TraceString(TEXT("游戏比赛配置成功"),TraceLevel_Normal);
	}

	//设置标识
	m_GameMatchOption.dwMatchID=GameMatchResult.dwMatchID;

	//比赛奖励
	m_GameMatchOption.wRewardCount=GameMatchResult.wRewardCount;
	CopyMemory(m_GameMatchOption.MatchRewardInfo,GameMatchResult.MatchRewardInfo,sizeof(m_GameMatchOption.MatchRewardInfo));

	//关闭窗口
	EndDialog(IDOK);

	return;
}


void CDlgMatchAndroidBase::OnEnKillfocusEditInitAndroidMax()
{
    // TODO:  在此添加控件通知处理程序代码
    static BOOL flag = false;
    UINT uMax = GetDlgItemInt(IDC_EDIT_INIT_ANDROID_MAX);
    UINT uMin = GetDlgItemInt(IDC_EDIT_INIT_ANDROID_MIN);
    if(uMax <= uMin)
    {
        AfxMessageBox(TEXT("AI初始人数范围设置有误，请重新输入！"), MB_ICONWARNING); 
        GetDlgItem(IDC_EDIT_INIT_ANDROID_MAX)->SetFocus();
        flag = false;
        return;
       
    }
    if(!flag)
    {
        GetDlgItem(IDC_CHECK_ANDROID_WIN)->SetFocus();
        flag = TRUE;
    }
    
    return;
}


void CDlgMatchAndroidBase::OnEnKillfocusEditTotalSection()
{
    // TODO:  在此添加控件通知处理程序代码
    UINT uSection = GetDlgItemInt(IDC_EDIT_TOTAL_SECTION);
    if(uSection < 1 || uSection>10)
    {
        AfxMessageBox(TEXT("请输入1—>10阶段数值！"), MB_ICONWARNING);
        GetDlgItem(IDC_EDIT_TOTAL_SECTION)->SetFocus();
        SetDlgItemInt(IDC_EDIT_TOTAL_SECTION,1);
    }
   
    return;
}


void CDlgMatchImmediate::OnEnKillfocusInitialScore1()
{
    // TODO:  在此添加控件通知处理程序代码
    //游戏底分
    LONGLONG lScore = GetDlgItemInt(IDC_INITIAL_SCORE1);
    LONGLONG lScoreBase = GetDlgItemInt(IDC_INITIAL_BASE);
    if(lScore<(100*lScoreBase))
    {
        AfxMessageBox(TEXT("初始底分至少为游戏底分的100倍，请重新输入！"),MB_ICONWARNING);
        GetDlgItem(IDC_INITIAL_SCORE1)->SetFocus();
        SetDlgItemInt(IDC_INITIAL_SCORE1,lScoreBase*100);
    }

    return;
}

void CDlgMatchSignup1::OnEnKillfocusRankidEnd()
{
    // TODO:  在此添加控件通知处理程序代码

    UINT uMax = GetDlgItemInt(IDC_RANKID_END);
    UINT uMin = GetDlgItemInt(IDC_RANKID_START);
    if(uMax < uMin)
    {
        AfxMessageBox(TEXT("名次范围输入不合法，请重新输入！"), MB_ICONWARNING);
        GetDlgItem(IDC_RANKID_END)->SetFocus();    
        SetDlgItemInt(IDC_RANKID_END,uMin+1);
    }
  
    return;
}



void CDlgMatchAndroidBase::OnEnChangeEditTotalSection()
{
    // TODO:  如果该控件是 RICHEDIT 控件，它将不
    // 发送此通知，除非重写 CDlgMatchItem::OnInitDialog()
    // 函数并调用 CRichEditCtrl().SetEventMask()，
    // 同时将 ENM_CHANGE 标志“或”运算到掩码中。

    // TODO:  在此添加控件通知处理程序代码
    UINT uSection = GetDlgItemInt(IDC_EDIT_TOTAL_SECTION);
    for(int i = IDC_EDIT_SECTION1; i <= IDC_EDIT_SECTION10; i++)
    {
        GetDlgItem(i)->EnableWindow(TRUE);
        SetDlgItemInt(i, 0);
    }
    if(uSection < 0 || uSection>10)
        return;
    switch(uSection)
    {
        case 1:
        {
            SetDlgItemInt(IDC_EDIT_SECTION1, 1);
            for(int i = IDC_EDIT_SECTION2; i <= IDC_EDIT_SECTION10; i++)
            {
                GetDlgItem(i)->EnableWindow(FALSE);
            }
            break;
        }
        case 2:
        {
            SetDlgItemInt(IDC_EDIT_SECTION1, 1);
            SetDlgItemInt(IDC_EDIT_SECTION2, 1);
            for(int i = IDC_EDIT_SECTION3; i <= IDC_EDIT_SECTION10; i++)
            {
                GetDlgItem(i)->EnableWindow(FALSE);
            }
            break;
        }
        case 3:
        {
            SetDlgItemInt(IDC_EDIT_SECTION1, 1);
            SetDlgItemInt(IDC_EDIT_SECTION2, 1);
            SetDlgItemInt(IDC_EDIT_SECTION3, 1);
            for(int i = IDC_EDIT_SECTION4; i <= IDC_EDIT_SECTION10; i++)
            {
                GetDlgItem(i)->EnableWindow(FALSE);
            }
            break;
        }
        case 4:
        {
            for(int i = IDC_EDIT_SECTION1; i < IDC_EDIT_SECTION5; i++)
            {
                SetDlgItemInt(i, 1);
            }
            for(int i = IDC_EDIT_SECTION5; i <= IDC_EDIT_SECTION10; i++)
            {
                GetDlgItem(i)->EnableWindow(FALSE);
            }
            break;
        }
        case 5:
        {
            for(int i = IDC_EDIT_SECTION1; i < IDC_EDIT_SECTION6; i++)
            {
                SetDlgItemInt(i, 1);
            }
            for(int i = IDC_EDIT_SECTION6; i <= IDC_EDIT_SECTION10; i++)
            {
                GetDlgItem(i)->EnableWindow(FALSE);
            }
            break;
        }
        case 6:
        {
            for(int i = IDC_EDIT_SECTION1; i < IDC_EDIT_SECTION7; i++)
            {
                SetDlgItemInt(i, 1);
            }
            for(int i = IDC_EDIT_SECTION7; i <= IDC_EDIT_SECTION10; i++)
            {
                GetDlgItem(i)->EnableWindow(FALSE);
            }
            break;
        }
        case 7:
        {
            for(int i = IDC_EDIT_SECTION1; i < IDC_EDIT_SECTION8; i++)
            {
                SetDlgItemInt(i, 1);
            }
            for(int i = IDC_EDIT_SECTION8; i <= IDC_EDIT_SECTION10; i++)
            {
                GetDlgItem(i)->EnableWindow(FALSE);
            }
            break;
        }
        case 8:
        {
            for(int i = IDC_EDIT_SECTION1; i < IDC_EDIT_SECTION9; i++)
            {
                SetDlgItemInt(i, 1);
            }
            for(int i = IDC_EDIT_SECTION9; i <= IDC_EDIT_SECTION10; i++)
            {
                GetDlgItem(i)->EnableWindow(FALSE);
            }
            break;
        }
        case 9:
        {
            for(int i = IDC_EDIT_SECTION1; i < IDC_EDIT_SECTION10; i++)
            {
                SetDlgItemInt(i, 1);
            }

            GetDlgItem(IDC_EDIT_SECTION10)->EnableWindow(FALSE);

            break;
        }
        case 10:
        {
            for(int i = IDC_EDIT_SECTION1; i <= IDC_EDIT_SECTION10; i++)
            {
                SetDlgItemInt(i, 1);
            }
            break;
        }
        default:
            break;
    }
    return;
}


void CDlgMatchWizardStep1::OnBnClickedButton1()
{
    // TODO:  在此添加控件通知处理程序代码
    ActiveOptionItem(0);
}


void CDlgMatchWizardStep1::OnBnClickedButton2()
{
    // TODO:  在此添加控件通知处理程序代码
    CComboBox * pComboBox = (CComboBox *)GetDlgItem(IDC_COMBO_MATCH_TYPE);
    if(pComboBox != NULL && pComboBox->GetCurSel() != LB_ERR)
    {
        //比赛类型
        BYTE cbMatchType = (BYTE)pComboBox->GetItemData(pComboBox->GetCurSel());
        if(cbMatchType == MATCH_TYPE_IMMEDIATE)
        {
            ActiveOptionItem(1);
        }
        else
        {
            ActiveOptionItem(3);
        }
    }  
}


void CDlgMatchWizardStep1::OnBnClickedButton3()
{
    // TODO:  在此添加控件通知处理程序代码
    ActiveOptionItem(2);
}


void CDlgMatchWizardStep1::OnBnClickedButton4()
{
    // TODO:  在此添加控件通知处理程序代码
    ActiveOptionItem(3);
}
BEGIN_MESSAGE_MAP(CDlgMatchLockTime, CDlgMatchItem)
    ON_EN_KILLFOCUS(IDC_INIT_SCORE, &CDlgMatchLockTime::OnEnKillfocusInitScore)
    ON_EN_KILLFOCUS(IDC_MIN_MATCH_USER, &CDlgMatchLockTime::OnEnKillfocusMinMatchUser)
END_MESSAGE_MAP()


void CDlgMatchLockTime::OnEnKillfocusInitScore()
{
    // TODO:  在此添加控件通知处理程序代码
    LONGLONG lScore = GetDlgItemInt(IDC_INIT_SCORE);
    LONGLONG lScoreBase = GetDlgItemInt(IDC_INITIAL_BASE_LOCK);
    if(lScore<(100 * lScoreBase))
    {
        AfxMessageBox(TEXT("初始底分至少为游戏底分的100倍，请重新输入！"), MB_ICONWARNING);
        GetDlgItem(IDC_INIT_SCORE)->SetFocus();
        SetDlgItemInt(IDC_INIT_SCORE, lScoreBase * 100);
    }

    return;
}


void CDlgMatchImmediate::OnEnKillfocusStartUsercount()
{
    // TODO:  在此添加控件通知处理程序代码
    BOOL flag;
    int iMatchPeople = GetDlgItemInt(IDC_START_USERCOUNT, &flag, TRUE);
    //变量定义
    tagImmediateMatch * pImmediateMatch = (tagImmediateMatch *)m_pGameMatchOption->cbMatchRule;
    if(iMatchPeople != 0)
    {
        if(m_wKindID == 200) //斗地主
        {
            if(iMatchPeople % 3 != 0)
            {
                AfxMessageBox(TEXT("斗地主比赛人数需要为3的倍数，请重新输入！"), MB_ICONWARNING);
                GetDlgItem(IDC_START_USERCOUNT)->SetFocus();
                return;
            }
        }
       
        for(INT i = 0; i < MAX_MATCH_ROUNDS; i++)
        {
            //晋级初始化
            INT playcount = 3;
            if(m_wKindID == 200) //斗地主
                playcount = 3;

            CComboBox *pPromotion = (CComboBox *)GetDlgItem(IDC_COMBO_PROMOTION1 + i);
            pPromotion->ResetContent();
            for(INT index = 0; index < iMatchPeople / 3; index++)
            {
                int temp = playcount + playcount * index;
                TCHAR szString[20] = TEXT("");
                _sntprintf(szString, CountArray(szString), TEXT("%d人"), temp);

                pPromotion->SetItemData(pPromotion->InsertString(index, szString), temp);
            }
            pPromotion->SetCurSel(0);
            int iSel = pImmediateMatch->hMatchRounds[i].wPromotion / playcount - 1;
            if(iSel >= 0)
            {
                pPromotion->SetCurSel(iSel);
            }
            else
                pPromotion->SetCurSel(0);
        }

    }

    return;
}

void CDlgMatchLockTime::OnEnKillfocusMinMatchUser()
{
    // TODO:  在此添加控件通知处理程序代码
    BOOL flag;
    int iMatchPeople = GetDlgItemInt(IDC_MIN_MATCH_USER, &flag, TRUE);

    if(iMatchPeople != 0)
    {
        if(m_wKindID == 200) //斗地主
        {
            if(iMatchPeople % 3 != 0)
            {
                AfxMessageBox(TEXT("斗地主比赛人数需要为3的倍数，请重新输入！"), MB_ICONWARNING);
                GetDlgItem(IDC_MIN_MATCH_USER)->SetFocus();
                return;
            }
        }
    }
}
