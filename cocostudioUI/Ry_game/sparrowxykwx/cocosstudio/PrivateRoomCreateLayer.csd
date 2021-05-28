<GameFile>
  <PropertyGroup Name="PrivateRoomCreateLayer" Type="Layer" ID="95e24c84-2c0a-4a22-b662-aa81936c4596" Version="3.10.0.0" />
  <Content ctype="GameProjectContent">
    <Content>
      <Animation Duration="0" Speed="1.0000" />
      <ObjectData Name="Layer" Tag="86" ctype="GameLayerObjectData">
        <Size X="1334.0000" Y="750.0000" />
        <Children>
          <AbstractNodeData Name="panel_mask" CanEdit="False" ActionTag="539361401" Tag="33" IconVisible="False" PercentWidthEnable="True" PercentHeightEnable="True" PercentWidthEnabled="True" PercentHeightEnabled="True" TouchEnable="True" ClipAble="False" BackColorAlpha="153" ComboBoxIndex="1" ColorAngle="90.0000" Scale9Width="1" Scale9Height="1" ctype="PanelObjectData">
            <Size X="1334.0000" Y="750.0000" />
            <AnchorPoint />
            <Position />
            <Scale ScaleX="1.0000" ScaleY="1.0000" />
            <CColor A="255" R="255" G="255" B="255" />
            <PrePosition />
            <PreSize X="1.0000" Y="1.0000" />
            <SingleColor A="255" R="0" G="0" B="0" />
            <FirstColor A="255" R="150" G="200" B="255" />
            <EndColor A="255" R="255" G="255" B="255" />
            <ColorVector ScaleY="1.0000" />
          </AbstractNodeData>
          <AbstractNodeData Name="sp_bg" ActionTag="-431009998" Tag="32" IconVisible="False" PositionPercentXEnabled="True" PositionPercentYEnabled="True" TopMargin="-1.1250" BottomMargin="1.1250" TouchEnable="True" Scale9Enable="True" LeftEage="319" RightEage="319" TopEage="171" BottomEage="171" Scale9OriginX="319" Scale9OriginY="171" Scale9Width="696" Scale9Height="408" ctype="ImageViewObjectData">
            <Size X="1334.0000" Y="750.0000" />
            <Children>
              <AbstractNodeData Name="Image_1" ActionTag="-2044432519" Tag="104" IconVisible="False" LeftMargin="101.0000" RightMargin="133.0000" TopMargin="138.0000" BottomMargin="132.0000" Scale9Enable="True" LeftEage="26" RightEage="26" TopEage="27" BottomEage="27" Scale9OriginX="26" Scale9OriginY="27" Scale9Width="28" Scale9Height="28" ctype="ImageViewObjectData">
                <Size X="1100.0000" Y="480.0000" />
                <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                <Position X="651.0000" Y="372.0000" />
                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                <CColor A="255" R="255" G="255" B="255" />
                <PrePosition X="0.4880" Y="0.4960" />
                <PreSize X="0.8246" Y="0.6400" />
                <FileData Type="Normal" Path="create_room/pri_sp_bgBox.png" Plist="" />
              </AbstractNodeData>
              <AbstractNodeData Name="Sprite_11" ActionTag="-1958048373" Tag="107" IconVisible="False" LeftMargin="2.0740" RightMargin="1168.9260" TopMargin="-0.6262" BottomMargin="650.6262" ctype="SpriteObjectData">
                <Size X="163.0000" Y="100.0000" />
                <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                <Position X="83.5740" Y="700.6262" />
                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                <CColor A="255" R="255" G="255" B="255" />
                <PrePosition X="0.0626" Y="0.9342" />
                <PreSize X="0.1222" Y="0.1333" />
                <FileData Type="Normal" Path="create_room/pri_sp_backbtn_bg.png" Plist="" />
                <BlendFunc Src="1" Dst="771" />
              </AbstractNodeData>
              <AbstractNodeData Name="ckBox_score" ActionTag="-477488685" VisibleForFrame="False" Tag="107" IconVisible="False" LeftMargin="1201.7537" RightMargin="72.2463" TopMargin="154.9266" BottomMargin="390.0734" TouchEnable="True" CheckedState="True" ctype="CheckBoxObjectData">
                <Size X="60.0000" Y="205.0000" />
                <Children>
                  <AbstractNodeData Name="Text_1" ActionTag="-1290331161" Tag="109" IconVisible="False" LeftMargin="18.0000" RightMargin="18.0000" TopMargin="55.0000" BottomMargin="54.0000" FontSize="24" LabelText="金&#xA;币&#xA;约&#xA;战" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                    <Size X="24.0000" Y="96.0000" />
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position X="30.0000" Y="102.0000" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition X="0.5000" Y="0.4976" />
                    <PreSize X="0.4000" Y="0.4683" />
                    <OutlineColor A="255" R="255" G="0" B="0" />
                    <ShadowColor A="255" R="110" G="110" B="110" />
                  </AbstractNodeData>
                </Children>
                <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                <Position X="1231.7537" Y="492.5734" />
                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                <CColor A="255" R="255" G="255" B="255" />
                <PrePosition X="0.9234" Y="0.6568" />
                <PreSize X="0.0450" Y="0.2733" />
                <NormalBackFileData Type="Normal" Path="create_room/pri_btn_gold.png" Plist="" />
                <PressedBackFileData Type="Normal" Path="create_room/pri_btn_gold.png" Plist="" />
                <DisableBackFileData Type="Normal" Path="create_room/pri_btn_gold.png" Plist="" />
                <NodeNormalFileData Type="Normal" Path="create_room/pri_btn_score.png" Plist="" />
                <NodeDisableFileData Type="Normal" Path="create_room/pri_btn_score.png" Plist="" />
              </AbstractNodeData>
              <AbstractNodeData Name="ckBox_gold" ActionTag="-800078104" VisibleForFrame="False" Tag="110" IconVisible="False" LeftMargin="1203.7009" RightMargin="70.2991" TopMargin="360.7585" BottomMargin="184.2415" TouchEnable="True" ctype="CheckBoxObjectData">
                <Size X="60.0000" Y="205.0000" />
                <Children>
                  <AbstractNodeData Name="Text_1" ActionTag="-1996484947" Tag="111" IconVisible="False" LeftMargin="18.0000" RightMargin="18.0000" TopMargin="55.0000" BottomMargin="54.0000" FontSize="24" LabelText="积&#xA;分&#xA;约&#xA;战" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                    <Size X="24.0000" Y="96.0000" />
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position X="30.0000" Y="102.0000" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition X="0.5000" Y="0.4976" />
                    <PreSize X="0.4000" Y="0.4683" />
                    <OutlineColor A="255" R="255" G="0" B="0" />
                    <ShadowColor A="255" R="110" G="110" B="110" />
                  </AbstractNodeData>
                </Children>
                <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                <Position X="1233.7009" Y="286.7415" />
                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                <CColor A="255" R="255" G="255" B="255" />
                <PrePosition X="0.9248" Y="0.3823" />
                <PreSize X="0.0450" Y="0.2733" />
                <NormalBackFileData Type="Normal" Path="create_room/pri_btn_gold.png" Plist="" />
                <PressedBackFileData Type="Normal" Path="create_room/pri_btn_gold.png" Plist="" />
                <DisableBackFileData Type="Normal" Path="create_room/pri_btn_gold.png" Plist="" />
                <NodeNormalFileData Type="Normal" Path="create_room/pri_btn_score.png" Plist="" />
                <NodeDisableFileData Type="Normal" Path="create_room/pri_btn_score.png" Plist="" />
              </AbstractNodeData>
            </Children>
            <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
            <Position X="667.0000" Y="376.1250" />
            <Scale ScaleX="1.0000" ScaleY="1.0000" />
            <CColor A="255" R="255" G="255" B="255" />
            <PrePosition X="0.5000" Y="0.5015" />
            <PreSize X="1.0000" Y="1.0000" />
            <FileData Type="Normal" Path="create_room/public_background_4.png" Plist="" />
          </AbstractNodeData>
          <AbstractNodeData Name="Sprite_4" ActionTag="1758230137" Tag="211" IconVisible="False" LeftMargin="8.9744" RightMargin="-8.9744" TopMargin="-1.0256" BottomMargin="1.0256" ctype="SpriteObjectData">
            <Size X="1334.0000" Y="750.0000" />
            <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
            <Position X="675.9744" Y="376.0256" />
            <Scale ScaleX="1.0000" ScaleY="1.0000" />
            <CColor A="255" R="255" G="255" B="255" />
            <PrePosition X="0.5067" Y="0.5014" />
            <PreSize X="1.0000" Y="1.0000" />
            <FileData Type="Normal" Path="create_room/pri_sp_topbg.png" Plist="" />
            <BlendFunc Src="1" Dst="771" />
          </AbstractNodeData>
          <AbstractNodeData Name="Sprite_9" ActionTag="-1529096197" Tag="216" IconVisible="False" LeftMargin="557.7119" RightMargin="551.2881" TopMargin="38.7481" BottomMargin="648.2519" ctype="SpriteObjectData">
            <Size X="225.0000" Y="63.0000" />
            <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
            <Position X="670.2119" Y="679.7519" />
            <Scale ScaleX="1.0000" ScaleY="1.0000" />
            <CColor A="255" R="255" G="255" B="255" />
            <PrePosition X="0.5024" Y="0.9063" />
            <PreSize X="0.1687" Y="0.0840" />
            <FileData Type="Normal" Path="create_room/kawuxing.png" Plist="" />
            <BlendFunc Src="1" Dst="771" />
          </AbstractNodeData>
          <AbstractNodeData Name="btn_close" ActionTag="-125534772" Tag="88" IconVisible="False" LeftMargin="15.1753" RightMargin="1245.8247" TopMargin="9.1805" BottomMargin="675.8195" TouchEnable="True" FontSize="14" Scale9Enable="True" LeftEage="15" RightEage="15" TopEage="11" BottomEage="11" Scale9OriginX="15" Scale9OriginY="11" Scale9Width="43" Scale9Height="43" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="ButtonObjectData">
            <Size X="73.0000" Y="65.0000" />
            <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
            <Position X="51.6753" Y="708.3195" />
            <Scale ScaleX="1.0000" ScaleY="1.0000" />
            <CColor A="255" R="255" G="255" B="255" />
            <PrePosition X="0.0387" Y="0.9444" />
            <PreSize X="0.0547" Y="0.0867" />
            <TextColor A="255" R="65" G="65" B="70" />
            <DisabledFileData Type="Normal" Path="create_room/public_btn_back_0.png" Plist="" />
            <PressedFileData Type="Normal" Path="create_room/public_btn_back_0.png" Plist="" />
            <NormalFileData Type="Normal" Path="create_room/public_btn_back_1.png" Plist="" />
            <OutlineColor A="255" R="255" G="0" B="0" />
            <ShadowColor A="255" R="110" G="110" B="110" />
          </AbstractNodeData>
          <AbstractNodeData Name="Node_score" ActionTag="-2124291549" Tag="119" IconVisible="True" RightMargin="1334.0000" TopMargin="750.0000" ctype="SingleNodeObjectData">
            <Size X="0.0000" Y="0.0000" />
            <Children>
              <AbstractNodeData Name="Sprite_3" ActionTag="381280326" Tag="118" IconVisible="False" LeftMargin="878.7078" RightMargin="-956.7078" TopMargin="-315.7849" BottomMargin="237.7849" ctype="SpriteObjectData">
                <Size X="78.0000" Y="78.0000" />
                <AnchorPoint ScaleX="0.4649" ScaleY="0.5701" />
                <Position X="914.9700" Y="282.2527" />
                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                <CColor A="255" R="255" G="255" B="255" />
                <PrePosition />
                <PreSize X="0.0000" Y="0.0000" />
                <FileData Type="Normal" Path="create_room/sparrowgd_prisp_diamond.png" Plist="" />
                <BlendFunc Src="1" Dst="771" />
              </AbstractNodeData>
              <AbstractNodeData Name="Text_0" ActionTag="1144273691" Tag="122" IconVisible="False" LeftMargin="823.4811" RightMargin="-884.4811" TopMargin="-293.2989" BottomMargin="264.2989" FontSize="26" LabelText="消耗:" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                <Size X="61.0000" Y="29.0000" />
                <AnchorPoint ScaleY="0.5000" />
                <Position X="823.4811" Y="278.7989" />
                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                <CColor A="255" R="255" G="255" B="255" />
                <PrePosition />
                <PreSize X="0.0000" Y="0.0000" />
                <FontResource Type="Normal" Path="fonts/FZHTJW.TTF" Plist="" />
                <OutlineColor A="255" R="255" G="0" B="0" />
                <ShadowColor A="255" R="110" G="110" B="110" />
              </AbstractNodeData>
              <AbstractNodeData Name="Text_diamond" ActionTag="-834431181" Tag="123" IconVisible="False" LeftMargin="941.0114" RightMargin="-967.0114" TopMargin="-295.6871" BottomMargin="262.6871" FontSize="28" LabelText="x1" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                <Size X="26.0000" Y="33.0000" />
                <AnchorPoint ScaleY="0.5000" />
                <Position X="941.0114" Y="279.1871" />
                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                <CColor A="255" R="255" G="255" B="255" />
                <PrePosition />
                <PreSize X="0.0000" Y="0.0000" />
                <FontResource Type="Normal" Path="fonts/round_body.ttf" Plist="" />
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
          <AbstractNodeData Name="node_normal" ActionTag="603664320" Tag="182" IconVisible="True" LeftMargin="101.6944" RightMargin="1232.3057" TopMargin="612.4727" BottomMargin="137.5273" ctype="SingleNodeObjectData">
            <Size X="0.0000" Y="0.0000" />
            <Children>
              <AbstractNodeData Name="line_3" ActionTag="1276015953" Tag="191" IconVisible="False" LeftMargin="25.2684" RightMargin="-47.2684" TopMargin="-284.5422" BottomMargin="262.5422" ctype="SpriteObjectData">
                <Size X="22.0000" Y="22.0000" />
                <Children>
                  <AbstractNodeData Name="Text_2" ActionTag="57204158" Tag="192" IconVisible="False" LeftMargin="30.7593" RightMargin="-123.7593" TopMargin="-5.3788" BottomMargin="-5.6212" FontSize="28" LabelText="买马选择" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                    <Size X="115.0000" Y="33.0000" />
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position X="88.2593" Y="10.8788" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition X="4.0118" Y="0.4945" />
                    <PreSize X="5.2273" Y="1.5000" />
                    <FontResource Type="Normal" Path="fonts/round_body.ttf" Plist="" />
                    <OutlineColor A="255" R="255" G="0" B="0" />
                    <ShadowColor A="255" R="110" G="110" B="110" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="CheckBox_1" ActionTag="1567453196" Tag="197" IconVisible="False" LeftMargin="162.3972" RightMargin="-332.3972" TopMargin="-19.0691" BottomMargin="-14.9309" TouchEnable="True" ctype="CheckBoxObjectData">
                    <Size X="192.0000" Y="56.0000" />
                    <Children>
                      <AbstractNodeData Name="Text" ActionTag="2006559583" Tag="198" IconVisible="False" LeftMargin="51.8577" RightMargin="35.1423" TopMargin="16.2592" BottomMargin="10.7408" FontSize="26" LabelText="自摸买马" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                        <Size X="105.0000" Y="29.0000" />
                        <AnchorPoint ScaleY="0.5000" />
                        <Position X="51.8577" Y="25.2408" />
                        <Scale ScaleX="1.0000" ScaleY="1.0000" />
                        <CColor A="255" R="255" G="255" B="255" />
                        <PrePosition X="0.2701" Y="0.4507" />
                        <PreSize X="0.5469" Y="0.5179" />
                        <FontResource Type="Normal" Path="fonts/FZHTJW.TTF" Plist="" />
                        <OutlineColor A="255" R="255" G="0" B="0" />
                        <ShadowColor A="255" R="110" G="110" B="110" />
                      </AbstractNodeData>
                    </Children>
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position X="258.3972" Y="13.0691" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition X="11.7453" Y="0.5940" />
                    <PreSize X="8.7273" Y="2.5455" />
                    <NormalBackFileData Type="Normal" Path="create_room/pri_check_sel_1_0.png" Plist="" />
                    <PressedBackFileData Type="Normal" Path="create_room/pri_check_sel_1_0.png" Plist="" />
                    <DisableBackFileData Type="Normal" Path="create_room/pri_check_sel_1_0.png" Plist="" />
                    <NodeNormalFileData Type="Normal" Path="create_room/pri_check_sel_1_1.png" Plist="" />
                    <NodeDisableFileData Type="Normal" Path="create_room/pri_check_sel_1_1.png" Plist="" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="CheckBox_2" ActionTag="337092071" Tag="199" IconVisible="False" LeftMargin="376.6206" RightMargin="-546.6206" TopMargin="-19.0691" BottomMargin="-14.9309" TouchEnable="True" ctype="CheckBoxObjectData">
                    <Size X="192.0000" Y="56.0000" />
                    <Children>
                      <AbstractNodeData Name="Text" ActionTag="1649841415" Tag="200" IconVisible="False" LeftMargin="54.0434" RightMargin="-19.0434" TopMargin="13.6836" BottomMargin="13.3164" FontSize="26" LabelText="亮倒自摸买马" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                        <Size X="157.0000" Y="29.0000" />
                        <AnchorPoint ScaleY="0.5000" />
                        <Position X="54.0434" Y="27.8164" />
                        <Scale ScaleX="1.0000" ScaleY="1.0000" />
                        <CColor A="255" R="255" G="255" B="255" />
                        <PrePosition X="0.2815" Y="0.4967" />
                        <PreSize X="0.8177" Y="0.5179" />
                        <FontResource Type="Normal" Path="fonts/FZHTJW.TTF" Plist="" />
                        <OutlineColor A="255" R="255" G="0" B="0" />
                        <ShadowColor A="255" R="110" G="110" B="110" />
                      </AbstractNodeData>
                    </Children>
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position X="472.6206" Y="13.0691" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition X="21.4828" Y="0.5940" />
                    <PreSize X="8.7273" Y="2.5455" />
                    <NormalBackFileData Type="Normal" Path="create_room/pri_check_sel_1_0.png" Plist="" />
                    <PressedBackFileData Type="Normal" Path="create_room/pri_check_sel_1_0.png" Plist="" />
                    <DisableBackFileData Type="Normal" Path="create_room/pri_check_sel_1_0.png" Plist="" />
                    <NodeNormalFileData Type="Normal" Path="create_room/pri_check_sel_1_1.png" Plist="" />
                    <NodeDisableFileData Type="Normal" Path="create_room/pri_check_sel_1_1.png" Plist="" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="CheckBox_3" ActionTag="-619294025" Tag="124" IconVisible="False" LeftMargin="590.8441" RightMargin="-760.8441" TopMargin="-19.0691" BottomMargin="-14.9309" TouchEnable="True" ctype="CheckBoxObjectData">
                    <Size X="192.0000" Y="56.0000" />
                    <Children>
                      <AbstractNodeData Name="Text" ActionTag="584327567" Tag="125" IconVisible="False" LeftMargin="57.8674" RightMargin="55.1326" TopMargin="12.7945" BottomMargin="14.2055" FontSize="26" LabelText="不买马" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                        <Size X="79.0000" Y="29.0000" />
                        <AnchorPoint ScaleY="0.5000" />
                        <Position X="57.8674" Y="28.7055" />
                        <Scale ScaleX="1.0000" ScaleY="1.0000" />
                        <CColor A="255" R="255" G="255" B="255" />
                        <PrePosition X="0.3014" Y="0.5126" />
                        <PreSize X="0.4115" Y="0.5179" />
                        <FontResource Type="Normal" Path="fonts/FZHTJW.TTF" Plist="" />
                        <OutlineColor A="255" R="255" G="0" B="0" />
                        <ShadowColor A="255" R="110" G="110" B="110" />
                      </AbstractNodeData>
                    </Children>
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position X="686.8441" Y="13.0691" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition X="31.2202" Y="0.5940" />
                    <PreSize X="8.7273" Y="2.5455" />
                    <NormalBackFileData Type="Normal" Path="create_room/pri_check_sel_1_0.png" Plist="" />
                    <PressedBackFileData Type="Normal" Path="create_room/pri_check_sel_1_0.png" Plist="" />
                    <DisableBackFileData Type="Normal" Path="create_room/pri_check_sel_1_0.png" Plist="" />
                    <NodeNormalFileData Type="Normal" Path="create_room/pri_check_sel_1_1.png" Plist="" />
                    <NodeDisableFileData Type="Normal" Path="create_room/pri_check_sel_1_1.png" Plist="" />
                  </AbstractNodeData>
                </Children>
                <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                <Position X="36.2684" Y="273.5422" />
                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                <CColor A="255" R="255" G="255" B="255" />
                <PrePosition />
                <PreSize X="0.0000" Y="0.0000" />
                <FileData Type="Normal" Path="create_room/pri_sp_flag.png" Plist="" />
                <BlendFunc Src="1" Dst="771" />
              </AbstractNodeData>
              <AbstractNodeData Name="node_ma_display" ActionTag="1618857306" VisibleForFrame="False" Tag="285" IconVisible="True" LeftMargin="201.1781" RightMargin="-201.1781" TopMargin="-220.7328" BottomMargin="220.7328" ctype="SingleNodeObjectData">
                <Size X="0.0000" Y="0.0000" />
                <Children>
                  <AbstractNodeData Name="CheckBox_1" ActionTag="-1684212186" Tag="283" IconVisible="False" LeftMargin="-12.0083" RightMargin="-179.9917" TopMargin="-27.2457" BottomMargin="-28.7543" TouchEnable="True" ctype="CheckBoxObjectData">
                    <Size X="192.0000" Y="56.0000" />
                    <Children>
                      <AbstractNodeData Name="Text" ActionTag="396396601" Tag="284" IconVisible="False" LeftMargin="54.3463" RightMargin="70.6537" TopMargin="13.6566" BottomMargin="13.3434" FontSize="26" LabelText="买1马" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                        <Size X="67.0000" Y="29.0000" />
                        <AnchorPoint ScaleY="0.5000" />
                        <Position X="54.3463" Y="27.8434" />
                        <Scale ScaleX="1.0000" ScaleY="1.0000" />
                        <CColor A="255" R="255" G="255" B="255" />
                        <PrePosition X="0.2831" Y="0.4972" />
                        <PreSize X="0.3490" Y="0.5179" />
                        <FontResource Type="Normal" Path="fonts/FZHTJW.TTF" Plist="" />
                        <OutlineColor A="255" R="255" G="0" B="0" />
                        <ShadowColor A="255" R="110" G="110" B="110" />
                      </AbstractNodeData>
                    </Children>
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position X="83.9917" Y="-0.7543" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition />
                    <PreSize X="0.0000" Y="0.0000" />
                    <NormalBackFileData Type="Normal" Path="create_room/pri_check_sel_1_0.png" Plist="" />
                    <PressedBackFileData Type="Normal" Path="create_room/pri_check_sel_1_0.png" Plist="" />
                    <DisableBackFileData Type="Normal" Path="create_room/pri_check_sel_1_0.png" Plist="" />
                    <NodeNormalFileData Type="Normal" Path="create_room/pri_check_sel_1_1.png" Plist="" />
                    <NodeDisableFileData Type="Normal" Path="create_room/pri_check_sel_1_1.png" Plist="" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="CheckBox_2" ActionTag="1545586792" Tag="286" IconVisible="False" LeftMargin="201.1563" RightMargin="-393.1563" TopMargin="-27.2456" BottomMargin="-28.7544" TouchEnable="True" ctype="CheckBoxObjectData">
                    <Size X="192.0000" Y="56.0000" />
                    <Children>
                      <AbstractNodeData Name="Text" ActionTag="816849005" Tag="287" IconVisible="False" LeftMargin="55.2837" RightMargin="69.7163" TopMargin="11.7815" BottomMargin="15.2185" FontSize="26" LabelText="买6马" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                        <Size X="67.0000" Y="29.0000" />
                        <AnchorPoint ScaleY="0.5000" />
                        <Position X="55.2837" Y="29.7185" />
                        <Scale ScaleX="1.0000" ScaleY="1.0000" />
                        <CColor A="255" R="255" G="255" B="255" />
                        <PrePosition X="0.2879" Y="0.5307" />
                        <PreSize X="0.3490" Y="0.5179" />
                        <FontResource Type="Normal" Path="fonts/FZHTJW.TTF" Plist="" />
                        <OutlineColor A="255" R="255" G="0" B="0" />
                        <ShadowColor A="255" R="110" G="110" B="110" />
                      </AbstractNodeData>
                    </Children>
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position X="297.1563" Y="-0.7544" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition />
                    <PreSize X="0.0000" Y="0.0000" />
                    <NormalBackFileData Type="Normal" Path="create_room/pri_check_sel_1_0.png" Plist="" />
                    <PressedBackFileData Type="Normal" Path="create_room/pri_check_sel_1_0.png" Plist="" />
                    <DisableBackFileData Type="Normal" Path="create_room/pri_check_sel_1_0.png" Plist="" />
                    <NodeNormalFileData Type="Normal" Path="create_room/pri_check_sel_1_1.png" Plist="" />
                    <NodeDisableFileData Type="Normal" Path="create_room/pri_check_sel_1_1.png" Plist="" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="CheckBox_3" ActionTag="1289477668" Tag="288" IconVisible="False" LeftMargin="416.3214" RightMargin="-608.3214" TopMargin="-27.2457" BottomMargin="-28.7543" TouchEnable="True" ctype="CheckBoxObjectData">
                    <Size X="192.0000" Y="56.0000" />
                    <Children>
                      <AbstractNodeData Name="Text" ActionTag="-1545433807" Tag="289" IconVisible="False" LeftMargin="57.1608" RightMargin="54.8392" TopMargin="13.6566" BottomMargin="13.3434" FontSize="26" LabelText="买1送1" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                        <Size X="80.0000" Y="29.0000" />
                        <AnchorPoint ScaleY="0.5000" />
                        <Position X="57.1608" Y="27.8434" />
                        <Scale ScaleX="1.0000" ScaleY="1.0000" />
                        <CColor A="255" R="255" G="255" B="255" />
                        <PrePosition X="0.2977" Y="0.4972" />
                        <PreSize X="0.4167" Y="0.5179" />
                        <FontResource Type="Normal" Path="fonts/FZHTJW.TTF" Plist="" />
                        <OutlineColor A="255" R="255" G="0" B="0" />
                        <ShadowColor A="255" R="110" G="110" B="110" />
                      </AbstractNodeData>
                    </Children>
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position X="512.3214" Y="-0.7543" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition />
                    <PreSize X="0.0000" Y="0.0000" />
                    <NormalBackFileData Type="Normal" Path="create_room/pri_check_sel_1_0.png" Plist="" />
                    <PressedBackFileData Type="Normal" Path="create_room/pri_check_sel_1_0.png" Plist="" />
                    <DisableBackFileData Type="Normal" Path="create_room/pri_check_sel_1_0.png" Plist="" />
                    <NodeNormalFileData Type="Normal" Path="create_room/pri_check_sel_1_1.png" Plist="" />
                    <NodeDisableFileData Type="Normal" Path="create_room/pri_check_sel_1_1.png" Plist="" />
                  </AbstractNodeData>
                </Children>
                <AnchorPoint />
                <Position X="201.1781" Y="220.7328" />
                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                <CColor A="255" R="255" G="255" B="255" />
                <PrePosition />
                <PreSize X="0.0000" Y="0.0000" />
              </AbstractNodeData>
              <AbstractNodeData Name="line_4" ActionTag="848982748" Tag="193" IconVisible="False" LeftMargin="24.7584" RightMargin="-46.7584" TopMargin="-222.7511" BottomMargin="200.7511" ctype="SpriteObjectData">
                <Size X="22.0000" Y="22.0000" />
                <Children>
                  <AbstractNodeData Name="Text_2" ActionTag="-2126787517" Tag="194" IconVisible="False" LeftMargin="31.2593" RightMargin="-123.2593" TopMargin="-5.3788" BottomMargin="-5.6212" FontSize="28" LabelText="密码设置" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                    <Size X="114.0000" Y="33.0000" />
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position X="88.2593" Y="10.8788" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition X="4.0118" Y="0.4945" />
                    <PreSize X="5.1818" Y="1.5000" />
                    <FontResource Type="Normal" Path="fonts/round_body.ttf" Plist="" />
                    <OutlineColor A="255" R="255" G="0" B="0" />
                    <ShadowColor A="255" R="110" G="110" B="110" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="CheckBox_1" ActionTag="-2028275985" Tag="201" IconVisible="False" LeftMargin="162.7908" RightMargin="-332.7908" TopMargin="-15.6710" BottomMargin="-18.3290" TouchEnable="True" ctype="CheckBoxObjectData">
                    <Size X="192.0000" Y="56.0000" />
                    <Children>
                      <AbstractNodeData Name="Text" ActionTag="-102303918" Tag="202" IconVisible="False" LeftMargin="52.0228" RightMargin="33.9772" TopMargin="15.0141" BottomMargin="11.9859" FontSize="26" LabelText="需要密码" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                        <Size X="106.0000" Y="29.0000" />
                        <AnchorPoint ScaleY="0.5000" />
                        <Position X="52.0228" Y="26.4859" />
                        <Scale ScaleX="1.0000" ScaleY="1.0000" />
                        <CColor A="255" R="255" G="255" B="255" />
                        <PrePosition X="0.2710" Y="0.4730" />
                        <PreSize X="0.5521" Y="0.5179" />
                        <FontResource Type="Normal" Path="fonts/FZHTJW.TTF" Plist="" />
                        <OutlineColor A="255" R="255" G="0" B="0" />
                        <ShadowColor A="255" R="110" G="110" B="110" />
                      </AbstractNodeData>
                    </Children>
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position X="258.7908" Y="9.6710" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition X="11.7632" Y="0.4396" />
                    <PreSize X="8.7273" Y="2.5455" />
                    <NormalBackFileData Type="Normal" Path="create_room/pri_check_sel_1_0.png" Plist="" />
                    <PressedBackFileData Type="Normal" Path="create_room/pri_check_sel_1_0.png" Plist="" />
                    <DisableBackFileData Type="Normal" Path="create_room/pri_check_sel_1_0.png" Plist="" />
                    <NodeNormalFileData Type="Normal" Path="create_room/pri_check_sel_1_1.png" Plist="" />
                    <NodeDisableFileData Type="Normal" Path="create_room/pri_check_sel_1_1.png" Plist="" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="CheckBox_2" ActionTag="-726539562" Tag="203" IconVisible="False" LeftMargin="373.9792" RightMargin="-543.9792" TopMargin="-15.6710" BottomMargin="-18.3290" TouchEnable="True" ctype="CheckBoxObjectData">
                    <Size X="192.0000" Y="56.0000" />
                    <Children>
                      <AbstractNodeData Name="Text" ActionTag="-415399475" Tag="204" IconVisible="False" LeftMargin="55.3812" RightMargin="30.6188" TopMargin="16.1336" BottomMargin="10.8664" FontSize="26" LabelText="无需密码" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                        <Size X="106.0000" Y="29.0000" />
                        <AnchorPoint ScaleY="0.5000" />
                        <Position X="55.3812" Y="25.3664" />
                        <Scale ScaleX="1.0000" ScaleY="1.0000" />
                        <CColor A="255" R="255" G="255" B="255" />
                        <PrePosition X="0.2884" Y="0.4530" />
                        <PreSize X="0.5521" Y="0.5179" />
                        <FontResource Type="Normal" Path="fonts/FZHTJW.TTF" Plist="" />
                        <OutlineColor A="255" R="255" G="0" B="0" />
                        <ShadowColor A="255" R="110" G="110" B="110" />
                      </AbstractNodeData>
                    </Children>
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position X="469.9792" Y="9.6710" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition X="21.3627" Y="0.4396" />
                    <PreSize X="8.7273" Y="2.5455" />
                    <NormalBackFileData Type="Normal" Path="create_room/pri_check_sel_1_0.png" Plist="" />
                    <PressedBackFileData Type="Normal" Path="create_room/pri_check_sel_1_0.png" Plist="" />
                    <DisableBackFileData Type="Normal" Path="create_room/pri_check_sel_1_0.png" Plist="" />
                    <NodeNormalFileData Type="Normal" Path="create_room/pri_check_sel_1_1.png" Plist="" />
                    <NodeDisableFileData Type="Normal" Path="create_room/pri_check_sel_1_1.png" Plist="" />
                  </AbstractNodeData>
                </Children>
                <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                <Position X="35.7584" Y="211.7511" />
                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                <CColor A="255" R="255" G="255" B="255" />
                <PrePosition />
                <PreSize X="0.0000" Y="0.0000" />
                <FileData Type="Normal" Path="create_room/pri_sp_flag.png" Plist="" />
                <BlendFunc Src="1" Dst="771" />
              </AbstractNodeData>
              <AbstractNodeData Name="line_5" ActionTag="909038436" Tag="195" IconVisible="False" LeftMargin="24.7912" RightMargin="-46.7912" TopMargin="-161.0303" BottomMargin="139.0303" ctype="SpriteObjectData">
                <Size X="22.0000" Y="22.0000" />
                <Children>
                  <AbstractNodeData Name="Text_2" ActionTag="-963708004" Tag="196" IconVisible="False" LeftMargin="30.7593" RightMargin="-123.7593" TopMargin="-5.3788" BottomMargin="-5.6212" FontSize="28" LabelText="支付方式" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                    <Size X="115.0000" Y="33.0000" />
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position X="88.2593" Y="10.8788" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition X="4.0118" Y="0.4945" />
                    <PreSize X="5.2273" Y="1.5000" />
                    <FontResource Type="Normal" Path="fonts/round_body.ttf" Plist="" />
                    <OutlineColor A="255" R="255" G="0" B="0" />
                    <ShadowColor A="255" R="110" G="110" B="110" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="CheckBox_1" ActionTag="-1210666691" Tag="205" IconVisible="False" LeftMargin="163.0185" RightMargin="-333.0185" TopMargin="-16.6382" BottomMargin="-17.3618" TouchEnable="True" ctype="CheckBoxObjectData">
                    <Size X="192.0000" Y="56.0000" />
                    <Children>
                      <AbstractNodeData Name="Text" ActionTag="1417722780" Tag="206" IconVisible="False" LeftMargin="56.6199" RightMargin="29.3801" TopMargin="17.9857" BottomMargin="9.0143" FontSize="26" LabelText="房主支付" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                        <Size X="106.0000" Y="29.0000" />
                        <AnchorPoint ScaleY="0.5000" />
                        <Position X="56.6199" Y="23.5143" />
                        <Scale ScaleX="1.0000" ScaleY="1.0000" />
                        <CColor A="255" R="255" G="255" B="255" />
                        <PrePosition X="0.2949" Y="0.4199" />
                        <PreSize X="0.5521" Y="0.5179" />
                        <FontResource Type="Normal" Path="fonts/FZHTJW.TTF" Plist="" />
                        <OutlineColor A="255" R="255" G="0" B="0" />
                        <ShadowColor A="255" R="110" G="110" B="110" />
                      </AbstractNodeData>
                    </Children>
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position X="259.0185" Y="10.6382" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition X="11.7736" Y="0.4836" />
                    <PreSize X="8.7273" Y="2.5455" />
                    <NormalBackFileData Type="Normal" Path="create_room/pri_check_sel_1_0.png" Plist="" />
                    <PressedBackFileData Type="Normal" Path="create_room/pri_check_sel_1_0.png" Plist="" />
                    <DisableBackFileData Type="Normal" Path="create_room/pri_check_sel_1_0.png" Plist="" />
                    <NodeNormalFileData Type="Normal" Path="create_room/pri_check_sel_1_1.png" Plist="" />
                    <NodeDisableFileData Type="Normal" Path="create_room/pri_check_sel_1_1.png" Plist="" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="CheckBox_2" ActionTag="-313703667" Tag="207" IconVisible="False" LeftMargin="371.5681" RightMargin="-541.5681" TopMargin="-16.6382" BottomMargin="-17.3618" TouchEnable="True" ctype="CheckBoxObjectData">
                    <Size X="192.0000" Y="56.0000" />
                    <Children>
                      <AbstractNodeData Name="Text" ActionTag="1858924482" Tag="208" IconVisible="False" LeftMargin="60.2104" RightMargin="43.7896" TopMargin="21.5763" BottomMargin="5.4237" FontSize="26" LabelText="AA支付" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                        <Size X="88.0000" Y="29.0000" />
                        <AnchorPoint ScaleY="0.5000" />
                        <Position X="60.2104" Y="19.9237" />
                        <Scale ScaleX="1.0000" ScaleY="1.0000" />
                        <CColor A="255" R="255" G="255" B="255" />
                        <PrePosition X="0.3136" Y="0.3558" />
                        <PreSize X="0.4583" Y="0.5179" />
                        <FontResource Type="Normal" Path="fonts/FZHTJW.TTF" Plist="" />
                        <OutlineColor A="255" R="255" G="0" B="0" />
                        <ShadowColor A="255" R="110" G="110" B="110" />
                      </AbstractNodeData>
                    </Children>
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position X="467.5681" Y="10.6382" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition X="21.2531" Y="0.4836" />
                    <PreSize X="8.7273" Y="2.5455" />
                    <NormalBackFileData Type="Normal" Path="create_room/pri_check_sel_1_0.png" Plist="" />
                    <PressedBackFileData Type="Normal" Path="create_room/pri_check_sel_1_0.png" Plist="" />
                    <DisableBackFileData Type="Normal" Path="create_room/pri_check_sel_1_0.png" Plist="" />
                    <NodeNormalFileData Type="Normal" Path="create_room/pri_check_sel_1_1.png" Plist="" />
                    <NodeDisableFileData Type="Normal" Path="create_room/pri_check_sel_1_1.png" Plist="" />
                  </AbstractNodeData>
                </Children>
                <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                <Position X="35.7912" Y="150.0303" />
                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                <CColor A="255" R="255" G="255" B="255" />
                <PrePosition />
                <PreSize X="0.0000" Y="0.0000" />
                <FileData Type="Normal" Path="create_room/pri_sp_flag.png" Plist="" />
                <BlendFunc Src="1" Dst="771" />
              </AbstractNodeData>
              <AbstractNodeData Name="line_2" ActionTag="-1439635021" Tag="189" IconVisible="False" LeftMargin="25.2684" RightMargin="-47.2684" TopMargin="-359.1224" BottomMargin="337.1224" ctype="SpriteObjectData">
                <Size X="22.0000" Y="22.0000" />
                <Children>
                  <AbstractNodeData Name="Text_2" ActionTag="164618497" Tag="190" IconVisible="False" LeftMargin="31.2593" RightMargin="-123.2593" TopMargin="-6.6464" BottomMargin="-4.3536" FontSize="28" LabelText="定漂配置" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                    <Size X="114.0000" Y="33.0000" />
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position X="88.2593" Y="12.1464" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition X="4.0118" Y="0.5521" />
                    <PreSize X="5.1818" Y="1.5000" />
                    <FontResource Type="Normal" Path="fonts/round_body.ttf" Plist="" />
                    <OutlineColor A="255" R="255" G="0" B="0" />
                    <ShadowColor A="255" R="110" G="110" B="110" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="btn_drop" ActionTag="468225724" Tag="266" IconVisible="False" LeftMargin="147.7811" RightMargin="-331.7811" TopMargin="-21.1464" BottomMargin="-18.8536" TouchEnable="True" FontSize="14" Scale9Enable="True" LeftEage="15" RightEage="15" TopEage="11" BottomEage="11" Scale9OriginX="15" Scale9OriginY="11" Scale9Width="176" Scale9Height="40" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="ButtonObjectData">
                    <Size X="206.0000" Y="62.0000" />
                    <Children>
                      <AbstractNodeData Name="Text" ActionTag="-269334441" Tag="267" IconVisible="False" LeftMargin="47.9304" RightMargin="99.0696" TopMargin="15.0944" BottomMargin="13.9056" FontSize="28" LabelText="不漂" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                        <Size X="59.0000" Y="33.0000" />
                        <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                        <Position X="77.4304" Y="30.4056" />
                        <Scale ScaleX="1.0000" ScaleY="1.0000" />
                        <CColor A="255" R="255" G="255" B="255" />
                        <PrePosition X="0.3759" Y="0.4904" />
                        <PreSize X="0.2864" Y="0.5323" />
                        <FontResource Type="Normal" Path="fonts/round_body.ttf" Plist="" />
                        <OutlineColor A="255" R="255" G="0" B="0" />
                        <ShadowColor A="255" R="110" G="110" B="110" />
                      </AbstractNodeData>
                      <AbstractNodeData Name="Sprite_10" ActionTag="1840899704" Tag="277" IconVisible="False" LeftMargin="148.9819" RightMargin="2.0181" TopMargin="4.4345" BottomMargin="0.5655" ctype="SpriteObjectData">
                        <Size X="55.0000" Y="57.0000" />
                        <AnchorPoint />
                        <Position X="148.9819" Y="0.5655" />
                        <Scale ScaleX="1.0000" ScaleY="1.0000" />
                        <CColor A="255" R="255" G="255" B="255" />
                        <PrePosition X="0.7232" Y="0.0091" />
                        <PreSize X="0.2670" Y="0.9194" />
                        <FileData Type="Normal" Path="create_room/land_pribtn_arrow_down_0.png" Plist="" />
                        <BlendFunc Src="1" Dst="771" />
                      </AbstractNodeData>
                      <AbstractNodeData Name="img_drop" ActionTag="1742855868" Tag="204" IconVisible="False" LeftMargin="-12.2600" RightMargin="-11.7400" TopMargin="49.9664" BottomMargin="-257.9664" Scale9Enable="True" LeftEage="75" RightEage="75" TopEage="53" BottomEage="53" Scale9OriginX="75" Scale9OriginY="53" Scale9Width="80" Scale9Height="55" ctype="ImageViewObjectData">
                        <Size X="230.0000" Y="270.0000" />
                        <Children>
                          <AbstractNodeData Name="btn_round_count_0" ActionTag="-830900584" Tag="205" IconVisible="False" LeftMargin="14.1756" RightMargin="11.8244" TopMargin="28.6079" BottomMargin="173.3921" TouchEnable="True" FontSize="14" LeftEage="15" RightEage="15" TopEage="11" BottomEage="11" Scale9OriginX="15" Scale9OriginY="11" Scale9Width="174" Scale9Height="46" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="ButtonObjectData">
                            <Size X="204.0000" Y="68.0000" />
                            <Children>
                              <AbstractNodeData Name="Text" ActionTag="-406777935" Tag="206" IconVisible="False" LeftMargin="76.1270" RightMargin="68.8730" TopMargin="18.7859" BottomMargin="16.2141" FontSize="28" LabelText="不漂" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                                <Size X="59.0000" Y="33.0000" />
                                <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                                <Position X="105.6270" Y="32.7141" />
                                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                                <CColor A="255" R="255" G="255" B="255" />
                                <PrePosition X="0.5178" Y="0.4811" />
                                <PreSize X="0.2892" Y="0.4853" />
                                <FontResource Type="Normal" Path="fonts/round_body.ttf" Plist="" />
                                <OutlineColor A="255" R="255" G="0" B="0" />
                                <ShadowColor A="255" R="110" G="110" B="110" />
                              </AbstractNodeData>
                            </Children>
                            <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                            <Position X="116.1756" Y="207.3921" />
                            <Scale ScaleX="1.0000" ScaleY="1.0000" />
                            <CColor A="255" R="255" G="255" B="255" />
                            <PrePosition X="0.5051" Y="0.7681" />
                            <PreSize X="0.8870" Y="0.2519" />
                            <TextColor A="255" R="65" G="65" B="70" />
                            <DisabledFileData Type="Normal" Path="create_room/sparrowgd_check_dropdown_sel_0.png" Plist="" />
                            <PressedFileData Type="Normal" Path="create_room/sparrowgd_check_dropdown_sel_0.png" Plist="" />
                            <NormalFileData Type="Normal" Path="create_room/sparrowgd_check_dropdown_sel_0.png" Plist="" />
                            <OutlineColor A="255" R="255" G="0" B="0" />
                            <ShadowColor A="255" R="110" G="110" B="110" />
                          </AbstractNodeData>
                          <AbstractNodeData Name="btn_round_count_1" ActionTag="2065767099" Tag="207" IconVisible="False" LeftMargin="14.1756" RightMargin="11.8244" TopMargin="104.1499" BottomMargin="97.8501" TouchEnable="True" FontSize="14" LeftEage="15" RightEage="15" TopEage="11" BottomEage="11" Scale9OriginX="15" Scale9OriginY="11" Scale9Width="174" Scale9Height="46" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="ButtonObjectData">
                            <Size X="204.0000" Y="68.0000" />
                            <Children>
                              <AbstractNodeData Name="Text" ActionTag="-2013818570" Tag="208" IconVisible="False" LeftMargin="71.1270" RightMargin="63.8730" TopMargin="18.7859" BottomMargin="16.2141" FontSize="28" LabelText="漂1次" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                                <Size X="69.0000" Y="33.0000" />
                                <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                                <Position X="105.6270" Y="32.7141" />
                                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                                <CColor A="255" R="255" G="255" B="255" />
                                <PrePosition X="0.5178" Y="0.4811" />
                                <PreSize X="0.3382" Y="0.4853" />
                                <FontResource Type="Normal" Path="fonts/round_body.ttf" Plist="" />
                                <OutlineColor A="255" R="255" G="0" B="0" />
                                <ShadowColor A="255" R="110" G="110" B="110" />
                              </AbstractNodeData>
                            </Children>
                            <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                            <Position X="116.1756" Y="131.8501" />
                            <Scale ScaleX="1.0000" ScaleY="1.0000" />
                            <CColor A="255" R="255" G="255" B="255" />
                            <PrePosition X="0.5051" Y="0.4883" />
                            <PreSize X="0.8870" Y="0.2519" />
                            <TextColor A="255" R="65" G="65" B="70" />
                            <DisabledFileData Type="Normal" Path="create_room/sparrowgd_check_dropdown_sel_0.png" Plist="" />
                            <PressedFileData Type="Normal" Path="create_room/sparrowgd_check_dropdown_sel_0.png" Plist="" />
                            <NormalFileData Type="Normal" Path="create_room/sparrowgd_check_dropdown_sel_0.png" Plist="" />
                            <OutlineColor A="255" R="255" G="0" B="0" />
                            <ShadowColor A="255" R="110" G="110" B="110" />
                          </AbstractNodeData>
                          <AbstractNodeData Name="btn_round_count_2" ActionTag="373438005" Tag="209" IconVisible="False" LeftMargin="14.1756" RightMargin="11.8244" TopMargin="179.6907" BottomMargin="22.3093" TouchEnable="True" FontSize="14" LeftEage="15" RightEage="15" TopEage="11" BottomEage="11" Scale9OriginX="15" Scale9OriginY="11" Scale9Width="174" Scale9Height="46" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="ButtonObjectData">
                            <Size X="204.0000" Y="68.0000" />
                            <Children>
                              <AbstractNodeData Name="Text" ActionTag="-1726706290" Tag="210" IconVisible="False" LeftMargin="69.1266" RightMargin="19.8734" TopMargin="18.7859" BottomMargin="16.2141" FontSize="28" LabelText="每次要漂" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                                <Size X="115.0000" Y="33.0000" />
                                <AnchorPoint ScaleY="0.5000" />
                                <Position X="69.1266" Y="32.7141" />
                                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                                <CColor A="255" R="255" G="255" B="255" />
                                <PrePosition X="0.3389" Y="0.4811" />
                                <PreSize X="0.5637" Y="0.4853" />
                                <FontResource Type="Normal" Path="fonts/round_body.ttf" Plist="" />
                                <OutlineColor A="255" R="255" G="0" B="0" />
                                <ShadowColor A="255" R="110" G="110" B="110" />
                              </AbstractNodeData>
                            </Children>
                            <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                            <Position X="116.1756" Y="56.3093" />
                            <Scale ScaleX="1.0000" ScaleY="1.0000" />
                            <CColor A="255" R="255" G="255" B="255" />
                            <PrePosition X="0.5051" Y="0.2086" />
                            <PreSize X="0.8870" Y="0.2519" />
                            <TextColor A="255" R="65" G="65" B="70" />
                            <DisabledFileData Type="Normal" Path="create_room/sparrowgd_check_dropdown_sel_0.png" Plist="" />
                            <PressedFileData Type="Normal" Path="create_room/sparrowgd_check_dropdown_sel_0.png" Plist="" />
                            <NormalFileData Type="Normal" Path="create_room/sparrowgd_check_dropdown_sel_0.png" Plist="" />
                            <OutlineColor A="255" R="255" G="0" B="0" />
                            <ShadowColor A="255" R="110" G="110" B="110" />
                          </AbstractNodeData>
                        </Children>
                        <AnchorPoint ScaleX="0.5000" ScaleY="1.0000" />
                        <Position X="102.7400" Y="12.0336" />
                        <Scale ScaleX="1.0000" ScaleY="1.0000" />
                        <CColor A="255" R="255" G="255" B="255" />
                        <PrePosition X="0.4987" Y="0.1941" />
                        <PreSize X="1.1165" Y="4.3548" />
                        <FileData Type="Normal" Path="create_room/land_sp_dropdownbg.png" Plist="" />
                      </AbstractNodeData>
                    </Children>
                    <AnchorPoint ScaleX="0.5000" />
                    <Position X="250.7811" Y="-18.8536" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition X="11.3991" Y="-0.8570" />
                    <PreSize X="9.3636" Y="2.8182" />
                    <TextColor A="255" R="65" G="65" B="70" />
                    <DisabledFileData Type="Normal" Path="create_room/sparrowgd_prisp_dropdown_menu.png" Plist="" />
                    <PressedFileData Type="Normal" Path="create_room/sparrowgd_prisp_dropdown_menu.png" Plist="" />
                    <NormalFileData Type="Normal" Path="create_room/sparrowgd_prisp_dropdown_menu.png" Plist="" />
                    <OutlineColor A="255" R="255" G="0" B="0" />
                    <ShadowColor A="255" R="110" G="110" B="110" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="line_2_2" ActionTag="1377615665" Tag="211" IconVisible="False" LeftMargin="600.4700" RightMargin="-600.4700" TopMargin="-1.1463" BottomMargin="1.1463" ctype="SpriteObjectData">
                    <Size X="22.0000" Y="22.0000" />
                    <Children>
                      <AbstractNodeData Name="Button_28" ActionTag="-544913844" Tag="280" IconVisible="False" LeftMargin="164.1873" RightMargin="-333.1873" TopMargin="-5.2132" BottomMargin="-10.7868" TouchEnable="True" FontSize="14" Scale9Enable="True" LeftEage="15" RightEage="15" TopEage="11" BottomEage="11" Scale9OriginX="15" Scale9OriginY="11" Scale9Width="161" Scale9Height="16" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="ButtonObjectData">
                        <Size X="191.0000" Y="38.0000" />
                        <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                        <Position X="259.6873" Y="8.2132" />
                        <Scale ScaleX="1.0000" ScaleY="1.0000" />
                        <CColor A="255" R="255" G="255" B="255" />
                        <PrePosition X="11.8040" Y="0.3733" />
                        <PreSize X="8.6818" Y="1.7273" />
                        <TextColor A="255" R="65" G="65" B="70" />
                        <DisabledFileData Type="Normal" Path="create_room/sel_bg.png" Plist="" />
                        <PressedFileData Type="Normal" Path="create_room/sel_bg.png" Plist="" />
                        <NormalFileData Type="Normal" Path="create_room/sel_bg.png" Plist="" />
                        <OutlineColor A="255" R="255" G="0" B="0" />
                        <ShadowColor A="255" R="110" G="110" B="110" />
                      </AbstractNodeData>
                      <AbstractNodeData Name="Sprite_1" Visible="False" ActionTag="-2077570111" Tag="282" IconVisible="False" LeftMargin="161.9726" RightMargin="-235.9726" TopMargin="-5.8311" BottomMargin="-10.1689" ctype="SpriteObjectData">
                        <Size X="96.0000" Y="38.0000" />
                        <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                        <Position X="209.9726" Y="8.8311" />
                        <Scale ScaleX="1.0000" ScaleY="1.0000" />
                        <CColor A="255" R="255" G="255" B="255" />
                        <PrePosition X="9.5442" Y="0.4014" />
                        <PreSize X="4.3636" Y="1.7273" />
                        <FileData Type="Normal" Path="create_room/sel.png" Plist="" />
                        <BlendFunc Src="1" Dst="771" />
                      </AbstractNodeData>
                      <AbstractNodeData Name="Sprite_2" ActionTag="1328293292" Tag="281" IconVisible="False" LeftMargin="259.5654" RightMargin="-333.5654" TopMargin="-5.8311" BottomMargin="-10.1689" ctype="SpriteObjectData">
                        <Size X="96.0000" Y="38.0000" />
                        <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                        <Position X="307.5654" Y="8.8311" />
                        <Scale ScaleX="1.0000" ScaleY="1.0000" />
                        <CColor A="255" R="255" G="255" B="255" />
                        <PrePosition X="13.9802" Y="0.4014" />
                        <PreSize X="4.3636" Y="1.7273" />
                        <FileData Type="Normal" Path="create_room/sel.png" Plist="" />
                        <BlendFunc Src="1" Dst="771" />
                      </AbstractNodeData>
                      <AbstractNodeData Name="Text_2" ActionTag="-383289742" Tag="212" IconVisible="False" LeftMargin="30.7593" RightMargin="-123.7593" TopMargin="-5.3788" BottomMargin="-5.6212" FontSize="28" LabelText="游戏玩法" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                        <Size X="115.0000" Y="33.0000" />
                        <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                        <Position X="88.2593" Y="10.8788" />
                        <Scale ScaleX="1.0000" ScaleY="1.0000" />
                        <CColor A="255" R="255" G="255" B="255" />
                        <PrePosition X="4.0118" Y="0.4945" />
                        <PreSize X="5.2273" Y="1.5000" />
                        <FontResource Type="Normal" Path="fonts/round_body.ttf" Plist="" />
                        <OutlineColor A="255" R="255" G="0" B="0" />
                        <ShadowColor A="255" R="110" G="110" B="110" />
                      </AbstractNodeData>
                      <AbstractNodeData Name="Text_2_0" ActionTag="-362398659" Tag="216" IconVisible="False" LeftMargin="165.9881" RightMargin="-230.9881" TopMargin="-4.6792" BottomMargin="-6.3208" FontSize="28" LabelText="全频道" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                        <Size X="87.0000" Y="33.0000" />
                        <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                        <Position X="209.4881" Y="10.1792" />
                        <Scale ScaleX="1.0000" ScaleY="1.0000" />
                        <CColor A="255" R="255" G="255" B="255" />
                        <PrePosition X="9.5222" Y="0.4627" />
                        <PreSize X="3.9545" Y="1.5000" />
                        <FontResource Type="Normal" Path="fonts/round_body.ttf" Plist="" />
                        <OutlineColor A="255" R="255" G="0" B="0" />
                        <ShadowColor A="255" R="110" G="110" B="110" />
                      </AbstractNodeData>
                      <AbstractNodeData Name="Text_2_1" ActionTag="843583923" Tag="217" IconVisible="False" LeftMargin="264.6750" RightMargin="-329.6750" TopMargin="-4.6792" BottomMargin="-6.3208" FontSize="28" LabelText="半频道" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                        <Size X="87.0000" Y="33.0000" />
                        <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                        <Position X="308.1750" Y="10.1792" />
                        <Scale ScaleX="1.0000" ScaleY="1.0000" />
                        <CColor A="255" R="255" G="255" B="255" />
                        <PrePosition X="14.0080" Y="0.4627" />
                        <PreSize X="3.9545" Y="1.5000" />
                        <FontResource Type="Normal" Path="fonts/round_body.ttf" Plist="" />
                        <OutlineColor A="255" R="255" G="0" B="0" />
                        <ShadowColor A="255" R="110" G="110" B="110" />
                      </AbstractNodeData>
                    </Children>
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position X="611.4700" Y="12.1463" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition X="27.7941" Y="0.5521" />
                    <PreSize X="1.0000" Y="1.0000" />
                    <FileData Type="Normal" Path="create_room/pri_sp_flag.png" Plist="" />
                    <BlendFunc Src="1" Dst="771" />
                  </AbstractNodeData>
                </Children>
                <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                <Position X="36.2684" Y="348.1224" />
                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                <CColor A="255" R="255" G="255" B="255" />
                <PrePosition />
                <PreSize X="0.0000" Y="0.0000" />
                <FileData Type="Normal" Path="create_room/pri_sp_flag.png" Plist="" />
                <BlendFunc Src="1" Dst="771" />
              </AbstractNodeData>
              <AbstractNodeData Name="line_1" ActionTag="1894454768" Tag="185" IconVisible="False" LeftMargin="25.2684" RightMargin="-47.2684" TopMargin="-433.7026" BottomMargin="411.7026" ctype="SpriteObjectData">
                <Size X="22.0000" Y="22.0000" />
                <Children>
                  <AbstractNodeData Name="Text_2" ActionTag="-1104515234" Tag="186" IconVisible="False" LeftMargin="30.7593" RightMargin="-123.7593" TopMargin="-8.4023" BottomMargin="-2.5977" FontSize="28" LabelText="游戏人数" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                    <Size X="115.0000" Y="33.0000" />
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position X="88.2593" Y="13.9023" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition X="4.0118" Y="0.6319" />
                    <PreSize X="5.2273" Y="1.5000" />
                    <FontResource Type="Normal" Path="fonts/round_body.ttf" Plist="" />
                    <OutlineColor A="255" R="255" G="0" B="0" />
                    <ShadowColor A="255" R="110" G="110" B="110" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="btn_drop" ActionTag="296353514" Tag="254" IconVisible="False" LeftMargin="147.5065" RightMargin="-331.5065" TopMargin="-22.9023" BottomMargin="-17.0977" TouchEnable="True" FontSize="14" Scale9Enable="True" LeftEage="15" RightEage="15" TopEage="11" BottomEage="11" Scale9OriginX="15" Scale9OriginY="11" Scale9Width="176" Scale9Height="40" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="ButtonObjectData">
                    <Size X="206.0000" Y="62.0000" />
                    <Children>
                      <AbstractNodeData Name="Text" ActionTag="-2107835983" Tag="255" IconVisible="False" LeftMargin="54.6194" RightMargin="104.3806" TopMargin="16.5068" BottomMargin="12.4932" FontSize="28" LabelText="3人" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                        <Size X="47.0000" Y="33.0000" />
                        <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                        <Position X="78.1194" Y="28.9932" />
                        <Scale ScaleX="1.0000" ScaleY="1.0000" />
                        <CColor A="255" R="255" G="255" B="255" />
                        <PrePosition X="0.3792" Y="0.4676" />
                        <PreSize X="0.2282" Y="0.5323" />
                        <FontResource Type="Normal" Path="fonts/round_body.ttf" Plist="" />
                        <OutlineColor A="255" R="255" G="0" B="0" />
                        <ShadowColor A="255" R="110" G="110" B="110" />
                      </AbstractNodeData>
                      <AbstractNodeData Name="Sprite_10" ActionTag="-861415987" Tag="265" IconVisible="False" LeftMargin="149.5871" RightMargin="1.4129" TopMargin="2.9091" BottomMargin="2.0909" ctype="SpriteObjectData">
                        <Size X="55.0000" Y="57.0000" />
                        <AnchorPoint />
                        <Position X="149.5871" Y="2.0909" />
                        <Scale ScaleX="1.0000" ScaleY="1.0000" />
                        <CColor A="255" R="255" G="255" B="255" />
                        <PrePosition X="0.7262" Y="0.0337" />
                        <PreSize X="0.2670" Y="0.9194" />
                        <FileData Type="Normal" Path="create_room/land_pribtn_arrow_down_0.png" Plist="" />
                        <BlendFunc Src="1" Dst="771" />
                      </AbstractNodeData>
                      <AbstractNodeData Name="img_drop" ActionTag="7525349" VisibleForFrame="False" Tag="193" IconVisible="False" LeftMargin="-13.4977" RightMargin="-10.5023" TopMargin="48.8761" BottomMargin="-136.8761" Scale9Enable="True" LeftEage="75" RightEage="75" TopEage="53" BottomEage="53" Scale9OriginX="75" Scale9OriginY="53" Scale9Width="80" Scale9Height="55" ctype="ImageViewObjectData">
                        <Size X="230.0000" Y="150.0000" />
                        <Children>
                          <AbstractNodeData Name="btn_round_count_0" CanEdit="False" ActionTag="1874353259" Tag="194" IconVisible="False" LeftMargin="10.1331" RightMargin="15.8669" TopMargin="11.9308" BottomMargin="70.0692" TouchEnable="True" FontSize="14" LeftEage="15" RightEage="15" TopEage="11" BottomEage="11" Scale9OriginX="15" Scale9OriginY="11" Scale9Width="174" Scale9Height="46" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="ButtonObjectData">
                            <Size X="204.0000" Y="68.0000" />
                            <Children>
                              <AbstractNodeData Name="Text" CanEdit="False" ActionTag="154762052" Tag="195" IconVisible="False" LeftMargin="82.1270" RightMargin="74.8730" TopMargin="18.7859" BottomMargin="16.2141" FontSize="28" LabelText="2人" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                                <Size X="47.0000" Y="33.0000" />
                                <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                                <Position X="105.6270" Y="32.7141" />
                                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                                <CColor A="255" R="255" G="255" B="255" />
                                <PrePosition X="0.5178" Y="0.4811" />
                                <PreSize X="0.2304" Y="0.4853" />
                                <FontResource Type="Normal" Path="fonts/round_body.ttf" Plist="" />
                                <OutlineColor A="255" R="255" G="0" B="0" />
                                <ShadowColor A="255" R="110" G="110" B="110" />
                              </AbstractNodeData>
                            </Children>
                            <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                            <Position X="112.1331" Y="104.0692" />
                            <Scale ScaleX="1.0000" ScaleY="1.0000" />
                            <CColor A="255" R="255" G="255" B="255" />
                            <PrePosition X="0.4875" Y="0.6938" />
                            <PreSize X="0.8870" Y="0.4533" />
                            <TextColor A="255" R="65" G="65" B="70" />
                            <DisabledFileData Type="Normal" Path="create_room/sparrowgd_check_dropdown_sel_0.png" Plist="" />
                            <PressedFileData Type="Normal" Path="create_room/sparrowgd_check_dropdown_sel_0.png" Plist="" />
                            <NormalFileData Type="Normal" Path="create_room/sparrowgd_check_dropdown_sel_0.png" Plist="" />
                            <OutlineColor A="255" R="255" G="0" B="0" />
                            <ShadowColor A="255" R="110" G="110" B="110" />
                          </AbstractNodeData>
                          <AbstractNodeData Name="btn_round_count_1" CanEdit="False" ActionTag="-2117854638" Tag="196" IconVisible="False" LeftMargin="12.1332" RightMargin="13.8668" TopMargin="73.4984" BottomMargin="8.5016" TouchEnable="True" FontSize="14" LeftEage="15" RightEage="15" TopEage="11" BottomEage="11" Scale9OriginX="15" Scale9OriginY="11" Scale9Width="174" Scale9Height="46" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="ButtonObjectData">
                            <Size X="204.0000" Y="68.0000" />
                            <Children>
                              <AbstractNodeData Name="Text" CanEdit="False" ActionTag="-1047478096" Tag="197" IconVisible="False" LeftMargin="82.1270" RightMargin="74.8730" TopMargin="18.7859" BottomMargin="16.2141" FontSize="28" LabelText="3人" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                                <Size X="47.0000" Y="33.0000" />
                                <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                                <Position X="105.6270" Y="32.7141" />
                                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                                <CColor A="255" R="255" G="255" B="255" />
                                <PrePosition X="0.5178" Y="0.4811" />
                                <PreSize X="0.2304" Y="0.4853" />
                                <FontResource Type="Normal" Path="fonts/round_body.ttf" Plist="" />
                                <OutlineColor A="255" R="255" G="0" B="0" />
                                <ShadowColor A="255" R="110" G="110" B="110" />
                              </AbstractNodeData>
                            </Children>
                            <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                            <Position X="114.1332" Y="42.5016" />
                            <Scale ScaleX="1.0000" ScaleY="1.0000" />
                            <CColor A="255" R="255" G="255" B="255" />
                            <PrePosition X="0.4962" Y="0.2833" />
                            <PreSize X="0.8870" Y="0.4533" />
                            <TextColor A="255" R="65" G="65" B="70" />
                            <DisabledFileData Type="Normal" Path="create_room/sparrowgd_check_dropdown_sel_0.png" Plist="" />
                            <PressedFileData Type="Normal" Path="create_room/sparrowgd_check_dropdown_sel_0.png" Plist="" />
                            <NormalFileData Type="Normal" Path="create_room/sparrowgd_check_dropdown_sel_0.png" Plist="" />
                            <OutlineColor A="255" R="255" G="0" B="0" />
                            <ShadowColor A="255" R="110" G="110" B="110" />
                          </AbstractNodeData>
                        </Children>
                        <AnchorPoint ScaleX="0.5000" ScaleY="1.0000" />
                        <Position X="101.5023" Y="13.1239" />
                        <Scale ScaleX="1.0000" ScaleY="1.0000" />
                        <CColor A="255" R="255" G="255" B="255" />
                        <PrePosition X="0.4927" Y="0.2117" />
                        <PreSize X="1.1165" Y="2.4194" />
                        <FileData Type="Normal" Path="create_room/land_sp_dropdownbg.png" Plist="" />
                      </AbstractNodeData>
                    </Children>
                    <AnchorPoint ScaleX="0.5000" />
                    <Position X="250.5065" Y="-17.0977" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition X="11.3867" Y="-0.7772" />
                    <PreSize X="9.3636" Y="2.8182" />
                    <TextColor A="255" R="65" G="65" B="70" />
                    <DisabledFileData Type="Normal" Path="create_room/sparrowgd_prisp_dropdown_menu.png" Plist="" />
                    <PressedFileData Type="Normal" Path="create_room/sparrowgd_prisp_dropdown_menu.png" Plist="" />
                    <NormalFileData Type="Normal" Path="create_room/sparrowgd_prisp_dropdown_menu.png" Plist="" />
                    <OutlineColor A="255" R="255" G="0" B="0" />
                    <ShadowColor A="255" R="110" G="110" B="110" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="line_1_2" ActionTag="-858326507" Tag="209" IconVisible="False" LeftMargin="600.4747" RightMargin="-600.4747" TopMargin="-2.9023" BottomMargin="2.9023" ctype="SpriteObjectData">
                    <Size X="22.0000" Y="22.0000" />
                    <Children>
                      <AbstractNodeData Name="Text_2" ActionTag="-1917850081" Tag="210" IconVisible="False" LeftMargin="31.2593" RightMargin="-123.2593" TopMargin="-5.3788" BottomMargin="-5.6212" FontSize="28" LabelText="局数配置" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                        <Size X="114.0000" Y="33.0000" />
                        <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                        <Position X="88.2593" Y="10.8788" />
                        <Scale ScaleX="1.0000" ScaleY="1.0000" />
                        <CColor A="255" R="255" G="255" B="255" />
                        <PrePosition X="4.0118" Y="0.4945" />
                        <PreSize X="5.1818" Y="1.5000" />
                        <FontResource Type="Normal" Path="fonts/round_body.ttf" Plist="" />
                        <OutlineColor A="255" R="255" G="0" B="0" />
                        <ShadowColor A="255" R="110" G="110" B="110" />
                      </AbstractNodeData>
                      <AbstractNodeData Name="btn_drop" ActionTag="-626604483" Tag="220" IconVisible="False" LeftMargin="148.9456" RightMargin="-332.9456" TopMargin="-24.4885" BottomMargin="-15.5115" TouchEnable="True" FontSize="14" LeftEage="15" RightEage="15" TopEage="11" BottomEage="11" Scale9OriginX="15" Scale9OriginY="11" Scale9Width="176" Scale9Height="40" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="ButtonObjectData">
                        <Size X="206.0000" Y="62.0000" />
                        <Children>
                          <AbstractNodeData Name="Text" ActionTag="-355835669" Tag="219" IconVisible="False" LeftMargin="56.4315" RightMargin="103.5685" TopMargin="16.0942" BottomMargin="12.9058" FontSize="28" LabelText="5局" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                            <Size X="46.0000" Y="33.0000" />
                            <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                            <Position X="79.4315" Y="29.4058" />
                            <Scale ScaleX="1.0000" ScaleY="1.0000" />
                            <CColor A="255" R="255" G="255" B="255" />
                            <PrePosition X="0.3856" Y="0.4743" />
                            <PreSize X="0.2233" Y="0.5323" />
                            <FontResource Type="Normal" Path="fonts/round_body.ttf" Plist="" />
                            <OutlineColor A="255" R="255" G="0" B="0" />
                            <ShadowColor A="255" R="110" G="110" B="110" />
                          </AbstractNodeData>
                          <AbstractNodeData Name="img_drop" ActionTag="1022625124" VisibleForFrame="False" Tag="215" IconVisible="False" LeftMargin="-12.7145" RightMargin="-11.2855" TopMargin="48.7969" BottomMargin="-364.7969" Scale9Enable="True" LeftEage="75" RightEage="75" TopEage="53" BottomEage="53" Scale9OriginX="75" Scale9OriginY="53" Scale9Width="80" Scale9Height="55" ctype="ImageViewObjectData">
                            <Size X="230.0000" Y="378.0000" />
                            <Children>
                              <AbstractNodeData Name="btn_round_count_0" ActionTag="-60110376" Tag="183" IconVisible="False" LeftMargin="11.5884" RightMargin="14.4116" TopMargin="11.2000" BottomMargin="298.8000" TouchEnable="True" FontSize="14" LeftEage="15" RightEage="15" TopEage="11" BottomEage="11" Scale9OriginX="15" Scale9OriginY="11" Scale9Width="174" Scale9Height="46" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="ButtonObjectData">
                                <Size X="204.0000" Y="68.0000" />
                                <Children>
                                  <AbstractNodeData Name="Text" ActionTag="-507547481" Tag="184" IconVisible="False" LeftMargin="82.6270" RightMargin="75.3730" TopMargin="18.7859" BottomMargin="16.2141" FontSize="28" LabelText="5局" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                                    <Size X="46.0000" Y="33.0000" />
                                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                                    <Position X="105.6270" Y="32.7141" />
                                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                                    <CColor A="255" R="255" G="255" B="255" />
                                    <PrePosition X="0.5178" Y="0.4811" />
                                    <PreSize X="0.2255" Y="0.4853" />
                                    <FontResource Type="Normal" Path="fonts/round_body.ttf" Plist="" />
                                    <OutlineColor A="255" R="255" G="0" B="0" />
                                    <ShadowColor A="255" R="110" G="110" B="110" />
                                  </AbstractNodeData>
                                </Children>
                                <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                                <Position X="113.5884" Y="332.8000" />
                                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                                <CColor A="255" R="255" G="255" B="255" />
                                <PrePosition X="0.4939" Y="0.8804" />
                                <PreSize X="0.8870" Y="0.1799" />
                                <TextColor A="255" R="65" G="65" B="70" />
                                <DisabledFileData Type="Normal" Path="create_room/sparrowgd_check_dropdown_sel_0.png" Plist="" />
                                <PressedFileData Type="Normal" Path="create_room/sparrowgd_check_dropdown_sel_0.png" Plist="" />
                                <NormalFileData Type="Normal" Path="create_room/sparrowgd_check_dropdown_sel_0.png" Plist="" />
                                <OutlineColor A="255" R="255" G="0" B="0" />
                                <ShadowColor A="255" R="110" G="110" B="110" />
                              </AbstractNodeData>
                              <AbstractNodeData Name="btn_round_count_1" ActionTag="-1720714627" Tag="185" IconVisible="False" LeftMargin="11.5884" RightMargin="14.4116" TopMargin="81.7656" BottomMargin="228.2344" TouchEnable="True" FontSize="14" LeftEage="15" RightEage="15" TopEage="11" BottomEage="11" Scale9OriginX="15" Scale9OriginY="11" Scale9Width="174" Scale9Height="46" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="ButtonObjectData">
                                <Size X="204.0000" Y="68.0000" />
                                <Children>
                                  <AbstractNodeData Name="Text" ActionTag="-328958196" Tag="186" IconVisible="False" LeftMargin="77.6270" RightMargin="70.3730" TopMargin="18.7859" BottomMargin="16.2141" FontSize="28" LabelText="10局" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                                    <Size X="56.0000" Y="33.0000" />
                                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                                    <Position X="105.6270" Y="32.7141" />
                                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                                    <CColor A="255" R="255" G="255" B="255" />
                                    <PrePosition X="0.5178" Y="0.4811" />
                                    <PreSize X="0.2745" Y="0.4853" />
                                    <FontResource Type="Normal" Path="fonts/round_body.ttf" Plist="" />
                                    <OutlineColor A="255" R="255" G="0" B="0" />
                                    <ShadowColor A="255" R="110" G="110" B="110" />
                                  </AbstractNodeData>
                                </Children>
                                <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                                <Position X="113.5884" Y="262.2344" />
                                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                                <CColor A="255" R="255" G="255" B="255" />
                                <PrePosition X="0.4939" Y="0.6937" />
                                <PreSize X="0.8870" Y="0.1799" />
                                <TextColor A="255" R="65" G="65" B="70" />
                                <DisabledFileData Type="Normal" Path="create_room/sparrowgd_check_dropdown_sel_0.png" Plist="" />
                                <PressedFileData Type="Normal" Path="create_room/sparrowgd_check_dropdown_sel_0.png" Plist="" />
                                <NormalFileData Type="Normal" Path="create_room/sparrowgd_check_dropdown_sel_0.png" Plist="" />
                                <OutlineColor A="255" R="255" G="0" B="0" />
                                <ShadowColor A="255" R="110" G="110" B="110" />
                              </AbstractNodeData>
                              <AbstractNodeData Name="btn_round_count_2" ActionTag="-121428357" Tag="191" IconVisible="False" LeftMargin="11.5884" RightMargin="14.4116" TopMargin="154.0240" BottomMargin="155.9760" TouchEnable="True" FontSize="14" LeftEage="15" RightEage="15" TopEage="11" BottomEage="11" Scale9OriginX="15" Scale9OriginY="11" Scale9Width="174" Scale9Height="46" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="ButtonObjectData">
                                <Size X="204.0000" Y="68.0000" />
                                <Children>
                                  <AbstractNodeData Name="Text" ActionTag="-258447646" Tag="192" IconVisible="False" LeftMargin="77.6270" RightMargin="70.3730" TopMargin="18.7859" BottomMargin="16.2141" FontSize="28" LabelText="15局" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                                    <Size X="56.0000" Y="33.0000" />
                                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                                    <Position X="105.6270" Y="32.7141" />
                                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                                    <CColor A="255" R="255" G="255" B="255" />
                                    <PrePosition X="0.5178" Y="0.4811" />
                                    <PreSize X="0.2745" Y="0.4853" />
                                    <FontResource Type="Normal" Path="fonts/round_body.ttf" Plist="" />
                                    <OutlineColor A="255" R="255" G="0" B="0" />
                                    <ShadowColor A="255" R="110" G="110" B="110" />
                                  </AbstractNodeData>
                                </Children>
                                <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                                <Position X="113.5884" Y="189.9760" />
                                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                                <CColor A="255" R="255" G="255" B="255" />
                                <PrePosition X="0.4939" Y="0.5026" />
                                <PreSize X="0.8870" Y="0.1799" />
                                <TextColor A="255" R="65" G="65" B="70" />
                                <DisabledFileData Type="Normal" Path="create_room/sparrowgd_check_dropdown_sel_0.png" Plist="" />
                                <PressedFileData Type="Normal" Path="create_room/sparrowgd_check_dropdown_sel_0.png" Plist="" />
                                <NormalFileData Type="Normal" Path="create_room/sparrowgd_check_dropdown_sel_0.png" Plist="" />
                                <OutlineColor A="255" R="255" G="0" B="0" />
                                <ShadowColor A="255" R="110" G="110" B="110" />
                              </AbstractNodeData>
                              <AbstractNodeData Name="btn_round_count_3" ActionTag="-1957731876" Tag="187" IconVisible="False" LeftMargin="11.5884" RightMargin="14.4116" TopMargin="222.8969" BottomMargin="87.1031" TouchEnable="True" FontSize="14" LeftEage="15" RightEage="15" TopEage="11" BottomEage="11" Scale9OriginX="15" Scale9OriginY="11" Scale9Width="174" Scale9Height="46" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="ButtonObjectData">
                                <Size X="204.0000" Y="68.0000" />
                                <Children>
                                  <AbstractNodeData Name="Text" ActionTag="1051180277" Tag="188" IconVisible="False" LeftMargin="74.6270" RightMargin="67.3730" TopMargin="18.7859" BottomMargin="16.2141" FontSize="28" LabelText="20局" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                                    <Size X="62.0000" Y="33.0000" />
                                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                                    <Position X="105.6270" Y="32.7141" />
                                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                                    <CColor A="255" R="255" G="255" B="255" />
                                    <PrePosition X="0.5178" Y="0.4811" />
                                    <PreSize X="0.3039" Y="0.4853" />
                                    <FontResource Type="Normal" Path="fonts/round_body.ttf" Plist="" />
                                    <OutlineColor A="255" R="255" G="0" B="0" />
                                    <ShadowColor A="255" R="110" G="110" B="110" />
                                  </AbstractNodeData>
                                </Children>
                                <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                                <Position X="113.5884" Y="121.1031" />
                                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                                <CColor A="255" R="255" G="255" B="255" />
                                <PrePosition X="0.4939" Y="0.3204" />
                                <PreSize X="0.8870" Y="0.1799" />
                                <TextColor A="255" R="65" G="65" B="70" />
                                <DisabledFileData Type="Normal" Path="create_room/sparrowgd_check_dropdown_sel_0.png" Plist="" />
                                <PressedFileData Type="Normal" Path="create_room/sparrowgd_check_dropdown_sel_0.png" Plist="" />
                                <NormalFileData Type="Normal" Path="create_room/sparrowgd_check_dropdown_sel_0.png" Plist="" />
                                <OutlineColor A="255" R="255" G="0" B="0" />
                                <ShadowColor A="255" R="110" G="110" B="110" />
                              </AbstractNodeData>
                              <AbstractNodeData Name="btn_round_count_4" ActionTag="-1488373252" Tag="189" IconVisible="False" LeftMargin="12.8793" RightMargin="13.1207" TopMargin="293.4625" BottomMargin="16.5375" TouchEnable="True" FontSize="14" LeftEage="15" RightEage="15" TopEage="11" BottomEage="11" Scale9OriginX="15" Scale9OriginY="11" Scale9Width="174" Scale9Height="46" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="ButtonObjectData">
                                <Size X="204.0000" Y="68.0000" />
                                <Children>
                                  <AbstractNodeData Name="Text" ActionTag="1906829549" Tag="190" IconVisible="False" LeftMargin="74.6270" RightMargin="67.3730" TopMargin="18.7859" BottomMargin="16.2141" FontSize="28" LabelText="25局" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                                    <Size X="62.0000" Y="33.0000" />
                                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                                    <Position X="105.6270" Y="32.7141" />
                                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                                    <CColor A="255" R="255" G="255" B="255" />
                                    <PrePosition X="0.5178" Y="0.4811" />
                                    <PreSize X="0.3039" Y="0.4853" />
                                    <FontResource Type="Normal" Path="fonts/round_body.ttf" Plist="" />
                                    <OutlineColor A="255" R="255" G="0" B="0" />
                                    <ShadowColor A="255" R="110" G="110" B="110" />
                                  </AbstractNodeData>
                                </Children>
                                <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                                <Position X="114.8793" Y="50.5375" />
                                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                                <CColor A="255" R="255" G="255" B="255" />
                                <PrePosition X="0.4995" Y="0.1337" />
                                <PreSize X="0.8870" Y="0.1799" />
                                <TextColor A="255" R="65" G="65" B="70" />
                                <DisabledFileData Type="Normal" Path="create_room/sparrowgd_check_dropdown_sel_0.png" Plist="" />
                                <PressedFileData Type="Normal" Path="create_room/sparrowgd_check_dropdown_sel_0.png" Plist="" />
                                <NormalFileData Type="Normal" Path="create_room/sparrowgd_check_dropdown_sel_0.png" Plist="" />
                                <OutlineColor A="255" R="255" G="0" B="0" />
                                <ShadowColor A="255" R="110" G="110" B="110" />
                              </AbstractNodeData>
                            </Children>
                            <AnchorPoint ScaleX="0.5000" ScaleY="1.0000" />
                            <Position X="102.2855" Y="13.2031" />
                            <Scale ScaleX="1.0000" ScaleY="1.0000" />
                            <CColor A="255" R="255" G="255" B="255" />
                            <PrePosition X="0.4965" Y="0.2130" />
                            <PreSize X="1.1165" Y="6.0968" />
                            <FileData Type="Normal" Path="create_room/land_sp_dropdownbg.png" Plist="" />
                          </AbstractNodeData>
                          <AbstractNodeData Name="Sprite_10" ActionTag="1756949263" Tag="218" IconVisible="False" LeftMargin="150.1146" RightMargin="0.8854" TopMargin="3.3639" BottomMargin="1.6361" ctype="SpriteObjectData">
                            <Size X="55.0000" Y="57.0000" />
                            <AnchorPoint />
                            <Position X="150.1146" Y="1.6361" />
                            <Scale ScaleX="1.0000" ScaleY="1.0000" />
                            <CColor A="255" R="255" G="255" B="255" />
                            <PrePosition X="0.7287" Y="0.0264" />
                            <PreSize X="0.2670" Y="0.9194" />
                            <FileData Type="Normal" Path="create_room/land_pribtn_arrow_down_0.png" Plist="" />
                            <BlendFunc Src="1" Dst="771" />
                          </AbstractNodeData>
                        </Children>
                        <AnchorPoint ScaleX="0.5000" />
                        <Position X="251.9456" Y="-15.5115" />
                        <Scale ScaleX="1.0000" ScaleY="1.0000" />
                        <CColor A="255" R="255" G="255" B="255" />
                        <PrePosition X="11.4521" Y="-0.7051" />
                        <PreSize X="9.3636" Y="2.8182" />
                        <TextColor A="255" R="65" G="65" B="70" />
                        <DisabledFileData Type="Normal" Path="create_room/sparrowgd_prisp_dropdown_menu.png" Plist="" />
                        <PressedFileData Type="Normal" Path="create_room/sparrowgd_prisp_dropdown_menu.png" Plist="" />
                        <NormalFileData Type="Normal" Path="create_room/sparrowgd_prisp_dropdown_menu.png" Plist="" />
                        <OutlineColor A="255" R="255" G="0" B="0" />
                        <ShadowColor A="255" R="110" G="110" B="110" />
                      </AbstractNodeData>
                    </Children>
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position X="611.4747" Y="13.9023" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition X="27.7943" Y="0.6319" />
                    <PreSize X="1.0000" Y="1.0000" />
                    <FileData Type="Normal" Path="create_room/pri_sp_flag.png" Plist="" />
                    <BlendFunc Src="1" Dst="771" />
                  </AbstractNodeData>
                </Children>
                <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                <Position X="36.2684" Y="422.7026" />
                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                <CColor A="255" R="255" G="255" B="255" />
                <PrePosition />
                <PreSize X="0.0000" Y="0.0000" />
                <FileData Type="Normal" Path="create_room/pri_sp_flag.png" Plist="" />
                <BlendFunc Src="1" Dst="771" />
              </AbstractNodeData>
            </Children>
            <AnchorPoint />
            <Position X="101.6944" Y="137.5273" />
            <Scale ScaleX="1.0000" ScaleY="1.0000" />
            <CColor A="255" R="255" G="255" B="255" />
            <PrePosition X="0.0762" Y="0.1834" />
            <PreSize X="0.0000" Y="0.0000" />
          </AbstractNodeData>
          <AbstractNodeData Name="Sprite_5" CanEdit="False" ActionTag="-1228400033" Tag="212" IconVisible="False" LeftMargin="3.7178" RightMargin="-3.7178" TopMargin="126.8168" BottomMargin="126.1832" ctype="SpriteObjectData">
            <Size X="1334.0000" Y="497.0000" />
            <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
            <Position X="670.7178" Y="374.6832" />
            <Scale ScaleX="1.0000" ScaleY="1.0000" />
            <CColor A="255" R="255" G="255" B="255" />
            <PrePosition X="0.5028" Y="0.4996" />
            <PreSize X="1.0000" Y="0.6627" />
            <FileData Type="Normal" Path="create_room/pri_sp_createroombg_1.png" Plist="" />
            <BlendFunc Src="1" Dst="771" />
          </AbstractNodeData>
          <AbstractNodeData Name="Sprite_6" CanEdit="False" ActionTag="-1731380356" Tag="213" IconVisible="False" LeftMargin="1025.0000" RightMargin="-7.0000" TopMargin="14.6450" BottomMargin="4.3550" ctype="SpriteObjectData">
            <Size X="316.0000" Y="731.0000" />
            <AnchorPoint ScaleX="1.0000" ScaleY="0.5000" />
            <Position X="1341.0000" Y="369.8550" />
            <Scale ScaleX="1.0000" ScaleY="1.0000" />
            <CColor A="255" R="255" G="255" B="255" />
            <PrePosition X="1.0052" Y="0.4931" />
            <PreSize X="0.2369" Y="0.9747" />
            <FileData Type="Normal" Path="create_room/sparrowgd_sp_bg_3.png" Plist="" />
            <BlendFunc Src="1" Dst="771" />
          </AbstractNodeData>
          <AbstractNodeData Name="Sprite_7" ActionTag="-29627574" Tag="214" IconVisible="False" LeftMargin="9.9997" RightMargin="-9.9998" TopMargin="662.9100" BottomMargin="-1.9100" ctype="SpriteObjectData">
            <Size X="1334.0000" Y="89.0000" />
            <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
            <Position X="676.9997" Y="42.5900" />
            <Scale ScaleX="1.0000" ScaleY="1.0000" />
            <CColor A="255" R="255" G="255" B="255" />
            <PrePosition X="0.5075" Y="0.0568" />
            <PreSize X="1.0000" Y="0.1187" />
            <FileData Type="Normal" Path="create_room/pri_sp_bottombg.png" Plist="" />
            <BlendFunc Src="1" Dst="771" />
          </AbstractNodeData>
          <AbstractNodeData Name="Sprite_8" ActionTag="770556371" Tag="215" IconVisible="False" LeftMargin="394.5000" RightMargin="374.5000" TopMargin="723.8483" BottomMargin="4.1517" ctype="SpriteObjectData">
            <Size X="565.0000" Y="22.0000" />
            <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
            <Position X="677.0000" Y="15.1517" />
            <Scale ScaleX="1.0000" ScaleY="1.0000" />
            <CColor A="255" R="255" G="255" B="255" />
            <PrePosition X="0.5075" Y="0.0202" />
            <PreSize X="0.4235" Y="0.0293" />
            <FileData Type="Normal" Path="create_room/pri_sp_altertips.png" Plist="" />
            <BlendFunc Src="1" Dst="771" />
          </AbstractNodeData>
          <AbstractNodeData Name="btn_for_other" ActionTag="365390379" Tag="116" IconVisible="False" LeftMargin="296.0125" RightMargin="755.9875" TopMargin="617.2532" BottomMargin="40.7468" TouchEnable="True" FontSize="30" Scale9Enable="True" LeftEage="15" RightEage="15" TopEage="11" BottomEage="11" Scale9OriginX="15" Scale9OriginY="11" Scale9Width="252" Scale9Height="70" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="ButtonObjectData">
            <Size X="282.0000" Y="92.0000" />
            <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
            <Position X="437.0125" Y="86.7468" />
            <Scale ScaleX="1.0000" ScaleY="1.0000" />
            <CColor A="255" R="255" G="255" B="255" />
            <PrePosition X="0.3276" Y="0.1157" />
            <PreSize X="0.2114" Y="0.1227" />
            <TextColor A="255" R="255" G="226" B="184" />
            <DisabledFileData Type="Normal" Path="create_room/sparrowgd_btn_createroom_1_1.png" Plist="" />
            <PressedFileData Type="Normal" Path="create_room/sparrowgd_btn_createroom_1_1.png" Plist="" />
            <NormalFileData Type="Normal" Path="create_room/sparrowgd_btn_createroom_1_0.png" Plist="" />
            <OutlineColor A="255" R="255" G="0" B="0" />
            <ShadowColor A="255" R="110" G="110" B="110" />
          </AbstractNodeData>
          <AbstractNodeData Name="btn_create_now" ActionTag="727113633" Tag="117" IconVisible="False" LeftMargin="685.5199" RightMargin="366.4801" TopMargin="617.2532" BottomMargin="40.7468" TouchEnable="True" FontSize="30" Scale9Enable="True" LeftEage="15" RightEage="15" TopEage="11" BottomEage="11" Scale9OriginX="15" Scale9OriginY="11" Scale9Width="252" Scale9Height="70" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="ButtonObjectData">
            <Size X="282.0000" Y="92.0000" />
            <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
            <Position X="826.5199" Y="86.7468" />
            <Scale ScaleX="1.0000" ScaleY="1.0000" />
            <CColor A="255" R="255" G="255" B="255" />
            <PrePosition X="0.6196" Y="0.1157" />
            <PreSize X="0.2114" Y="0.1227" />
            <TextColor A="255" R="255" G="226" B="184" />
            <DisabledFileData Type="Normal" Path="create_room/sparrowgd_btn_createroom_1.png" Plist="" />
            <PressedFileData Type="Normal" Path="create_room/sparrowgd_btn_createroom_1.png" Plist="" />
            <NormalFileData Type="Normal" Path="create_room/sparrowgd_btn_createroom_0.png" Plist="" />
            <OutlineColor A="255" R="255" G="0" B="0" />
            <ShadowColor A="255" R="110" G="110" B="110" />
          </AbstractNodeData>
        </Children>
      </ObjectData>
    </Content>
  </Content>
</GameFile>