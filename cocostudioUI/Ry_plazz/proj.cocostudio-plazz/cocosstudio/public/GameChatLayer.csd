<GameFile>
  <PropertyGroup Name="GameChatLayer" Type="Layer" ID="441c5e2e-2f8b-4453-9829-1d172c6b4f75" Version="3.10.0.0" />
  <Content ctype="GameProjectContent">
    <Content>
      <Animation Duration="0" Speed="1.0000" />
      <ObjectData Name="Layer" ctype="GameLayerObjectData">
        <Size X="1334.0000" Y="750.0000" />
        <Children>
          <AbstractNodeData Name="Panel_1" ActionTag="171595120" Tag="2" IconVisible="False" PercentWidthEnable="True" PercentHeightEnable="True" PercentWidthEnabled="True" PercentHeightEnabled="True" LeftMargin="-2.0785" RightMargin="2.0785" TopMargin="-1.8763" BottomMargin="1.8763" TouchEnable="True" ClipAble="False" BackColorAlpha="76" ComboBoxIndex="1" ColorAngle="90.0000" Scale9Width="1" Scale9Height="1" ctype="PanelObjectData">
            <Size X="1334.0000" Y="750.0000" />
            <AnchorPoint />
            <Position X="-2.0785" Y="1.8763" />
            <Scale ScaleX="1.0000" ScaleY="1.0000" />
            <CColor A="255" R="255" G="255" B="255" />
            <PrePosition X="-0.0016" Y="0.0025" />
            <PreSize X="1.0000" Y="1.0000" />
            <SingleColor A="255" R="0" G="0" B="0" />
            <FirstColor A="255" R="150" G="200" B="255" />
            <EndColor A="255" R="255" G="255" B="255" />
            <ColorVector ScaleY="1.0000" />
          </AbstractNodeData>
          <AbstractNodeData Name="chat_bg" ActionTag="315933839" Tag="3" IconVisible="False" PositionPercentXEnabled="True" PositionPercentYEnabled="True" LeftMargin="901.2911" RightMargin="2.7089" TopMargin="74.0000" BottomMargin="20.0000" ctype="SpriteObjectData">
            <Size X="430.0000" Y="656.0000" />
            <Children>
              <AbstractNodeData Name="chat_common_region" ActionTag="1371106292" Tag="50" IconVisible="False" LeftMargin="15.0000" RightMargin="15.0000" TopMargin="88.0000" BottomMargin="18.0000" TouchEnable="True" ClipAble="False" BackColorAlpha="0" ComboBoxIndex="1" ColorAngle="90.0000" Scale9Width="1" Scale9Height="1" ctype="PanelObjectData">
                <Size X="400.0000" Y="550.0000" />
                <Children>
                  <AbstractNodeData Name="common_chat_bg" Visible="False" ActionTag="1687085194" VisibleForFrame="False" Tag="4" IconVisible="False" LeftMargin="-1.5282" RightMargin="-193.4718" TopMargin="301.4147" BottomMargin="-3.4147" ctype="SpriteObjectData">
                    <Size X="595.0000" Y="252.0000" />
                    <AnchorPoint />
                    <Position X="-1.5282" Y="-3.4147" />
                    <Scale ScaleX="0.8225" ScaleY="0.9772" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition X="-0.0038" Y="-0.0062" />
                    <PreSize X="1.4875" Y="0.4582" />
                    <FileData Type="PlistSubImage" Path="chat_his.png" Plist="public/public.plist" />
                    <BlendFunc Src="1" Dst="771" />
                  </AbstractNodeData>
                </Children>
                <AnchorPoint />
                <Position X="15.0000" Y="18.0000" />
                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                <CColor A="255" R="255" G="255" B="255" />
                <PrePosition X="0.0349" Y="0.0274" />
                <PreSize X="0.9302" Y="0.8384" />
                <SingleColor A="255" R="0" G="0" B="0" />
                <FirstColor A="255" R="150" G="200" B="255" />
                <EndColor A="255" R="255" G="255" B="255" />
                <ColorVector ScaleY="1.0000" />
              </AbstractNodeData>
              <AbstractNodeData Name="emoj_region" ActionTag="256655698" Tag="198" IconVisible="False" LeftMargin="15.0000" RightMargin="15.0000" TopMargin="88.0000" BottomMargin="18.0000" TouchEnable="True" ClipAble="False" ColorAngle="90.0000" Scale9Width="1" Scale9Height="1" ctype="PanelObjectData">
                <Size X="400.0000" Y="550.0000" />
                <Children>
                  <AbstractNodeData Name="emoj_bg" ActionTag="528795519" VisibleForFrame="False" Tag="199" IconVisible="False" LeftMargin="-1.5282" RightMargin="-193.4718" TopMargin="301.4147" BottomMargin="-3.4147" ctype="SpriteObjectData">
                    <Size X="595.0000" Y="252.0000" />
                    <AnchorPoint />
                    <Position X="-1.5282" Y="-3.4147" />
                    <Scale ScaleX="0.8225" ScaleY="1.2150" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition X="-0.0038" Y="-0.0062" />
                    <PreSize X="1.4875" Y="0.4582" />
                    <FileData Type="PlistSubImage" Path="chat_his.png" Plist="public/public.plist" />
                    <BlendFunc Src="1" Dst="771" />
                  </AbstractNodeData>
                </Children>
                <AnchorPoint />
                <Position X="15.0000" Y="18.0000" />
                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                <CColor A="255" R="255" G="255" B="255" />
                <PrePosition X="0.0349" Y="0.0274" />
                <PreSize X="0.9302" Y="0.8384" />
                <SingleColor A="255" R="0" G="0" B="0" />
                <FirstColor A="255" R="150" G="200" B="255" />
                <EndColor A="255" R="255" G="255" B="255" />
                <ColorVector ScaleY="1.0000" />
              </AbstractNodeData>
              <AbstractNodeData Name="edit_send_layer" ActionTag="-1973092508" VisibleForFrame="False" Tag="200" IconVisible="True" RightMargin="430.0000" TopMargin="656.0000" ctype="SingleNodeObjectData">
                <Size X="0.0000" Y="0.0000" />
                <Children>
                  <AbstractNodeData Name="edit_frame" ActionTag="-1713428463" Tag="10" IconVisible="False" LeftMargin="42.0984" RightMargin="-453.0984" TopMargin="-94.0747" BottomMargin="35.0747" ctype="SpriteObjectData">
                    <Size X="411.0000" Y="59.0000" />
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position X="247.5984" Y="64.5747" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition />
                    <PreSize X="0.0000" Y="0.0000" />
                    <FileData Type="PlistSubImage" Path="chag_frame.png" Plist="public/public.plist" />
                    <BlendFunc Src="1" Dst="771" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="btn_send" ActionTag="-1524604112" Tag="11" IconVisible="False" LeftMargin="473.9000" RightMargin="-628.9000" TopMargin="-90.6471" BottomMargin="33.6471" TouchEnable="True" FontSize="14" Scale9Enable="True" LeftEage="8" RightEage="8" TopEage="7" BottomEage="7" Scale9OriginX="8" Scale9OriginY="7" Scale9Width="139" Scale9Height="43" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="ButtonObjectData">
                    <Size X="155.0000" Y="57.0000" />
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position X="551.4000" Y="62.1471" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition />
                    <PreSize X="0.0000" Y="0.0000" />
                    <TextColor A="255" R="65" G="65" B="70" />
                    <DisabledFileData Type="PlistSubImage" Path="chat_send_1.png" Plist="public/public.plist" />
                    <PressedFileData Type="PlistSubImage" Path="chat_send_1.png" Plist="public/public.plist" />
                    <NormalFileData Type="PlistSubImage" Path="chat_send_1.png" Plist="public/public.plist" />
                    <OutlineColor A="255" R="255" G="0" B="0" />
                    <ShadowColor A="255" R="110" G="110" B="110" />
                  </AbstractNodeData>
                </Children>
                <AnchorPoint />
                <Position />
                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                <CColor A="255" R="255" G="255" B="255" />
                <PrePosition />
                <PreSize X="0.0000" Y="0.0000" />
              </AbstractNodeData>
              <AbstractNodeData Name="sp_select" ActionTag="436639354" Tag="135" IconVisible="False" LeftMargin="217.0000" RightMargin="15.0000" TopMargin="18.4999" BottomMargin="576.5001" ctype="SpriteObjectData">
                <Size X="198.0000" Y="61.0000" />
                <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                <Position X="316.0000" Y="607.0001" />
                <Scale ScaleX="-1.0000" ScaleY="1.0000" />
                <CColor A="255" R="255" G="255" B="255" />
                <PrePosition X="0.7349" Y="0.9253" />
                <PreSize X="0.4605" Y="0.0930" />
                <FileData Type="Normal" Path="public/public_chatSelect.png" Plist="" />
                <BlendFunc Src="1" Dst="771" />
              </AbstractNodeData>
              <AbstractNodeData Name="text_check" ActionTag="1146070618" Tag="133" IconVisible="False" LeftMargin="16.0000" RightMargin="214.0000" TopMargin="18.5000" BottomMargin="576.5000" TouchEnable="True" FontSize="14" Scale9Enable="True" LeftEage="15" RightEage="15" TopEage="11" BottomEage="11" Scale9OriginX="15" Scale9OriginY="11" Scale9Width="170" Scale9Height="39" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="ButtonObjectData">
                <Size X="200.0000" Y="61.0000" />
                <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                <Position X="116.0000" Y="607.0000" />
                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                <CColor A="255" R="255" G="255" B="255" />
                <PrePosition X="0.2698" Y="0.9253" />
                <PreSize X="0.4651" Y="0.0930" />
                <TextColor A="255" R="65" G="65" B="70" />
                <DisabledFileData Type="Normal" Path="public/public_chatTxt.png" Plist="" />
                <PressedFileData Type="Normal" Path="public/public_chatTxt.png" Plist="" />
                <NormalFileData Type="Normal" Path="public/public_chatTxt.png" Plist="" />
                <OutlineColor A="255" R="255" G="0" B="0" />
                <ShadowColor A="255" R="110" G="110" B="110" />
              </AbstractNodeData>
              <AbstractNodeData Name="emoj_check" ActionTag="1551650552" Tag="134" IconVisible="False" LeftMargin="216.0000" RightMargin="14.0000" TopMargin="18.5000" BottomMargin="576.5000" TouchEnable="True" FontSize="14" Scale9Enable="True" LeftEage="15" RightEage="15" TopEage="11" BottomEage="11" Scale9OriginX="15" Scale9OriginY="11" Scale9Width="170" Scale9Height="39" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="ButtonObjectData">
                <Size X="200.0000" Y="61.0000" />
                <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                <Position X="316.0000" Y="607.0000" />
                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                <CColor A="255" R="255" G="255" B="255" />
                <PrePosition X="0.7349" Y="0.9253" />
                <PreSize X="0.4651" Y="0.0930" />
                <TextColor A="255" R="65" G="65" B="70" />
                <DisabledFileData Type="Normal" Path="public/public_chatEmoj.png" Plist="" />
                <PressedFileData Type="Normal" Path="public/public_chatEmoj.png" Plist="" />
                <NormalFileData Type="Normal" Path="public/public_chatEmoj.png" Plist="" />
                <OutlineColor A="255" R="255" G="0" B="0" />
                <ShadowColor A="255" R="110" G="110" B="110" />
              </AbstractNodeData>
            </Children>
            <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
            <Position X="1116.2911" Y="348.0000" />
            <Scale ScaleX="1.0000" ScaleY="1.0000" />
            <CColor A="255" R="255" G="255" B="255" />
            <PrePosition X="0.8368" Y="0.4640" />
            <PreSize X="0.3223" Y="0.8747" />
            <FileData Type="Normal" Path="public/public_chatBg.png" Plist="" />
            <BlendFunc Src="1" Dst="771" />
          </AbstractNodeData>
        </Children>
      </ObjectData>
    </Content>
  </Content>
</GameFile>