//藏宝库IT社区（28xin.com）
#ifndef SERVER_INFO_MANAGER_HEAD_FILE
#define SERVER_INFO_MANAGER_HEAD_FILE

#pragma once

#include "AfxTempl.h"
#include "ModuleManagerHead.h"

//////////////////////////////////////////////////////////////////////////////////

//数组定义
typedef CWHArray<tagGameServerInfo *> CGameServerInfoArray;
typedef CWHArray<tagGameMatchOption *> CGameMatchOptionArray;

//索引定义
typedef CMap<WORD,WORD,tagGameServerInfo *,tagGameServerInfo *> CGameServerInfoMap;
typedef CMap<DWORD,DWORD,tagGameMatchOption *,tagGameMatchOption *> CGameMatchOptionMap;

//////////////////////////////////////////////////////////////////////////////////

//模块数据
class MODULE_MANAGER_CLASS CServerInfoBuffer
{
	//变量定义
public:
	CGameServerInfoMap				m_GameServerInfoMap;				//模块索引
	CGameServerInfoArray			m_GameServerInfoArray;				//模块数组

	//函数定义
public:
	//构造函数
	CServerInfoBuffer();
	//析构函数
	virtual ~CServerInfoBuffer();

	//管理函数
public:
	//重置数据
	bool ResetServerInfo();
	//删除数据
	bool DeleteServerInfo(WORD wServerID);
	//插入数据
	bool InsertServerInfo(tagGameServerInfo * pGameServerInfo);

	//信息函数
public:
	//获取数目
	DWORD GetServerInfoCount();
	//查找数据
	tagGameServerInfo * SearchServerInfo(WORD wServerID);

	//内部函数
private:
	//创建对象
	tagGameServerInfo * CreateServerInfo();
};

//////////////////////////////////////////////////////////////////////////////////
//模块数据
class MODULE_MANAGER_CLASS CMatchOptionBuffer
{
	//变量定义
public:
	//CGameMatchOptionMap			m_GameMatchOptionMap;				//模块索引
	CGameMatchOptionArray		m_GameMatchOptionArray;			    //模块数组
	CGameMatchOptionArray		m_GameMatchOptionBuffer;			//模块数组	

	//函数定义
public:
	//构造函数
	CMatchOptionBuffer();
	//析构函数
	virtual ~CMatchOptionBuffer();

	//管理函数
public:
	//重置数据
	bool ResetMatchOption();
	//删除数据
	bool DeleteMatchOption(DWORD dwMatchID,DWORD wMatchNO);
	//插入数据
	bool InsertMatchOption(tagGameMatchOption * pGameMatchOption);

	//信息函数
public:
	//获取数目
	DWORD GetMatchOptionCount();
	//查找数据
	tagGameMatchOption * SearchMatchOption(DWORD dwMatchID,LONGLONG wMatchNO);

	//内部函数
private:
	//创建对象
	tagGameMatchOption * CreateMatchOption();
};

//////////////////////////////////////////////////////////////////////////////////

//模块信息
class MODULE_MANAGER_CLASS CServerInfoManager
{
	//函数定义
public:
	//构造函数
	CServerInfoManager();
	//析构函数
	virtual ~CServerInfoManager();

	//加载房间
public:
	//加载房间
	bool LoadGameServerInfo(TCHAR szMachineID[LEN_MACHINE_ID], CServerInfoBuffer & ServerInfoBuffer);
	//加载房间
	bool LoadGameServerInfo(TCHAR szMachineID[LEN_MACHINE_ID], WORD wServerID, tagGameServerInfo & GameServerResult);

	//注册管理
public:
	//删除房间
	bool DeleteGameServer(WORD wServerID);
	//插入房间
	bool InsertGameServer(tagGameServerCreate * pGameServerCreate, tagGameServerInfo & GameServerResult);
	//修改房间
	bool ModifyGameServer(tagGameServerCreate * pGameServerCreate, tagGameServerInfo & GameServerResult);

	//内部函数
private:
	//连接数据
	bool ConnectPlatformDB(CDataBaseHelper & PlatformDBModule);
	//读取房间
	bool ReadGameServerInfo(CDataBaseAide & PlatformDBAide, tagGameServerInfo & GameServerResult);

	//私人房间信息
public:
	tagPersonalRoomOption m_PersonalRoomOption;
	tagPersonalRoomOptionRightAndFee m_PersonalRoomOptionRightAndFee;

	//设置私人房间参数
	void SetPersonalRoomOption(tagPersonalRoomOption PesronalRoomOption, tagPersonalRoomOptionRightAndFee  PersonalRoomOptionRightAndFee);

	//加载私人房间配置
	bool LoadPersonalRoomParameter(tagPersonalRoomOption  & pesronalRoomOption,  tagPersonalRoomOptionRightAndFee  &personalRoomOptionRightAndFee,  WORD wKindID, byte cbPlayMode);

	//插入私人房间参数
	bool InsertPersonalRoomParameter(CDataBaseAide PlatformDBAide, tagPersonalRoomOption  PersonalRoomOption, tagPersonalRoomOptionRightAndFee PersonalRoomOptionRightAndFee, WORD dwServerID, WORD dwKindID, TCHAR szShareStorageRule[1025], TCHAR szCurSubStorageItem[1025], tagConfigSubStorageItem * pConfigSubStorageItem);

	//修改私人房间参数
	bool ModifyPersonalRoomParameter(CDataBaseAide PlatformDBAide, tagPersonalRoomOption  PersonalRoomOption, tagPersonalRoomOptionRightAndFee PersonalRoomOptionRightAndFee, WORD dwServerID, WORD dwKindID, TCHAR szShareStorageRule[1025], TCHAR szCurSubStorageItem[1025], tagConfigSubStorageItem * pConfigSubStorageItem);
	
	//写文件
	void WriteFileValue(LPCTSTR pszKeyName, LPCTSTR pszItemName, UINT nValue, LPCTSTR szPath);
	
	//写私人房间信息
	bool WritePersonalRoomInfo(tagPersonalRoomOption  PersonalRoomOption,  tagPersonalRoomOptionRightAndFee PersonalRoomOptionRightAndFee , WORD dwKindID);
};

//////////////////////////////////////////////////////////////////////////////////

#endif