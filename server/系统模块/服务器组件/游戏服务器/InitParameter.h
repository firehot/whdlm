#ifndef INIR_PARAMETER_HEAD_FILE
#define INIR_PARAMETER_HEAD_FILE

#pragma once

#include "Stdafx.h"

//////////////////////////////////////////////////////////////////////////////////

//配置参数
class CInitParameter
{
	//配置信息
public:
	WORD							m_wConnectTime;						//重连时间
	WORD							m_wCollectTime;						//统计时间
	WORD							m_wAutoStart;						//自动开始
	//协调信息
public:
	WORD							m_wCorrespondPort;					//协调端口
	tagAddressInfo					m_CorrespondAddress;				//协调地址

	//约战服务信息
public:
	WORD							m_wPrsnlRmCorrespondPort;		//约战服务端口
	tagAddressInfo			m_PrsnlRmCorrespondAddress;	//约战服务地址
	//AI分配服务信息
public:
	WORD							m_wAndroidDistributePort;			//大联盟AI分配端口
	tagAddressInfo					m_AndroidDistributePortAddress;		//约战服务地址
public:
	WORD							m_wLogServerPort;				//日志服务器端口
	tagAddressInfo					m_LogServerAddress;				//约战地址

	//配置信息
public:
	TCHAR							m_szServerName[LEN_SERVER];			//服务器名

	//手机变量
public:
	WORD							m_wVisibleTableCount;				//可视桌子数
	WORD							m_wEverySendPageCount;				//每次发送页数

	//连接信息
public:
	tagAddressInfo					m_ServiceAddress;					//服务地址
	tagDataBaseParameter			m_TreasureDBParameter;				//连接地址
	tagDataBaseParameter			m_PlatformDBParameter;				//连接地址
	tagGameServiceAttrib*			m_pGameServiceAttrib;				//服务属性
	tagGameServiceOption*			m_pGameServiceOption;				//服务配置

	//函数定义
public:
	//构造函数
	CInitParameter();
	//析构函数
	virtual ~CInitParameter();

	//功能函数
public:
	//初始化
	VOID InitParameter();
	//加载配置
	VOID LoadInitParameter();
	//设置参数
	VOID SetServerParameter(tagGameServiceAttrib *pGameServiceAttrib, tagGameServiceOption *pGameServiceOption);
	//读取手机配置
	VOID ReadMobileParameter();
};

//////////////////////////////////////////////////////////////////////////////////

#endif
