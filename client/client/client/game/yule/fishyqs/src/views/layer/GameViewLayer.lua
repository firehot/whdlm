
--
-- Author: Tang
-- Date: 2016-08-09 14:46:36
--
local GameViewLayer = class("GameViewLayer", function(scene)
			local gameViewLayer = display.newLayer()
			return gameViewLayer

	end)

--Tag
GameViewLayer.VIEW_TAG = 
{
    tag_bg        = 200,
    tag_autoshoot = 210,
    tag_autolock = 211,
    tag_gameScore= 212,
    tag_gameMultiple = 213,
    tag_grounpTips = 214,
    tag_GoldCycle = 3000,
    tag_GoldCycleTxt = 4000,
    tag_Menu = 5000,
    tag_GoldsText = 1000,
}
local CHANGE_MULTIPLE_INTERVAL =  0.8
local  TAG = GameViewLayer.VIEW_TAG

local ExternalFun = require(appdf.EXTERNAL_SRC.."ExternalFun")
local HeadSprite = appdf.req(appdf.EXTERNAL_SRC .. "HeadSprite")
local g_var = ExternalFun.req_var
local ClipText = appdf.EXTERNAL_SRC .. "ClipText"
local module_pre = "game.yule.fishyqs.src"	
local game_cmd = appdf.HEADER_SRC .. "CMD_GameServer"
local PRELOAD = require(module_pre..".views.layer.PreLoading") 
local CannonSprite = require(module_pre..".views.layer.Cannon")
local cmd = module_pre .. ".models.CMD_YQSGame"
local scheduler = cc.Director:getInstance():getScheduler()
function GameViewLayer:ctor( scene )

    self._tag = 0
	self._scene = scene

	self:addSerchPaths()
    PRELOAD.setEnded(false)
    self._gameFrame = scene._gameFrame

    self.m_pUserItem = self._gameFrame:GetMeUserItem()
   --预加载资源
    PRELOAD.loadTextures()

      --注册事件
    ExternalFun.registerTouchEvent(self,true)
    self.m_TAG = TAG
    self.m_bCanChangeMultple = true
end


function GameViewLayer:onExit()

    PRELOAD.unloadTextures()
    PRELOAD.removeAllActions()

    PRELOAD.resetData()

    self:StopLoading(true)

    --播放大厅背景音乐
    ExternalFun.playPlazzBackgroudAudio()

    --重置搜索路径
    local oldPaths = cc.FileUtils:getInstance():getSearchPaths();
    local newPaths = {};
    for k,v in pairs(oldPaths) do
        if tostring(v) ~= tostring(self._searchPath) then
            table.insert(newPaths, v);
        end
    end
    cc.FileUtils:getInstance():setSearchPaths(newPaths);

end

function GameViewLayer:StopLoading( bRemove )
    PRELOAD.StopAnim(bRemove)
end

function GameViewLayer:getDataMgr( )
    return self:getParentNode():getDataMgr()
end

function GameViewLayer:getParentNode( )
    return self._scene;
end

function GameViewLayer:addSerchPaths( )
   --搜索路径
    local gameList = self._scene._scene:getApp()._gameList;
    local gameInfo = {};
    for k,v in pairs(gameList) do
          if tonumber(v._KindID) == tonumber(g_var(cmd).KIND_ID) then
            gameInfo = v;
            break;
        end
    end

    if nil ~= gameInfo._KindName then
        self._searchPath = device.writablePath.."game/" .. gameInfo._Module .. "/res/";
        cc.FileUtils:getInstance():addSearchPath(self._searchPath);
    end


end

function GameViewLayer:changeMultipleSchedule( dt )

    local function  update( dt  )
        self:multipleUpdate()
    end

    if nil == self.multipleSchedule then
        self.multipleSchedule = scheduler:scheduleScriptFunc(update, dt, false)
    end
    
end

function GameViewLayer:unMultipleSchedule()
    self.m_bCanChangeMultple = true
    if nil ~= self.multipleSchedule then
        scheduler:unscheduleScriptEntry(self.multipleSchedule)
        self.multipleSchedule = nil
    end
end

function GameViewLayer:multipleUpdate()
    self:unMultipleSchedule()  
end

function GameViewLayer:initView(  )

    local bg =  ccui.ImageView:create("game_res/game_bg_0.png")
	bg:setAnchorPoint(cc.p(.5,.5))
    bg:setTag(TAG.tag_bg)
	bg:setPosition(cc.p(yl.WIDTH/2,yl.HEIGHT/2))
	self:addChild(bg)
    --头像
    local headBg = cc.Sprite:create("game_res/head_bg.png")
    headBg:setAnchorPoint(cc.p(0,0))
    headBg:setPosition(cc.p(0,0))
    self:addChild(headBg,21)

    local head = HeadSprite:createClipHead(self.m_pUserItem, 74,"game_res/head_bg.png")
    head:setPosition(cc.p(43,43))
    head:setTag(310)
    self:addChild(head,22)
    --底栏菜单栏
    local menuBG = cc.Sprite:create("game_res/game_buttom.png")
    menuBG:setAnchorPoint(0.5,0.0)
    menuBG:setScaleY(0.9)
    menuBG:setPosition(667, -6)
    self:addChild(menuBG,20)

    --倍数切换
    local mutipleBtn = ccui.Button:create("game_res/im_multiple_tip_0.png","game_res/im_multiple_tip_1.png")
    mutipleBtn:setAnchorPoint(0.5,0.0)
    mutipleBtn:addTouchEventListener(function( sender , eventType )
        if eventType == ccui.TouchEventType.ended then
            if not self.m_bCanChangeMultple then
                return
            end
            local cannonPos = self._scene.m_nChairID
            cannonPos = CannonSprite.getPos(self._scene._dataModel.m_reversal,cannonPos)
            local cannon = self._scene.m_cannonLayer:getCannoByPos(cannonPos + 1)
            --激光不能切换倍数
            if g_var(cmd).CannonType.Laser_Cannon == cannon.m_Type or g_var(cmd).CannonType.Laser_Shooting == cannon.m_Type then
                return
            end
            --出现自己的宝箱不能切换倍数
            if self._scene._dataModel.m_bBoxTime then
                return
            end

            --加速不能切换倍数
            if g_var(cmd).CannonType.Special_Cannon == cannon.m_Type then
                showToast(cc.Director:getInstance():getRunningScene(), "在加速状态下不能切换炮台", 2)
                return
            end
            
            self._scene._dataModel:playEffect(g_var(cmd).SWITCHING_RUN)
            --print(".........................................touch mutiple event .......................................")
            local index = self._scene._dataModel.m_secene.nMultipleIndex[1][self._scene.m_nChairID+1]
            print("切换倍数index",index)
            index = index + 1
            index = math.mod(index,6)

            local cmddata = CCmd_Data:create(4)
            cmddata:setcmdinfo(g_var(game_cmd).MDM_GF_GAME, g_var(cmd).SUB_C_MULTIPLE);
            cmddata:pushint(index)
            self._scene:sendNetData(cmddata)

            self.m_bCanChangeMultple = false
            self:changeMultipleSchedule(CHANGE_MULTIPLE_INTERVAL)
               ---[[
        
        self._scene._dataModel.m_secene.nMultipleIndex[1][self._scene.m_nChairID+1] = index
        print("cannonPos "..cannonPos,cannon == nil,self._scene._dataModel.m_secene.nMultipleIndex[1][self._scene.m_nChairID+1])
        cannon:setMultiple(self._scene._dataModel.m_secene.nMultipleIndex[1][self._scene.m_nChairID+1])
        self:updateMultiple(self._scene._dataModel.m_secene.nMultipleValue[1][index+1]) 
        
        --]]
        end

    end)


    mutipleBtn:setPosition(yl.WIDTH/2 - 70, -20)
    self:addChild(mutipleBtn,21)


    local function callBack( sender, eventType)
        self:ButtonEvent(sender,eventType)
    end


    --自动射击
    local autoShootBtn = ccui.Button:create()
    autoShootBtn:setContentSize(cc.size(42, 36))
    autoShootBtn:setScale9Enabled(true)
    autoShootBtn:setPosition(692, 17)
    autoShootBtn:setTag(TAG.tag_autoshoot)
    autoShootBtn:addTouchEventListener(callBack)
    self:addChild(autoShootBtn,20)


    --自动锁定
    local autoLockBtn = ccui.Button:create()
    autoLockBtn:setContentSize(cc.size(42, 36))
    autoLockBtn:setScale9Enabled(true)
    autoLockBtn:setPosition(906, 17)
    autoLockBtn:setTag(TAG.tag_autolock)
    autoLockBtn:addTouchEventListener(callBack)
    self:addChild(autoLockBtn,20)

--菜单
    local menu = ccui.Button:create("game_res/bt_menu_0.png","game_res/bt_menu_1.png")
    menu:addTouchEventListener(callBack)
    menu:setTag(TAG.tag_Menu)
    menu:setPosition(1227, 22)
    self:addChild(menu,20)

	
    --水波效果
    local render = cc.RenderTexture:create(1334,750)
    render:beginWithClear(0,0,0,0)
    local water = cc.Sprite:createWithSpriteFrameName("water_0.png")
    water:setScale(2.5)
    water:setOpacity(120)
    water:setBlendFunc(gl.SRC_ALPHA,gl.ONE)
    water:visit()
    render:endToLua()
    water:addChild(render)
    render:setPosition(667,375) 
    water:setPosition(667,375)
    self:addChild(water, 1)

    local ani1 = cc.Animate:create(cc.AnimationCache:getInstance():getAnimation("WaterAnim"))
    local ani2 = ani1:reverse()

    local action = cc.RepeatForever:create(cc.Sequence:create(ani1,ani2))
    water:runAction(action)
end


function GameViewLayer:initUserInfo()
    --倍数
    local nick = cc.Label:createWithCharMap("game_res/num_multiple.png",19,20,string.byte("0"))
    nick:setString("1:")
    nick:setAnchorPoint(0.5,0.5)
    nick:setPosition(380,21)
    nick:setTag(TAG.tag_gameMultiple)
    self:addChild(nick,22)


    --用户分数 
    local score = cc.Label:createWithCharMap("game_res/scoreNum.png",16,22,string.byte("0"))
    --print(string.format("------------------用户分数 %d------------", self._scene.m_pUserItem.lScore))
    score:setString(string.format("%d", self._scene.m_pUserItem.lScore))
    score:setAnchorPoint(0.5,0.5)
    score:setScale(0.9)
    score:setTag(TAG.tag_gameScore)
    score:setPosition(163, 22)
    self:addChild(score,22)
end

function GameViewLayer:updateUserScore( score )
    local _score  = self:getChildByTag(TAG.tag_gameScore)
    if nil ~=  _score then
        _score:setString(string.format("%d",score))
    end
end

function GameViewLayer:updateMultiple( multiple )
    local _Multiple = self:getChildByTag(TAG.tag_gameMultiple)
    if nil ~=  _Multiple then
        _Multiple:setString(string.format("%d:",multiple))
    end

end

function GameViewLayer:updteBackGround(param)

    local bg = self:getChildByTag(TAG.tag_bg)

    if bg  then
        local call = cc.CallFunc:create(function()
            bg:removeFromParent()
        end)

        bg:runAction(cc.Sequence:create(cc.FadeTo:create(2.5,0),call))

        local bgfile = string.format("game_res/game_bg_%d.png", param)
        local _bg = cc.Sprite:create(bgfile)
        _bg:setPosition(yl.WIDTH/2, yl.HEIGHT/2)
        _bg:setOpacity(0)
        _bg:setTag(TAG.tag_bg)
        self:addChild(_bg)

        _bg:runAction(cc.FadeTo:create(5,255))
    end

        --鱼阵提示
        local groupTips = ccui.ImageView:create("game_res/fish_grounp.png")
        groupTips:setPosition(cc.p(yl.WIDTH/2,yl.HEIGHT/2))
        groupTips:setTag(TAG.tag_grounpTips)
        self:addChild(groupTips,30)

        local callFunc = cc.CallFunc:create(function()
                groupTips:removeFromParent()
            end)

        groupTips:runAction(cc.Sequence:create(cc.DelayTime:create(5.0),callFunc))

       
end

function GameViewLayer:setAutoShoot(b,target)
                 
    if b then
        local auto = cc.Sprite:create("game_res/bt_check_yes.png")
        auto:setTag(1)
        auto:setPosition(target:getContentSize().width/2, target:getContentSize().height/2)
        target:removeChildByTag(1)
        target:addChild(auto)

    else
         target:removeChildByTag(1)
    end
          
end

function GameViewLayer:setAutoLock(b,target)
          
    if b then
        local lock = cc.Sprite:create("game_res/bt_check_yes.png")
        lock:setTag(1)
        lock:setPosition(target:getContentSize().width/2, target:getContentSize().height/2)
        target:removeChildByTag(1)
        target:addChild(lock)

    else
         target:removeChildByTag(1)

         --取消自动射击
         self._scene._dataModel.m_fishIndex = g_var(cmd).INT_MAX

        --删除自动锁定图标
         local cannonPos = self._scene.m_nChairID
         cannonPos = CannonSprite.getPos(self._scene._dataModel.m_reversal,cannonPos)

         local cannon = self._scene.m_cannonLayer:getCannoByPos(cannonPos + 1)
         cannon:removeLockTag()

    end              
end


function GameViewLayer:onBankSuccess( )
    self._scene:dismissPopWait()
    local bank_success = self._scene.bank_success
    showToast(cc.Director:getInstance():getRunningScene(), bank_success.szDescribrString, 2)
    GlobalUserItem.tabAccountInfo.lUserInsure = bank_success.lUserInsure
    self:refreshScore()
    if true then
        return
    end
    
    if nil == bank_success then
        return
    end

    local addScore = bank_success.lUserScore - GlobalUserItem.tabAccountInfo.lUserScore
    GlobalUserItem.tabAccountInfo.lUserScore = self._scene._dataModel.m_secene.lPlayCurScore[1][self._scene.m_nChairID + 1] + addScore
    
    print("onBankSuccess addScore lUserScore",addScore,bank_success.lUserScore,GlobalUserItem.tabAccountInfo.lUserScore)
    self:refreshScore()

end

--银行操作失败
function GameViewLayer:onBankFailure( )

     self._scene:dismissPopWait()
    local bank_fail = self._scene.bank_fail
    if nil == bank_fail then
        return
    end

    showToast(cc.Director:getInstance():getRunningScene(), bank_fail.szDescribeString, 2)
end


  --刷新游戏币
function GameViewLayer:refreshScore( )
    --携带游戏币
    local str = ExternalFun.numberThousands(self._scene._dataModel.m_secene.lPlayCurScore[1][self._scene.m_nChairID + 1])
    if string.len(str) > 19 then
        str = string.sub(str, 1, 19)
    end

    if true == self._scene.m_bLeaveGame then
        print("----------LeaveGame refreshScore---------------")
        return
    end

    if nil == self.textCurrent then
        return
    end
    self.textCurrent:setString(str)

    --银行存款
    str = ExternalFun.numberThousands(GlobalUserItem.tabAccountInfo.lUserInsure)
    if string.len(str) > 19 then
        str = string.sub(str, 1, 19)
    end

    self.textBank:setString(ExternalFun.numberThousands(GlobalUserItem.tabAccountInfo.lUserInsure))

    --用户分数
   self:updateUserScore(self._scene._dataModel.m_secene.lPlayCurScore[1][self._scene.m_nChairID + 1])


end


--子菜单
function GameViewLayer:subMenuEvent( sender , eventType)
    
    local function addBG()
        local bg = ccui.ImageView:create()
        bg:setContentSize(cc.size(yl.WIDTH, yl.HEIGHT))
        bg:setScale9Enabled(true)
        bg:setPosition(yl.WIDTH/2, yl.HEIGHT/2)
        bg:setTouchEnabled(true)
        self:addChild(bg,50)
        bg:addTouchEventListener(function (sender,eventType)
            if eventType == ccui.TouchEventType.ended then
                bg:removeFromParent()
                self.textCurrent = nil
                self.textBank = nil

            end
        end)

        return bg
    end


    local function showPopWait()
        self._scene:showPopWait()
    end

    --关闭等待
    local function dismissPopWait()
        self._scene:dismissPopWait()
    end

    local tag = sender:getTag()
    if 1 == tag then --银行

        --申请取款
        local function sendTakeScore( lScore,szPassword )
            local cmddata = ExternalFun.create_netdata(g_var(game_cmd).CMD_GR_C_TakeScoreRequest)
            cmddata:setcmdinfo(g_var(game_cmd).MDM_GR_INSURE, g_var(game_cmd).SUB_GR_TAKE_SCORE_REQUEST)
            cmddata:pushbyte(g_var(game_cmd).SUB_GR_TAKE_SCORE_REQUEST)
            cmddata:pushscore(lScore)
            cmddata:pushstring(md5(szPassword),yl.LEN_PASSWORD)
            cmddata:pushstring(GlobalUserItem.szDynamicPass,yl.LEN_PASSWORD)
            self._scene:sendNetData(cmddata)
        end


        local function onTakeScore( )
                --参数判断
                local szScore = string.gsub( self.m_editNumber:getText(),"([^0-9])","")
                local szPass =   self.m_editPasswd:getText()

                if #szScore < 1 then 
                    showToast(cc.Director:getInstance():getRunningScene(),"请输入操作金额！",2)
                    return
                end

                local lOperateScore = tonumber(szScore)
                if lOperateScore<1 then
                    showToast(cc.Director:getInstance():getRunningScene(),"请输入正确金额！",2)
                    return
                end

                if #szPass < 1 then 
                    showToast(cc.Director:getInstance():getRunningScene(),"请输入银行密码！",2)
                    return
                end
                if #szPass <6 then
                    showToast(cc.Director:getInstance():getRunningScene(),"密码必须大于6个字符，请重新输入！",2)
                    return
                end

                showPopWait()
                sendTakeScore(lOperateScore,szPass)
                
         end


        local  bg = addBG()

        local csbNode = ExternalFun.loadCSB("game_res/Bank.csb", bg)
        csbNode:setAnchorPoint(0.5,0.5)
        csbNode:setPosition(yl.WIDTH/2,yl.HEIGHT/2)

--当前游戏币
        self.textCurrent =  csbNode:getChildByName("Text_Score")
        local pos = cc.p(self.textCurrent:getPositionX(),self.textCurrent:getPositionY())
        local text = self.textCurrent:getString()
        self.textCurrent:removeFromParent()

        self.textCurrent = cc.Label:createWithTTF(text, "fonts/round_body.ttf", 20)
        self.textCurrent:setPosition(pos.x, pos.y)
        csbNode:addChild(self.textCurrent)


--银行存款
        self.textBank    =  csbNode:getChildByName("Text_inSave")
        pos = cc.p(self.textBank:getPositionX(),self.textBank:getPositionY())
        text = self.textBank:getString()

        self.textBank:removeFromParent()

        self.textBank = cc.Label:createWithTTF(text, "fonts/round_body.ttf", 20)
        self.textBank:setPosition(pos.x, pos.y)
        csbNode:addChild(self.textBank)

        self:refreshScore()

--输入取出金额

        local take = csbNode:getChildByName("Text_tipNum")
        pos = cc.p(take:getPositionX(),take:getPositionY())
        text = take:getString()

        take:removeFromParent()

        take = cc.Label:createWithTTF(text, "fonts/round_body.ttf", 20)
        take:setPosition(pos.x, pos.y)
        csbNode:addChild(take)


--输入银行密码  

        local password = csbNode:getChildByName("Text_tipPassWord")
        pos = cc.p(password:getPositionX(),password:getPositionY())
        text = password:getString()

        password:removeFromParent()

        password = cc.Label:createWithTTF(text, "fonts/round_body.ttf", 20)
        password:setPosition(pos.x, pos.y)
        csbNode:addChild(password)

--取款按钮
        local btnTake = csbNode:getChildByName("btn_takeout")
        btnTake:addTouchEventListener(function( sender , envetType )
            if envetType == ccui.TouchEventType.ended then
                onTakeScore()
            end
        end)

--关闭按钮
        local btnClose = csbNode:getChildByName("bt_close")
        btnClose:addTouchEventListener(function( sender , eventType )
            if eventType == ccui.TouchEventType.ended then
                bg:removeFromParent()
            end
        end)

------------------------------------EditBox---------------------------------------------------


--取款金额
    local editbox = ccui.EditBox:create(cc.size(325, 47),"bank_res/edit_frame.png")
        :setPosition(cc.p(30,take:getPositionY()))
        :setFontName("fonts/round_body.ttf")
        :setPlaceholderFontName("fonts/round_body.ttf")
        :setFontSize(24)
        :setPlaceholderFontSize(24)
        :setMaxLength(32)
        :setInputMode(cc.EDITBOX_INPUT_MODE_SINGLELINE)
        :setPlaceHolder("请输入取款金额")
    csbNode:addChild(editbox)
    self.m_editNumber = editbox
  

    --取款密码
    editbox = ccui.EditBox:create(cc.size(325, 47),"bank_res/edit_frame.png")
        :setPosition(cc.p(30,password:getPositionY()))
        :setFontName("fonts/round_body.ttf")
        :setPlaceholderFontName("fonts/round_body.ttf")
        :setFontSize(24)
        :setPlaceholderFontSize(24)
        :setMaxLength(32)
        :setInputFlag(cc.EDITBOX_INPUT_FLAG_PASSWORD)
        :setInputMode(cc.EDITBOX_INPUT_MODE_SINGLELINE)
        :setPlaceHolder("请输入取款密码")
    csbNode:addChild(editbox)
    self.m_editPasswd = editbox
   

---------------------------------------------------------------------------------------------------------

    elseif 2 == tag then --帮助

        local  bg = addBG()

        local csbNode = ExternalFun.loadCSB("game_res/Help.csb", bg)
        csbNode:setAnchorPoint(0.5,0.5)
        csbNode:setPosition(yl.WIDTH/2,yl.HEIGHT/2)

        --切换按钮
        local btnLayout = csbNode:getChildByName("btn_layout")
        local btnOperate = btnLayout:getChildByName("Button_operate")
        local btnAward = btnLayout:getChildByName("Button_award")
        local btnGift = btnLayout:getChildByName("Button_gift")

        local btnClose = csbNode:getChildByName("btn_close")


        --背景
        local  operateBG = csbNode:getChildByName("help_operate")
        local  awardBG = csbNode:getChildByName("help_award")
        local  giftBG  = csbNode:getChildByName("help_gift")


        --添加点击事件
        btnOperate:addTouchEventListener(function ( sender , eventType )
            if eventType == ccui.TouchEventType.ended then
                operateBG:setVisible(true)
                awardBG:setVisible(false)
                giftBG:setVisible(false)
            end
        end)

        btnAward:addTouchEventListener(function ( sender , eventType )
            if eventType == ccui.TouchEventType.ended then
                operateBG:setVisible(false)
                awardBG:setVisible(true)
                giftBG:setVisible(false)



              if nil == awardBG:getChildByTag(1) then 
                --dump(self._scene._dataModel.m_secene.nFishMultiple, "the mutiple is ======================= >   ", 6)
                local gameMultiple = self._scene._dataModel.m_secene.nFishMultiple
                
                for i=1,22 do
                    local dx = 170
                    if 0 == math.mod(i,5) then
                        dx = 158
                    end
                    if gameMultiple[i][1] == gameMultiple[i][2] then
                        local value = gameMultiple[i][1]
                        local mutiple = cc.LabelAtlas:create(string.format("%d:",value),"game_res/num_help.png",19,20,string.byte("0"))
                        mutiple:setTag(i)
                        mutiple:setPosition(125 + math.mod((i-1),5)*dx, awardBG:getContentSize().height -135 -  math.floor((i-1)/5) * 70)
                        awardBG:addChild(mutiple)

                    else

                        local value = gameMultiple[i][1]
                        local mutiple = cc.LabelAtlas:create(string.format("%d",value),"game_res/num_help.png",19,20,string.byte("0"))
                        mutiple:setTag(i)
                        mutiple:setPosition(115 + math.mod((i-1),5)*dx, awardBG:getContentSize().height -135 - math.floor((i-1)/5) * 70)
                        awardBG:addChild(mutiple)


                        local sign = cc.Sprite:create()
                        sign:setAnchorPoint(0.5,0.5)
                        sign:initWithFile("game_res/num_clear_multiple.png",cc.rect(0,0,16,17))
                        sign:setPosition(135 + math.mod((i-1),5)*dx, awardBG:getContentSize().height -140 -  math.floor((i-1)/5) * 70)
                        awardBG:addChild(sign)


                        local _value = gameMultiple[i][2]
                        local _mutiple = cc.LabelAtlas:create(string.format("%d:",_value),"game_res/num_help.png",19,20,string.byte("0"))
                        _mutiple:setTag(i)
                        _mutiple:setPosition(140 + math.mod((i-1),5)*dx, awardBG:getContentSize().height -150 - math.floor((i-1)/5) * 70)
                        awardBG:addChild(_mutiple)
    
                    end
                end  
             end

            end
        end)

        btnGift:addTouchEventListener(function ( sender , eventType )
            if eventType == ccui.TouchEventType.ended then
                operateBG:setVisible(false)
                awardBG:setVisible(false)
                giftBG:setVisible(true)

            end
        end)

        --关闭
         btnClose:addTouchEventListener(function ( sender , eventType )
            if eventType == ccui.TouchEventType.ended then
                bg:removeFromParent()
            end
        end)

    elseif 3 == tag then --设置

        local bMute = false

        local  bg = addBG()

        local csbNode = ExternalFun.loadCSB("game_res/Setting.csb", bg)
        csbNode:setAnchorPoint(0.5,0.5)
        csbNode:setPosition(yl.WIDTH/2,yl.HEIGHT/2)

        local btnClose = csbNode:getChildByName("bt_close")


         btnClose:addTouchEventListener(function ( sender , eventType )
            if eventType == ccui.TouchEventType.ended then
                bg:removeFromParent()
            end
        end)

        local txt_version = csbNode:getChildByName("txt_version")
        txt_version:setVisible(false)
        local mgr = self._scene._scene:getApp():getVersionMgr()
        local verstr = mgr:getResVersion(g_var(cmd).KIND_ID) or "0"
        verstr = "游戏版本:" .. appdf.BASE_C_VERSION .. "." .. verstr
        print("----- verstr ----"..verstr)
        local lbVersion =  cc.Label:createWithSystemFont(verstr, "Microsoft Yahei", 20)
        lbVersion:setAnchorPoint(cc.p(1,0.5))
        lbVersion:setColor(cc.c3b(210, 230, 240))
        lbVersion:setPosition(cc.p(txt_version:getPositionX(), txt_version:getPositionY()))
        csbNode:addChild(lbVersion)

--静音按钮
        local muteBtn = csbNode:getChildByName("btn_mute")
        
        if  GlobalUserItem.bVoiceAble or GlobalUserItem.bSoundAble then
            muteBtn:loadTextureNormal("setting_res/bt_check_no.png")
        end

        
        if (self._tag == 0) and not (GlobalUserItem.bVoiceAble and GlobalUserItem.bSoundAble) then
            self._tag = 1
        end

        muteBtn:addTouchEventListener(function( sender,eventType )

            if eventType == ccui.TouchEventType.ended then

                GlobalUserItem.bVoiceAble = not GlobalUserItem.bVoiceAble
                GlobalUserItem.bSoundAble = GlobalUserItem.bVoiceAble

                if  self._tag == 1 then
                    self._tag = 2
                    muteBtn:loadTextureNormal("setting_res/bt_check_yes.png")
                    AudioEngine.setMusicVolume(0)
                    AudioEngine.pauseMusic() 
                    GlobalUserItem.bSoundAble = false
                    GlobalUserItem.bVoiceAble = false
                    return
                end

                if GlobalUserItem.bVoiceAble then

                    muteBtn:loadTextureNormal("setting_res/bt_check_no.png")
                    AudioEngine.resumeMusic()
                    AudioEngine.setMusicVolume(1.0)     
                else
                    muteBtn:loadTextureNormal("setting_res/bt_check_yes.png")
                    AudioEngine.setMusicVolume(0)
                    AudioEngine.pauseMusic() -- 暂停音乐
                end
            end
        end)


    else --结算
        local  bg = addBG()

        local csbNode = ExternalFun.loadCSB("game_res/GameClear.csb", bg)
        csbNode:setAnchorPoint(0.5,0.5)
        csbNode:setPosition(yl.WIDTH/2,yl.HEIGHT/2)

        --按钮
        local quit = csbNode:getChildByName("btn_gameQuit")
        quit:addTouchEventListener(function(sender,eventType)
            if eventType == ccui.TouchEventType.ended then
                bg:removeFromParent()
                self._scene:onQueryExitGame()
            end
        end)

        local back = csbNode:getChildByName("btn_gameBack")
        back:addTouchEventListener(function(sender,eventType)
            if eventType == ccui.TouchEventType.ended then
                 bg:removeFromParent()
            end
        end)

 --子弹消耗
       local bulletConsum = csbNode:getChildByName("Text_bulletConsum")
       local  pos  = cc.p(bulletConsum:getPositionX(),bulletConsum:getPositionY())
       local anrchor = bulletConsum:getAnchorPoint()
       bulletConsum:removeFromParent()

       bulletConsum = cc.LabelAtlas:create(string.format("%d",self._scene._dataModel.m_secene.lBulletConsume[1][self._scene.m_nChairID+1]),"game_res/num_award.png",21,21,string.byte("0"))
       bulletConsum:setPosition(pos.x, pos.y)
       bulletConsum:setAnchorPoint(anrchor)
       csbNode:addChild(bulletConsum)

  
  --捕鱼收获
       local getNum = self._scene._dataModel.m_getFishScore
       local fishGet = csbNode:getChildByName("Text_fishGet")  
       pos  = cc.p(fishGet:getPositionX(),fishGet:getPositionY())
       anrchor = fishGet:getAnchorPoint()
       fishGet:removeFromParent()

       fishGet = cc.LabelAtlas:create(string.format("%d",getNum),"game_res/num_award.png",21,21,string.byte("0"))
       fishGet:setPosition(pos.x, pos.y)
       fishGet:setAnchorPoint(anrchor)
       csbNode:addChild(fishGet)  

       local gameMultiple = self._scene._dataModel.m_secene.nFishMultiple
        for i=1,22 do

            local dx = 160
            if gameMultiple[i][1] == gameMultiple[i][2] then
                local value = gameMultiple[i][1]
                local mutiple = cc.LabelAtlas:create(string.format("%d:",value),"game_res/num_help.png",19,20,string.byte("0"))
                mutiple:setTag(i)
                mutiple:setPosition(-335 + math.mod((i-1),5)*dx, csbNode:getContentSize().height + 145 -  math.floor((i-1)/5) * 70)
                csbNode:addChild(mutiple)

            else

                local value = gameMultiple[i][1]
                local mutiple = cc.LabelAtlas:create(string.format("%d",value),"game_res/num_help.png",19,20,string.byte("0"))
                mutiple:setTag(i)
                mutiple:setPosition(-335 + math.mod((i-1),5)*dx, csbNode:getContentSize().height + 145 -  math.floor((i-1)/5) * 70)
                csbNode:addChild(mutiple)


                local sign = cc.Sprite:create()
                sign:setAnchorPoint(0.5,0.5)
                sign:initWithFile("game_res/num_clear_multiple.png",cc.rect(0,0,16,17))
                sign:setPosition(-325 + math.mod((i-1),5)*dx, csbNode:getContentSize().height + 140 -  math.floor((i-1)/5) * 70)
                csbNode:addChild(sign)


                local _value = gameMultiple[i][2]
                local _mutiple = cc.LabelAtlas:create(string.format("%d:",_value),"game_res/num_help.png",19,20,string.byte("0"))
                _mutiple:setTag(i)
                _mutiple:setPosition(-315 + math.mod((i-1),5)*dx, csbNode:getContentSize().height + 130 -  math.floor((i-1)/5) * 70)
                csbNode:addChild(_mutiple)
            
            end


            local count = self._scene.m_catchFishCount[i]

            local sign = cc.Sprite:create()
            sign:setAnchorPoint(0.5,0.5)
            sign:initWithFile("game_res/num_clear_strip.png",cc.rect(17*12,0,17,15))
            sign:setPosition(-350 + math.mod((i-1),5)*175, csbNode:getContentSize().height + 187 -  math.floor((i-1)/5) * 70)
            csbNode:addChild(sign)

            local _count = cc.LabelAtlas:create(string.format("%d",count),"game_res/num_clear_strip.png",17,15,string.byte("0"))
            _count:setTag(i)
            _count:setPosition(-340 + math.mod((i-1),5)*175, csbNode:getContentSize().height + 180 -  math.floor((i-1)/5) * 70)
            csbNode:addChild(_count)
         end

   --用户分数
        local userScore = csbNode:getChildByName("Text_totalScore")  

        pos  = cc.p(userScore:getPositionX(),userScore:getPositionY())
        anrchor = userScore:getAnchorPoint()
        userScore:removeFromParent()

        userScore = cc.LabelAtlas:create(string.format("%d",self._scene._dataModel.m_secene.lPlayCurScore[1][self._scene.m_nChairID + 1]),"game_res/num_award.png",21,21,string.byte("0"))
        userScore:setPosition(pos.x, pos.y)
        userScore:setAnchorPoint(anrchor)
        csbNode:addChild(userScore)    
    end
end


function GameViewLayer:ButtonEvent( sender , eventType)
    
    if eventType == ccui.TouchEventType.ended then

            local function getCannonPos()
                 --获取自己炮台
              local cannonPos = self._scene.m_nChairID

              cannonPos = CannonSprite.getPos(self._scene._dataModel.m_reversal,cannonPos)
              
              return cannonPos
            end

            local tag = sender:getTag()

            if tag == TAG.tag_autoshoot then --自动射击

              self._scene._dataModel.m_autoshoot = not self._scene._dataModel.m_autoshoot

              if self._scene._dataModel.m_autoshoot then
                  self._scene._dataModel.m_autolock = false
              end
  
              self:setAutoShoot(self._scene._dataModel.m_autoshoot,sender)
              local lock = self:getChildByTag(TAG.tag_autolock)
              self:setAutoLock(self._scene._dataModel.m_autolock,lock)

              local isauto = false

              if self._scene._dataModel.m_autoshoot or self._scene._dataModel.m_autolock then
                  isauto =  true
              end
             
              local cannon = self._scene.m_cannonLayer:getCannoByPos(getCannonPos() + 1)
              cannon:setAutoShoot(isauto)

              if self._scene._dataModel.m_autoshoot then
                  cannon:removeLockTag()
              end
                    
            elseif tag == TAG.tag_autolock then --自动锁定
                 
              self._scene._dataModel.m_autolock = not self._scene._dataModel.m_autolock
              if self._scene._dataModel.m_autolock then
                  self._scene._dataModel.m_autoshoot = false
              end
              
              local auto = self:getChildByTag(TAG.tag_autoshoot)
              self:setAutoShoot(self._scene._dataModel.m_autoshoot,auto)
              self:setAutoLock(self._scene._dataModel.m_autolock,sender) 

              local isauto = false

              if self._scene._dataModel.m_autoshoot or self._scene._dataModel.m_autolock then
                  isauto =  true
              end
             
              local cannon = self._scene.m_cannonLayer:getCannoByPos(getCannonPos() + 1)
              cannon:setAutoShoot(isauto)

              if self._scene._dataModel.m_autoshoot then
                  cannon:removeLockTag()
              end

              elseif tag == TAG.tag_Menu then --菜单

                local MenuBG = ccui.ImageView:create()
                MenuBG:setContentSize(cc.size(yl.WIDTH, yl.HEIGHT))
                MenuBG:setScale9Enabled(true)
                MenuBG:setPosition(yl.WIDTH/2, yl.HEIGHT/2)
                MenuBG:setTouchEnabled(true)
                self:addChild(MenuBG,21)
                MenuBG:addTouchEventListener(function (sender,eventType)
                    if eventType == ccui.TouchEventType.ended then
                        MenuBG:removeFromParent()
                    end
                end)


                --添加菜单背景
                local bg = ccui.ImageView:create("game_res/im_bt_frame.png")
                bg:setScale9Enabled(true)
                bg:setContentSize(cc.size(bg:getContentSize().width, 380))
                bg:setAnchorPoint(1.0,0.0)

                bg:setPosition(yl.WIDTH - 5, -260)
                MenuBG:addChild(bg)

                bg:runAction(cc.MoveTo:create(0.2,cc.p(yl.WIDTH-5,60)))

                local function subCallBack( sender , eventType )
                    if eventType == ccui.TouchEventType.ended  then
                        sender:getParent():getParent():removeFromParent()
                        self:subMenuEvent(sender,eventType)
                    end
                end

                --添加子菜单
                local bank = ccui.Button:create("game_res/bt_bank_0.png","game_res/bt_bank_1.png")
                bank:setTag(1)
                bank:addTouchEventListener(subCallBack)
                bank:setPosition(bg:getContentSize().width/2, bg:getContentSize().height - 53)
                bg:addChild(bank)

                local help = ccui.Button:create("game_res/bt_help_0.png","game_res/bt_help_1.png")
                help:setTag(2)
                help:addTouchEventListener(subCallBack)
                help:setPosition(bg:getContentSize().width/2, bg:getContentSize().height - 143)
                bg:addChild(help)

                local set = ccui.Button:create("game_res/bt_setting_0.png","game_res/bt_setting_1.png")
                set:setTag(3)
                set:addTouchEventListener(subCallBack)
                set:setPosition(bg:getContentSize().width/2, bg:getContentSize().height - 143 - 90 - 5)
                bg:addChild(set)

                local clear = ccui.Button:create("game_res/bt_clearing_0.png","game_res/bt_clearing_1.png")
                clear:setTag(4)
                clear:addTouchEventListener(subCallBack)
                clear:setPosition(bg:getContentSize().width/2, bg:getContentSize().height - 143 - 180 - 5)
                bg:addChild(clear)

            end
    end
end


function GameViewLayer:Showtips( tips )
  
    local lb =  cc.Label:createWithTTF(tips, "fonts/round_body.ttf", 20)
    local bg = ccui.ImageView:create("game_res/clew_box.png")
    lb:setTextColor(cc.YELLOW)
    bg:setScale9Enabled(true)
    bg:setContentSize(cc.size(lb:getContentSize().width + 60  , 40))
    bg:setScale(0.1)
    lb:setPosition(bg:getContentSize().width/2, 20)
    bg:addChild(lb)

    self:ShowTipsForBg(bg)

end

function GameViewLayer:ShowCoin( score,wChairID,pos,fishtype )

  --print("score.."..score.."wChairID.."..wChairID.."fishtype.."..fishtype)
  --local nMyNum = math.floor(self.m_pUserItem.wChairID / 3)
  --local nPlayerNum = math.floor(wChairID / 3)
  local nMyNum = self.m_pUserItem.wChairID >= 3
  local nPlayerNum = wChairID >= 3
  self._scene._dataModel:playEffect(g_var(cmd).Coinfly)

  local silverNum = {2,2,3,4,4}
  local goldNum = {1,1,1,2,2,3,3,4,5,6,8,16,16,16,18,18,18}
  
  --local nMyNum = self._scene.m_nChairID/3
  --local playerNum = wChairID/3

  local nPos = wChairID
--获取炮台
  nPos = CannonSprite.getPos(self._scene._dataModel.m_reversal,nPos)

   local cannon = self._scene.m_cannonLayer:getCannoByPos(nPos + 1)

   if nil == cannon then
      return
   end

   local anim = nil
   local coinNum = 1
   local frameName = nil
   local distant = 50


  if fishtype < 5 then
    anim = cc.AnimationCache:getInstance():getAnimation("SilverAnim")
    frameName = "silver_coin_0.png"
    coinNum = silverNum[fishtype+1]
  elseif fishtype>=5 and fishtype<17 then
    anim = cc.AnimationCache:getInstance():getAnimation("GoldAnim")
    frameName = "gold_coin_0.png"

    coinNum = goldNum[fishtype+1]

  elseif fishtype == g_var(cmd).FishType_YuanBao then
    anim = cc.AnimationCache:getInstance():getAnimation("fish_ignot_coin")
    frameName = "ignot_coin_1.png"
    coinNum = 1
  end

  local posX = {}
  local initX = -105
  posX[1] = initX

  for i=2,10 do
    posX[i] = initX-(i-1)*39
  end

  local node = cc.Node:create()
  node:setAnchorPoint(0.5,0.5)
  node:setContentSize(cc.size(distant*5 , distant*4))
  
  if coinNum > 5 then
    node:setContentSize(cc.size(distant*5 , distant*2+40))
  end

  node:setPosition(pos.x, pos.y)
  self._scene.m_cannonLayer:addChild(node,1)

  if nil ~= anim then
      local action = cc.RepeatForever:create(cc.Animate:create(anim))
     
      if coinNum > 10 then
        coinNum = 10
      end

     local num = cc.LabelAtlas:create(string.format("%d", score),"game_res/num_game_gold.png",37,34,string.byte("0"))
     num:setAnchorPoint(0.5,0.5)
     num:setPosition(node:getContentSize().width/2, node:getContentSize().height-140)
     node:addChild(num)
     local call = cc.CallFunc:create(function()
       num:removeFromParent()
     end)

     num:runAction(cc.Sequence:create(cc.DelayTime:create(1.0),call))

     local secondNum = coinNum
     if coinNum > 5 then
        secondNum = coinNum/2 
     end

     local node1 = cc.Node:create()
     node1:setContentSize(cc.size(distant*secondNum, distant))
     node1:setAnchorPoint(0.5,0.5)
     node1:setPosition(node:getContentSize().width/2, distant/2)
     node:addChild(node1)

     for i=1,secondNum do
       local coin = cc.Sprite:createWithSpriteFrameName(frameName)
       coin:runAction(action:clone())
       coin:setPosition(distant/2+(i-1)*distant, distant/2)
       node1:addChild(coin)
     end

     if coinNum > 5 then
       local firstNum = coinNum - secondNum
       local node2 = cc.Node:create()
       node2:setContentSize(cc.size(distant*firstNum, distant))
       node2:setAnchorPoint(0.5,0.5)
       node2:setPosition(node:getContentSize().width/2, distant*3/2)
       node:addChild(node2)

     end
  end

  local cannonPos = cc.p(cannon:getPositionX(),cannon:getPositionY())
  local call = cc.CallFunc:create(function()
    node:removeFromParent()
  end)

  node:runAction(cc.Sequence:create(cc.MoveBy:create(1.0,cc.p(0,40)),cc.MoveTo:create(0.35,cannonPos),call))

  local angle = 70.0
  local time = 0.12
  local moveY = 30.0

  if fishtype >= g_var(cmd).FishType.FishType_JianYu and fishtype <= g_var(cmd).FishType.FishType_LiKui then
    self._scene._dataModel:playEffect(g_var(cmd).bingo)
    local goldCycle = self:getChildByTag(TAG.tag_GoldCycle + wChairID )
    if nil == goldCycle then
        goldCycle = cc.Sprite:create("game_res/goldCircle.png")
        goldCycle:setTag(TAG.tag_GoldCycle + wChairID)

        goldCycle:setPosition(pos.x, pos.y)
        self:addChild(goldCycle,6)
        local call = cc.CallFunc:create(function( )
           goldCycle:removeFromParent()
        end)
        goldCycle:runAction(cc.Sequence:create(cc.RotateBy:create(time*18,360*1.3),call))
    end


    local goldTxt = self:getChildByTag(TAG.tag_GoldCycleTxt + wChairID)
    if goldTxt == nil then

      goldTxt = cc.LabelAtlas:create(string.format("%d", score),"game_res/mutipleNum.png",14,17,string.byte("0"))
      goldTxt:setAnchorPoint(0.5,0.5)
      goldTxt.lScore = score
      goldTxt:setPosition(pos.x, pos.y)          
      self:addChild(goldTxt,6)

      local action = cc.Sequence:create(cc.RotateTo:create(time*2,angle),cc.RotateTo:create(time*4,-angle),cc.RotateTo:create(time*2,0))
      local call = cc.CallFunc:create(function()  
          goldTxt:removeFromParent()
      end)

      goldTxt:runAction(cc.Sequence:create(action,call))

    end

  end

    if fishtype ~= g_var(cmd).FishType_BaoXiang then

    local bannerText = cc.LabelAtlas:create(string.format("%d", score),"game_res/mutipleNum.png",14,17,string.byte("0"))
    bannerText:setTag(TAG.tag_GoldsText)
    bannerText:setAnchorPoint(cc.p(0.5,0.5))

    if cannon.m_nBannerColor == 0 then
        cannon.m_nBannerColor = 1
    else
        cannon.m_nBannerColor = 0
    end
    local spGoldBanner = cc.Sprite:create("game_res/gold_banner.png")
    local goldBanner = ccui.Scale9Sprite:create("game_res/gold_banner.png")
    goldBanner:updateWithSprite(spGoldBanner,cc.rect(0,18*cannon.m_nBannerColor,75, 18),false, cc.rect(5, 5, 65, 8))
    goldBanner:setContentSize(cc.size(bannerText:getContentSize().width + 10, bannerText:getContentSize().height))

    local golds = cc.Sprite:create("game_res/golds.png",cc.rect(0,0,38,4*7))
    goldBanner:addChild(golds, 19)

    local posArray = {}
    local initPos = -105
    posArray[1] = initPos
    local moveX = 0
    local moveY = 30
    local tMoveX = 39
    local tMoveY = 0
    for i = 2, 10 do
        posArray[i] = initPos - i * 39
    end
    if nMyNum == nPlayerNum then
        goldBanner:setPosition(cc.p(cannonPos.x + posArray[#cannon.m_goldList + 2] + 90, cannonPos.y - 27))
        golds:setPosition(cc.p(goldBanner:getContentSize().width / 2, - 15))
    else
        moveY = -30
        goldBanner:setPosition(cc.p(cannonPos.x + posArray[#cannon.m_goldList + 2] + 90, cannonPos.y + 40))
        golds:setPosition(cc.p(goldBanner:getContentSize().width / 2, 27))
    end

    if nPos == 6 then
        goldBanner:setPosition(cc.p(cannonPos.x -46, cannonPos.y - posArray[#cannon.m_goldList + 2] - 100))
        golds:setPosition(cc.p(goldBanner:getContentSize().width / 2, - 15))
        goldBanner:setRotation(90)
        moveX = 30
        moveY = 0
        tMoveX = 0;
        tMoveY = -39
    elseif nPos == 7 then
        goldBanner:setPosition(cc.p(cannonPos.x + 46, cannonPos.y + posArray[#cannon.m_goldList + 2] + 100))
        golds:setPosition(cc.p(goldBanner:getContentSize().width / 2, - 15))
        goldBanner:setRotation(270)
        moveX = -30
        moveY = 0
        tMoveX = 0;
        tMoveY = 39
    end

    local seAction = cc.Sequence:create(cc.MoveBy:create(0.5,cc.p(moveX,moveY)), cc.DelayTime:create(0.3))

    local index = #cannon.m_goldList

    if index >= 3 then
        local node = cannon.m_goldList[3]
        local text = node:getChildByTag(TAG.tag_GoldsText)
        if nil ~= text and nil~=text.lScore then
            text.lScore = text.lScore + score
            text:setString(string.format("%d", text.lScore))
        end
    else
        self:addChild(goldBanner, 19)
        bannerText:setPosition(cc.p(goldBanner:getContentSize().width / 2, goldBanner:getContentSize().height / 2))
        goldBanner:addChild(bannerText)
        table.insert(cannon.m_goldList,goldBanner)
        goldBanner:runAction(cc.Sequence:create(seAction, cc.CallFunc:create(function()
        if nil ==  cannon.m_goldList then
            return
        end 
          if #cannon.m_goldList  and (#cannon.m_goldList == 1 or goldBanner == cannon.m_goldList[1]) then
            goldBanner:removeFromParent()
            table.remove(cannon.m_goldList,1)
          end

          for i = 1, #cannon.m_goldList do
            local node = cannon.m_goldList[i]
            node:runAction(cc.Sequence:create(cc.MoveBy:create(0.35,cc.p(tMoveX,tMoveY)),  cc.CallFunc:create(function()
                cannon:moveAllBannerAndGolds(node)
                end) ))
          end
      end)))
    end

end
end

function GameViewLayer:ShowAwardTip(data)


 local fishName = {"小黄刺鱼","小草鱼","热带黄鱼","大眼金鱼","热带紫鱼","小丑鱼","河豚鱼","狮头鱼","灯笼鱼","海龟","神仙鱼","蝴蝶鱼","铃铛鱼","剑鱼","魔鬼鱼","大白鲨","大金鲨",
    "巨型黄金鲨","金龙","绿色千年龟摇钱树","银色千年龟摇钱树","金色千年龟摇钱树","漂流瓶","屠龙刀","火山","宝箱","元宝"}

  local labelList = {}

  local tipStr  = ""
  local tipStr1 = ""
  local tipStr2 = ""

  if data.nFishMultiple >= 50 then
    if data.nScoreType == g_var(cmd).SupplyType.EST_Cold then
       tipStr = "捕中了"..fishName[data.nFishType+1]..",获得"
    elseif data.nScoreType == g_var(cmd).SupplyType.EST_Laser then
      
       tipStr = "使用激光,获得"
    end

  tipStr1 = string.format("%d倍 %d分数",data.nFishMultiple,data.lFishScore)
  if data.nFishMultiple > 500 then
     tipStr2 = "超神了!!!"
  elseif data.nFishMultiple == 19 then
       tipStr2 = "运气爆表!!!"   
  else
      tipStr2 = "实力超群!!!"     
  end

  local name = data.szPlayName
  local tableStr = nil
  if data.wTableID == self._scene.m_nTableID  then 
    tableStr = "本桌玩家"

  else
       tableStr = string.format("第%d桌玩家",data.wTableID+1)

  end

  local lb1 =  cc.Label:createWithTTF(tableStr, "fonts/round_body.ttf", 20)
  lb1:setTextColor(cc.YELLOW)
  lb1:setAnchorPoint(0,0.5)
  table.insert(labelList, lb1)
 

  local lb2 =  cc.Label:createWithTTF(name, "fonts/round_body.ttf", 20)
  lb2:setTextColor(cc.RED)
  lb2:setAnchorPoint(0,0.5)
  table.insert(labelList, lb2)

  local lb3 =  cc.Label:createWithTTF(tipStr, "fonts/round_body.ttf", 20)
  lb3:setTextColor(cc.YELLOW)
  lb3:setAnchorPoint(0,0.5)
  table.insert(labelList, lb3)

  local lb4 =  cc.Label:createWithTTF(tipStr1, "fonts/round_body.ttf", 20)
  lb4:setTextColor(cc.RED)
  lb4:setAnchorPoint(0,0.5)
  table.insert(labelList, lb4)

  local lb5 =  cc.Label:createWithTTF(tipStr2, "fonts/round_body.ttf", 20)
  lb5:setTextColor(cc.YELLOW)
  lb5:setAnchorPoint(0,0.5)
  table.insert(labelList, lb5)

  else

    local lb1 =  cc.Label:createWithTTF("恭喜你捕中了补给箱,获得", "fonts/round_body.ttf", 20)
    lb1:setTextColor(cc.YELLOW)
    lb1:setAnchorPoint(0,0.5)

    local lb1 =  cc.Label:createWithTTF(string.format("%d倍 %d分数 !", data.nFishMultiple,data.lFishScore), "fonts/round_body.ttf", 20)
    lb1:setTextColor(cc.RED)
    lb1:setAnchorPoint(0,0.5)

    table.insert(labelList, lb1)
    table.insert(labelList, lb2)

  end



  local length = 60
  for i=1,#labelList do
    local lb = labelList[i]
    lb:setPosition(length - 30 , 20)
    length =  length + lb:getContentSize().width + 5 
  end


   local bg = ccui.ImageView:create("game_res/clew_box.png")
    bg:setScale9Enabled(true)
  
    bg:setContentSize(length,40)
    bg:setScale(0.1)

    for i=1,#labelList do
      local lb = labelList[i]
      bg:addChild(lb)
    end

    self:ShowTipsForBg(bg)
    labelList = {}
end


function GameViewLayer:ShowTipsForBg( bg )

  local infoCount = #self._scene.m_infoList
  local sublist = {}

  while infoCount >= 3 do

    local node = self._scene.m_infoList[1]
    table.remove(self._scene.m_infoList,1)
    node:removeFromParent()

    for i=1,#self._scene.m_infoList do
      local bg = self._scene.m_infoList[i]
      bg:runAction(cc.MoveBy:create(0.2,cc.p(0,60)))
    end

    infoCount = #self._scene.m_infoList
  end

  bg:setPosition(yl.WIDTH/2, yl.HEIGHT-120-60*infoCount)
  self:addChild(bg,30)
  table.insert(self._scene.m_infoList, bg)

  local call = cc.CallFunc:create(function()
    bg:removeFromParent()
    for i=1,#self._scene.m_infoList do
      local _bg = self._scene.m_infoList[i]
      if bg == _bg then
        table.remove(self._scene.m_infoList,i)
        break
      end
    end

    if #self._scene.m_infoList > 0 then
      for i=1,#self._scene.m_infoList do

       local _bg = self._scene.m_infoList[i]
          _bg:runAction(cc.MoveBy:create(0.2,cc.p(0,60)))

       end
    end

  end)

  bg:runAction(cc.Sequence:create(cc.ScaleTo:create(0.17,1.0),cc.DelayTime:create(5),cc.ScaleTo:create(0.17,0.1,1.0),call)) 
end

return GameViewLayer
