#include "StdAfx.h"
#include "ChatEdit.h"
#include ".\chatedit.h"

///////////////////////////////////////////////////////////////////////////////////

//IMPLEMENT_DYNAMIC(CChatEdit, CRichEditCtrl)

BEGIN_MESSAGE_MAP(CChatEdit, CRichEditCtrl)
	
	ON_WM_CHAR()
	ON_WM_NCCALCSIZE()
	ON_WM_CREATE()
	ON_WM_VSCROLL()
	ON_WM_MOUSEWHEEL()

END_MESSAGE_MAP()

//构造函数
CChatEdit::CChatEdit()
{
	m_font.CreatePointFont(60, TEXT("宋体")); 
	m_crTextColor = GetSysColor(COLOR_WINDOWTEXT);
}

//析构函数
CChatEdit::~CChatEdit()
{
}

//初始化函数
VOID CChatEdit::Initialization()
{
	InitializeFlatSB(this->m_hWnd);
	FlatSB_EnableScrollBar(this->m_hWnd, SB_BOTH, ESB_DISABLE_BOTH);
	SetWindowLong(this->m_hWnd, GWL_EXSTYLE, GetWindowLong(this->m_hWnd,GWL_EXSTYLE)|WS_EX_TRANSPARENT); 

	CRect windowRect;
	GetWindowRect(&windowRect);

	int nTitleBarHeight = 0;
	CWnd* pParent = GetParent();
	if(pParent->GetStyle() & WS_CAPTION)
		nTitleBarHeight = GetSystemMetrics(SM_CYSIZE);

	int nDialogFrameHeight = 0;
	int nDialogFrameWidth = 0;
	if((pParent->GetStyle() & WS_BORDER))
	{
		nDialogFrameHeight = GetSystemMetrics(SM_CYDLGFRAME);
		nDialogFrameWidth = GetSystemMetrics(SM_CYDLGFRAME);
	}

	if(pParent->GetStyle() & WS_THICKFRAME)
	{
		nDialogFrameHeight+=1;
		nDialogFrameWidth+=1;
	}

	CRect rect1(windowRect.right-nDialogFrameWidth,windowRect.top-nTitleBarHeight-nDialogFrameHeight-1,windowRect.right+12-nDialogFrameWidth,windowRect.bottom+11-nTitleBarHeight-nDialogFrameHeight);
	CRect rect2(windowRect.left-nDialogFrameWidth,windowRect.bottom-nTitleBarHeight-nDialogFrameHeight-1,windowRect.right+1-nDialogFrameWidth,windowRect.bottom+11-nTitleBarHeight-nDialogFrameHeight);
	m_SkinVerticleScrollbar.Create(NULL, WS_CHILD|SS_LEFT|SS_NOTIFY|WS_VISIBLE|WS_GROUP, rect1, pParent);
	m_SkinVerticleScrollbar.pEdit = (CEdit *)this;

	return;
}

//调整控件
VOID CChatEdit::RectifyControl(INT nWidth, INT nHeigth)
{
	CRect windowRect,clientRect;
	GetWindowRect(&windowRect);
	GetClientRect(&clientRect);

	//窗口位置
	CRect rcArce;
	SystemParametersInfo(SPI_GETWORKAREA, 0, &rcArce, SPIF_SENDCHANGE);

	//读取位置
	CSize SizeRestrict(nWidth, nHeigth);

	//正常位置
	CRect rcNormalSize;

	//位置调整
	SizeRestrict.cx=__min(rcArce.Width(),SizeRestrict.cx);
	SizeRestrict.cy=__min(rcArce.Height(),SizeRestrict.cy);

	//移动窗口
	rcNormalSize.top=(rcArce.Height()-SizeRestrict.cy)/2;
	rcNormalSize.left=(rcArce.Width()-SizeRestrict.cx)/2;
	rcNormalSize.right=rcNormalSize.left+SizeRestrict.cx;
	rcNormalSize.bottom=rcNormalSize.top+SizeRestrict.cy;

	m_SkinVerticleScrollbar.MoveWindow(rcNormalSize.Width()-28, rcNormalSize.Height()-232, 16, clientRect.Height()+2);

	return;
}

//设置字体颜色
VOID CChatEdit::SetTextColor(COLORREF rcTextColor)
{
	//设置字体颜色
	m_crTextColor = rcTextColor;

	//刷新控件
	Invalidate(TRUE);

	return;
}

//设置字体
VOID CChatEdit::SetTextFont(const LOGFONT &lfTextFont)
{
	//创建字体
	if (m_font.GetSafeHandle())
	{
		m_font.DeleteObject();
	}
	m_font.CreateFontIndirect(&lfTextFont);

	//绑定控件
	CRichEditCtrl::SetFont(&m_font);

	//刷新控件
	Invalidate(TRUE);

	return;
}

//设置隐藏
VOID CChatEdit::SetHideWindow(bool bHide)
{
	if (bHide == true)
	{
		m_SkinVerticleScrollbar.ShowWindow(SW_HIDE);
	}
	else
	{
		m_SkinVerticleScrollbar.ShowWindow(SW_SHOW);
	}

	return;
}

//获取当前字体
BOOL CChatEdit::GetTextFont(LOGFONT &lfTextFont)
{
	if (m_font.GetLogFont(&lfTextFont) != 0) return TRUE;   

	return FALSE;
}

void CChatEdit::PreSubclassWindow()
{
	CRichEditCtrl::PreSubclassWindow();

	return;
}

//创建控件
int CChatEdit::OnCreate(LPCREATESTRUCT lpCreateStruct)
{
	if (CRichEditCtrl::OnCreate(lpCreateStruct) == -1)
		return -1;

	//初始化控件
	Initialization();

	return 0;
}

void CChatEdit::OnChar(UINT nChar, UINT nRepCnt, UINT nFlags)
{
	CRichEditCtrl::OnChar(nChar, nRepCnt, nFlags);

	return;
}

void CChatEdit::OnNcCalcSize(BOOL bCalcValidRects, NCCALCSIZE_PARAMS* lpncsp)
{
	ModifyStyle(WS_HSCROLL | WS_VSCROLL, 0, 0); 
	CRichEditCtrl::OnNcCalcSize(bCalcValidRects, lpncsp);

	return;
}

void CChatEdit::OnVScroll(UINT nSBCode, UINT nPos, CScrollBar* pScrollBar)
{
	CRichEditCtrl::OnVScroll(nSBCode, nPos, pScrollBar);
	m_SkinVerticleScrollbar.UpdateThumbPosition();

	return;
}

BOOL CChatEdit::OnMouseWheel(UINT nFlags, short zDelta, CPoint pt)
{
	CWnd::OnMouseWheel(nFlags, zDelta, pt);
	m_SkinVerticleScrollbar.UpdateThumbPosition();
	return TRUE;
}
