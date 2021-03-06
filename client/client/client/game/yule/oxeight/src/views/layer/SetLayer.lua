--
-- Author: luo
-- Date: 2016年12月30日 15:18:32
--
--设置界面
local ExternalFun = require(appdf.EXTERNAL_SRC .. "ExternalFun")
local SettingLayer = class("SettingLayer", cc.Layer)
SettingLayer.RES_PATH 				= "game/yule/oxeight/res/set/"

SettingLayer.BT_EFFECT = 1
SettingLayer.BT_MUSIC = 2
SettingLayer.BT_CLOSE = 3
--构造
function SettingLayer:ctor(verstr )
    --注册触摸事件
    ExternalFun.registerTouchEvent(self, true)
    --加载csb资源
    self._csbNode = ExternalFun.loadCSB("set/set.csb", self)
    --回调方法
    local cbtlistener = function (sender,eventType)
        if eventType == ccui.TouchEventType.ended then
            self:OnButtonClickedEvent(sender:getTag(),sender)
        end
    end
    --背景
    local sp_bg = self._csbNode:getChildByName("bg")
    self.m_spBg = sp_bg

    --关闭按钮
    local btn = self._csbNode:getChildByName("closeBtn")
    btn:setTag(SettingLayer.BT_CLOSE)
    btn:addTouchEventListener(function (ref, eventType)
        if eventType == ccui.TouchEventType.ended then
            ExternalFun.playClickEffect()
            self:setVisible(false)
        end
    end)

    --音效
    self.m_btnEffect = self._csbNode:getChildByName("soundBtn")
    self.m_btnEffect:setTag(SettingLayer.BT_EFFECT)
    self.m_btnEffect:addTouchEventListener(cbtlistener)

    --音乐
    self.m_btnMusic = self._csbNode:getChildByName("musicBtn")
    self.m_btnMusic:setTag(SettingLayer.BT_MUSIC)
    self.m_btnMusic:addTouchEventListener(cbtlistener)
    --按钮纹理
    if GlobalUserItem.bVoiceAble == true then 
        self.m_btnMusic:loadTextureNormal(SettingLayer.RES_PATH .. "open.png")
        
    else
        self.m_btnMusic:loadTextureNormal(SettingLayer.RES_PATH .. "close.png")
    end
    if GlobalUserItem.bSoundAble == true then 
        self.m_btnEffect:loadTextureNormal(SettingLayer.RES_PATH .. "open.png")
    else
        self.m_btnEffect:loadTextureNormal(SettingLayer.RES_PATH .. "close.png")
    end
    --版本信息
    --dump(verstr)
    self.m_TextVer = self._csbNode:getChildByName("Text_1")
    self.m_TextVer:setString(verstr)

end

--
function SettingLayer:showLayer( var )
    self:setVisible(var)
end
--按钮回调方法
function SettingLayer:OnButtonClickedEvent( tag, sender )
    if SettingLayer.BT_MUSIC == tag then    --音乐
        local music = not GlobalUserItem.bVoiceAble
        GlobalUserItem.setVoiceAble(music)
        if GlobalUserItem.bVoiceAble == true then 
            AudioEngine.playMusic("sound_res/backMusic.mp3", true)
            sender:loadTextureNormal( SettingLayer.RES_PATH .. "open.png")
        else
            AudioEngine.stopMusic()
            sender:loadTextureNormal(SettingLayer.RES_PATH .. "close.png")
        end
    elseif SettingLayer.BT_EFFECT == tag then   --音效
        local effect = not GlobalUserItem.bSoundAble
        GlobalUserItem.setSoundAble(effect)
        if GlobalUserItem.bSoundAble == true then 
            sender:loadTextureNormal(SettingLayer.RES_PATH .. "open.png")
        else
            sender:loadTextureNormal(SettingLayer.RES_PATH .. "close.png")
        end
    end
end
--触摸回调
function SettingLayer:onTouchBegan(touch, event)
    return self:isVisible()
end

function SettingLayer:onTouchEnded(touch, event)
    local pos = touch:getLocation() 
    local m_spBg = self.m_spBg
    pos = m_spBg:convertToNodeSpace(pos)
    local rec = cc.rect(0, 0, m_spBg:getContentSize().width, m_spBg:getContentSize().height)
    if false == cc.rectContainsPoint(rec, pos) then
        self:setVisible(false)
    end
end

return SettingLayer