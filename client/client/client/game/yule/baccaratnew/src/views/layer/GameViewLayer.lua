local GameViewLayer = class("GameViewLayer",function(scene)
		local gameViewLayer =  display.newLayer()
    return gameViewLayer
end)
local module_pre = "game.yule.baccaratnew.src"

--external
--
local ExternalFun = require(appdf.EXTERNAL_SRC .. "ExternalFun")
local g_var = ExternalFun.req_var
local ClipText = appdf.EXTERNAL_SRC .. "ClipText"
local PopupInfoHead = appdf.EXTERNAL_SRC .. "PopupInfoHead"
--

local cmd = module_pre .. ".models.CMD_Game"
local game_cmd = appdf.HEADER_SRC .. "CMD_GameServer"
local QueryDialog   = require("app.views.layer.other.QueryDialog")

--utils
--
local UserListLayer = module_pre .. ".views.layer.userlist.UserListLayer"
local ApplyListLayer = module_pre .. ".views.layer.userlist.ApplyListLayer"
local SettingLayer = module_pre .. ".views.layer.SettingLayer"
local WallBillLayer = module_pre .. ".views.layer.WallBillLayer"
local SitRoleNode = module_pre .. ".views.layer.SitRoleNode"
local GameCardLayer = module_pre .. ".views.layer.GameCardLayer"
local GameResultLayer = module_pre .. ".views.layer.GameResultLayer"

local BankLayer = appdf.req(module_pre..".views.layer.BankLayer")
local HelpLayer = appdf.req(module_pre .. ".views.layer.HelpLayer")
local RoleInfoLayer = appdf.req(module_pre .. ".views.layer.RoleInfoLayer")
--

GameViewLayer.TAG_START				= 100
local enumTable = 
{
	"BT_EXIT",
	"BT_START",
	"BT_LUDAN",
	"BT_BANK",
	"BT_SET",
	"BT_ROBBANKER",
	"BT_APPLYBANKER",
	"BT_REJECT",
	"BT_USERLIST",
	"BT_APPLY",
	"BT_APPLYLIST",
	"BANK_LAYER",
	"BT_CLOSEBANK",
	"BT_TAKESCORE",
	"BT_HELP",
	"BT_CHAT"
}
local TAG_ENUM = ExternalFun.declarEnumWithTable(GameViewLayer.TAG_START, enumTable);
local zorders = 
{
	"CLOCK_ZORDER",
	"SITDOWN_ZORDER",
	"DROPDOWN_ZORDER",
	"DROPDOWN_CHECK_ZORDER",
	"GAMECARD_ZORDER",
	"SETTING_ZORDER",
	"ROLEINFO_ZORDER",
	"BANK_ZORDER",
	"USERLIST_ZORDER",
	"WALLBILL_ZORDER",
	"GAMERS_ZORDER",	
	"ENDCLOCK_ZORDER"
}
local TAG_ZORDER = ExternalFun.declarEnumWithTable(1, zorders);

local enumApply =
{
	"kCancelState",
	"kApplyState",
	"kApplyedState",
	"kSupperApplyed"
}

-- ????????????
local betPosList = 
{
	cc.p(286, 322), cc.p(667 , 401), cc.p(1047 , 324),cc.p(434 , 241),cc.p(894 , 241), cc.p(664 , 225),cc.p(357 , 507), cc.p(973 , 509)
}

-- ??????????????????
local sitPlayerPosList = 
{
	cc.p(60, 245), cc.p(60 , 402), cc.p(60 , 558),cc.p(1274 , 558),cc.p(1274 , 402), cc.p(1274 , 245)
}

--???????????????
local BankerPos = cc.p(780, 650);
local OtherPos = cc.p(1275, 90);
local MyPos = cc.p(100, 30);

--?????????????????????
local ChoumaType =
{
	[1] = 1,
	[2] = 10,
	[3] = 100,
	[4]	= 1000,
	[5] = 10000,
	[6] = 100000
}

GameViewLayer._apply_state = ExternalFun.declarEnumWithTable(0, enumApply)
local APPLY_STATE = GameViewLayer._apply_state

--?????????????????????
local DEFAULT_BET = 1
--??????????????????
local BET_ANITIME = 0.2

function GameViewLayer:ctor(scene)
	--??????node??????
	ExternalFun.registerNodeEvent(self)
	
	self._scene = scene
	self:gameDataInit();

	--?????????
	self.animateUI = nil

	--?????????csb??????
	self:initCsbRes();
	--?????????????????????
	self:initAction();
end

function GameViewLayer:loadRes(  )
	--??????????????????
	cc.Director:getInstance():getTextureCache():addImage("game/card.png");
end

---------------------------------------------------------------------------------------
--???????????????
function GameViewLayer:initCsbRes(  )
	local rootLayer, csbNode = ExternalFun.loadRootCSB("game/GameLayer.csb", self);
	self.m_rootLayer = rootLayer
	self.csbNode = csbNode
	-- self.animateUI = cc.Node:create():addTo(self, TAG_ZORDER.DROPDOWN_CHECK_ZORDER)
	self.animateUI = cc.Node:create();
	self:addToRootLayer(self.animateUI, TAG_ZORDER.CLOCK_ZORDER)
	--????????????
	local bottom_sp = csbNode:getChildByName("node_bottom");
	self.m_spBottom = bottom_sp;

	-- ????????????
	local node_score = csbNode:getChildByName("node_score");
	self.node_score = node_score;
	-- self.node_score:setVisible(false);
	self.node_score:setOpacity(0)

	--??????
	self.m_atlasScore = node_score:getChildByName("altas_score")
	self.m_atlasScore:setString("")
	--????????????
	self.m_scoreBg = node_score:getChildByName("score_bg")
	--????????????
	self.altas_score_banker = node_score:getChildByName("altas_score_banker")
	self.altas_score_banker:setString("")
	self.score_bg_banker = node_score:getChildByName("score_bg_banker")

		
	--???????????????
	self:initBtn(csbNode);

	--?????????????????????
	self:initBankerInfo();

	--?????????????????????
	self:initUserInfo();

	--?????????????????????
	self:initJetton(csbNode);

	--?????????????????????
	self:initSitDownList(csbNode)

	--?????????
	self:createClockNode()	
end

function GameViewLayer:reSet(  )

end

function GameViewLayer:reSetForNewGame(  )
	--??????????????????
	self:cleanJettonArea()

	--????????????
	if self.animateUI then
		self.animateUI:removeAllChildren()
	end

	--????????????
	self:jettonAreaBlinkClean()

	self:showGameResult(false)

	-- if nil ~= self.m_cardLayer then
	-- 	self.m_cardLayer:showLayer(false)
	-- end
end

--???????????????
function GameViewLayer:initBtn( csbNode )
	local this = self
	------
	--??????checkbox
	local function checkEvent( sender,eventType )
		self:onCheckBoxClickEvent(sender, eventType);
	end
	local btnlist_check = csbNode:getChildByName("btnlist_check");
	btnlist_check:addEventListener(checkEvent);
	btnlist_check:setSelected(false);
	btnlist_check:setLocalZOrder(TAG_ZORDER.DROPDOWN_CHECK_ZORDER)
	------

	------
	--????????????
	local function btnEvent( sender, eventType )
		if eventType == ccui.TouchEventType.ended then
			this:onButtonClickedEvent(sender:getTag(), sender);
		end
	end	
	local btn_list = csbNode:getChildByName("sp_btn_list");
	self.m_btnList = btn_list;
	btn_list:setScaleY(0.0000001)
	btn_list:setLocalZOrder(TAG_ZORDER.DROPDOWN_ZORDER)

	ExternalFun.registerTouchEvent(btn_list)
 	btn_list.onTouchBegan=function() return true end
 	btn_list.onTouchEnded=function() 
	 	if btn_list:isVisible() then 
	 		btnlist_check:setSelected(false);
	 		self.m_btnList:stopAllActions();
			self.m_btnList:runAction(self.m_actDropOut);
	 	end
 	end

 	--??????
	btn_back = csbNode:getChildByName("btn_back");
	btn_back:setTag(TAG_ENUM.BT_EXIT);
	btn_back:addTouchEventListener(btnEvent);

	--??????
	local help_btn = btn_list:getChildByName("help_btn");
	help_btn:setTag(TAG_ENUM.BT_HELP);
	help_btn:addTouchEventListener(btnEvent);

	--??????
	btn = btn_list:getChildByName("set_btn");
	btn:setTag(TAG_ENUM.BT_SET);
	btn:addTouchEventListener(btnEvent);

    -- ????????????????????????
    local enableBank = (GlobalUserItem.tabSystemConfig.EnjoinInsure == yl.ENABLE_VALUE)
	--??????
	bank_btn = btn_list:getChildByName("bank_btn");
	bank_btn:setTag(TAG_ENUM.BT_BANK);
	bank_btn:addTouchEventListener(btnEvent);
	bank_btn:setVisible(enableBank)

	--??????
	btn = csbNode:getChildByName("bank_btn");
	btn:setTag(TAG_ENUM.BT_BANK);
	btn:addTouchEventListener(btnEvent);
	btn:setVisible(enableBank)

	--??????
	local node_ludan = csbNode:getChildByName("node_ludan");
	self.node_ludan = node_ludan;
	local btn_record = node_ludan:getChildByName("btn_record");
	btn_record:setTag(TAG_ENUM.BT_LUDAN);
	btn_record:addTouchEventListener(btnEvent);

	local node_record  = node_ludan:getChildByName("node_record");
	local btn_record  = node_record:getChildByName("btn_record");
	btn_record:setTag(TAG_ENUM.BT_LUDAN);
	btn_record:addTouchEventListener(btnEvent);
	self.btn_record = btn_record;

	local node_roadBig  = node_ludan:getChildByName("node_roadBig");
	local btn_record_roadBig  = node_roadBig:getChildByName("btn_record_roadBig");
	btn_record_roadBig:setTag(TAG_ENUM.BT_LUDAN);
	btn_record_roadBig:addTouchEventListener(btnEvent);
	self.btn_record_roadBig = btn_record_roadBig;

	-- for i = 1, 20 do
	-- 	local record = self.node_ludan:getChildByName("record_" .. i);
	-- 	record:setVisible(false);
	-- end

	------
	local node_banker = csbNode:getChildByName("node_banker");
	--???????????????
	local banker_bg = node_banker:getChildByName("banker_bg");
	self.node_banker = node_banker;
	--??????
	btn = node_banker:getChildByName("rob_btn");
	btn:setTag(TAG_ENUM.BT_ROBBANKER);
	btn:addTouchEventListener(btnEvent);
	self.m_btnRob = btn;
	self.m_btnRob:setEnabled(false);

	--??????
	btn = node_banker:getChildByName("apply_btn");
	btn:setTag(TAG_ENUM.BT_APPLY);
	btn:addTouchEventListener(btnEvent);
	self.btnApply = btn

	--????????????
	btn = self.m_spBottom:getChildByName("rejetton_btn");
	btn:setTag(TAG_ENUM.BT_REJECT);
	btn:addTouchEventListener(btnEvent);
	-- btn:setVisible(false)

	--????????????
	btn = node_banker:getChildByName("banklist_btn");
	btn:setTag(TAG_ENUM.BT_APPLYLIST);
	btn:addTouchEventListener(btnEvent);	

	self.banker_apply_num = node_banker:getChildByName("player_num");
	self.banker_apply_num:setString(0);
	------

	--????????????
	btn = self.csbNode:getChildByName("userlist_btn");
	btn:setTag(TAG_ENUM.BT_USERLIST);
	btn:addTouchEventListener(btnEvent);

	self.player_num = self.m_spBottom:getChildByName("player_num");
	self.player_num:setString(0);

	-- ???????????? gameviewlayer -> gamelayer -> clientscene
    --self:getParentNode():getParentNode():createHelpBtn2(cc.p(1287, 620), 0, 122, 0, csbNode)
end

--?????????????????????
function GameViewLayer:initBankerInfo( ... )
	local node_banker = self.node_banker;
	--????????????
	local tmp = node_banker:getChildByName("name_text");
	self.m_clipBankerNick = g_var(ClipText):createClipText(tmp:getContentSize(), "");
	self.m_clipBankerNick:setAnchorPoint(tmp:getAnchorPoint());
	self.m_clipBankerNick:setPosition(tmp:getPosition());
	node_banker:addChild(self.m_clipBankerNick);

	--???????????????
	self.m_textBankerCoin = node_banker:getChildByName("bankercoin_text");

	self:reSetBankerInfo();
end

function GameViewLayer:reSetBankerInfo(  )
	self.m_clipBankerNick:setString("");
	self.m_textBankerCoin:setString("");
end

function GameViewLayer:cleanTable()
	if self.m_gameResultLayer then
		self.m_gameResultLayer:removeFromParent()
		self.m_gameResultLayer = nil
	end
end

--?????????????????????
function GameViewLayer:initUserInfo(  )	
	-- --????????????
	-- local tmp = self.m_spBottom:getChildByName("player_head")
	-- local head = g_var(PopupInfoHead):createClipHead(self:getMeUserItem(), tmp:getContentSize().width -20, "game/head_mask.png")
	-- head:setPosition(tmp:getPosition())
	-- tmp:addChild(head)

	local function btnEvent( sender, eventType )
		if eventType == ccui.TouchEventType.ended then
			self:onRoleInfoLayer()
		end
	end	
	local head_bottom = self.m_spBottom:getChildByName("head_bottom")
	head_bottom:addTouchEventListener(btnEvent)

	--???????????????
	self.m_textUserCoint = self.m_spBottom:getChildByName("coin_text")

	self:reSetUserInfo()
end

function GameViewLayer:formatScoreText(score)
    local scorestr = ExternalFun.formatScore(score)
    if score < 10000 then
        return scorestr,0
    end

    if score < 100000000 then
        scorestr = string.format("%.2f", score / 10000)
        return scorestr,1
    end
    scorestr = string.format("%.2f", score / 100000000)
    return scorestr,2
end

--????????????
function GameViewLayer:formatScoreShow(score, scoreType, scoreLabel, scoreIcon, wanStr, yiStr)
	scoreLabel:setString(score);
	local labelW = scoreLabel:getContentSize().width/2;
	local labelPosX = scoreLabel:getPositionX();
	if scoreType == 0 then
		scoreIcon:setVisible(false);
	elseif scoreType == 1 then
		scoreIcon:setVisible(true);
		scoreIcon:setTexture(wanStr);
		scoreIcon:setPositionX(labelPosX + labelW);
	elseif scoreType == 2 then
		scoreIcon:setVisible(true);
		scoreIcon:setTexture(yiStr);
		scoreIcon:setPositionX(labelPosX + labelW);
	end
end

function GameViewLayer:reSetUserInfo(  )
	-- local node = self.csbNode:getChildByName("Node_noNotice")
	self.m_scoreUser = 0
	local myUser = self:getMeUserItem()
	if nil ~= myUser then
		self.m_scoreUser = myUser.lScore;
	end	

	local name = self.m_spBottom:getChildByName("name")
	name:setString(myUser.szNickName);
	-- local str = self.m_scoreUser
	-- if self.m_scoreUser >= 100000000 then
	-- 	node:getChildByName("yi_1"):setVisible(true)
 --        node:getChildByName("nostr_1"):setVisible(false)
	-- elseif self.m_scoreUser >= 10000 then
	-- 	node:getChildByName("yi_1"):setVisible(false)
 --        node:getChildByName("nostr_1"):setVisible(true)
	-- else
	-- 	node:getChildByName("yi_1"):setVisible(false)
 --        node:getChildByName("nostr_1"):setVisible(false)
	-- end

	-- print("???????????????:" .. ExternalFun.formatScore(self.m_scoreUser))
	-- self.m_textUserCoint:setString(self:formatScoreText(self.m_scoreUser));

	self:freshUserScore()
	--??????????????????
	self.m_nextSelect = 0
end

--??????????????????
function GameViewLayer:freshBankerInfo(lScore)
	local node = self.node_banker;
	local icon_yi = node:getChildByName("icon_yi");
	local icon_wan = node:getChildByName("icon_wan");
	if lScore >= 100000000 then
		icon_yi:setVisible(true)
        icon_wan:setVisible(false)
	elseif lScore >= 10000 then
		icon_yi:setVisible(false)
        icon_wan:setVisible(true)
	else
		icon_yi:setVisible(false)
        icon_wan:setVisible(false)
	end

	print("???????????????:" .. ExternalFun.formatScore(lScore))
	local scoreStr, scoreType = self:formatScoreText(lScore);
	self.m_textBankerCoin:setString(scoreStr);

	--???????????????
	local scoreW = self.m_textBankerCoin:getContentSize().width;
	local scorePosX = self.m_textBankerCoin:getPositionX();
	icon_yi:setPositionX(scorePosX + scoreW + 8);
	icon_wan:setPositionX(scorePosX + scoreW +8);
end

-- ??????????????????
function GameViewLayer:playerEndScoreEffect(changescore, lBankerWinScore)
	-- if 0 == changescore then
	-- 	return
	-- end

	--????????????
	local str = "/" .. ExternalFun.numberThousands(changescore)
	self.m_atlasScore:setVisible(true);
	self.m_scoreBg:setVisible(true);
	if changescore > 0 then
		self.m_atlasScore:setProperty(str, "fonts/atlas_add.png", 27, 43, ".")
		self.m_scoreBg:loadTexture("game/score_bg_add.png");
	elseif changescore < 0 then
		self.m_atlasScore:setProperty(str, "fonts/atlas_sub.png", 27, 43, ".")
		self.m_scoreBg:loadTexture("game/score_bg_sub.png");
	else
		self.m_atlasScore:setVisible(false);
		self.m_scoreBg:setVisible(false);
	end
	self.m_scoreBg:setContentSize(cc.size(self.m_atlasScore:getContentSize().width +120, 45))

	--????????????
	local bankerStr = "/" .. ExternalFun.numberThousands(lBankerWinScore)
	self.score_bg_banker:setVisible(true);
	self.altas_score_banker:setVisible(true);
	if lBankerWinScore > 0 then
		self.altas_score_banker:setProperty(bankerStr, "fonts/atlas_add.png", 27, 43, ".")
		self.score_bg_banker:loadTexture("game/score_bg_add.png");
	elseif lBankerWinScore < 0 then
		self.altas_score_banker:setProperty(bankerStr, "fonts/atlas_sub.png", 27, 43, ".")
		self.score_bg_banker:loadTexture("game/score_bg_sub.png");
	else
		self.altas_score_banker:setVisible(false);
		self.score_bg_banker:setVisible(false);
	end
	self.score_bg_banker:setContentSize(cc.size(self.altas_score_banker:getContentSize().width +120, 45))

	self.node_score:setOpacity(255)
	--????????????
	local moveBy = cc.MoveBy:create(2.0, cc.p(0, 50))
	local fadeout = cc.FadeOut:create(0.5)
	local call = cc.CallFunc:create(function( )
		self.node_score:setPositionY(0)
	end)
	self.node_score:runAction(cc.Sequence:create(moveBy, fadeout, call))
end

-- ??????????????????
function GameViewLayer:freshUserScore()
	--??????
	-- local str = ExternalFun.formatScore(self.m_scoreUser)
	-- if string.len(str) > 11 then
	-- 	str = string.sub(str,1,11) .. "...";
	-- end
	local node = self.csbNode:getChildByName("Node_noNotice");
	local icon_yi = node:getChildByName("yi_1");
	local icon_wan = node:getChildByName("nostr_1");
	
	if self.m_scoreUser >= 100000000 then
		icon_yi:setVisible(true);
        icon_wan:setVisible(false);
	elseif self.m_scoreUser >= 10000 then
		icon_yi:setVisible(false);
        icon_wan:setVisible(true);
	else
		icon_yi:setVisible(false);
        icon_wan:setVisible(false);
	end
	local scoreStr, scoreType = self:formatScoreText(self.m_scoreUser);
	self.m_textUserCoint:setString(scoreStr);
	--???????????????
	local scoreW = self.m_textUserCoint:getContentSize().width;
	local scorePosX = self.m_textUserCoint:getPositionX();
	icon_yi:setPositionX(scorePosX + scoreW/2);
	icon_wan:setPositionX(scorePosX + scoreW/2);
end

-- ??????????????????
function GameViewLayer:freshSitUserScore(wChairID, changeScore)
	--????????????
	local index = 0;
	for i = 1,g_var(cmd).MAX_OCCUPY_SEAT_COUNT do
		if (nil ~= self.m_tabSitDownUser[i]) and (wChairID == self.m_tabSitDownUser[i]:getChair()) then
			index = i
			break
		end
	end

	if index <= 0 then
		return;
	end

	self.m_tabSitDownUser[index]:freshSiteRoleScore(changeScore);
end

--?????????????????????
function GameViewLayer:initJetton( csbNode )
	local bottom_sp = self.m_spBottom;
	------
	--????????????	
	local clip_layout = bottom_sp:getChildByName("clip_layout");
	self.m_layoutClip = clip_layout;
	
	local node_bet = self.csbNode:getChildByName("node_bet");
	for i = 1,8 do
		local bet_node = node_bet:getChildByName("bet_" .. i);
		self.m_tableJettonNode[i] = bet_node;
		self:reSetJettonNode(self.m_tableJettonNode[i])
	end
	self.bet_total = node_bet:getChildByName("bet_total");
	--???????????????
	self:reSetTotalJetton();
	------
	--????????????
	self:initJettonArea(csbNode);
	------

	-----
	--??????????????????
	-----
	self:initJettonSp(csbNode);
end

function GameViewLayer:enableJetton( var )
	--????????????
	self:reSetJettonBtnInfo(var);

	--????????????
	self:reSetJettonArea(var);
end

--??????
function GameViewLayer:addLabelAtlasWithParent(parent, str)
	-- local lab = cc.LabelAtlas:create("0","fonts/font_bet_num.png",19, 29, string.byte("."))
	local lab = cc.LabelAtlas:create("","fonts/font_bet_num_1.png",8, 12, string.byte("."))
	parent:addChild(lab)
	lab:setAnchorPoint(0.5,0.5)
	lab:setPosition(parent:getContentSize().width/2,parent:getContentSize().height/2)
	local num = str
	lab:setString(num)
	if num >= 10000 then
		num = num / 10000
		lab:setString(num)
		local sp = cc.Sprite:create("game/wan.png")
		sp:setScale(0.5)
		parent:addChild(sp)
		sp:setAnchorPoint(0, 0.5)
		lab:setPositionX(parent:getContentSize().width/2 - 5)
		sp:setPosition(lab:getPositionX() + lab:getContentSize().width/2 , parent:getContentSize().height/2)
	end
end

--????????????
function GameViewLayer:addBetBtnAtlasWithParent(parent, str)
	local lab = cc.LabelAtlas:create("0","fonts/font_bet_num.png",19, 29, string.byte("."))
	parent:addChild(lab)
	lab:setAnchorPoint(0.5,0.5)
	lab:setPosition(parent:getContentSize().width/2,parent:getContentSize().height/2+5)
	local num = str
	lab:setString(num)
	if num >= 10000 then
		num = num / 10000
		lab:setString(num)
		local sp = cc.Sprite:create("game/wan.png")
		sp:setScale(1.2)
		parent:addChild(sp)
		sp:setAnchorPoint(0, 0.5)
		lab:setPositionX(parent:getContentSize().width/2 - 10)
		sp:setPosition(lab:getPositionX() + lab:getContentSize().width/2 , parent:getContentSize().height/2+5)
	end
end

--????????????
function GameViewLayer:initJettonBtnInfo(  )
	local clip_layout = self.m_layoutClip;
	local this = self

	local function clipEvent( sender, eventType )
		if eventType == ccui.TouchEventType.ended then
			this:onJettonButtonClicked(sender:getTag(), sender);
		end
	end

	self.m_tabJettonAnimate = {}
	for i=1,#self.m_pJettonNumber do
		local tag = i - 1
		local str = string.format("chip%d_btn", tag)
		local btn = clip_layout:getChildByName(str)
		btn:setTag(i)
		btn:addTouchEventListener(clipEvent)
		self.m_tableJettonBtn[i] = btn
		
		local num = self.m_pJettonNumber[i].k
		self:addBetBtnAtlasWithParent(btn, num)
		
		str = string.format("chip%d", tag)
		self.m_tabJettonAnimate[i] = clip_layout:getChildByName(str)
	end

	self:reSetJettonBtnInfo(false);
end

function GameViewLayer:reSetJettonBtnInfo( var )
	for i=1,#self.m_tableJettonBtn do
		self.m_tableJettonBtn[i]:setTag(i)
		self.m_tableJettonBtn[i]:setEnabled(var)

		self.m_tabJettonAnimate[i]:stopAllActions()
		self.m_tabJettonAnimate[i]:setVisible(false)
	end
end

function GameViewLayer:adjustJettonBtn(  )
	--?????????????????????
	local lCanJetton = self.m_llMaxJetton - self.m_lHaveJetton;
	local lCondition = math.min(self.m_scoreUser, lCanJetton);
	print("=================================>",self.m_llMaxJetton, self.m_lHaveJetton,lCanJetton,self.m_scoreUser)

	for i=1,#self.m_tableJettonBtn do
		local enable = false
		if self.m_bOnGameRes then
			enable = false
		else
			enable = self.m_bOnGameRes or (lCondition >= self.m_pJettonNumber[i].k)
		end
		self.m_tableJettonBtn[i]:setEnabled(enable);
	end

	if self.m_nJettonSelect > self.m_scoreUser then
		self.m_nJettonSelect = -1;
	end

	--????????????
	local enable = lCondition >= self.m_pJettonNumber[self.m_nSelectBet].k;
	if false == enable then
		self.m_tabJettonAnimate[self.m_nSelectBet]:stopAllActions()
		self.m_tabJettonAnimate[self.m_nSelectBet]:setVisible(false)
	end
end

function GameViewLayer:refreshJetton(  )
	-- local str = ExternalFun.numberThousands(self.m_lHaveJetton)
	-- self.m_clipJetton:setString(str)
	-- self.m_userJettonLayout:setVisible(self.m_lHaveJetton > 0)
end

function GameViewLayer:switchJettonBtnState( idx )
	for i=1,#self.m_tabJettonAnimate do
		self.m_tabJettonAnimate[i]:stopAllActions()
		self.m_tabJettonAnimate[i]:setVisible(false)
	end

	--?????????????????????
	local lCanJetton = self.m_llMaxJetton - self.m_lHaveJetton;
	local lCondition = math.min(self.m_scoreUser, lCanJetton);
	if nil ~= idx and nil ~= self.m_tabJettonAnimate[idx] then
		local enable = lCondition >= self.m_pJettonNumber[idx].k;
		if enable then
			-- local blink = cc.Blink:create(1.0,1)
			-- self.m_tabJettonAnimate[idx]:runAction(cc.RepeatForever:create(blink))
			self.m_tabJettonAnimate[idx]:setVisible(true)
		end		
	end
end

-- --????????????????????????
-- function GameViewLayer:betAnimation( )
-- 	local cmd_gameend = self:getDataMgr().m_tabGameEndCmd
-- 	if nil == cmd_gameend then
-- 		return
-- 	end

-- 	local tmp = self.m_betAreaLayout:getChildren()
-- 	dump(tmp,"------------????????????????????????------------",6)
-- 	--????????????
-- 	local maxCount = 300
-- 	local count = 0
-- 	local children = {}
-- 	for k,v in pairs(tmp) do
-- 		table.insert(children, v)
-- 		count = count + 1
-- 		if count > maxCount then
-- 			break
-- 		end
-- 	end
-- 	local left = {}
-- 	print("bankerscore:" .. ExternalFun.formatScore(cmd_gameend.lBankerScore))
-- 	print("selfscore:" .. ExternalFun.formatScore(cmd_gameend.lPlayAllScore))

-- 	--?????????
-- 	local call = cc.CallFunc:create(function()
-- 		left = self:userBetAnimation(children, "banker", cmd_gameend.lBankerScore)
-- 		if cmd_gameend.lBankerScore < 0 then
-- 			local tmp = self.m_betAreaLayout:getChildren()
-- 			--????????????
-- 			local maxCount = 300
-- 			local count = 0
-- 			local children = {}
-- 			for k,v in pairs(tmp) do
-- 				table.insert(children, v)
-- 				count = count + 1
-- 				if count > maxCount then
-- 					break
-- 				end
-- 			end
-- 			left = children
-- 		end
-- 	end)
-- 	local delay = cc.DelayTime:create(0.5)

-- 	--?????????
-- 	local meChair =  self:getMeUserItem().wChairID
-- 	local call2 = cc.CallFunc:create(function()		
-- 		left = self:userBetAnimation(left, meChair, cmd_gameend.lPlayAllScore)

-- 		--??????????????????
-- 		if cmd_gameend.lPlayAllScore > 0 then
-- 			local myUser = self:getMeUserItem()
-- 			if nil ~= myUser then
-- 				self.m_scoreUser = myUser.lScore;
-- 			end	
-- 			self.m_scoreUser = self.m_scoreUser + cmd_gameend.lPlayAllScore;
-- 			self:freshUserScore();
-- 		end

-- 		--??????????????????????????????
-- 		self:playerEndScoreEffect(cmd_gameend.lPlayAllScore, cmd_gameend.lBankerWinScore);
		
-- 	end)	
-- 	local delay2 = cc.DelayTime:create(0.5)

-- 	--?????????
-- 	local call3 = cc.CallFunc:create(function()
-- 		for i = 1, g_var(cmd).MAX_OCCUPY_SEAT_COUNT do
-- 			if nil ~= self.m_tabSitDownUser[i] then
-- 				--?????????
-- 				local chair = self.m_tabSitDownUser[i]:getChair()
-- 				local score = cmd_gameend.lOccupySeatUserWinScore[1][i]
-- 				-- if meChair ~= chair then
-- 					left = self:userBetAnimation(left, chair, cmd_gameend.lOccupySeatUserWinScore[1][i])
-- 				-- end

-- 				local useritem = self:getDataMgr():getChairUserList()[chair + 1]
-- 				--???????????????
-- 				self.m_tabSitDownUser[i]:gameEndScoreChange(useritem, score)
-- 			end
-- 		end
-- 	end)
-- 	local delay3 = cc.DelayTime:create(0.5)	

-- 	--???????????????
-- 	local call4 = cc.CallFunc:create(function()
-- 		self:userBetAnimation(left, "other", 1)
-- 	end)

-- 	--?????????????????????
-- 	local call5 = cc.CallFunc:create(function()
-- 		--??????????????????????????????
-- 		self:cleanJettonArea()
-- 	end)

-- 	local seq = cc.Sequence:create(call, delay, call2, delay2, call3, delay3, call4, cc.DelayTime:create(2), call5)
-- 	self:stopAllActions()
-- 	self:runAction(seq)	
-- end


-- function GameViewLayer:flyFromBanker(data)
-- 	local pos = cc.p(self.m_textBankerCoin:getPositionX(), self.m_textBankerCoin:getPositionY())
-- 	-- pos = self.m_textBankerCoin:convertToWorldSpace(pos)
-- 	-- pos = self.m_betAreaLayout:convertToNodeSpace(pos)

-- 	local area = data.areaIndex
-- 	local nIdx = self:getJettonIdx(data.lBetScore)-1
-- 	local str = string.format("game/chip_%d.png", nIdx);
-- 	local sp = cc.Sprite:create(str)
	
-- 	local num = self.m_pJettonNumber[nIdx].k
	
-- 	self:addLabelAtlasWithParent(sp, num)
	
-- 	local btn = self.m_tableJettonArea[area];
-- 	if nil == sp then
-- 		print("sp nil");
-- 	end

-- 	if nil == btn then
-- 		print("btn nil");
-- 	end
-- 	if nil ~= sp and nil ~= btn then
-- 		--??????
-- 		-- sp:setTag(wUser);
-- 		local name = string.format("%d", area) 
-- 		sp:setName(name)
		
-- 		--????????????????????????
-- 		sp:setPosition(pos)
-- 		--??????????????????
-- 		local act = self:getBetAnimation(self:getBetRandomPos(area), cc.CallFunc:create(function()
-- 			--?????????????????????
-- 			ExternalFun.playSoundEffect("CoinFly.wav")
-- 		end))
-- 		sp:stopAllActions()
-- 		sp:runAction(act)
-- 		self.m_betAreaLayout:addChild(sp)
-- 	end
-- end

-- --????????????
-- function GameViewLayer:userBetAnimation( children, wchair, score, cmd_gameend )
-- 	print(children,wchair,score,"--------????????????---------")
-- 	--?????????????????????
-- 	if score < 0 and "banker" == wchair then
-- 		local blinkArea = self:getDataMgr().m_tabBetArea
-- 		local score = math.abs(score)

-- 		local winCount = {}
-- 		for i=1, #blinkArea do
-- 			if blinkArea[i] > 0 then
-- 				table.insert(winCount, i)
-- 			end
-- 		end

-- 		local leftScore = score
-- 		for i=#self.m_pJettonNumber, 1, -1 do
-- 			local num = math.floor(leftScore/self.m_pJettonNumber[i].k)
-- 			leftScore = score%self.m_pJettonNumber[i].k

-- 			for j=1, num do
-- 				local index = math.random(#winCount)
-- 				local tmp = {}
-- 				tmp.areaIndex = winCount[index]
-- 				-- tmp.wChairID = 
-- 				tmp.lBetScore = self.m_pJettonNumber[i].k
-- 				self:flyFromBanker(tmp)
-- 			end
-- 		end
-- 	end
-- 	------------------------------------------------------------------------
-- 	if nil == score or score <= 0 then
-- 		return children
-- 	end

-- 	local left = {}
-- 	local getScore = score
-- 	local tmpScore = 0
-- 	local totalIdx = #self.m_pJettonNumber
-- 	local winSize = self.m_betAreaLayout:getContentSize()
-- 	local remove = true
-- 	local count = 0
-- 	for k,v in pairs(children) do
-- 		local idx = nil

-- 		if remove then
-- 			if nil ~= v and not tolua.isnull(v) and v:getTag() and  v:getTag() == wchair then
-- 				idx = tonumber(v:getName())
				
-- 				local pos = self.m_betAreaLayout:convertToNodeSpace(self:getBetFromPos(wchair))
-- 				self:generateBetAnimtion(v, {x = pos.x, y = pos.y}, count)

-- 				if nil ~= idx and nil ~= self.m_pJettonNumber[idx] then
-- 					tmpScore = tmpScore + self.m_pJettonNumber[idx].k
-- 				end

-- 				if tmpScore >= score then
-- 					remove = false
-- 				end
-- 			elseif yl.INVALID_CHAIR == wchair then
-- 				--?????????????????????
-- 				idx = self:randomGetBetIdx(getScore, totalIdx)

-- 				local pos = self.m_betAreaLayout:convertToNodeSpace(self:getBetFromPos(wchair))

-- 				if nil ~= idx and nil ~= self.m_pJettonNumber[idx] then
-- 					tmpScore = tmpScore + self.m_pJettonNumber[idx].k
-- 					getScore = getScore - tmpScore
-- 				end

-- 				if tmpScore >= score then
-- 					remove = false
-- 				end
-- 			elseif "banker" == wchair then
-- 				--?????????????????????
-- 				idx = self:randomGetBetIdx(getScore, totalIdx)

-- 				local pos = cc.p(self.m_textBankerCoin:getPositionX(), self.m_textBankerCoin:getPositionY())
-- 				-- pos = self.m_textBankerCoin:convertToWorldSpace(pos)
-- 				-- pos = self.m_betAreaLayout:convertToNodeSpace(pos)
				
-- 				self:generateBetAnimtion(v, {x = pos.x, y = pos.y}, count)

-- 				if nil ~= idx and nil ~= self.m_pJettonNumber[idx] then
-- 					tmpScore = tmpScore + self.m_pJettonNumber[idx].k
-- 					getScore = getScore - tmpScore
-- 				end
-- 				print("banker win bet",count,idx,tmpScore,score)
-- 				if tmpScore >= score then
-- 					remove = false
-- 				end
-- 			elseif "other" == wchair then
-- 				local posx = self.csbNode:getChildByName("userlist_btn"):getPositionX()
-- 				local posy = self.csbNode:getChildByName("userlist_btn"):getPositionY()
-- 				-- local worldPos = self.m_spBottom:convertToWorldSpace(cc.p(posx,posy))
-- 				-- local _pos = self.csbNode:convertToNodeSpace(worldPos)
-- 				local pos = cc.p(posx,posy)
-- 				self:generateBetAnimtion(v, {x = pos.x, y = pos.y}, count)
-- 			else
-- 				table.insert(left, v)
-- 			end
-- 		else
-- 			table.insert(left, v)
-- 		end	
-- 		count = count + 1	
-- 	end
-- 	return left
-- end

-- function GameViewLayer:generateBetAnimtion( bet, pos, count)
-- 	if bet == nil or tolua.isnull(bet) then
-- 		return;
-- 	end
-- 	--????????????	
-- 	local moveTo = cc.MoveTo:create(BET_ANITIME, cc.p(pos.x, pos.y))
-- 	local call = cc.CallFunc:create(function ( )
-- 		bet:removeAllChildren()
-- 		bet:removeFromParent()
-- 		bet = nil
-- 	end)
-- 	bet:stopAllActions()
-- 	-- bet:runAction(cc.Sequence:create(cc.DelayTime:create(0.05 * count),moveTo, call))
-- 	bet:runAction(cc.Sequence:create(cc.DelayTime:create(0.05),moveTo, call))

-- 	--?????????????????????
-- 	ExternalFun.playSoundEffect("CoinFly.wav")
-- end

-- function GameViewLayer:randomGetBetIdx( score, totalIdx )
-- 	if score > self.m_pJettonNumber[1].k and score < self.m_pJettonNumber[2].k then
-- 		return math.random(1,2)
-- 	elseif score > self.m_pJettonNumber[2].k and score < self.m_pJettonNumber[3].k then
-- 		return math.random(1,3)
-- 	elseif score > self.m_pJettonNumber[3].k and score < self.m_pJettonNumber[4].k then
-- 		return math.random(1,4)
-- 	else
-- 		return math.random(totalIdx)
-- 	end	
-- end

--???????????????
-- ????????????
function GameViewLayer:chipCreatByType(chipType, m_llScore)
	local file = "game/chip_" .. chipType ..".png"
    local chip = display.newSprite(file);
    --???????????????
    self:addLabelAtlasWithParent(chip, m_llScore);

	return chip;
end

--????????????????????????
function GameViewLayer:chipCreatByScore(score, startPos)
	local chipList = {};
	if score <= 0 then
		return chipList;
	end
	local numbers = self.m_pJettonNumber;
	local betNums = {numbers[1].k, numbers[2].k, numbers[3].k, numbers[4].k, numbers[5].k, numbers[6].k};
	local vec = self:getDataMgr().calcuteJetton(score, false, betNums);
	
	-- local winAreList = self:getWinAreaIndexList(tabArea);
	--????????????
	local winAreList = self:getWinAreaIndexList();
	local index = 0;
	for k,v in pairs(vec) do
		local info = v;
		for i=1,info.m_cbCount do
			local chip = self:chipCreatByType(info.m_cbIdx, info.m_llScore);
			chip:setPosition(startPos);
			self.m_betAreaLayout:addChild(chip);

			table.insert(chipList, chip);

			--??????????????????
			local index = math.random(#winAreList);
			local areaIndex = winAreList[index];
			local endPos = self:getBetRandomPos(areaIndex);
			self:betFlyAnimtion(chip, endPos, 0.01*index, 0.4, false);
			index = index +1;
		end
	end
	return chipList;
end

--??????????????????
function GameViewLayer:chipFlyToWinPlayer(winBetArr, endPos)
	local index = 0;
	for i = 1,#winBetArr do
		local chip = winBetArr[i];
		if chip then
			self:betFlyAnimtion(chip, endPos, 0.01*index, 0.4, true);
			index = index +1;
		end
	end
end

--???????????????????????????????????????????????????
function GameViewLayer:endBetAnimation()
	local cmd_gameend = self:getDataMgr().m_tabGameEndCmd;
	if nil == cmd_gameend then
		return;
	end

	--????????????
	local allAreaTotalScore = 0;
	for i = 1,g_var(cmd).AREA_MAX do
		allAreaTotalScore = allAreaTotalScore + self.m_tableJettonNode[i].m_llAreaTotal;
	end

	--????????????
	local callFun1 = cc.CallFunc:create(function()
		local children = self.m_betAreaLayout:getChildren();
		local index = 0;
		for k,v in pairs(children) do
			if nil ~= v and not tolua.isnull(v) then
				--?????????
				self:betFlyAnimtion(v, BankerPos, 0.01*index, 0.4, true);
				index = index +1;
			end
		end
	end)
	local delayTime1 = cc.DelayTime:create(1.0);

	--?????????????????????????????????????????????????????????
	local meChair =  self:getMeUserItem().wChairID;
	local otherScore = 0;
	local myWinBetArr = {};
	local sitPlayerWinBetArr = {{}, {}, {}, {}, {}, {}, {}, {}};
	local otherWinBetArr ={};
	local totalBetArr ={};
	local startPos = BankerPos;

	local callFun2 = cc.CallFunc:create(function()
		self.m_betAreaLayout:removeAllChildren();

		myWinBetArr = self:chipCreatByScore(cmd_gameend.lPlayAllScore, startPos);
		otherScore = allAreaTotalScore - cmd_gameend.lPlayAllScore;

		--??????????????????
		if cmd_gameend.lPlayAllScore > 0 then
			local myUser = self:getMeUserItem();
			if nil ~= myUser then
				self.m_scoreUser = myUser.lScore;
			end	
			self.m_scoreUser = self.m_scoreUser + cmd_gameend.lPlayAllScore;
			self:freshUserScore();
		end

		--??????????????????????????????
		self:playerEndScoreEffect(cmd_gameend.lPlayAllScore, cmd_gameend.lBankerWinScore);
	end)
	
	local callFun3 = cc.CallFunc:create(function()
		for i = 1,g_var(cmd).MAX_OCCUPY_SEAT_COUNT do
			if nil ~= self.m_tabSitDownUser[i] then
				local sitPlayerScore = cmd_gameend.lOccupySeatUserWinScore[1][i];
				local chair = self.m_tabSitDownUser[i]:getChair()
				if sitPlayerScore > 0 then
					sitPlayerWinBetArr[i] = self:chipCreatByScore(sitPlayerScore, startPos);
					if meChair ~= chair then
						otherScore = otherScore - sitPlayerScore;
					end
				end

				--?????????
				-- local chair = self.m_tabSitDownUser[i]:getChair()
				-- local score = cmd_gameend.lOccupySeatUserWinScore[1][i]
				local useritem = self:getDataMgr():getChairUserList()[chair + 1];
				--???????????????
				self.m_tabSitDownUser[i]:gameEndScoreChange(useritem, sitPlayerScore);
			end
		end
	end)
	local callFun4 = cc.CallFunc:create(function()
		otherWinBetArr = self:chipCreatByScore(otherScore, startPos);
	end)
	local delayTime4 = cc.DelayTime:create(1.5);

	--????????????????????????
	local callFun5 = cc.CallFunc:create(function()
		--?????????
		self:chipFlyToWinPlayer(myWinBetArr, MyPos);
		--???????????????
		for i = 1,#sitPlayerWinBetArr do
			self:chipFlyToWinPlayer(sitPlayerWinBetArr[i], sitPlayerPosList[i]);
		end
		--???????????????
		local userList = self:getDataMgr():getUserList();
		if #userList > 1 then
			self:chipFlyToWinPlayer(otherWinBetArr, OtherPos);
		end
	end)
	local delayTime5 = cc.DelayTime:create(1.0);
	
	--?????????????????????
	local callFun6 = cc.CallFunc:create(function()
		--??????????????????????????????
		self:cleanJettonArea();
	end)

	local seq = cc.Sequence:create(callFun1, delayTime1, callFun2, callFun3, callFun4, delayTime4, callFun5, delayTime5, callFun6);
	self:stopAllActions();
	self:runAction(seq);
end

function GameViewLayer:betFlyAnimtion(betNode, endPos, delayTime, moveTime, isRemoveSelf)
	if betNode == nil or tolua.isnull(betNode) then
		return;
	end
	--????????????
	local delay = cc.DelayTime:create(delayTime);
	local moveTo = cc.MoveTo:create(moveTime, endPos);
	local call = cc.CallFunc:create(function()
		if isRemoveSelf then
			betNode:removeAllChildren();
			betNode:removeFromParent();
			betNode = nil;
		end
	end)
	betNode:stopAllActions();
	betNode:runAction(cc.Sequence:create(delay,moveTo, call));

	--?????????????????????
	ExternalFun.playSoundEffect("CoinFly.wav");
end

--????????????
function GameViewLayer:getWinAreaIndexList()
	local tabArea = self:getDataMgr().m_tabBetArea;
	local winAreList = {};
	for i = 1, g_var(cmd).AREA_MAX do
		local score = tabArea[i]
		if score > 0 then
			table.insert(winAreList, i);
		end
	end
	return winAreList;
end

--????????????
function GameViewLayer:initJettonArea( csbNode )
	local this = self
	local tag_control = csbNode:getChildByName("tag_control");
	self.m_tagControl = tag_control

	--????????????
	self.m_betAreaLayout = tag_control:getChildByName("bet_area")

	--????????????
	local function btnEvent( sender, eventType )
		if eventType == ccui.TouchEventType.ended then
			this:onJettonAreaClicked(sender:getTag(), sender);
		end
	end	

	for i=1,8 do
		local tag = i - 1;
		local str = string.format("tag%d_btn", tag);
		local tag_btn = tag_control:getChildByName(str);
		tag_btn:setTag(i);
		tag_btn:addTouchEventListener(btnEvent);
		self.m_tableJettonArea[i] = tag_btn; 
	end

	--????????????
	-- local m_userJettonLayout = csbNode:getChildByName("jetton_control");
	-- local infoSize = m_userJettonLayout:getContentSize()
	-- local text = ccui.Text:create("???????????????:", "fonts/round_body.ttf", 20)
	-- text:setAnchorPoint(cc.p(1.0,0.5))
	-- text:setPosition(cc.p(infoSize.width * 0.495, infoSize.height * 0.19))
	-- m_userJettonLayout:addChild(text)
	-- m_userJettonLayout:setVisible(false)

	-- local m_clipJetton = g_var(ClipText):createClipText(cc.size(120, 23), "")
	-- m_clipJetton:setPosition(cc.p(infoSize.width * 0.5, infoSize.height * 0.19))
	-- m_clipJetton:setAnchorPoint(cc.p(0,0.5));
	-- m_clipJetton:setTextColor(cc.c4b(255,165,0,255))
	-- m_userJettonLayout:addChild(m_clipJetton)

	-- self.m_userJettonLayout = m_userJettonLayout;
	-- self.m_clipJetton = m_clipJetton;

	self:reSetJettonArea(false);
end

function GameViewLayer:reSetJettonArea( var )
	for i=1,#self.m_tableJettonArea do
		self.m_tableJettonArea[i]:setEnabled(var);
	end
end

function GameViewLayer:cleanJettonArea(  )
	--?????????????????????
	self.m_betAreaLayout:removeAllChildren()

	for i=1,#self.m_tableJettonArea do
		if nil ~= self.m_tableJettonNode[i] then
			--self.m_tableJettonNode[i]:reSet()
			self:reSetJettonNode(self.m_tableJettonNode[i])
		end
	end
	-- self.m_userJettonLayout:setVisible(false)
	-- self.m_clipJetton:setString("")

	--???????????????
	self:reSetTotalJetton();
end

--??????????????????
function GameViewLayer:initJettonSp( csbNode )
	self.m_tagSpControls = {};
	local sp_control = csbNode:getChildByName("tag_sp_control");
	for i=1,8 do
		local tag = i - 1;
		local str = string.format("tagsp_%d", tag);
		local tagsp = sp_control:getChildByName(str);
		self.m_tagSpControls[i] = tagsp;
	end

	self:reSetJettonSp();
end

function GameViewLayer:reSetJettonSp(  )
	for i=1,#self.m_tagSpControls do
		self.m_tagSpControls[i]:setVisible(false);
	end
end

--??????????????????
function GameViewLayer:jettonAreaBlink( tabArea )
	for i = 1, #tabArea do
		local score = tabArea[i]
		if score > 0 then
			local rep = cc.RepeatForever:create(cc.Blink:create(1.0,1))
			self.m_tagSpControls[i]:runAction(rep)
		end
	end
end

function GameViewLayer:jettonAreaBlinkClean(  )
	for i = 1, g_var(cmd).AREA_MAX do
		self.m_tagSpControls[i]:stopAllActions()
		self.m_tagSpControls[i]:setVisible(false)
	end
end

--????????????
function GameViewLayer:initSitDownList( csbNode )
	local m_roleSitDownLayer = csbNode:getChildByName("role_control")
	self.m_roleSitDownLayer = m_roleSitDownLayer

	--????????????
	local function btnEvent( sender, eventType )
		if eventType == ccui.TouchEventType.ended then
			self:onSitDownClick(sender:getTag(), sender);
		end
	end

	local str = ""
	for i=1,g_var(cmd).MAX_OCCUPY_SEAT_COUNT do
		str = string.format("sit_btn_%d", i)
		self.m_tabSitDownList[i] = m_roleSitDownLayer:getChildByName(str)
		self.m_tabSitDownList[i]:setTag(i)
		self.m_tabSitDownList[i]:addTouchEventListener(btnEvent);
	end
end

function GameViewLayer:initAction(  )
	local dropIn = cc.ScaleTo:create(0.2, 1.0);
	dropIn:retain();
	self.m_actDropIn = dropIn;

	local dropOut = cc.ScaleTo:create(0.2, 1.0, 0.0000001);
	dropOut:retain();
	self.m_actDropOut = dropOut;
end
---------------------------------------------------------------------------------------

function GameViewLayer:onButtonClickedEvent(tag,ref)
	ExternalFun.playClickEffect()
	if tag == TAG_ENUM.BT_EXIT then
		print("----------BT_EXIT------------")
		if self.m_lHaveJetton > 0 then
			self._scene.m_cbGameStatus = g_var(cmd).GAME_PLAY
		else
			self._scene.m_cbGameStatus = g_var(cmd).GAME_SCENE_FREE
		end

		self:getParentNode():onQueryExitGame()
	elseif tag == TAG_ENUM.BT_START then
		self:getParentNode():onStartGame()
	elseif tag == TAG_ENUM.BT_USERLIST then
		if nil == self.m_userListLayer then
			self.m_userListLayer = g_var(UserListLayer):create(self)
			self:addToRootLayer(self.m_userListLayer, TAG_ZORDER.USERLIST_ZORDER)
		end
		local userList = self:getDataMgr():getUserList()		
		self.m_userListLayer:refreshList(userList)
	elseif tag == TAG_ENUM.BT_APPLYLIST then
		if nil == self.m_applyListLayer then
			self.m_applyListLayer = g_var(ApplyListLayer):create(self)
			self:addToRootLayer(self.m_applyListLayer, TAG_ZORDER.USERLIST_ZORDER)
		end
		local userList = self:getDataMgr():getApplyBankerUserList()		
		self.m_applyListLayer:refreshList(userList)
	elseif tag == TAG_ENUM.BT_APPLY then
		self:applyBanker(self.m_enApplyState)
	elseif tag == TAG_ENUM.BT_REJECT then
		self:reJettonScore()
	elseif tag == TAG_ENUM.BT_BANK then
		--???????????????
		if 0 == GlobalUserItem.tabAccountInfo.cbInsureEnabled then
			showToast(self,"????????????????????????????????????",1)
			return
		end

		--????????????
		local rule = self:getParentNode()._roomRule
		if rule == yl.GAME_GENRE_SCORE 
		or rule == yl.GAME_GENRE_EDUCATE then 
			print("?????? or ?????????")
		end
		-- ??????????????????
		local rom = GlobalUserItem.GetRoomInfo()
		if nil ~= rom then
			if rom.wServerType ~= yl.GAME_GENRE_GOLD then
				showToast(self, "??????????????????????????????!", 2)
				return
			end
		end

		if false == self:getParentNode():getFrame():OnGameAllowBankTake() then
			--showToast(self,"?????????????????????????????????",1)
			--return
		end

		self.m_bankLayer = BankLayer:create(self):addTo(self, TAG_ZORDER.BANK_ZORDER)
		self._scene:sendRequestBankInfo()
	elseif tag == TAG_ENUM.BT_SET then
		local setting = g_var(SettingLayer):create(self)
		self:addToRootLayer(setting, TAG_ZORDER.SETTING_ZORDER)
	elseif tag == TAG_ENUM.BT_LUDAN then
		self:onOpenBigLudanLayer();
	elseif tag == TAG_ENUM.BT_ROBBANKER then
		--????????????
		if g_var(cmd).SUPERBANKER_CONSUMETYPE == self.m_tabSupperRobConfig.superbankerType then
			local str = "????????????????????? " .. self.m_tabSupperRobConfig.lSuperBankerConsume .. ",?????????????"
			local query = QueryDialog:create(str, function(ok)
		        if ok == true then
		            self:getParentNode():sendRobBanker()
		        end
		    end):setCanTouchOutside(false)
		        :addTo(self) 
		else
			self:getParentNode():sendRobBanker()
		end
	elseif tag == TAG_ENUM.BT_CLOSEBANK then
		if nil ~= self.m_bankLayer then
			self.m_bankLayer:setVisible(false)
		end
	elseif tag == TAG_ENUM.BT_TAKESCORE then
		self:onTakeScore()
	elseif tag == TAG_ENUM.BT_CHAT then

	elseif tag == TAG_ENUM.BT_HELP then
		local help = HelpLayer:create();
		help.m_parent = self;
		self:addChild(help,10);
	else
		showToast(self,"?????????????????????",1)
	end
end

function GameViewLayer:onOpenBigLudanLayer()
	if nil == self.m_wallBill then
		self.m_wallBill = g_var(WallBillLayer):create(self)
		self:addToRootLayer(self.m_wallBill, TAG_ZORDER.WALLBILL_ZORDER)
	end
	self.m_wallBill:refreshWallBillList()
end

--??????????????????????????????
function GameViewLayer:updateRejecttonState()
	--?????????????????????
	local score = 0

	--??????????????????
	if self:isMeChair(self.m_wBankerUser) then
		self.m_spBottom:getChildByName("rejetton_btn"):setEnabled(false)
		return 
	end

	if self.isReject then
		self.m_spBottom:getChildByName("rejetton_btn"):setEnabled(false)
		return 
	end

	for k, v in pairs(self.lastRoundJettonScore) do
		score = score + v.m_llMyTotal
	end

	--??????????????????
	if score > self.m_scoreUser then
		self.m_spBottom:getChildByName("rejetton_btn"):setEnabled(false)
		return 
	end

	--??????????????????
	if score == 0 then
		self.m_spBottom:getChildByName("rejetton_btn"):setEnabled(false)
		return 
	end

	--???????????????
	if self.m_cbGameStatus ~= g_var(cmd).GAME_JETTON then
		self.m_spBottom:getChildByName("rejetton_btn"):setEnabled(false)
		return
	end

	self.m_spBottom:getChildByName("rejetton_btn"):setEnabled(true)
end

--????????????
function GameViewLayer:reJettonScore()
	self:getParentNode():sendRejectton()
end

--??????????????????
function GameViewLayer:onReJetton(cmd_table)
	self.m_spBottom:getChildByName("rejetton_btn"):setEnabled(false)
	self.isReject = true

	local tmp = {}
	tmp.wChairID = cmd_table.wChairID

	for i=1, 8 do
		tmp.cbBetArea = i-1
		tmp.lBetScore = cmd_table.lBetScore[1][i]
		if tmp.lBetScore ~= 0 then
			self:onGetUserBet(tmp)
		end
	end
end

--??????????????????
function GameViewLayer:onReJettonFail(cmd_table)

end

function GameViewLayer:onJettonButtonClicked( tag, ref )
	if tag >= 1 and tag <= 6 then
		self.m_nJettonSelect = self.m_pJettonNumber[tag].k;
	else
		self.m_nJettonSelect = -1;
	end

	self.m_nSelectBet = tag
	self:switchJettonBtnState(tag)
	print("click jetton:" .. self.m_nJettonSelect);
end

function GameViewLayer:onJettonAreaClicked( tag, ref )
	local m_nJettonSelect = self.m_nJettonSelect;

	if m_nJettonSelect < 0 then
		return;
	end

	local area = tag - 1;	
	if self.m_lHaveJetton > self.m_llMaxJetton then
		showToast(self,"???????????????????????????",1)
		self.m_lHaveJetton = self.m_lHaveJetton - m_nJettonSelect;
		return;
	end

	--?????????????????????
	self.m_nextSelect = area
	--??????
	self:getParentNode():sendUserBet(area, m_nJettonSelect);	
end

function GameViewLayer:showGameResult( bShow, cbCardCount, cbTableCardArray, mHaveAnim, isBreakLine)
	if true == bShow then
		if nil == self.m_gameResultLayer then
			self.m_gameResultLayer = g_var(GameResultLayer):create(self)
			self:addToRootLayer(self.m_gameResultLayer, TAG_ZORDER.GAMECARD_ZORDER)
		end

		-- if true == bShow and true == self:getDataMgr().m_bJoin then
		-- 	self.m_gameResultLayer:showGameResult(self:getDataMgr().m_tabGameResult)
		-- end
		if true == bShow then
			self.m_gameResultLayer:showGameResult(bShow, cbCardCount, cbTableCardArray, mHaveAnim, isBreakLine);
		end
	else
		if nil ~= self.m_gameResultLayer then
			self.m_gameResultLayer:hideGameResult()
		end
	end
end

function GameViewLayer:onCheckBoxClickEvent( sender,eventType )
	ExternalFun.playClickEffect()
	if eventType == ccui.CheckBoxEventType.selected then
		self.m_btnList:stopAllActions();
		self.m_btnList:runAction(self.m_actDropIn);
	elseif eventType == ccui.CheckBoxEventType.unselected then
		self.m_btnList:stopAllActions();
		self.m_btnList:runAction(self.m_actDropOut);
	end
end

function GameViewLayer:onSitDownClick( tag, sender )
	print("sit ==> " .. tag)
	local useritem = self:getMeUserItem()
	if nil == useritem then
		return
	end

	--????????????
	if nil ~= self.m_nSelfSitIdx and tag == self.m_nSelfSitIdx then
		return
	end

	if nil ~= self.m_nSelfSitIdx then --and tag ~= self.m_nSelfSitIdx  then
		showToast(self, "???????????? " .. self.m_nSelfSitIdx .. " ?????????,??????????????????!", 2)
		return
	end	

	--??????????????????
	if useritem.lScore < self.m_tabSitDownConfig.lForceStandUpCondition then
		local str = "?????????????????? " .. self.m_tabSitDownConfig.lForceStandUpCondition .. " ?????????,???????????????!"
		showToast(self, str, 2)
		return
	end
	if self.m_tabSitDownConfig.occupyseatType == g_var(cmd).OCCUPYSEAT_CONSUMETYPE then --???????????????
		if useritem.lScore < self.m_tabSitDownConfig.lOccupySeatConsume then
			local str = "?????????????????? " .. self.m_tabSitDownConfig.lOccupySeatConsume .. " ?????????,???????????????!"
			showToast(self, str, 2)
			return
		end
		local str = "??????????????? " .. self.m_tabSitDownConfig.lOccupySeatConsume .. ",?????????????"
			local query = QueryDialog:create(str, function(ok)
		        if ok == true then
		            self:getParentNode():sendSitDown(tag - 1, useritem.wChairID)
		        end
		    end):setCanTouchOutside(false)
		        :addTo(self)
	elseif self.m_tabSitDownConfig.occupyseatType == g_var(cmd).OCCUPYSEAT_VIPTYPE then --????????????
		if useritem.cbMemberOrder < self.m_tabSitDownConfig.enVipIndex then
			local str = "??????????????????????????? " .. self.m_tabSitDownConfig.enVipIndex .. " ??????????????????!"
			showToast(self, str, 2)
			return
		end
		self:getParentNode():sendSitDown(tag - 1, self:getMeUserItem().wChairID)
	elseif self.m_tabSitDownConfig.occupyseatType == g_var(cmd).OCCUPYSEAT_FREETYPE then --????????????
		if useritem.lScore < self.m_tabSitDownConfig.lOccupySeatFree then
			local str = "??????????????????????????????????????? " .. self.m_tabSitDownConfig.lOccupySeatFree .. " ,???????????????????????????!"
			showToast(self, str, 2)
			return
		end
		self:getParentNode():sendSitDown(tag - 1, self:getMeUserItem().wChairID)
	end
end

function GameViewLayer:onResetView()
	self:stopAllActions()
	self:gameDataReset()
end

function GameViewLayer:onExit()
	self:onResetView()
end

--????????????
function GameViewLayer:applyBanker( state )
	-- print("-----????????????-----", state, APPLY_STATE.kCancelState, APPLY_STATE.kApplyState, APPLY_STATE.kApplyedState)
	if state == APPLY_STATE.kCancelState then
        self._scene:sendCancelApply(); 
    elseif state == APPLY_STATE.kApplyState then
        self._scene:sendApplyBanker();
    elseif state == APPLY_STATE.kApplyedState then
        self._scene:sendCancelApply();    
    end
end

---------------------------------------------------------------------------------------
--????????????

------
--????????????
function GameViewLayer:onGetUserScore( item )
	--??????
	if item.dwUserID == GlobalUserItem.tabAccountInfo.dwUserID then
       self:reSetUserInfo()
    end

    --????????????
    for i = 1, g_var(cmd).MAX_OCCUPY_SEAT_COUNT do
    	if nil ~= self.m_tabSitDownUser[i] then
    		if item.wChairID == self.m_tabSitDownUser[i]:getChair() then
    			self.m_tabSitDownUser[i]:updateScore(item)
    		end
    	end
    end

    --??????
    if self.m_wBankerUser == item.wChairID then
    	--???????????????
		-- local str = string.formatNumberThousands(item.lScore);
		-- if string.len(str) > 11 then
		-- 	str = string.sub(str, 1, 9) .. "...";
		-- end
		-- self.m_textBankerCoin:setString("?????????:" .. str);
		self:freshBankerInfo(item.lScore);
    end
end

function GameViewLayer:refreshCondition(  )
	local applyable = self:getApplyable()
	if applyable then
		------
		--????????????

		--??????????????????????????????????????????????????????
		if (yl.INVALID_CHAIR ~= self.m_wCurrentRobApply) or (true == self:isMeChair(self.m_wBankerUser)) then
			ExternalFun.enableBtn(self.m_btnRob, false)
		else
			local useritem = self:getMeUserItem()
			--??????????????????
			if g_var(cmd).SUPERBANKER_VIPTYPE == self.m_tabSupperRobConfig.superbankerType then
				--vip??????				
				ExternalFun.enableBtn(self.m_btnRob, useritem.cbMemberOrder >= self.m_tabSupperRobConfig.enVipIndex)
			elseif g_var(cmd).SUPERBANKER_CONSUMETYPE == self.m_tabSupperRobConfig.superbankerType then
				--?????????????????????(????????????+????????????)
				local condition = self.m_tabSupperRobConfig.lSuperBankerConsume + self.m_llCondition
				ExternalFun.enableBtn(self.m_btnRob, useritem.lScore >= condition)
			end
		end		
	else
		ExternalFun.enableBtn(self.m_btnRob, false)
	end
end

--??????free
function GameViewLayer:onGameFree( )
	self.m_cbGameStatus = g_var(cmd).GAME_SCENE_FREE
	yl.m_bDynamicJoin = false
	self.m_lHaveJetton = 0;

	self:reSetForNewGame()

	--??????????????????
	self:refreshCondition()

	--????????????????????????
	self:refreshApplyBtnState()
	self:updateRejecttonState()
	self.isReject = false
	if nil ~= self.m_bankLayer and true == self.m_bankLayer:isVisible() and true == self:isMeChair(self.m_wBankerUser) then
		showToast(self.m_bankLayer,"????????????????????????????????????????????????",1)
	end

	--??????????????????
	if self.isAutoOpenLudan then
		self:onOpenBigLudanLayer();
	end

	--????????????
	local records = self:getDataMgr():getRecords();
	local recordNum = #records;
	if recordNum > g_var(cmd).RECORD_NUM then
		self:getDataMgr():subFirstGameRecord();
		--??????????????????
		self:updateWallBill();
	end
end

--????????????
function GameViewLayer:onGameStart( )
	self.m_cbGameStatus = g_var(cmd).GAME_JETTON
	self.m_nJettonSelect = self.m_pJettonNumber[DEFAULT_BET].k;
	self.m_lHaveJetton = 0;

	--???????????????????????????	
	self:reSetUserInfo();

	self.m_bOnGameRes = false

	--??????????????????,????????????
	if false == self:isMeChair(self.m_wBankerUser) and false == self.m_bNoBanker then
		--??????
		self:enableJetton(true);
		--??????????????????
		self:adjustJettonBtn();

		--?????????????????????
		self:switchJettonBtnState(DEFAULT_BET)
	end	

	math.randomseed(tostring(os.time()):reverse():sub(1, 6))

	--????????????????????????
	self:refreshApplyBtnState()
	self:updateRejecttonState()	
end

--????????????
function GameViewLayer:reEnterStart( lUserJetton )
	self.m_cbGameStatus = g_var(cmd).GAME_JETTON
	self.m_nJettonSelect = self.m_pJettonNumber[DEFAULT_BET].k;
	self.m_lHaveJetton = lUserJetton;

	--???????????????????????????
	self.m_scoreUser = 0
	self:reSetUserInfo();

	self.m_bOnGameRes = false

	--??????????????????
	if false == self:isMeChair(self.m_wBankerUser) then
		--??????
		self:enableJetton(true);
		--??????????????????
		self:adjustJettonBtn();

		--?????????????????????
		self:switchJettonBtnState(DEFAULT_BET)
	end
end

--????????????
function GameViewLayer:onGetApplyBankerCondition( llCon , rob_config)
	self.m_llCondition = llCon
	--??????????????????
	self.m_tabSupperRobConfig = rob_config

	self:refreshCondition();
end

--??????????????????
function GameViewLayer:onChangeBanker( wBankerUser, lBankerScore, bEnableSysBanker )
	print("??????????????????:" .. wBankerUser .. "; coin =>" .. lBankerScore)

	--??????????????????????????????????????????????????????????????????????????????
	if self.m_wBankerUser ~= wBankerUser and self:isMeChair(self.m_wBankerUser) then
		self.m_enApplyState = APPLY_STATE.kCancelState
	end
	self.m_wBankerUser = wBankerUser
	--??????????????????
	self.m_bNoBanker = false

	local nickstr = "";
	--????????????
	if true == bEnableSysBanker then --??????????????????
		if yl.INVALID_CHAIR == wBankerUser then
			nickstr = "????????????"
		else
			local userItem = self:getDataMgr():getChairUserList()[wBankerUser + 1];
			if nil ~= userItem then
				nickstr = userItem.szNickName 

				if self:isMeChair(wBankerUser) then
					self.m_enApplyState = APPLY_STATE.kApplyedState
				end
			else
				print("????????????????????????")
			end
		end	
	else
		if yl.INVALID_CHAIR == wBankerUser then
			nickstr = "????????????"
			self.m_bNoBanker = true
		else
			local userItem = self:getDataMgr():getChairUserList()[wBankerUser + 1];
			if nil ~= userItem then
				nickstr = userItem.szNickName 

				if self:isMeChair(wBankerUser) then
					self.m_enApplyState = APPLY_STATE.kApplyedState
				end
			else
				print("????????????????????????")
			end
		end
	end
	self.m_clipBankerNick:setString(nickstr);

	--???????????????
	-- local str = string.formatNumberThousands(lBankerScore);
	-- if string.len(str) > 11 then
	-- 	str = string.sub(str, 1, 7) .. "...";
	-- end
	-- self.m_textBankerCoin:setString("?????????:" .. str);
	self:freshBankerInfo(lBankerScore);

	--?????????????????????????????????
	if wBankerUser == self.m_wCurrentRobApply then
		self.m_wCurrentRobApply = yl.INVALID_CHAIR
		self:refreshCondition()
	end

	--??????????????????
	local chair = -1
	for i = 1, g_var(cmd).MAX_OCCUPY_SEAT_COUNT do
		if nil ~= self.m_tabSitDownUser[i] then
			chair = self.m_tabSitDownUser[i]:getChair()
			self.m_tabSitDownUser[i]:updateBanker(chair == wBankerUser)
		end
	end
end

--??????????????????
function GameViewLayer:onGetSupperRobApply(  )
	if yl.INVALID_CHAIR ~= self.m_wCurrentRobApply then
		self.m_bSupperRobApplyed = true
		ExternalFun.enableBtn(self.m_btnRob, false)
	end
	--???????????????f
	if true == self:isMeChair(self.m_wCurrentRobApply) then
		--???????????????????????????
		self.m_enApplyState = APPLY_STATE.kSupperApplyed
	end
end

--????????????????????????
function GameViewLayer:onGetSupperRobLeave( wLeave )
	if yl.INVALID_CHAIR == self.m_wCurrentRobApply then
		--???????????????????????????
		self.m_bSupperRobApplyed = false

		ExternalFun.enableBtn(self.m_btnRob, true)
	end

	--???????????????
end

--??????????????????
function GameViewLayer:onGetUserBet( cmd_placebet)
	local data = cmd_placebet
	if nil == data then
		return
	end
	local area = data.cbBetArea + 1;
	local wUser = data.wChairID;
	local llScore = data.lBetScore

	local nIdx = self:getJettonIdx(data.lBetScore) - 1
	print("nIdx",nIdx)
	local str = string.format("game/chip_%d.png", nIdx);
	local sp = cc.Sprite:create(str)
	
	local num = self.m_pJettonNumber[nIdx].k
	
	self:addLabelAtlasWithParent(sp, num)
	
	local btn = self.m_tableJettonArea[area];
	if nil == sp then
		print("sp nil");
	end

	if nil == btn then
		print("btn nil");
	end
	if nil ~= sp and nil ~= btn then
		--??????
		sp:setTag(wUser);
		local name = string.format("%d", area) --ExternalFun.formatScore(data.lBetScore);
		sp:setName(name)
		
		--????????????????????????
		local pos = self.m_betAreaLayout:convertToNodeSpace(self:getBetFromPos(wUser))
		--pos = self.m_betAreaLayout:convertToNodeSpace(self:getBetFromPos(wUser))
		sp:setPosition(pos)
		--??????????????????
		local act = self:getBetAnimation(self:getBetRandomPos(area), cc.CallFunc:create(function()
			--??????????????????
			ExternalFun.playSoundEffect("BetFly.mp3")
		end))
		sp:stopAllActions()
		sp:runAction(act)
		self.m_betAreaLayout:addChild(sp)

		--??????????????????
		self:refreshJettonNode(self.m_tableJettonNode[area], llScore, llScore, self:isMeChair(wUser))
	end

	if self:isMeChair(wUser) then
		self.m_scoreUser = self.m_scoreUser - self.m_nJettonSelect;
		self.m_lHaveJetton = self.m_lHaveJetton + llScore;
		
		--??????????????????
		self:adjustJettonBtn();

		--??????????????????
		self:refreshJetton();

		--??????????????????
		self:freshUserScore();
	end
	-- self:updateRejecttonState()
	--??????????????????
	self:freshSitUserScore(wUser, -llScore);
end

--????????????????????????
function GameViewLayer:onGetUserBetFail(  )
	local data = self:getParentNode().cmd_jettonfail;
	if nil == data then
		return;
	end

	--????????????
	local wUser = data.wPlaceUser;
	--????????????
	local cbArea = data.cbBetArea + 1;
	--????????????
	local llScore = data.lPlaceScore;

	if self:isMeChair(wUser) then
		--??????????????????
		local str = string.format("?????? %s ??????", ExternalFun.formatScore(llScore))
		showToast(self,str,1)

		--??????????????????
		self.m_scoreUser = self.m_scoreUser + llScore;
		self.m_lHaveJetton = self.m_lHaveJetton - llScore;
		self:adjustJettonBtn();
		self:refreshJetton()

		--
		if 0 ~= self.m_lHaveJetton then
			if nil ~= self.m_tableJettonNode[cbArea] then
				self:refreshJettonNode(self.m_tableJettonNode[cbArea],-llScore, -llScore, true)
			end

			--????????????????????????
			local name = string.format("%d", cbArea) --ExternalFun.formatScore(llScore);
			self.m_betAreaLayout:removeChildByName(name)
		end
	end
end

--?????????????????????????????????
function GameViewLayer:reEnterGameBet( cbArea, llScore )
	local btn = self.m_tableJettonArea[cbArea];
	if nil == btn or 0 == llSocre then
		return;
	end

	local numbers = self.m_pJettonNumber;
	local betNums = {numbers[1].k, numbers[2].k, numbers[3].k, numbers[4].k, numbers[5].k, numbers[6].k};
	local vec = self:getDataMgr().calcuteJetton(llScore, false, betNums);
	for k,v in pairs(vec) do
		local info = v;
		for i=1,info.m_cbCount do
			-- local str = string.format("chip_%d.png", info.m_cbIdx);
			-- local sp = cc.Sprite:createWithSpriteFrameName(str);
			local str = string.format("game/chip_%d.png", info.m_cbIdx);
			local sp = cc.Sprite:create(str)
			self:addLabelAtlasWithParent(sp, info.m_llScore);

			if nil ~= sp then
				sp:setTag(yl.INVALID_CHAIR);
				local name = string.format("%d", cbArea) --ExternalFun.formatScore(info.m_llScore);
				sp:setName(name);

				self:randomSetJettonPos(cbArea, sp);
				self.m_betAreaLayout:addChild(sp);
			end
		end
	end

	--??????????????????
	self:refreshJettonNode(self.m_tableJettonNode[cbArea], llScore, llScore, false)
end

--?????????????????????????????????
function GameViewLayer:reEnterUserBet( cbArea, llScore )
	local btn = self.m_tableJettonArea[cbArea];
	if nil == btn or 0 == llSocre then
		return;
	end

	--??????????????????
	self:refreshJettonNode(self.m_tableJettonNode[cbArea], llScore, 0, true)
end

--????????????
function GameViewLayer:onGetGameEnd(  )
	self.m_cbGameStatus = g_var(cmd).GAME_END
	--???????????????????????????
	for k, v in pairs(self.m_tableJettonNode) do
		self.lastRoundJettonScore[k].m_llMyTotal = self.m_tableJettonNode[k].m_llMyTotal or  0
	end

	self:updateRejecttonState()

	self.m_bOnGameRes = true

	--????????????
	self:enableJetton(false)

	--??????????????????
	self:reSet()
end

--????????????
function GameViewLayer:onGetApplyBanker( )
	if self:isMeChair(self:getParentNode().cmd_applybanker.wApplyUser) then
		self.m_enApplyState = APPLY_STATE.kApplyState
	end

	self:refreshApplyList()
end

--??????????????????
function GameViewLayer:onGetCancelBanker(  )
	if self:isMeChair(self:getParentNode().cmd_cancelbanker.wCancelUser) then
		self.m_enApplyState = APPLY_STATE.kCancelState
	end
	
	self:refreshApplyList()
end

--????????????
function GameViewLayer:refreshApplyList(  )
	local userList = self:getDataMgr():getApplyBankerUserList()
	if nil ~= self.m_applyListLayer and self.m_applyListLayer:isVisible() then
        self.m_applyListLayer:refreshList(userList)
        -- dump(userList, "-------------????????????????????????------------", 6)
    end

    --????????????
	self.banker_apply_num:setString(#userList);
end 

function GameViewLayer:refreshUserList(  )
	local userList = self:getDataMgr():getUserList()
	if nil ~= self.m_userListLayer and self.m_userListLayer:isVisible() then
		self.m_userListLayer:refreshList(userList)
	end

	--????????????
	self.player_num:setString(#userList);
end

--??????????????????????????????
function GameViewLayer:refreshApplyBtnState(  )
	if nil ~= self.m_applyListLayer and self.m_applyListLayer:isVisible() then
		self.m_applyListLayer:refreshBtnState()
	end
end

--????????????
function GameViewLayer:updateWallBill()
	if nil ~= self.m_wallBill and self.m_wallBill:isVisible() then
		self.m_wallBill:refreshWallBillList()
	end

	--???????????????
	self:showGameResultRecord()
end

--???????????????
function GameViewLayer:onGetGameCard( tabRes, bAni, cbTime )
	self.m_cbGameStatus = g_var(cmd).GAME_END
	-- if nil == self.m_cardLayer then
	-- 	self.m_cardLayer = g_var(GameCardLayer):create(self)
	-- 	self:addToRootLayer(self.m_cardLayer, TAG_ZORDER.GAMECARD_ZORDER)
	-- end
	-- self.m_cardLayer:showLayer(true)
	-- self.m_cardLayer:refresh(tabRes, bAni, cbTime)
end

--????????????????????????
function GameViewLayer:onGetSitDownShowFresh( index, isLeave)
	local sitBtn = self.m_tabSitDownList[index];
	local role_name = sitBtn:getChildByName("role_name");
	local role_score_bg = sitBtn:getChildByName("role_score_bg");
	local role_score = sitBtn:getChildByName("role_score");
	if isLeave then
		role_name:setVisible(true);
		role_score_bg:setVisible(true);
		role_score:setVisible(true);
	else
		role_name:setVisible(false);
		role_score_bg:setVisible(false);
		role_score:setVisible(false);
	end
end

--??????????????????
function GameViewLayer:onGetSitDownInfo( config, info )
	self.m_tabSitDownConfig = config
	
	local pos = cc.p(0,0)
	--?????????????????????
	for i = 1, g_var(cmd).MAX_OCCUPY_SEAT_COUNT do
		print("sit chair " .. info[i])
		self:onGetSitDown(i - 1, info[i], false)
	end
end

--????????????
function GameViewLayer:onGetSitDown( index, wchair, bAni )
	if wchair ~= nil 
		and nil ~= index
		and index ~= g_var(cmd).SEAT_INVALID_INDEX 
		and wchair ~= yl.INVALID_CHAIR then
		local useritem = self:getDataMgr():getChairUserList()[wchair + 1]

		if nil ~= useritem then
			--?????????1
			index = index + 1
			if nil == self.m_tabSitDownUser[index] then
				self.m_tabSitDownUser[index] = g_var(SitRoleNode):create(self, index)
				self.m_tabSitDownUser[index]:setPosition(self.m_tabSitDownList[index]:getPosition())
				self.m_roleSitDownLayer:addChild(self.m_tabSitDownUser[index],10)

				self:onGetSitDownShowFresh( index, false);
			end
			self.m_tabSitDownUser[index]:onSitDown(useritem, bAni, wchair == self.m_wBankerUser)

			if useritem.dwUserID == GlobalUserItem.tabAccountInfo.dwUserID then
				self.m_nSelfSitIdx = index
			end
		end
	end
end

--????????????/??????
function GameViewLayer:onGetSitDownLeave( index )
	if index ~= g_var(cmd).SEAT_INVALID_INDEX 
		and nil ~= index then
		index = index + 1
		if nil ~= self.m_tabSitDownUser[index] then
			self.m_tabSitDownUser[index]:removeFromParent()
			self.m_tabSitDownUser[index] = nil

			self:onGetSitDownShowFresh( index, true);
		end

		if self.m_nSelfSitIdx == index then
			self.m_nSelfSitIdx = nil
		end
	end
end

--??????????????????
function GameViewLayer:onBankSuccess( )
	local bank_success = self:getParentNode().bank_success
	if nil == bank_success then
		return
	end
	GlobalUserItem.tabAccountInfo.lUserScore = bank_success.lUserScore
	GlobalUserItem.tabAccountInfo.lUserInsure = bank_success.lUserInsure

	if nil ~= self.m_bankLayer and true == self.m_bankLayer:isVisible() then
		-- self:refreshScore()
		self.m_bankLayer:refreshBankScore();

		showToast(self.m_bankLayer, bank_success.szDescribrString, 2)
	end

	
end

--??????????????????
function GameViewLayer:onBankFailure( )
	local bank_fail = self:getParentNode().bank_fail
	if nil == bank_fail then
		return
	end

	if nil ~= self.m_bankLayer and true == self.m_bankLayer:isVisible() then
		showToast(self.m_bankLayer, bank_fail.szDescribeString, 2)
	end
end

--????????????
function GameViewLayer:onGetBankInfo(bankinfo)
	bankinfo.wRevenueTake = bankinfo.wRevenueTake or 10
	if nil ~= self.m_bankLayer then
		self.m_bankLayer:refreshBankRate(bankinfo.wRevenueTake, bankinfo.lBankOPButtonArray[1])
	end
end
------
---------------------------------------------------------------------------------------
function GameViewLayer:getParentNode( )
	return self._scene;
end

function GameViewLayer:getMeUserItem(  )
	if nil ~= GlobalUserItem.tabAccountInfo.dwUserID then
		return self:getDataMgr():getUidUserList()[GlobalUserItem.tabAccountInfo.dwUserID];
	end
	return nil;
end

function GameViewLayer:isMeChair( wchair )
	local useritem = self:getDataMgr():getChairUserList()[wchair + 1];
	if nil == useritem then
		return false
	else 
		return useritem.dwUserID == GlobalUserItem.tabAccountInfo.dwUserID
	end
end

function GameViewLayer:addToRootLayer( node , zorder)
	if nil == node then
		return
	end

	self.m_rootLayer:addChild(node)
	node:setLocalZOrder(zorder)
end

function GameViewLayer:getChildFromRootLayer( tag )
	if nil == tag then
		return nil
	end
	return self.m_rootLayer:getChildByTag(tag)
end

function GameViewLayer:getApplyState(  )
	return self.m_enApplyState
end

function GameViewLayer:getApplyCondition(  )
	return self.m_llCondition
end

--??????????????????
function GameViewLayer:getApplyable(  )
	--?????????????????????????????????????????????????????????
	if APPLY_STATE.kSupperApplyed == self.m_enApplyState then
		return false
	end

	local userItem = self:getMeUserItem();
	if nil ~= userItem then
		return self.m_scoreUser > self.m_llCondition
	else
		return false
	end
end

--????????????????????????
function GameViewLayer:getCancelable(  )
	return self.m_cbGameStatus == g_var(cmd).GAME_SCENE_FREE
end

--??????????????????
function GameViewLayer:showBetAreaBlink(  )
	local blinkArea = self:getDataMgr().m_tabBetArea
	self:jettonAreaBlink(blinkArea)
end

function GameViewLayer:getDataMgr( )
	return self:getParentNode():getDataMgr()
end

function GameViewLayer:logData(msg)
	local p = self:getParentNode()
	if nil ~= p.logData then
		p:logData(msg)
	end	
end

function GameViewLayer:showPopWait( )
	self:getParentNode():showPopWait()
end

function GameViewLayer:dismissPopWait( )
	self:getParentNode():dismissPopWait()
end

function GameViewLayer:gameDataInit( )

    --??????????????????
    ExternalFun.playBackgroudAudio("bg.mp3")

    --????????????
	self:getDataMgr():initUserList(self:getParentNode():getUserList())

    --????????????
	self:loadRes()

	--????????????
	self.m_nJettonSelect = -1
	self.m_lHaveJetton = 0;
	self.m_llMaxJetton = 0;
	self.m_llCondition = 0;
	yl.m_bDynamicJoin = false;
	self.m_scoreUser = self:getMeUserItem().lScore or 0

	--????????????
	self.m_tableJettonBtn = {};
	self.m_tableJettonArea = {};

	--????????????
	self.m_tableJettonNode = {};

	self.m_applyListLayer = nil
	self.m_userListLayer = nil
	self.m_wallBill = nil
	-- self.m_cardLayer = nil
	self.m_gameResultLayer = nil
	self.m_pClock = nil
	self.m_bankLayer = nil

	--????????????
	self.m_enApplyState = APPLY_STATE.kCancelState
	--??????????????????
	self.m_bSupperRobApplyed = false
	--??????????????????
	self.m_tabSupperRobConfig = {}
	--?????????????????????
	self.m_bRobAlert = false

	--??????????????????
	self.m_tabSitDownConfig = {}
	self.m_tabSitDownUser = {}
	--????????????
	self.m_nSelfSitIdx = nil

	--????????????
	self.m_tabSitDownList = {}

	--??????????????????
	self.m_wCurrentRobApply = yl.INVALID_CHAIR

	--??????????????????
	self.m_wBankerUser = yl.INVALID_CHAIR

	--???????????????
	self.m_nSelectBet = DEFAULT_BET

	--??????????????????
	self.m_bOnGameRes = false

	--??????????????????
	self.m_bNoBanker = false

	--???????????????????????????
	self.lastRoundJettonScore = {}
	for i=1, 8 do
		self.lastRoundJettonScore[i] = {}
		self.lastRoundJettonScore[i].m_llMyTotal = 0
	end

	--???????????????????????????
	self.isReject = false

	--????????????????????????
	self.isAutoOpenLudan = false;
end

function GameViewLayer:gameDataReset(  )
	--????????????
	cc.Director:getInstance():getTextureCache():removeTextureForKey("game/card.png")
	cc.SpriteFrameCache:getInstance():removeSpriteFramesFromFile("game/game.plist")
	cc.Director:getInstance():getTextureCache():removeTextureForKey("game/game.png")
	cc.SpriteFrameCache:getInstance():removeSpriteFramesFromFile("game/pk_card.plist")
	cc.Director:getInstance():getTextureCache():removeTextureForKey("game/pk_card.png")
	-- cc.SpriteFrameCache:getInstance():removeSpriteFramesFromFile("bank/bank.plist")
	-- cc.Director:getInstance():getTextureCache():removeTextureForKey("bank/bank.png")

	--????????????public_res blank.png ??????
	local dict = cc.FileUtils:getInstance():getValueMapFromFile("public/public.plist")
	if nil ~= framesDict and type(framesDict) == "table" then
		for k,v in pairs(framesDict) do
			if k ~= "blank.png" then
				cc.SpriteFrameCache:getInstance():removeSpriteFrameByName(k)
			end
		end
	end
	-- cc.Director:getInstance():getTextureCache():removeTextureForKey("public_res/public_res.png")

	-- cc.SpriteFrameCache:getInstance():removeSpriteFramesFromFile("setting/setting.plist")
	-- cc.Director:getInstance():getTextureCache():removeTextureForKey("setting/setting.png")
	cc.Director:getInstance():getTextureCache():removeUnusedTextures()
	cc.SpriteFrameCache:getInstance():removeUnusedSpriteFrames()


	--????????????????????????
	ExternalFun.playPlazzBackgroudAudio()

	--????????????
	self.m_actDropIn:release();
	self.m_actDropOut:release();
	-- if nil ~= self.m_cardLayer then
	-- 	self.m_cardLayer:clean()
	-- end

	yl.m_bDynamicJoin = false;
	self:getDataMgr():removeAllUser()
	self:getDataMgr():clearRecord()
end

function GameViewLayer:getJettonIdx( llScore )
	local idx = 2;
	for i=1,#self.m_pJettonNumber do
		if llScore == self.m_pJettonNumber[i].k then
			idx = self.m_pJettonNumber[i].i;
			break;
		end
	end
	return idx;
end

function GameViewLayer:randomSetJettonPos( nodeArea, jettonSp )
	if nil == jettonSp then
		return;
	end

	local pos = self:getBetRandomPos(nodeArea)
	jettonSp:setPosition(cc.p(pos.x, pos.y));
end

--??????????????????
function GameViewLayer:getBetFromPos( wchair )
	if nil == wchair then
		return {x = 0, y = 0}
	end
	local winSize = cc.Director:getInstance():getWinSize()

	local useritem = self:getDataMgr():getChairUserList()[wchair + 1]
	if nil == useritem then
		return {x = winSize.width, y = 0}
	end

	--?????????????????????
	local idx = nil
	for i = 1,g_var(cmd).MAX_OCCUPY_SEAT_COUNT do
		if (nil ~= self.m_tabSitDownUser[i]) and (wchair == self.m_tabSitDownUser[i]:getChair()) then
			idx = i
			break
		end
	end
	if nil ~= idx then
		local pos = cc.p(self.m_tabSitDownUser[idx]:getPositionX(), self.m_tabSitDownUser[idx]:getPositionY())
		-- pos = self.m_roleSitDownLayer:convertToWorldSpace(pos)
		return {x = pos.x, y = pos.y}
	end

	--???????????????
	if self:isMeChair(wchair) then
		local tmp = self.m_spBottom:getChildByName("player_head")
		if nil ~= tmp then
			local pos = cc.p(tmp:getPositionX(), tmp:getPositionY())
			-- pos = self.m_spBottom:convertToWorldSpace(pos)
			return {x = pos.x, y = pos.y}
		else
			return {x = winSize.width, y = 0}
		end
	end

	--????????????
	local pos = cc.p(self.csbNode:getChildByName("userlist_btn"):getPositionX(), self.csbNode:getChildByName("userlist_btn"):getPositionY())
	return {x = pos.x, y = pos.y};
end

function GameViewLayer:getBetAnimation( pos, call_back )
	local moveTo = cc.MoveTo:create(BET_ANITIME, cc.p(pos.x, pos.y))
	if nil ~= call_back then
		return cc.Sequence:create(cc.EaseIn:create(moveTo, 2), call_back)
	else
		return cc.EaseIn:create(moveTo, 2)
	end
end

function GameViewLayer:getBetRandomPos(areaIndex)
	local node_chip = self.csbNode:getChildByName("node_chip");
	local chip_area = node_chip:getChildByName("chip_area_" .. areaIndex);
	
	if nil == chip_area then
		return {x = 0, y = 0};
	end

	local nodeSize = cc.size(100, 80);
	if areaIndex == 1 or areaIndex == 3 then
		nodeSize = cc.size(200, 160);
	elseif areaIndex == 2 then
		nodeSize = cc.size(300, 120);
	end

	local xOffset = math.random()-0.5;
	local yOffset = math.random()-0.5;

	local posX = chip_area:getPositionX();
	local posY = chip_area:getPositionY();
	return cc.p(xOffset * nodeSize.width/2 + posX, yOffset * nodeSize.height/2 + posY);
end

------
--???????????????
function GameViewLayer:createClockNode()
	self.m_pClock = cc.Node:create()
	self.m_pClock:setPosition(667,514)
	self:addToRootLayer(self.m_pClock, TAG_ZORDER.CLOCK_ZORDER)

	--??????csb??????
	-- local csbNode = ExternalFun.loadCSB("game/GameClockNode.csb", self.m_pClock)
	local csbNode =  self.csbNode:getChildByName("node_clock");

	--?????????
	self.m_pClock.m_atlasTimer = csbNode:getChildByName("timer_atlas")
	self.m_pClock.m_atlasTimer:setString("")

	--??????
	self.m_pClock.m_spTip = csbNode:getChildByName("sp_tip")

	local frame = cc.SpriteFrameCache:getInstance():getSpriteFrame("blank.png")
	if nil ~= frame then
		self.m_pClock.m_spTip:setSpriteFrame(frame)
	end
end

function GameViewLayer:updateClock(tag, left)
	-- self.m_pClock:setVisible(left > 0)

	local str = string.format("%02d", left)
	self.m_pClock.m_atlasTimer:setString(str)

	if left <= 3 and left >= 0 then
    	--?????????
		ExternalFun.playSoundEffect("TimeWarn.wav")
	end

	--????????????
	if g_var(cmd).kGAMEFREE_COUNTDOWN == tag then
		if left == 1 then
			if nil ~= self.m_wallBill and self.m_wallBill:isVisible() then
				self.m_wallBill:showLayer(false)
			end

			--????????????????????????
			ExternalFun.playSoundEffect("startJetton.mp3")

			local aniNode = cc.CSLoader:createNode("startjetton/tongsha.csb"):addTo(self.animateUI)
            aniNode:setPosition(display.cx,display.cy)

            local ani = cc.CSLoader:createTimeline("startjetton/tongsha.csb")
            ani:gotoFrameAndPlay(0,false)
            aniNode:runAction(ani)
        end
	end

	if g_var(cmd).kGAMEPLAY_COUNTDOWN == tag then
		if left == 1 then
			--????????????????????????
			ExternalFun.playSoundEffect("stopJetton.mp3")

			local aniNode = cc.CSLoader:createNode("startjetton/tongpei.csb"):addTo(self.animateUI)
            aniNode:setPosition(display.cx,display.cy)

            local ani = cc.CSLoader:createTimeline("startjetton/tongpei.csb")
            ani:gotoFrameAndPlay(0,false)
            aniNode:runAction(ani)
		end
	end
	
	--????????????
	if g_var(cmd).kGAMEOVER_COUNTDOWN == tag then
		if 12 == left then
			-- if true == self:getDataMgr().m_bJoin then
			-- 	self:showGameResult(true)
			-- end	
			-- self:showGameResult(true)
		elseif 8 == left then
			if self:getDataMgr().m_bJoin then
				-- if nil ~= self.m_cardLayer then
				-- 	self.m_cardLayer:showLayer(false)
				-- end
			end					
			--????????????
			-- self:betAnimation()	

			self:endBetAnimation();	
		elseif 4 == left then
			
			--??????????????????
			self:updateWallBill()		
		elseif 3 == left then
			-- if nil ~= self.m_cardLayer then
			-- 	self.m_cardLayer:showLayer(false)
			-- end

			self:showGameResult(false);
		elseif 0 == left then
			--????????????
			self:jettonAreaBlinkClean()
		end
	end
end

function GameViewLayer:showTimerTip(tag)
	tag = tag or -1
	local scale = cc.ScaleTo:create(0.2, 0.0001, 1.0)
	local call = cc.CallFunc:create(function (  )
		local str = string.format("sp_tip_%d.png", tag)
		local frame = cc.SpriteFrameCache:getInstance():getSpriteFrame(str)

		self.m_pClock.m_spTip:setVisible(false)
		if nil ~= frame then
			self.m_pClock.m_spTip:setVisible(true)
			self.m_pClock.m_spTip:setSpriteFrame(frame)
		end
	end)
	local scaleBack = cc.ScaleTo:create(0.2,1.0)
	local seq = cc.Sequence:create(scale, call, scaleBack)

	self.m_pClock.m_spTip:stopAllActions()
	self.m_pClock.m_spTip:runAction(seq)
end

--????????????
function GameViewLayer:refreshJettonNode( node, my, total, bMyJetton )	
	local bet_all = node:getChildByName("bet_all");
	local icon_1 = node:getChildByName("icon_1");
	local bet_bg = node:getChildByName("bet_bg");
	local bet_self = node:getChildByName("bet_self");

	if true == bMyJetton then
		node.m_llMyTotal = node.m_llMyTotal + my
	end

	node.m_llAreaTotal = node.m_llAreaTotal + total
	node:setVisible( node.m_llAreaTotal > 0)

	--??????????????????
	local str = ExternalFun.numberThousands(node.m_llMyTotal);
	bet_self:setString(str);
	
	local scoreStr, scoreType = self:formatScoreText(node.m_llAreaTotal);
	self:formatScoreShow(scoreStr, scoreType, bet_all, icon_1, "fonts/icon_all_bet_wan_1.png", "fonts/icon_all_bet_yi_1.png")

	local allAreaTotalScore = 0;
	for i = 1,8 do
		allAreaTotalScore = allAreaTotalScore + self.m_tableJettonNode[i].m_llAreaTotal;
		local scoreStr, scoreType = self:formatScoreText(allAreaTotalScore);
		self.bet_total:setVisible(true);
		self:formatScoreShow(scoreStr, scoreType, self.bet_total:getChildByName("bet_all"), self.bet_total:getChildByName("icon_1"), "fonts/icon_all_bet_wan.png", "fonts/icon_all_bet_yi.png")
	end
end

function GameViewLayer:reSetJettonNode(node)
	node:setVisible(false);
	local bet_all = node:getChildByName("bet_all");
	local icon_1 = node:getChildByName("icon_1");
	local bet_bg = node:getChildByName("bet_bg");
	local bet_self = node:getChildByName("bet_self");

	bet_self:setString("")
	bet_all:setString("")
	-- node.m_imageBg:setContentSize(cc.size(34, 32))

	node.m_llMyTotal = 0
	node.m_llAreaTotal = 0
end

function GameViewLayer:reSetTotalJetton()
	self.bet_total:setVisible(false);
	local bet_all = self.bet_total:getChildByName("bet_all");
	local icon_1 = self.bet_total:getChildByName("icon_1");
	local bet_bg = self.bet_total:getChildByName("bet_bg");

	bet_all:setString("");
end

--????????????
function GameViewLayer:showGameResultRecord()
	local records = self:getDataMgr():getRecords();
	local recordNum = #records;
	local startPos = cc.p(14, 126);
	local disX = 29;
	local disY = 23;
	local maxNum = 64;
	-- print(recordNum,"-----------????????????------------")
	local node_record  = self.node_ludan:getChildByName("node_record");
	local content  = node_record:getChildByName("content");
	
	local numX = math.floor(recordNum/6) + 1;
	local size = cc.size(29 * numX, 138);
	if recordNum > 42 then
		node_record:setInnerContainerSize(size);
		content:setContentSize(size);
		self.btn_record:setContentSize(size);
	end
	content:removeAllChildren();
	for i = 1, recordNum do
		local rec = records[i];
		-- if recordNum >= maxNum then
		-- 	rec = records[recordNum -maxNum + i];
		-- elseif recordNum < maxNum and i <= recordNum then
		-- 	rec = records[i];
		-- else
		-- end
		if rec then
			local str = "";
			if g_var(cmd).AREA_XIAN == rec.m_cbGameResult then
				str = "waybill_xian.png";
			elseif g_var(cmd).AREA_ZHUANG == rec.m_cbGameResult then
				str = "waybill_zhuang.png";
			elseif g_var(cmd).AREA_PING == rec.m_cbGameResult then
				str = "waybill_ping.png";
			end
			local frame = cc.SpriteFrameCache:getInstance():getSpriteFrame(str);
			local record = cc.Sprite:createWithSpriteFrame(frame);
			content:addChild(record);
			record:setPosition(startPos.x + math.floor((i-1) / 6)*disX, startPos.y - ((i-1) % 6) * disY);
		end
	end
	--?????????
	self:roadBig(records);

	--????????????
	self:refreshWallBillList(records);
end

-- ????????????
function GameViewLayer:onRoleInfoLayer()
	local roleInfoLayer = RoleInfoLayer:create();
	roleInfoLayer.m_parent = self;
	self:addChild(roleInfoLayer,10);

	local roleItem = self:getMeUserItem();
	roleInfoLayer:freshRoleInfo(roleItem, cc.p(300, 210));
end

-- ??????????????????
function GameViewLayer:onDeskRoleInfoLayer(roleItem, pos)
	local roleInfoLayer = RoleInfoLayer:create();
	roleInfoLayer.m_parent = self;
	self:addChild(roleInfoLayer,10);

	roleInfoLayer:freshRoleInfo(roleItem, pos);
end

function GameViewLayer:canUseBank()

	if self.m_lHaveJetton > 0 and nil ~= self.m_bankLayer and true == self.m_bankLayer:isVisible() then 
		showToast(self.m_bankLayer,"???????????????????????????????????????",1)
		return
	end
	if (self:isMeChair(self.m_wBankerUser) and self.m_cbGameStatus ~= g_var(cmd).GAME_SCENE_FREE ) and nil ~= self.m_bankLayer and true == self.m_bankLayer:isVisible() then
		showToast(self.m_bankLayer,"??????????????????????????????????????????",1)
		return
	end
	return true
end


--??????
function GameViewLayer:roadBig(records)
	local node_roadBig  = self.node_ludan:getChildByName("node_roadBig");
	local content  = node_roadBig:getChildByName("content");

    self:setBigRoadData(records);

    local recordNum = self.bigXLen;
    local numX = recordNum + 1;
	local size = cc.size(29 * numX, 138);
	if recordNum > 7 then
		node_roadBig:setInnerContainerSize(size);
		content:setContentSize(size);
		self.btn_record_roadBig:setContentSize(size);
	end
	content:removeAllChildren();
    -- local startPos = cc.p(513, 756);
    local startPos = cc.p(14, 126);
    self:showWaybillItem(self.dataBig, self.bigXLen, content, "ludan/cellMid.png", "ludan/circle_red_big.png", "ludan/circle_blue_big.png", 30, 29, false, startPos);
end

--??????????????????
function GameViewLayer:setBigRoadData(records)
	self.dataBig, self.bigXLen, self.dataBigReality, self.tempBiglist = self:getDataMgr():setBigRoadData(records);
end

function GameViewLayer:showWaybillItem(showData, bigXLen, node, spCellBg, spRed, spBlack, cellCnt, cellWd, small, startPos)
	--????????????
	local startIndex = 1;
	for i = 1 , #showData do
		for j = startIndex , bigXLen do
			local val = showData[i][j];
			if val then
				local item = cc.Sprite:create(1 == val and spRed or spBlack);
				if small then
					item:setPosition(startPos.x + (j-startIndex) * 29,startPos.y - ((i-1) / 2) * 23);
				else
					item:setPosition(startPos.x + (j-startIndex) * 29,startPos.y - (i-1) * 23);
				end
				node:addChild(item);

				--??????
				-- if i == #showData and j == #showData[1] then
				-- 	item:runAction(cc.Sequence:create(
				-- 		cc.Blink:create(5, 5), 
				-- 		cc.CallFunc:create( function()
				--             item:setVisible(true);
				--             item:setOpacity(255);
				--         end)
				-- 	));
				-- end
			end
		end
	end
end

--????????????
function GameViewLayer:refreshWallBillList(vec)
	local num_1  = self.node_ludan:getChildByName("num_1");
	local num_2  = self.node_ludan:getChildByName("num_2");
	local num_3  = self.node_ludan:getChildByName("num_3");
	local num_4  = self.node_ludan:getChildByName("num_4");
	local num_5  = self.node_ludan:getChildByName("num_5");

	local nTotal = #vec
	local nXian = 0
	local nZhuang = 0
	local nPing = 0
	local nXianDouble = 0
	local nZhuangDouble = 0
	local nXianTian = 0
	local nZhuangTian = 0
	for i = 1, nTotal do
		local rec = vec[i]
		if g_var(cmd).AREA_XIAN == rec.m_cbGameResult then
			nXian = nXian + 1
		elseif g_var(cmd).AREA_PING == rec.m_cbGameResult then
			nPing = nPing + 1
		elseif g_var(cmd).AREA_ZHUANG == rec.m_cbGameResult then
			nZhuang = nZhuang + 1
		end
		if rec.m_pServerRecord.bBankerTwoPair then
			nZhuangDouble = nZhuangDouble + 1
		end
		if rec.m_pServerRecord.bPlayerTwoPair then
			nXianDouble = nXianDouble + 1
		end
		if rec.m_pServerRecord.cbBankerCount < rec.m_pServerRecord.cbPlayerCount and rec.m_pServerRecord.cbPlayerCount >= 8 then
			nXianTian = nXianTian + 1
		end
		if rec.m_pServerRecord.cbPlayerCount < rec.m_pServerRecord.cbBankerCount and rec.m_pServerRecord.cbBankerCount >= 8 then
			nZhuangTian = nZhuangTian + 1
		end
	end

	local per = 0
	if 0 ~= nTotal then
		per = (nXian / nTotal) * 100
	end
	local str = string.format("%d", nXian)
	num_2:setString(str)

	per = 0
	if 0 ~= nTotal then
		per = (nPing / nTotal) * 100
	end
	str = string.format("%d", nPing)
	num_3:setString(str)

	per = 0
	if 0 ~= nTotal then
		per = (nZhuang / nTotal) * 100
	end
	str = string.format("%d", nZhuang)
	num_1:setString(str)

	str = string.format("%d", nXianDouble)
	num_5:setString(str)

	str = string.format("%d", nZhuangDouble)
	num_4:setString(str)
end

------
return GameViewLayer