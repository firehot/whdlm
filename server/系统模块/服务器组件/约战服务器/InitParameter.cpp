//藏宝库IT社区（28xin.com）
#include "StdAfx.h"
#include "InitParameter.h"

//////////////////////////////////////////////////////////////////////////////////

#define REG_ITEM_NAME				TEXT("Information")					//注册表项

//////////////////////////////////////////////////////////////////////////////////

//构造函数
CInitParameter::CInitParameter() 
{ 
	InitParameter();
}

//析构函数
CInitParameter::~CInitParameter()
{
}

//初始化
VOID CInitParameter::InitParameter()
{
	//系统配置
	m_wMaxConnect=MAX_CONTENT;
	m_wServicePort=PORT_CENTER;
	m_wPrsnlServicePort= PORT_PERSONAL_ROOM;
	//配置信息
	ZeroMemory(m_szServerName,sizeof(m_szServerName));

	return;
}

//加载配置
VOID CInitParameter::LoadInitParameter()
{
	//重置参数
	InitParameter();

	//获取路径
	TCHAR szWorkDir[MAX_PATH]=TEXT("");
	CWHService::GetWorkDirectory(szWorkDir,CountArray(szWorkDir));

	//构造路径
	TCHAR szIniFile[MAX_PATH]=TEXT("");
	_snwprintf_s(szIniFile, CountArray(szIniFile), TEXT("%s\\ServerParameter.ini"), szWorkDir);

	//读取配置
	CWHIniData IniData;
	IniData.SetIniFilePath(szIniFile);

	//读取配置
	m_wMaxConnect=IniData.ReadInt(TEXT("PersonalRoom"),TEXT("ConnectMax"),m_wMaxConnect);
	m_wPrsnlServicePort=IniData.ReadInt(TEXT("PersonalRoom"),TEXT("ServicePort"),m_wPrsnlServicePort);
	IniData.ReadEncryptString(TEXT("ServerInfo"),TEXT("ServiceName"),NULL,m_szServerName,CountArray(m_szServerName));

	return;
}

//////////////////////////////////////////////////////////////////////////////////
