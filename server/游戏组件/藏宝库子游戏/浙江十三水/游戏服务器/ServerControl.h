#pragma once

//游戏控制基类
class IServerControl
{
public:
	IServerControl(void){};
	virtual ~IServerControl(void){};

public:
	//返回控制区域
	virtual bool __cdecl ControlResult(BYTE cbControlCardData[GAME_PLAYER][HAND_CARD_COUNT], ROOMUSERCONTROL Keyroomusercontrol, BYTE cbMaCard, WORD wBanker) = NULL;
};
