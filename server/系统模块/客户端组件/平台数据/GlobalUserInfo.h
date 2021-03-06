//藏宝库IT社区（28xin.com）
#ifndef GLOBAL_USER_INFO_HEAD_FILE
#define GLOBAL_USER_INFO_HEAD_FILE

#pragma once

#include "PlatformDataHead.h"

//////////////////////////////////////////////////////////////////////////////////
//结构定义

//用户信息
struct tagGlobalUserData
{
	//基本资料
	DWORD							dwUserID;							//用户 I D
	DWORD							dwGameID;							//游戏 I D
	DWORD							dwExperience;						//用户经验
	SCORE							lLoveLiness;						//用户魅力
	TCHAR							szAccounts[LEN_ACCOUNTS];			//登录帐号
	TCHAR							szNickName[LEN_NICKNAME];			//用户昵称
	TCHAR							szPassword[LEN_PASSWORD];			//登录密码
	TCHAR							szDynamicPass[LEN_PASSWORD];		//动态密码

	//用户成绩
	SCORE							lUserScore;							//用户游戏币
	SCORE							lUserInsure;						//用户银行
	SCORE							lUserIngot;							//用户元宝
	DOUBLE							dUserBeans;							//用户游戏豆

	//扩展资料
	BYTE							cbGender;							//用户性别
	BYTE							cbMoorMachine;						//锁定机器
	TCHAR							szUnderWrite[LEN_UNDER_WRITE];		//个性签名

	//社团资料
	DWORD							dwGroupID;							//社团索引
	TCHAR							szGroupName[LEN_GROUP_NAME];		//社团名字

	//会员资料
	BYTE							cbMemberOrder;						//会员等级
	SYSTEMTIME						MemberOverDate;						//到期时间

	//头像信息
	WORD							wFaceID;							//头像索引
	DWORD							dwCustomID;							//自定标识
	tagCustomFaceInfo				CustomFaceInfo;						//自定头像

	//配置信息
	BYTE							cbInsureEnabled;					//银行使能

	//登录信息
	DWORD							dwLogonTickCount;					//登录时间
	//赠送信息
	DWORD							dwPresentCount;						//被赠送的数量
	//推广标识
	TCHAR							szSpreader[LEN_ACCOUNTS];			//推广标识
};

//扩展资料
struct tagIndividualUserData
{
	//用户信息
	DWORD							dwUserID;							//用户 I D
	TCHAR							szUserNote[LEN_USER_NOTE];			//用户说明
	TCHAR							szCompellation[LEN_COMPELLATION];	//真实名字
	TCHAR							szPassPortID[LEN_PASS_PORT_ID];		//证件号码

	//电话号码
	TCHAR							szSeatPhone[LEN_SEAT_PHONE];		//固定电话
	TCHAR							szMobilePhone[LEN_MOBILE_PHONE];	//移动电话

	//联系资料
	TCHAR							szQQ[LEN_QQ];						//Q Q 号码
	TCHAR							szEMail[LEN_EMAIL];					//电子邮件
	TCHAR							szDwellingPlace[LEN_DWELLING_PLACE];//联系地址
};

//////////////////////////////////////////////////////////////////////////////////

//用户信息
class PLATFORM_DATA_CLASS CGlobalUserInfo
{
	//用户信息
protected:
	tagGlobalUserData				m_GlobalUserData;						//用户资料
	tagIndividualUserData			m_IndividualUserData;					//扩展资料

	//静态变量
protected:
	static CGlobalUserInfo *		m_pGlobalUserInfo;						//用户信息

	//函数定义
public:
	//构造函数
	CGlobalUserInfo();
	//析构函数
	virtual ~CGlobalUserInfo();

	//功能函数
public:
	//重置资料
	VOID ResetUserInfoData();
	//用户资料
	tagGlobalUserData * GetGlobalUserData() { return &m_GlobalUserData; }
	//扩展资料
	tagIndividualUserData * GetIndividualUserData() { return &m_IndividualUserData; }

	//静态函数
public:
	//获取对象
	static CGlobalUserInfo * GetInstance() { return m_pGlobalUserInfo; }
};

//////////////////////////////////////////////////////////////////////////////////

#endif