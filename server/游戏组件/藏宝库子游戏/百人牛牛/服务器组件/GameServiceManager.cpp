#include "StdAfx.h"
#include "Resource.h"
#include "TableFrameSink.h"
#include "GameServiceManager.h"

//////////////////////////////////////////////////////////////////////////////////
//游戏AI定义
#ifndef _DEBUG
#define ANDROID_SERVICE_DLL_NAME	TEXT("OxBattleAndroid.dll")	//组件名字
#else
#define ANDROID_SERVICE_DLL_NAME	TEXT("OxBattleAndroid.dll")	//组件名字
#endif
//构造函数
CGameServiceManager::CGameServiceManager()
{
	//内核属性
	m_GameServiceAttrib.wKindID = KIND_ID;
	m_GameServiceAttrib.wChairCount = GAME_PLAYER;
	m_GameServiceAttrib.wSupporType = (GAME_GENRE_GOLD | GAME_GENRE_SCORE | GAME_GENRE_EDUCATE);

	//功能标志
	m_GameServiceAttrib.cbDynamicJoin = TRUE;
	m_GameServiceAttrib.cbAndroidUser = TRUE;
	m_GameServiceAttrib.cbOffLineTrustee = FALSE;

	//服务属性
	m_GameServiceAttrib.dwServerVersion = VERSION_SERVER;
	m_GameServiceAttrib.dwClientVersion = VERSION_CLIENT;
	lstrcpyn(m_GameServiceAttrib.szGameName, GAME_NAME, CountArray(m_GameServiceAttrib.szGameName));
	lstrcpyn(m_GameServiceAttrib.szDataBaseName, szTreasureDB, CountArray(m_GameServiceAttrib.szDataBaseName));
	lstrcpyn(m_GameServiceAttrib.szClientEXEName, TEXT("OxBattle.EXE"), CountArray(m_GameServiceAttrib.szClientEXEName));
	lstrcpyn(m_GameServiceAttrib.szServerDLLName, TEXT("OxBattleServer.DLL"), CountArray(m_GameServiceAttrib.szServerDLLName));

	return;
}

//析构函数
CGameServiceManager::~CGameServiceManager()
{
}

//接口查询
VOID *CGameServiceManager::QueryInterface(const IID &Guid, DWORD dwQueryVer)
{
	QUERYINTERFACE(IGameServiceManager, Guid, dwQueryVer);
	QUERYINTERFACE(IGameServiceCustomRule, Guid, dwQueryVer);
	QUERYINTERFACE_IUNKNOWNEX(IGameServiceManager, Guid, dwQueryVer);

#ifdef VER_IGameServiceCustomTime
	QUERYINTERFACE(IGameServiceCustomTime, Guid, dwQueryVer);
#endif 

	return NULL;
}

//创建桌子
VOID *CGameServiceManager::CreateTableFrameSink(REFGUID Guid, DWORD dwQueryVer)
{
	//变量定义
	CTableFrameSink *pTableFrameSink = NULL;

	try
	{
		//建立对象
		pTableFrameSink = new CTableFrameSink();
		if (pTableFrameSink == NULL)
		{
			throw TEXT("创建失败");
		}

		//查询接口
		VOID *pObject = pTableFrameSink->QueryInterface(Guid, dwQueryVer);
		if (pObject == NULL)
		{
			throw TEXT("接口查询失败");
		}

		return pObject;
	}
	catch (...) {}

	//删除对象
	SafeDelete(pTableFrameSink);

	return NULL;
}

//创建游戏AI
VOID *CGameServiceManager::CreateAndroidUserItemSink(REFGUID Guid, DWORD dwQueryVer)
{
	try
	{
		//加载模块
		if (m_hDllInstance == NULL)
		{
			m_hDllInstance = AfxLoadLibrary(ANDROID_SERVICE_DLL_NAME);
			if (m_hDllInstance == NULL)
			{
				throw TEXT("游戏AI服务模块不存在");
			}
		}

		//寻找函数
		ModuleCreateProc *CreateProc = (ModuleCreateProc *)GetProcAddress(m_hDllInstance, "CreateAndroidUserItemSink");
		if (CreateProc == NULL)
		{
			throw TEXT("游戏AI服务模块组件不合法");
		}

		//创建组件
		return CreateProc(Guid, dwQueryVer);
	}
	catch (...) {}

	return NULL;
}
VOID *CGameServiceManager::CreateGameDataBaseEngineSink(REFGUID Guid, DWORD dwQueryVer)
{
	return NULL;
}
//组件属性
bool CGameServiceManager::GetServiceAttrib(tagGameServiceAttrib &GameServiceAttrib)
{
	//设置变量
	GameServiceAttrib = m_GameServiceAttrib;

	return true;
}

//调整参数
bool CGameServiceManager::RectifyParameter(tagGameServiceOption &GameServiceOption)
{
	//效验参数
	ASSERT(&GameServiceOption != NULL);
	if (&GameServiceOption == NULL)
	{
		return false;
	}

	//底分为最小筹码
	//金币游戏入场分和服务费默认0
	tagCustomConfig *pCustomConfig = (tagCustomConfig *)(GameServiceOption.cbCustomRule);
	GameServiceOption.lCellScore = pCustomConfig->CustomGeneral.lChipArray[0];

	return true;

}

//获取配置
bool CGameServiceManager::SaveCustomRule(LPBYTE pcbCustomRule, WORD wCustonSize)
{
	return m_DlgCustomRule.SaveCustomRule(pcbCustomRule, wCustonSize);
}

//默认配置
bool CGameServiceManager::DefaultCustomRule(LPBYTE pcbCustomRule, WORD wCustonSize)
{
	return m_DlgCustomRule.DefaultCustomRule(pcbCustomRule, wCustonSize);
}

//创建窗口
HWND CGameServiceManager::CreateCustomRule(CWnd *pParentWnd, CRect rcCreate, LPBYTE pcbCustomRule, WORD wCustonSize)
{
	//创建窗口
	if (m_DlgCustomRule.m_hWnd == NULL)
	{
		//设置资源
		AfxSetResourceHandle(GetModuleHandle(m_GameServiceAttrib.szServerDLLName));

		//创建窗口
		m_DlgCustomRule.Create(IDD_CUSTOM_RULE, pParentWnd);

		//还原资源
		AfxSetResourceHandle(GetModuleHandle(NULL));
	}

	//检查游戏AI模块
	HINSTANCE hDllInstance = NULL;
	hDllInstance = AfxLoadLibrary(ANDROID_SERVICE_DLL_NAME);
	if (hDllInstance == NULL)
	{
		m_DlgCustomRule.HideAndroidModule(true);
	}

	//设置变量
	m_DlgCustomRule.SetCustomRule(pcbCustomRule, wCustonSize);

	//显示窗口
	m_DlgCustomRule.SetWindowPos(NULL, rcCreate.left, rcCreate.top, rcCreate.Width(), rcCreate.Height(), SWP_NOZORDER | SWP_SHOWWINDOW);

	return m_DlgCustomRule.GetSafeHwnd();
}

//////////////////////////////////////////////////////////////////////////////////

//建立对象函数
extern "C" __declspec(dllexport) VOID *CreateGameServiceManager(const GUID &Guid, DWORD dwInterfaceVer)
{
	static CGameServiceManager GameServiceManager;
	return GameServiceManager.QueryInterface(Guid, dwInterfaceVer);
}

//////////////////////////////////////////////////////////////////////////////////
