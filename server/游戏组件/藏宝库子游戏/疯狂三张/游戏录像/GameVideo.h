#pragma once

//游戏视频基类
class IGameVideo
{
public:
	IGameVideo(void){};
	virtual ~IGameVideo(void){};

public:
	//开始录像
	virtual bool __cdecl	StartVideo(ITableFrame	*pTableFrame)		= NULL;
	//停止和保存
	virtual bool __cdecl	StopAndSaveVideo(WORD wServerID,WORD wTableID)	= NULL;
	//增加录像数据
	virtual bool __cdecl    AddVideoData(WORD wMsgKind,void *pPack,int nSize,bool bFirst=true)=NULL;
	//获取回放码
	virtual CHAR* __cdecl	GetVideoNumber() = NULL;

};
