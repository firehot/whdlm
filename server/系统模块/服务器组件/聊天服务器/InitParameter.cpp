#include "StdAfx.h"
#include "InitParameter.h"

//////////////////////////////////////////////////////////////////////////////////

//时间定义
#define TIME_CONNECT				30									//重连时间
#define TIME_COLLECT				30									//统计时间

//客户时间
#define TIME_INTERMIT				0									//中断时间
#define TIME_ONLINE_COUNT			600									//人数时间

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
	//时间定义
	m_wConnectTime=TIME_CONNECT;
	m_wCollectTime=TIME_COLLECT;

	//配置信息
	m_wServiceID=0;
	m_dwServiceAddr=ADDR_ANY;
	m_wServicePort=PORT_CHAT;
	m_wMaxPlayer=4096;
	m_dwServiceRule=0;
	m_cbMinOrder=0;
	m_dwDistance = 0;

	//协调信息
	m_wCorrespondPort=PORT_CENTER;
	ZeroMemory(&m_CorrespondAddress,sizeof(m_CorrespondAddress));

	//日志服务器信息
	m_wLogServerPort = PORT_LOG_SERVER;
	ZeroMemory(&m_LogServerAddress, sizeof(m_LogServerAddress));

	//连接信息
	ZeroMemory(&m_ServiceAddress,sizeof(m_ServiceAddress));
	ZeroMemory(&m_AccountsDBParameter,sizeof(m_AccountsDBParameter));
	ZeroMemory(&m_TreasureDBParameter,sizeof(m_TreasureDBParameter));
	ZeroMemory(&m_PlatformDBParameter,sizeof(m_PlatformDBParameter));
	ZeroMemory(&m_GameMatchDBParameter, sizeof(m_GameMatchDBParameter));

	//约战信息
	m_wPrsnlRmCorrespondPort = PORT_PERSONAL_ROOM;
	ZeroMemory(&m_PrsnlRmCorrespondAddress, sizeof(m_PrsnlRmCorrespondAddress));

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
	_sntprintf(szIniFile,CountArray(szIniFile),TEXT("%s\\ServerParameter.ini"),szWorkDir);

	//读取配置
	CWHIniData IniData;
	IniData.SetIniFilePath(szIniFile);

	//读取配置
	m_wServiceID=IniData.ReadInt(TEXT("ChatServer"),TEXT("ServiceID"),0);
	m_dwServiceAddr=IniData.ReadInt(TEXT("ChatServer"),TEXT("ServiceAddr"),ADDR_ANY);
	m_wServicePort=IniData.ReadInt(TEXT("ChatServer"),TEXT("ServicePort"),m_wServicePort);
	m_dwServiceRule=IniData.ReadInt(TEXT("ChatServer"),TEXT("ServiceRule"),m_dwServiceRule);
	m_wMaxPlayer=IniData.ReadInt(TEXT("ChatServer"),TEXT("MaxPlayer"),m_wMaxPlayer);
	m_cbMinOrder=IniData.ReadInt(TEXT("ChatServer"),TEXT("MinOrder"),m_cbMinOrder);

	IniData.ReadEncryptString(TEXT("ServerInfo"),TEXT("ServiceAddr"),NULL,m_ServiceAddress.szAddress,CountArray(m_ServiceAddress.szAddress));

	//协调信息
	m_wCorrespondPort=IniData.ReadInt(TEXT("Correspond"),TEXT("ServicePort"),m_wCorrespondPort);
	IniData.ReadEncryptString(TEXT("ServerInfo"),TEXT("CorrespondAddr"),NULL,m_CorrespondAddress.szAddress,CountArray(m_CorrespondAddress.szAddress));

	//约战信息
	m_wPrsnlRmCorrespondPort = IniData.ReadInt(TEXT("PrsnlRmCorrespond"), TEXT("ServicePort"), m_wPrsnlRmCorrespondPort);
	IniData.ReadEncryptString(TEXT("ServerInfo"), TEXT("PrsnlRmCorrespondAddr"), m_CorrespondAddress.szAddress, m_PrsnlRmCorrespondAddress.szAddress, CountArray(m_PrsnlRmCorrespondAddress.szAddress));

	//日志服务器地址
	m_wLogServerPort = IniData.ReadInt(TEXT("LogServer"), TEXT("ServicePort"), m_wLogServerPort);
	IniData.ReadEncryptString(TEXT("ServerInfo"), TEXT("LogServerAddr"), m_CorrespondAddress.szAddress, m_LogServerAddress.szAddress, CountArray(m_LogServerAddress.szAddress));


	//连接信息
	m_AccountsDBParameter.wDataBasePort=(WORD)IniData.ReadInt(TEXT("AccountsDB"),TEXT("DBPort"),1433);
	IniData.ReadEncryptString(TEXT("AccountsDB"),TEXT("DBAddr"),NULL,m_AccountsDBParameter.szDataBaseAddr,CountArray(m_AccountsDBParameter.szDataBaseAddr));
	IniData.ReadEncryptString(TEXT("AccountsDB"),TEXT("DBUser"),NULL,m_AccountsDBParameter.szDataBaseUser,CountArray(m_AccountsDBParameter.szDataBaseUser));
	IniData.ReadEncryptString(TEXT("AccountsDB"),TEXT("DBPass"),NULL,m_AccountsDBParameter.szDataBasePass,CountArray(m_AccountsDBParameter.szDataBasePass));
	IniData.ReadEncryptString(TEXT("AccountsDB"),TEXT("DBName"),szAccountsDB,m_AccountsDBParameter.szDataBaseName,CountArray(m_AccountsDBParameter.szDataBaseName));

	//连接信息
	m_TreasureDBParameter.wDataBasePort=(WORD)IniData.ReadInt(TEXT("TreasureDB"),TEXT("DBPort"),1433);
	IniData.ReadEncryptString(TEXT("TreasureDB"),TEXT("DBAddr"),NULL,m_TreasureDBParameter.szDataBaseAddr,CountArray(m_TreasureDBParameter.szDataBaseAddr));
	IniData.ReadEncryptString(TEXT("TreasureDB"),TEXT("DBUser"),NULL,m_TreasureDBParameter.szDataBaseUser,CountArray(m_TreasureDBParameter.szDataBaseUser));
	IniData.ReadEncryptString(TEXT("TreasureDB"),TEXT("DBPass"),NULL,m_TreasureDBParameter.szDataBasePass,CountArray(m_TreasureDBParameter.szDataBasePass));
	IniData.ReadEncryptString(TEXT("TreasureDB"),TEXT("DBName"),szTreasureDB,m_TreasureDBParameter.szDataBaseName,CountArray(m_TreasureDBParameter.szDataBaseName));

	//连接信息
	TCHAR szPlatformDBItem[32]=TEXT("PlatformDB");
	TCHAR szPlatformDBName[32]=TEXT("QPPlatformDB");
	IniData.ReadString(TEXT("LogonServer"),TEXT("PlatformDBItem"),TEXT("PlatformDB"),szPlatformDBItem,CountArray(szPlatformDBItem));
	IniData.ReadString(TEXT("LogonServer"),TEXT("PlatformDBName"),szPlatformDB,szPlatformDBName,CountArray(szPlatformDBName));
	m_PlatformDBParameter.wDataBasePort=(WORD)IniData.ReadInt(TEXT("PlatformDB"),TEXT("DBPort"),1433);
	IniData.ReadEncryptString(szPlatformDBItem,TEXT("DBAddr"),NULL,m_PlatformDBParameter.szDataBaseAddr,CountArray(m_PlatformDBParameter.szDataBaseAddr));
	IniData.ReadEncryptString(szPlatformDBItem,TEXT("DBUser"),NULL,m_PlatformDBParameter.szDataBaseUser,CountArray(m_PlatformDBParameter.szDataBaseUser));
	IniData.ReadEncryptString(szPlatformDBItem,TEXT("DBPass"),NULL,m_PlatformDBParameter.szDataBasePass,CountArray(m_PlatformDBParameter.szDataBasePass));
	IniData.ReadEncryptString(szPlatformDBItem,TEXT("DBName"),szPlatformDBName,m_PlatformDBParameter.szDataBaseName,CountArray(m_PlatformDBParameter.szDataBaseName));

	//临时方案 需要改工具
	m_GameMatchDBParameter.wDataBasePort = (WORD)IniData.ReadInt(TEXT("TreasureDB"), TEXT("DBPort"), 1433);
	IniData.ReadEncryptString(TEXT("TreasureDB"), TEXT("DBAddr"), NULL, m_GameMatchDBParameter.szDataBaseAddr, CountArray(m_GameMatchDBParameter.szDataBaseAddr));
	IniData.ReadEncryptString(TEXT("TreasureDB"), TEXT("DBUser"), NULL, m_GameMatchDBParameter.szDataBaseUser, CountArray(m_GameMatchDBParameter.szDataBaseUser));
	IniData.ReadEncryptString(TEXT("TreasureDB"), TEXT("DBPass"), NULL, m_GameMatchDBParameter.szDataBasePass, CountArray(m_GameMatchDBParameter.szDataBasePass));
	IniData.ReadEncryptString(TEXT("TreasureDB"), TEXT("DBName"), szGameMatchDB, m_GameMatchDBParameter.szDataBaseName, CountArray(m_GameMatchDBParameter.szDataBaseName));

	//构造路径
	TCHAR szIniFileChat[MAX_PATH]=TEXT("");
	_sntprintf(szIniFileChat,CountArray(szIniFileChat),TEXT("%s\\ChatServer.ini"),szWorkDir);

	//读取配置
	CWHIniData IniDataChat;
	IniDataChat.SetIniFilePath(szIniFileChat);

	m_dwDistance = IniDataChat.ReadInt(TEXT("ChatServer"),TEXT("Distance"),0);

	return;
}

//////////////////////////////////////////////////////////////////////////////////
