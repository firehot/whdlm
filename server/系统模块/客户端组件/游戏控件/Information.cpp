#include "StdAfx.h"
#include "Resource.h"
#include "Information.h"

//////////////////////////////////////////////////////////////////////////////////

//ʱ????ʶ
#define IDI_MESSAGE					100									//??Ϣ??ʶ

//????λ??
#define SMB_WINDOW_WIDTH			230									//??С????

//ͼ??ƫ??
#define SMB_ICON_LEFT				20									//ͼ??ƫ??
#define SMB_ICON_WIDTH				32									//ͼ??????
#define SMB_ICON_HEIGHT				32									//ͼ???߶?

//?ַ?ƫ??
#define SMB_STRING_TOP				25									//?ַ?ƫ??
#define SMB_STRING_LEFT				20									//?ַ?ƫ??
#define SMB_STRING_RIGHT			40									//?ַ?ƫ??
#define SMB_STRING_WIDTH			600									//????????
#define SMB_STRING_HEIGHT			600									//????????

//??ťƫ??
#define SMB_BUTTON_TOP				25									//??ťƫ??
#define SMB_BUTTON_LEFT				12									//??ťƫ??
#define SMB_BUTTON_RIGHT			12									//??ťƫ??
#define SMB_BUTTON_BOTTOM			12									//??ťƫ??
#define SMB_BUTTON_SPACE			20									//??ť????
#define SMB_BUTTON_WIDTH			65									//??ťƫ??
#define SMB_BUTTON_HEIGHT			24									//??ťƫ??

//????ƫ??
#define ROUND_XSPACE				2									//????ƫ??
#define ROUND_TSPACE				1									//????ƫ??
#define ROUND_BSPACE				3									//????ƫ??
//////////////////////////////////////////////////////////////////////////////////

//ͼ????ʶ
const TCHAR* const szLableIcoWarnControlName = TEXT("LableIcoWarn");
const TCHAR* const szLableIcoErrorControlName = TEXT("LableIcoError");
const TCHAR* const szLableIcoQuestControlName = TEXT("LableIcoQuest");
const TCHAR* const szLableIcoInfoControlName = TEXT("LableIcoInfo");

//??ť??ʶ
const TCHAR* const szButtonAbortControlName = TEXT("ButtonAbort");
const TCHAR* const szButtonRetryControlName = TEXT("ButtonRetry");
const TCHAR* const szButtonIgnoreControlName = TEXT("ButtonIgnore");
const TCHAR* const szButtonYESControlName = TEXT("ButtonYES");
const TCHAR* const szButtonNOControlName = TEXT("ButtonNO");
const TCHAR* const szButtonOKControlName = TEXT("ButtonOK");
const TCHAR* const szButtonCancleControlName = TEXT("ButtonCancle");

//??????Ϣ
const TCHAR* const szTextTipControlName = TEXT("TextTip");

//?رհ?ť
const TCHAR* const szButtonCloseControlName = TEXT("ButtonClose");

//////////////////////////////////////////////////////////////////////////////////

BEGIN_MESSAGE_MAP(CInformation, CFGuiDialog)
	ON_WM_TIMER()
END_MESSAGE_MAP()


//////////////////////////////////////////////////////////////////////////////////

//???캯??
CInformation::CInformation(CWnd * pParentWnd): CFGuiDialog(IDD_MESSAGE_BOX, pParentWnd)
{
	//???ñ???
	m_uType=MB_OK;

	//????????
	m_nElapse=0;
	m_nBtCount=0;

	//?ؼ?????

	ZeroMemory(m_uButtonID,sizeof(m_uButtonID));

	return;
}

//????????
CInformation::~CInformation()
{
}

//??ʼ????Ϣ
BOOL CInformation::OnInitDialog()
{
	//???ñ???
	SetWindowText(m_strCaption);


	//???д???
	SetActiveWindow();
	SetForegroundWindow();
	CenterWindow(GetParent());

	//????ʱ??
	//if (m_nElapse!=0) SetTimer(IDI_MESSAGE,1000,NULL);

	UpdateUI();

	return FALSE;
}

//??ʼ?ؼ?
void CInformation::InitControlUI()
{
	__super::InitControlUI();

}

//??Ϣ????
void CInformation::Notify(TNotifyUI &  msg)
{
	__super::Notify(msg);

	//??ȡ????
	CControlUI * pControlUI = msg.pSender;

	//?????¼?
	if (lstrcmp(msg.sType, TEXT("click")) == 0)
	{
		if(lstrcmp(pControlUI->GetName(), szButtonAbortControlName)==0)
		{
			EndDialog(IDABORT);
		}
		if(lstrcmp(pControlUI->GetName(), szButtonRetryControlName)==0)
		{
			EndDialog(IDRETRY);
		}
		if(lstrcmp(pControlUI->GetName(), szButtonIgnoreControlName)==0)
		{
			EndDialog(IDIGNORE);
		}
		if(lstrcmp(pControlUI->GetName(), szButtonYESControlName)==0)
		{
			EndDialog(IDYES);
		}
		if(lstrcmp(pControlUI->GetName(), szButtonNOControlName)==0)
		{
			EndDialog(IDNO);
		}
		if(lstrcmp(pControlUI->GetName(), szButtonOKControlName)==0)
		{
			EndDialog(IDOK);
		}
		if((lstrcmp(pControlUI->GetName(), szButtonCancleControlName)==0)
			||(lstrcmp(pControlUI->GetName(), szButtonCloseControlName)==0))
		{
			EndDialog(IDCANCEL);
		}
	}	
}


//??ʾ??Ϣ
INT CInformation::ShowMessageBox(LPCTSTR pszString, UINT uType, UINT nElapse)
{
	return ShowMessageBox(TEXT("ϵͳ??ʾ"),pszString,uType,nElapse);
}

//??ʾ??Ϣ
INT CInformation::ShowMessageBox(LPCTSTR pszCaption, LPCTSTR pszString, UINT uType, UINT nElapse)
{
	//???ñ???
	m_uType=uType;
	m_nElapse=nElapse;
	m_strString=pszString;
	m_strCaption=pszCaption;

	//??ʾ????
	INT nResult=(INT)DoModal();

	return nResult;
}

//???ť
VOID CInformation::CreateBoxButton()
{
	//????????
	LPCTSTR pszString[3]={NULL,NULL,NULL};

	//???ð?ť
	switch (m_uType&MB_TYPEMASK)
	{
	case MB_OKCANCEL:
		{
			m_nBtCount=2;
			m_uButtonID[0]=IDOK;
			m_uButtonID[1]=IDCANCEL;
			pszString[0]=TEXT("ȷ??(O)");
			pszString[1]=TEXT("ȡ??(C)");
			break;
		}
	case MB_YESNO:
		{
			m_nBtCount=2;
			m_uButtonID[0]=IDYES;
			m_uButtonID[1]=IDNO;
			pszString[0]=TEXT("??(Y)");
			pszString[1]=TEXT("??(N)");
			break;
		}
	case MB_YESNOCANCEL:
		{
			m_nBtCount=3;
			m_uButtonID[0]=IDYES;
			m_uButtonID[1]=IDNO;
			m_uButtonID[2]=IDCANCEL;
			pszString[0]=TEXT("??(Y)");
			pszString[1]=TEXT("??(N)");
			pszString[2]=TEXT("ȡ??(C)");
			break;
		}
	case MB_RETRYCANCEL:
		{
			m_nBtCount=2;
			m_uButtonID[0]=IDRETRY;
			m_uButtonID[1]=IDCANCEL;
			pszString[0]=TEXT("????(R)");
			pszString[1]=TEXT("ȡ??(C)");
			break;
		}
	case MB_ABORTRETRYIGNORE:
		{
			m_nBtCount=3;
			m_uButtonID[0]=IDABORT;
			m_uButtonID[1]=IDRETRY;
			m_uButtonID[2]=IDIGNORE;
			pszString[0]=TEXT("??ֹ(A)");
			pszString[1]=TEXT("????(R)");
			pszString[2]=TEXT("????(I)");
			break;
		}
	default:
		{
			m_nBtCount=1;
			m_uButtonID[0]=IDOK;
			pszString[0]=TEXT("ȷ??(O)");
			break;
		}
	}

	//???ð?ť
	for (UINT i=0;i<m_nBtCount;i++) 
	{
		m_pbtButton[i]->SetTag(m_uButtonID[i]);
		m_pbtButton[i]->SetText(pszString[i]);
	}

	return;
}

//ʱ????Ϣ
VOID CInformation::OnTimer(UINT_PTR nIDEvent)
{
	//????ʱ??
	if (nIDEvent==IDI_MESSAGE)
	{
		//ɾ???ж?
		if (m_nElapse==0)
		{
			PostMessage(WM_CLOSE,0,0);
			return;
		}

		//???ý???
		TCHAR szTitle[32]=TEXT("");
		_sntprintf_s(szTitle,CountArray(szTitle),TEXT("%s ??%ld ?룩"),m_strCaption,m_nElapse--);
		SetWindowText(szTitle);

		return;
	}

	__super::OnTimer(nIDEvent);
}
VOID CInformation::UpdateUI()
{
	CControlUI * pControlUI =NULL;
	//????ͼ??
	pControlUI=GetControlByName(szLableIcoWarnControlName);
	if(pControlUI!=NULL) pControlUI->SetVisible(false);

	pControlUI=GetControlByName(szLableIcoErrorControlName);
	if(pControlUI!=NULL) pControlUI->SetVisible(false);

	pControlUI=GetControlByName(szLableIcoQuestControlName);
	if(pControlUI!=NULL) pControlUI->SetVisible(false);

	pControlUI=GetControlByName(szLableIcoInfoControlName);
	if(pControlUI!=NULL) pControlUI->SetVisible(false);

	//????ͼ??

	switch(m_uType&MB_ICONMASK)
	{
	case MB_ICONWARNING:
		{
			pControlUI=GetControlByName(szLableIcoWarnControlName);
			if(pControlUI!=NULL) pControlUI->SetVisible(true);
			break;
		}
	case MB_ICONERROR:
		{
			pControlUI=GetControlByName(szLableIcoErrorControlName);
			if(pControlUI!=NULL) pControlUI->SetVisible(true);
			break;
		}
	case MB_ICONINFORMATION:
		{
			pControlUI=GetControlByName(szLableIcoInfoControlName);
			if(pControlUI!=NULL) pControlUI->SetVisible(true);
			break;
		}
	case MB_ICONQUESTION:
		{
			pControlUI=GetControlByName(szLableIcoQuestControlName);
			if(pControlUI!=NULL) pControlUI->SetVisible(true);
			break;
		}
	default:
		{
			pControlUI=GetControlByName(szLableIcoInfoControlName);
			if(pControlUI!=NULL) pControlUI->SetVisible(true);
			break;
		}
	}

	//???ذ?ť
	pControlUI=GetControlByName(szButtonRetryControlName);
	if(pControlUI!=NULL) pControlUI->SetVisible(false);

	pControlUI=GetControlByName(szButtonAbortControlName);
	if(pControlUI!=NULL) pControlUI->SetVisible(false);

	pControlUI=GetControlByName(szButtonIgnoreControlName);
	if(pControlUI!=NULL) pControlUI->SetVisible(false);

	pControlUI=GetControlByName(szButtonYESControlName);
	if(pControlUI!=NULL) pControlUI->SetVisible(false);

	pControlUI=GetControlByName(szButtonNOControlName);
	if(pControlUI!=NULL) pControlUI->SetVisible(false);

	pControlUI=GetControlByName(szButtonOKControlName);
	if(pControlUI!=NULL) pControlUI->SetVisible(false);

	pControlUI=GetControlByName(szButtonCancleControlName);
	if(pControlUI!=NULL) pControlUI->SetVisible(false);

	//???ð?ť
	switch (m_uType&MB_TYPEMASK)
	{
	case MB_OKCANCEL:
		{
			pControlUI=GetControlByName(szButtonOKControlName);
			if(pControlUI!=NULL) pControlUI->SetVisible(true);

			pControlUI=GetControlByName(szButtonCancleControlName);
			if(pControlUI!=NULL) pControlUI->SetVisible(true);
			break;
		}
	case MB_YESNO:
		{
			pControlUI=GetControlByName(szButtonYESControlName);
			if(pControlUI!=NULL) pControlUI->SetVisible(true);

			pControlUI=GetControlByName(szButtonNOControlName);
			if(pControlUI!=NULL) pControlUI->SetVisible(true);

			break;
		}
	case MB_YESNOCANCEL:
		{
			pControlUI=GetControlByName(szButtonYESControlName);
			if(pControlUI!=NULL) pControlUI->SetVisible(true);

			pControlUI=GetControlByName(szButtonNOControlName);
			if(pControlUI!=NULL) pControlUI->SetVisible(true);

			pControlUI=GetControlByName(szButtonCancleControlName);
			if(pControlUI!=NULL) pControlUI->SetVisible(true);
			break;
		}
	case MB_RETRYCANCEL:
		{
			pControlUI=GetControlByName(szButtonRetryControlName);
			if(pControlUI!=NULL) pControlUI->SetVisible(true);

			pControlUI=GetControlByName(szButtonCancleControlName);
			if(pControlUI!=NULL) pControlUI->SetVisible(true);
			break;
		}
	case MB_ABORTRETRYIGNORE:
		{
			pControlUI=GetControlByName(szButtonAbortControlName);
			if(pControlUI!=NULL) pControlUI->SetVisible(true);

			pControlUI=GetControlByName(szButtonRetryControlName);
			if(pControlUI!=NULL) pControlUI->SetVisible(true);

			pControlUI=GetControlByName(szButtonIgnoreControlName);
			if(pControlUI!=NULL) pControlUI->SetVisible(true);
			break;
		}
	default:
		{
			pControlUI=GetControlByName(szButtonOKControlName);
			if(pControlUI!=NULL) pControlUI->SetVisible(true);
			break;
		}
	}

	//????????
	pControlUI=GetControlByName(szTextTipControlName);
	if(pControlUI!=NULL) pControlUI->SetText(m_strString);

}

LPCTSTR CInformation::GetSkinFile()
{
	return TEXT("DlgInformation.xml");
}
//////////////////////////////////////////////////////////////////////////////////

//??ʾ??Ϣ
extern "C" SHARE_CONTROL_CLASS INT ShowInformation(LPCTSTR pszString, UINT uType, UINT nElapse)
{
	CInformation Information;
	return Information.ShowMessageBox(pszString,uType,nElapse);
}

//??ʾ??Ϣ
extern "C" SHARE_CONTROL_CLASS INT ShowInformationEx(LPCTSTR pszCaption, LPCTSTR pszString, UINT uType, UINT nElapse)
{
	CInformation Information;
	return Information.ShowMessageBox(pszCaption,pszString,uType,nElapse);
}

//////////////////////////////////////////////////////////////////////////////////
