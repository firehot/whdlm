local GameLogic = {}

local cmd = appdf.req(appdf.GAME_SRC.."yule.runfast.src.models.CMD_Game")

--**************    扑克类型    ******************--

--牌库数目
GameLogic.FULL_COUNT			= 48

--拷贝表
function GameLogic:copyTab(st)
    local tab = {}
    for k, v in pairs(st) do
        if type(v) ~= "table" then
            tab[k] = v
        else
            tab[k] = GameLogic:copyTab(v)
        end
    end
    return tab
 end

--取模
function GameLogic:mod(a,b)
    return a - math.floor(a/b)*b
end

--打印表
function GameLogic:printTable(table)
	for v, k in pairs(table) do
		if type(k) == "table" then
			print("v", v)
			GameLogic:printTable(k)
		elseif k ~= 0 then
			print("v, k", v, k)
		end
	end
end

--获得牌的颜色（0 -- 4）
function GameLogic:GetCardColor(cbCardData)
    return math.floor(cbCardData/16)
end

--获得牌的数值（1 -- 13）
function GameLogic:GetCardValue(cbCardData)
    return GameLogic:mod(cbCardData, 16)
end

--获得牌的逻辑数值
function GameLogic:GetCardLogicValue(cbCardData)
	local nValue = GameLogic:GetCardValue(cbCardData)
	return nValue <= 2 and nValue + 13 or nValue
end

--排列扑克
function GameLogic:SortCardList(cbCardData)
	if nil == cbCardData then
		return false
	end

	--转换数值
	local cbCardLogicValue = {}
	for i = 1, #cbCardData do
		cbCardLogicValue[i] = GameLogic:GetCardLogicValue(cbCardData[i])
	end

	--排序操作
	local bSorted = false
	local bLast = #cbCardData - 1
	while bSorted == false do
		bSorted = true
		for i = 1, bLast do
			if cbCardLogicValue[i] < cbCardLogicValue[i + 1] or 
			cbCardLogicValue[i] == cbCardLogicValue[i + 1] and cbCardData[i] > cbCardData[i + 1] then
				--交换位置
				cbCardData[i], cbCardData[i + 1] = cbCardData[i + 1], cbCardData[i]
				cbCardLogicValue[i], cbCardLogicValue[i + 1] = cbCardLogicValue[i + 1], cbCardLogicValue[i]
				bSorted = false
			end
		end
		bLast = bLast - 1
	end

	for i=1 , #cbCardData do
		if cbCardData[i] == 51 then
			local temp = cbCardData[#cbCardData]
			cbCardData[#cbCardData] = 51
			cbCardData[i] = temp
			break;
		end
	end

	return true
end

--分析扑克
function GameLogic:AnalyseCardData(cbCardData)
	--初始化
	local analyseResult = {}
	analyseResult.bFourCount = 0
	analyseResult.bThreeCount = 0
	analyseResult.bDoubleCount = 0
	analyseResult.bSignedCount = 0
	analyseResult.bFourLogicValue = {}
	for i = 1, 4 do
		analyseResult.bFourLogicValue[i] = 0
	end
	analyseResult.bThreeLogicValue = {}
	for i = 1, 5 do
		analyseResult.bThreeLogicValue[i] = 0
	end
	analyseResult.bDoubleLogicValue = {}
	for i = 1, 8 do
		analyseResult.bDoubleLogicValue[i] = 0
	end
	analyseResult.bSignedLogicValue = {}
	for i = 1, 16 do
		analyseResult.bSignedLogicValue[i] = 0
	end
	analyseResult.bFourCardData = {}
	for i = 1, 16 do
		analyseResult.bFourCardData[i] = 0
	end
	analyseResult.bThreeCardData = {}
	for i = 1, 16 do
		analyseResult.bThreeCardData[i] = 0
	end
	analyseResult.bDoubleCardData = {}
	for i = 1, 16 do
		analyseResult.bDoubleCardData[i] = 0
	end
	analyseResult.bSignedCardData = {}
	for i = 1, 16 do
		analyseResult.bSignedCardData[i] = 0
	end

	--扑克分析
	local i = 1
	while i <= #cbCardData do
		--变量定义
		local bSameCount = 1
		local bSameCardData = {cbCardData[i], 0, 0, 0}
		local bLogicValue = GameLogic:GetCardLogicValue(cbCardData[i])

		--获取同牌
		for j = i + 1, #cbCardData do
			--逻辑对比
			if GameLogic:GetCardLogicValue(cbCardData[j]) ~= bLogicValue then
				break
			end
			--设置扑克
			bSameCardData[bSameCount + 1] = cbCardData[j]
			bSameCount = bSameCount + 1
		end

		--保存结果
		if bSameCount == 1 then 		--一张
			analyseResult.bSignedLogicValue[analyseResult.bSignedCount + 1] = bLogicValue
			analyseResult.bSignedCardData[analyseResult.bSignedCount + 1] = bSameCardData[1]
			analyseResult.bSignedCount = analyseResult.bSignedCount + 1
		elseif bSameCount == 2 then 			--二张
			analyseResult.bDoubleLogicValue[analyseResult.bDoubleCount + 1] = bLogicValue
			for k = 1, 2 do
				analyseResult.bDoubleCardData[analyseResult.bDoubleCount*2 + k] = bSameCardData[k]
			end
			analyseResult.bDoubleCount = analyseResult.bDoubleCount + 1
		elseif bSameCount == 3 then 			--三张
			analyseResult.bThreeLogicValue[analyseResult.bThreeCount + 1] = bLogicValue
			for k = 1, 3 do
				analyseResult.bThreeCardData[analyseResult.bThreeCount*3 + k] = bSameCardData[k]
			end
			analyseResult.bThreeCount = analyseResult.bThreeCount + 1
		elseif bSameCount == 4 then 			--四张
			analyseResult.bFourLogicValue[analyseResult.bFourCount + 1] = bLogicValue
			for k = 1, 4 do
				analyseResult.bFourCardData[analyseResult.bFourCount*4 + k] = bSameCardData[k]
			end
			analyseResult.bFourCount = analyseResult.bFourCount + 1
		end

		--设置递增
		i = i + bSameCount
	end

	return analyseResult
end

--删除牌
function GameLogic:RemoveCard(bRemoveCard, bCardData)
	if nil == bRemoveCard or nil == bCardData then
		return false
	end

	local bRemoveCount = #bRemoveCard
	local bCardCount = #bCardData
	--校验数据
	if bRemoveCount > bCardCount then
		return false
	end
	--定义变量
	local bDeleteCount = 0
	local bTempCardData = {}
	for i = 1, bCardCount do
		bTempCardData[i] = bCardData[i]
	end
	--置零扑克
	for i = 1, bRemoveCount do
		for j = 1, bCardCount do
			if bRemoveCard[i] == bTempCardData[j] then
				bDeleteCount = bDeleteCount + 1
				bTempCardData[j] = 0
				break
			end
		end
	end
	if bDeleteCount ~= bRemoveCount then
		return false
	end
	--清零扑克
	local bCardPos = 1
	for i = 1, bCardCount do
		if bTempCardData[i] ~= 0 then
			bCardData[bCardPos] = bTempCardData[i]
			bCardPos = bCardPos + 1
		end
	end
	for i = bCardPos, bCardCount do
		bCardData[i] = nil
	end

	return true
end

--获取类型
function GameLogic:GetCardType(cbCardData,isLast)
	if nil == cbCardData or #cbCardData == 0 then
		return cmd.CT_ERROR
	end

	GameLogic:SortCardList(cbCardData)
	local cbCardCount = #cbCardData

	--简单牌型
	if cbCardCount == 1 then --单牌
		return cmd.CT_SINGLE
	elseif cbCardCount == 2 then --对牌
		local nValue1, nValue2 = GameLogic:GetCardLogicValue(cbCardData[1]) , GameLogic:GetCardLogicValue(cbCardData[2])
		return nValue1 == nValue2 and cmd.CT_DOUBLE_LINE or cmd.CT_ERROR
	end

	--分析扑克
	local analyseResult = GameLogic:AnalyseCardData(cbCardData)
dump(analyseResult  , "牌型分析结果")
	--炸弹判断
	if analyseResult.bFourCount == 1 then 
		if cbCardCount == 4 then
			return cmd.CT_BOMB
		elseif cbCardCount == 5 then
			return cmd.CT_THREE_TAKE_TWO_SINGLE
		elseif cbCardCount == 7 then
			return cmd.CT_FOUR_TAKE_THREE
		end
	end

	--三牌判断
	if analyseResult.bThreeCount > 0 then
		--连牌判断
		local bSeriesCard = false
		if analyseResult.bThreeCount == 1 --[[or analyseResult.bThreeLogicValue[1] ~= 15]] then
			local i = 1
			while i < analyseResult.bThreeCount do
				if analyseResult.bThreeLogicValue[i + 1] ~= analyseResult.bThreeLogicValue[1] - i then
					break
				end
				i = i + 1
			end
			if i == analyseResult.bThreeCount then
				bSeriesCard = true
			end
			--带牌判断
			if bSeriesCard == true then
				--数据定义
				local bSignedCount = cbCardCount - analyseResult.bThreeCount*3
				local bDoubleCount = analyseResult.bDoubleCount + analyseResult.bFourCount*2
				--类型分析
				if analyseResult.bThreeCount*3 == cbCardCount then
					return isLast and cmd.CT_THREE_LINE or cmd.CT_ERROR --cmd.CT_THREE_LINE	
				elseif analyseResult.bThreeCount == bSignedCount and
					analyseResult.bThreeCount*3 + bSignedCount == cbCardCount then
					return isLast and cmd.CT_THREE_LINE_TAKE_SINGLE or cmd.CT_ERROR --cmd.CT_THREE_LINE_TAKE_SINGLE
				elseif analyseResult.bThreeCount == bDoubleCount and
					analyseResult.bThreeCount*3 + bDoubleCount*2 == cbCardCount then
					return cmd.CT_THREE_LINE_TAKE_DOUBLE
				elseif (analyseResult.bThreeCount*2 == bSignedCount) and --三带两单
						(analyseResult.bThreeCount*3+bSignedCount == cbCardCount) then
					return cmd.CT_THREE_TAKE_TWO_SINGLE	
				end
			end
		end

		--(666 777 888 999  连三同也可以出牌)
		if analyseResult.bThreeCount >=2 and analyseResult.bThreeCount*3 == cbCardCount then
			local bLine = true
			local i = 1
			while i < analyseResult.bThreeCount do
				if analyseResult.bThreeLogicValue[i + 1] ~= analyseResult.bThreeLogicValue[1] - i  or analyseResult.bThreeLogicValue[1] == 15  then
					bLine = false
					break
				end
				i = i + 1
			end
			if bLine then
				return isLast and cmd.CT_THREE_LINE or cmd.CT_ERROR
			end
		end
	end

	--两连判断
	if analyseResult.bDoubleCount > 0 then
		--连牌判断
		local bSeriesCard = false
		if analyseResult.bDoubleCount == 1 or analyseResult.bDoubleLogicValue[1] ~= 15 then
			local i = 1
			while i < analyseResult.bDoubleCount do
				if analyseResult.bDoubleLogicValue[i + 1] ~= analyseResult.bDoubleLogicValue[1] - i then
					break
				end
				i = i + 1
			end
			if i == analyseResult.bDoubleCount then
				bSeriesCard = true
			end
		end
		if bSeriesCard == true and analyseResult.bDoubleCount*2 == cbCardCount then
			return cmd.CT_DOUBLE_LINE
		end
	end

	local valueTable = {}
	for i=1,analyseResult.bThreeCount do
		
		table.insert(valueTable,analyseResult.bThreeLogicValue[i])
	end

	for i=1,analyseResult.bFourCount do
		
		table.insert(valueTable,analyseResult.bFourLogicValue[i])
	end
	table.sort(valueTable,function (a,b)
		return a>b
	end)

	local count  = 1
	local lastCount = 1
	if isLast and #valueTable >=2 then
		for i=2,#valueTable do
			if valueTable[i] + 1 == valueTable[i-1] and valueTable[i-1] ~=15 then
				count = count +1
			else
				if count > lastCount then
					lastCount = count
				end
				count = 1
			end

			if i == #valueTable then
				if count > lastCount then
					lastCount = count
				end
				if cbCardCount <= lastCount*5 then
					return cmd.CT_THREE_THREE_LINE_TAKE_THREE_SINGLE
				end
			end
		end
	end

	dump({count,lastCount},"============yyyyy========1")
	--2连3同d带牌判断

	local twoCardFlag = false

	if analyseResult.bThreeCount +analyseResult.bFourCount >=2 then

		for i=2,#valueTable do
			if valueTable[i] + 1 == valueTable[i-1] and valueTable[i-1] ~=15 then
				twoCardFlag = true
				break
			end
		end
		
	end

	if twoCardFlag then
		if cbCardCount == 8 then
			return  isLast and cmd.CT_TWO_THREE_LINE_TAKE_TWO_SINGLE or cmd.CT_ERROR
		elseif cbCardCount == 10 then
			return cmd.CT_TWO_THREE_LINE_TAKE_FOUR_SINGLE
		end
	end


	--3连三同带牌判断
	local threeCardFlag = false

	if analyseResult.bThreeCount +analyseResult.bFourCount >=3 then

		for i=3,#valueTable do
			if valueTable[i-1] + 1 == valueTable[i-2] and valueTable[i] + 1 == valueTable[i-1] and valueTable[i-2] ~=15 then
				threeCardFlag = true
				break
			end
		end
		
	end

	if threeCardFlag  then
   		if cbCardCount ==15 then
   			return cmd.CT_THREE_THREE_LINE_TAKE_SIX_SINGLE
   		elseif cbCardCount == 12 then
   			return isLast and cmd.CT_THREE_THREE_LINE_TAKE_THREE_SINGLE or cmd.CT_ERROR
   		end
   	end

   	--4连3同判断
   	if analyseResult.bThreeCount +analyseResult.bFourCount >=4 then

   		for i = 4,#valueTable do
   			if valueTable[i-2] + 1 == valueTable[i-3] and valueTable[i-1] + 1 == valueTable[i-2] and valueTable[i] + 1 == valueTable[i-1] and valueTable[i-3] ~=15  then

   				if cbCardCount == 16 then
   					return cmd.CT_FOUR_THREE_LINE_TAKE_FOUR_SINGLE
   				end
   			end
   		end
   	end


	--单连判断
	if analyseResult.bSignedCount >= 5 and analyseResult.bSignedCount == cbCardCount then
		--变量定义
		local bSeriesCard = false
		local bLogicValue = GameLogic:GetCardLogicValue(cbCardData[1])
		--连牌判断
		if bLogicValue ~= 15 then
			local i = 1
			while i < analyseResult.bSignedCount do
				if GameLogic:GetCardLogicValue(cbCardData[i + 1]) ~= bLogicValue - i then
					break
				end
				i = i + 1
			end
			if i == analyseResult.bSignedCount then
				bSeriesCard = true
			end
		end
		--单连判断
		if bSeriesCard == true then
			return cmd.CT_SINGLE_LINE
		end
	end

	return cmd.CT_ERROR
end

--对比扑克
function GameLogic:CompareCard(bFirstList, bNextList,cbHandCardData)
	if nil == bFirstList or nil == bNextList then
		return false
	end

	local bSpecial = false
	GameLogic:SortCardList(bFirstList)
	GameLogic:SortCardList(bNextList)
	local bFirstCount = #bFirstList
	local bNextCount = #bNextList

	--获取类型
	local bNextType = GameLogic:GetCardType(bNextList)
	local bFirstType = GameLogic:GetCardType(bFirstList)
	--print(bNextType.."========uuuuuuuuuuuuuuuu========"..bFirstType)
	--类型判断
	if bFirstType == cmd.CT_ERROR then
		if (bNextType >= cmd.CT_TWO_THREE_LINE_TAKE_FOUR_SINGLE and bNextType <= cmd.CT_TWO_THREE_LINE_TAKE_OTHER) then 
			local analyseResult = GameLogic:AnalyseCardData(bFirstList)
			if (analyseResult.bThreeCount == 2) and (math.abs(analyseResult.bThreeLogicValue[1]-analyseResult.bThreeLogicValue[2]) == 1) and
			(analyseResult.bThreeLogicValue[1] ~= 15) and (bFirstCount == 7 or bFirstCount == 9)  then 
				bSpecial = true
			end
		end	

		if not bSpecial then
			return false
		end
	elseif bNextType == cmd.CT_ERROR then 
		return true
	end
	--炸弹判断
	if bFirstType == cmd.CT_BOMB and bNextType ~= cmd.CT_BOMB then
		return true
	end
	if bFirstType ~= cmd.CT_BOMB and bNextType == cmd.CT_BOMB then
		return false
	end
	
	--特殊情况 (出三张时不用按照第一个出三张的带排规则出牌。例如：上家出牌(33345) 下家接牌可出（44455）或者（44478）。上家出牌（33355）下家接牌可出（44466）或者（44456）)
	if (bFirstType == cmd.CT_THREE_TAKE_TWO_SINGLE and bNextType == cmd.CT_THREE_LINE_TAKE_DOUBLE)  or
		(bNextType == cmd.CT_THREE_TAKE_TWO_SINGLE and bFirstType == cmd.CT_THREE_LINE_TAKE_DOUBLE)  then
		bSpecial =  true
	end

	-- --如果手牌只有4张时是可以出3带一，也可以接别人3带2的牌比如：上家出（33345）下家只有4张牌（4443）或者只有3张牌（444）是可以接上家的牌
	-- if (bNextType == cmd.CT_THREE_TAKE_TWO_SINGLE or bNextType == cmd.CT_THREE_LINE_TAKE_DOUBLE) and 
	-- 	((bFirstType == cmd.CT_THREE_LINE and #cbHandCardData == 3) or
	-- 	(bFirstType ==cmd.CT_THREE_LINE_TAKE_SINGLE and #cbHandCardData == 4 )) then
	-- 	bSpecial = true
	-- end

	-- --如果上家出牌连同三张带四牌型,自己在手牌不够的情况下可以出 连同三张或者连同三张带一或者连同三张带二或者连同三张带三
	-- if (bNextType >= cmd.CT_TWO_THREE_LINE_TAKE_FOUR_SINGLE and bNextType <= cmd.CT_TWO_THREE_LINE_TAKE_OTHER) then 
	-- 	if (bFirstType >= CT_TWO_THREE_LINE_TAKE_TWO_SINGLE and bFirstType <= cmd.CT_TWO_THREE_LINE_TAKE_OTHER) then
	-- 		bSpecial = true
	-- 	end
	-- end

	--规则判断
	if (bFirstType ~= bNextType or bFirstCount ~= bNextCount) and not bSpecial then
		return false
	end
	
	--开始对比
	if bNextType == cmd.CT_BOMB or
		bNextType == cmd.CT_SINGLE or
		bNextType == cmd.CT_SINGLE_LINE or
		bNextType == cmd.CT_DOUBLE_LINE then
		local bNextLogicValue = GameLogic:GetCardLogicValue(bNextList[1])
		local bFirstLogicValue = GameLogic:GetCardLogicValue(bFirstList[1])
		return bFirstLogicValue > bNextLogicValue
	elseif bNextType == cmd.CT_FOUR_TAKE_THREE then
		local nextResult = GameLogic:AnalyseCardData(bNextList)
		local firstResult = GameLogic:AnalyseCardData(bFirstList)
		return firstResult.bFourLogicValue[1] > nextResult.bFourLogicValue[1]
	elseif  bNextType == cmd.CT_THREE_LINE or
		bNextType == cmd.CT_THREE_LINE_TAKE_SINGLE or
		bNextType == cmd.CT_THREE_LINE_TAKE_DOUBLE  or
		bNextType == cmd.CT_THREE_TAKE_TWO_SINGLE or
		bNextType == cmd.CT_TWO_THREE_LINE_TAKE_TWO_SINGLE or
		bNextType == cmd.CT_TWO_THREE_LINE_TAKE_ONE_DOUBLE or
		bNextType == cmd.CT_TWO_THREE_LINE_TAKE_FOUR_SINGLE or
		bNextType == cmd.CT_TWO_THREE_LINE_TAKE_TWO_DOUBLE or
		bNextType == cmd.CT_TWO_THREE_LINE_TAKE_OTHER or
		bNextType == cmd.CT_THREE_THREE_LINE_TAKE_THREE_SINGLE or
		bNextType == cmd.CT_THREE_THREE_LINE_TAKE_SIX_SINGLE or
		bNextType == cmd.CT_FOUR_THREE_LINE_TAKE_FOUR_SINGLE or
		true == bSpecial then
		local nextResult = GameLogic:AnalyseCardData(bNextList)
		local firstResult = GameLogic:AnalyseCardData(bFirstList)
		return firstResult.bThreeLogicValue[1] > nextResult.bThreeLogicValue[1]
	end
end

--搜索可出之牌
--[[
	@bCardData 		手牌数据	
	@bTurnCardData 	上玩家出的牌
	@isLastOne   	手牌最后一张标识
	@bFirstOutSpade 黑桃3是否首出
  ]]
function GameLogic:SearchOutCard(bCardData, bTurnCardData,isLastOne,bFirstOutSpade,cbFirstOutCard)

	--初始化结果
	local outCardResult = {}
	outCardResult.cbCardCount = 0
	outCardResult.cbResultCard = {}
	if nil == bCardData or nil == bTurnCardData or #bCardData == 0 then
		return outCardResult
	end

	local bCardCount = #bCardData
	GameLogic:SortCardList(bCardData)
	local bTurnCardCount
	--排序
	GameLogic:SortCardList(bTurnCardData)
	--计录长度
	bTurnCardCount = #bTurnCardData
	--特殊情况(如果手牌只有4张时是可以出3带一，也可以接别人3带2的牌比如：上家出（33345）下家只有4张牌（4443）或者只有3张牌（444）是可以接上家的牌。)
	--特殊情况(上家连三同带四牌型，444 555 6 7 8 9，自己手牌 666 777 or 666 777 8 or 666 777 8 9 or 666 777 8 9 10 都可以出)
	local bSpecial = false
	if ((bCardCount == 3 or bCardCount == 4 ) and (#bTurnCardData == 5)) or 
		 ((bCardCount == 6 or bCardCount == 7 or bCardCount == 8 or bCardCount == 9) and (#bTurnCardData == 10)) then
		bSpecial =  true
	end
	--长度判断
	if bTurnCardCount > bCardCount and not bSpecial then
		return outCardResult
	end


	local bTurnOutType = GameLogic:GetCardType(bTurnCardData)
	print("bTurnOutType is ====",bTurnOutType)
	if bTurnOutType == cmd.CT_ERROR then 			--错误类型（新一轮自己出牌）
		print("错误类型")

		if isLastOne then  --如果下家只剩下一张牌，自己只能出最大牌值
			outCardResult.cbResultCard[1] = bCardData[1]
			outCardResult.cbCardCount = 1
			return outCardResult
		end

	
		--如果有黑桃3 一定要先出
		print("bFirstOutSpade is =========",bFirstOutSpade)
		if bFirstOutSpade then
			for i = bCardCount, 1, -1 do
				if bCardData[i] == cbFirstOutCard then
					 outCardResult.cbCardCount = 1
					 outCardResult.cbResultCard[1] = cbFirstOutCard
					 return outCardResult
				end
			end
		end


		--连三同(666 777 888 999)
		while true do
			--分析扑克
			local analyseResult = GameLogic:AnalyseCardData(bCardData)
			local cardType = GameLogic:GetCardType(bCardData)
			if cardType == cmd.CT_MORE_THREE_LINE then
				outCardResult.cbCardCount = analyseResult.bThreeCount*3
				for i=1,analyseResult.bThreeCount*3 do 
					outCardResult.cbResultCard[i] = analyseResult.bThreeCardData[i]
				end
				return outCardResult	
			else
				break
			end
		end


		--连同三张带牌（正常情况下只能连同三张带四牌型，手牌不够的情况下可以出连同三张带一牌型，连同三张带二牌型，连同三张带三牌型）
		if bCardCount == 7 or bCardCount == 8 or bCardCount == 9 or bCardCount == 10 then
			GameLogic:SortCardList(bCardData)
			local temp = clone(bCardData)
			local analyseResult = GameLogic:AnalyseCardData(temp)
			if (analyseResult.bThreeCount == 2) and (math.abs(analyseResult.bThreeLogicValue[1] - analyseResult.bThreeLogicValue[2]) == 1) and
			     (analyseResult.bThreeLogicValue[1] ~= 15)  then 
				outCardResult.cbCardCount = bCardCount
				--三张
				for i=1,analyseResult.bThreeCount*3 do 
					outCardResult.cbResultCard[i] = analyseResult.bThreeCardData[i]
				end

				self:RemoveCard(outCardResult.cbResultCard, temp)

				for i=1,#temp do
					outCardResult.cbResultCard[6+i] = temp[i]
				end
			end
			if outCardResult.cbCardCount > 0 then
				return outCardResult
			else
				
				outCardResult.cbResultCard = {}
			end
		end
	

		--获取数值
		dump(bCardData, "the card data is ", 6)

		local bLogicValue = GameLogic:GetCardLogicValue(bCardData[bCardCount])
		--多牌判断
		local cbSameCount = 1
		for i = bCardCount - 1, 1 , -1 do
			if GameLogic:GetCardLogicValue(bCardData[i]) == bLogicValue then
				cbSameCount = cbSameCount + 1
			else
				break
			end
		end

		--最后一手是3带1或3带2
		if cbSameCount == 3 and  (bCardCount == 4 or  bCardCount == 5) then
			outCardResult.cbCardCount = bCardCount
			for i=1,bCardCount do
				outCardResult.cbResultCard[i] = bCardData[bCardCount - i + 1]
			end

			return outCardResult
		end

		--一对 三张 四张
		if cbSameCount == 2 or (cbSameCount == 3 and bCardCount == 3)  or (cbSameCount == 4 and bCardCount == 4)then
			outCardResult.cbCardCount = cbSameCount
			for i=1,cbSameCount do
				outCardResult.cbResultCard[i] = bCardData[bCardCount - i + 1]
			end

			return outCardResult
		end

		--单张(炸弹不拆)
		local analyseResult = GameLogic:AnalyseCardData(bCardData)
		if analyseResult.bFourCount >= 1 then
			for i=bCardCount,1,-1 do
				local bBomb = true
				local value = bCardData[i]
				for j=1,analyseResult.bFourCount do
					if analyseResult.bFourLogicValue[j] ~= self:GetCardLogicValue(value)  then 
						bBomb = false
						outCardResult.cbCardCount = 1
						outCardResult.cbResultCard[1] =  value
						return outCardResult
					end
				end
			end

			outCardResult.cbCardCount = 4
			for i=1,4 do
				outCardResult.cbResultCard[i] = bCardData[i]
			end
			return outCardResult
		end		

		outCardResult.cbCardCount = 1
		outCardResult.cbResultCard[1] =  bCardData[bCardCount]
		
	elseif bTurnOutType == cmd.CT_SINGLE then 				--单张
		print("单张")
		local bLogicValue = GameLogic:GetCardLogicValue(bTurnCardData[1])

		if isLastOne == true then
			local maxCardsValue = 0
			local MaxIndex = 0
			for i = bCardCount, 1, -1 do
				if GameLogic:GetCardLogicValue(bCardData[i]) > bLogicValue  then
					if GameLogic:GetCardLogicValue(bCardData[i]) >= maxCardsValue then
						maxCardsValue = GameLogic:GetCardLogicValue(bCardData[i])
						MaxIndex = i
					end
				end
			end
			if 0 ~= MaxIndex  then
				outCardResult.cbResultCard[1] = bCardData[MaxIndex]
				outCardResult.cbCardCount = 1
			end
			
			return outCardResult
		end

		for i = bCardCount, 1, -1 do
			if GameLogic:GetCardLogicValue(bCardData[i]) > bLogicValue then
				outCardResult.cbResultCard[1] = bCardData[i]
				outCardResult.cbCardCount = 1
				return outCardResult
			end
		end
	elseif bTurnOutType == cmd.CT_SINGLE_LINE then 			--单连
		print("单连")
		--获取数值
		local bLogicValue = GameLogic:GetCardLogicValue(bTurnCardData[bTurnCardCount])
		--搜索连牌
		for i = bCardCount, bTurnCardCount, -1 do
			local bBreak = false
			--获取数值
			local bHandLogicValue = GameLogic:GetCardLogicValue(bCardData[i])
			if bHandLogicValue > bLogicValue then
				--搜索连牌
				local bLineCount = 0
				for j = i, 1, -1 do
					local bValue = GameLogic:GetCardLogicValue(bCardData[j])
					if bValue >= 15 then  	--构造判断
						break
					end
					if bValue - bLineCount == bHandLogicValue then
						--增加连数
						outCardResult.cbResultCard[bLineCount + 1] = bCardData[j]
						bLineCount = bLineCount + 1
						--完成判断
						if bLineCount == bTurnCardCount then
							outCardResult.cbCardCount = bTurnCardCount
							bBreak = true
							break
						end
					end
				end
			end
			if bBreak then
				break
			end
		end
	elseif bTurnOutType == cmd.CT_DOUBLE_LINE then 		--对连
		print("对连")
		--长度判断
		if bCardCount < bTurnCardCount then 
			return outCardResult
		end

		local bLogicValue = GameLogic:GetCardLogicValue(bTurnCardData[bTurnCardCount])

		--搜素连牌
		local bLineCount = 0
		local temp = 0
		for i = bCardCount,2,-1 do 
			if (GameLogic:GetCardLogicValue(bCardData[i]) == GameLogic:GetCardLogicValue(bCardData[i-1])) and 
				(GameLogic:GetCardLogicValue(bCardData[i]) > bLogicValue) and
				(GameLogic:GetCardLogicValue(bCardData[i]) > temp)  then 
				local bContinue = false
				if temp > 0 then
					if GameLogic:GetCardLogicValue(bCardData[i]) - temp == 0 then
						bContinue = true
					elseif GameLogic:GetCardLogicValue(bCardData[i]) - temp > 1 then
						
						bContinue = false
						bLineCount = 0
					end
				end

				if not bContinue then
					outCardResult.cbResultCard[bLineCount*2+1] = bCardData[i]
					outCardResult.cbResultCard[bLineCount*2+2] = bCardData[i-1]
					bLineCount = bLineCount + 1
					temp = GameLogic:GetCardLogicValue(bCardData[i])
					if bLineCount*2 == bTurnCardCount then
						outCardResult.cbCardCount = bTurnCardCount
						return outCardResult
					end
				end
			end
		end

		--炸弹管非炸弹
		outCardResult.cbCardCount = 0
		outCardResult.cbResultCard = {}
		self:SearchBomb(bTurnOutType, outCardResult, bCardData)
		return outCardResult
	elseif bTurnOutType == cmd.CT_MORE_THREE_LINE then
			--找出连同三张
		GameLogic:SortCardList(bCardData)	
		local analyseResult = GameLogic:AnalyseCardData(bCardData)

		local temp = clone(bTurnCardData) 
		GameLogic:SortCardList(temp)
		local analyseResult1 = GameLogic:AnalyseCardData(temp)


		if analyseResult.bThreeCount*3 >= #bTurnCardData  then 	
			local result = {}

			local i = 1
			if analyseResult.bThreeLogicValue[1] == 15 then --排除222
				i = i + 1
			end

			for idx=1,3 do
				table.insert(result, analyseResult.bThreeCardData[i*3-idx+1])
			end

			while i < analyseResult.bThreeCount do
				if analyseResult.bThreeLogicValue[i + 1] == analyseResult.bThreeLogicValue[i] - 1 and analyseResult.bThreeLogicValue[i + 1] > analyseResult1.bThreeLogicValue[analyseResult1.bThreeCount]  then
					for idx=1,3 do
						table.insert(result, analyseResult.bThreeCardData[(i+1)*3-idx+1])
					end
				end
				i = i + 1
			end

			if #result >= #bTurnCardData then
				outCardResult.cbCardCount = #bTurnCardData
				for i=1,#bTurnCardData do
					outCardResult.cbResultCard[i] = result[#result-i+1]
				end
			end
		end	

	elseif (bTurnOutType == cmd.CT_TWO_THREE_LINE_TAKE_TWO_SINGLE) or
		(bTurnOutType == cmd.CT_TWO_THREE_LINE_TAKE_FOUR_SINGLE) or 
		(bTurnOutType == cmd.CT_TWO_THREE_LINE_TAKE_TWO_DOUBLE) or
		(bTurnOutType == cmd.CT_TWO_THREE_LINE_TAKE_OTHER) then

		--找出连同三张
		GameLogic:SortCardList(bCardData)	
		local analyseResult = GameLogic:AnalyseCardData(bCardData)

		local temp = clone(bTurnCardData)  
		GameLogic:SortCardList(temp)
		local analyseResult1 = GameLogic:AnalyseCardData(temp)
		if analyseResult.bThreeCount >= 2 then 
			local bLine = false
			local lineResult = {}
			for i=2,analyseResult.bThreeCount do
				if math.abs(analyseResult.bThreeLogicValue[i] - analyseResult.bThreeLogicValue[i-1]) == 1  then
					if analyseResult.bThreeLogicValue[i-1] > analyseResult1.bThreeLogicValue[1] then
						bLine = true
						
						for j=1,6 do
							outCardResult.cbResultCard[j] = analyseResult.bThreeCardData[(i-1)*6-j+1]
						end

						local copy = clone(bCardData)
						self:RemoveCard(outCardResult.cbResultCard, copy)
						if (#copy >= 0) and (#copy <= 4)  then
							outCardResult.cbCardCount = 6 + #copy
							if #copy > 0 then
								for k=1,#copy do
									outCardResult.cbResultCard[6+k] = copy[k]
								end
							end
							return outCardResult
						elseif #copy >4  then
							outCardResult.cbCardCount = 10
							GameLogic:SortCardList(copy)
							outCardResult.cbResultCard[7]  =  copy[#copy]
							outCardResult.cbResultCard[8]  =  copy[#copy-1]
							outCardResult.cbResultCard[9]  =  copy[#copy-2]
							outCardResult.cbResultCard[10] =  copy[#copy-3]	

							return outCardResult
						end
						break
					end
				end
			end
		end	
	elseif bTurnOutType == cmd.CT_THREE_LINE or 		 --三连
		bTurnOutType == cmd.CT_THREE_LINE_TAKE_SINGLE or --三带单
		bTurnOutType == cmd.CT_THREE_LINE_TAKE_DOUBLE or --三带对
		bTurnOutType == cmd.CT_THREE_TAKE_TWO_SINGLE then--三带两单

		print("三带")
		--获取数值
		local bLogicValue = 0
		for i = bTurnCardCount, 3, -1 do
			bLogicValue = GameLogic:GetCardLogicValue(bTurnCardData[i])
			if GameLogic:GetCardLogicValue(bTurnCardData[i - 1]) == bLogicValue and
				GameLogic:GetCardLogicValue(bTurnCardData[i - 2]) == bLogicValue then
				break
			end
		end
		--属性数值
		local bTurnLineCount = 0
		if bTurnOutType == cmd.CT_THREE_LINE_TAKE_SINGLE then
			bTurnLineCount = bTurnCardCount/4
		elseif bTurnOutType == cmd.CT_THREE_LINE_TAKE_DOUBLE then
			bTurnLineCount = bTurnCardCount/5
		elseif bTurnOutType == cmd.CT_THREE_TAKE_TWO_SINGLE then
			bTurnLineCount = math.floor(bTurnCardCount/5)	
		else
			bTurnLineCount = bTurnCardCount/3
		end
		outCardResult.cbCardCount = 0
		outCardResult.cbResultCard = {}
		--搜索连牌
		for i = bCardCount, bTurnLineCount*3, -1 do
			local bBreak = false
			--获取数值
			local bHandLogicValue = GameLogic:GetCardLogicValue(bCardData[i])
			if bHandLogicValue > bLogicValue then
				--搜索连牌
				local bLineCount = 0
				for j = i, 3, -1 do
					--三牌判断
					
					if GameLogic:GetCardLogicValue(bCardData[j]) - bLineCount == bHandLogicValue and
						GameLogic:GetCardLogicValue(bCardData[j - 1]) - bLineCount == bHandLogicValue and
						GameLogic:GetCardLogicValue(bCardData[j - 2]) - bLineCount == bHandLogicValue then
						--增加连数
						outCardResult.cbResultCard[bLineCount*3 + 1] = bCardData[j - 2]
						outCardResult.cbResultCard[bLineCount*3 + 2] = bCardData[j - 1]
						outCardResult.cbResultCard[bLineCount*3 + 3] = bCardData[j]
						bLineCount = bLineCount + 1
						
						--完成判断
						if bLineCount == bTurnLineCount then
							--连牌设置
							outCardResult.cbCardCount = bLineCount*3
							--构造扑克
							local bLeftCount = bCardCount - outCardResult.cbCardCount
							local bLeftCardData = {}
							for i = 1, bCardCount do
								bLeftCardData[i] = bCardData[i]
							end
							GameLogic:RemoveCard(outCardResult.cbResultCard, bLeftCardData)
							--分析扑克
							local analyseResult = GameLogic:AnalyseCardData(bLeftCardData)
							--单牌处理
							if bTurnOutType == cmd.CT_THREE_LINE_TAKE_SINGLE or bTurnOutType == cmd.CT_THREE_TAKE_TWO_SINGLE then
								
								--提取单牌
								for k = analyseResult.bSignedCount, 1, -1 do
									

									--终止判断
									if outCardResult.cbCardCount == bTurnCardCount  then
										break
									end
									--设置扑克
									local bSignedCard = analyseResult.bSignedCardData[k]
									outCardResult.cbResultCard[outCardResult.cbCardCount + 1] = bSignedCard
									outCardResult.cbCardCount = outCardResult.cbCardCount + 1
								end
								
								
								for k = analyseResult.bDoubleCount*2, 1, -2 do
									

									for m=1,2 do
										if outCardResult.cbCardCount >= bTurnCardCount then
											break
										end
										local bCardData = analyseResult.bDoubleCardData[k -m+1]
										outCardResult.cbResultCard[outCardResult.cbCardCount + 1] = bCardData
										outCardResult.cbCardCount = outCardResult.cbCardCount +1
									end
								end
								
								for k = analyseResult.bThreeCount*3, 1, -3 do
									
									

									for m=1,2 do
										if outCardResult.cbCardCount >= bTurnCardCount then
											break
										end
										local bCardData = analyseResult.bThreeCardData[k -m+1]
										outCardResult.cbResultCard[outCardResult.cbCardCount + 1] = bCardData
										outCardResult.cbCardCount = outCardResult.cbCardCount +1
									end
								end

								
							elseif bTurnOutType == cmd.CT_THREE_LINE_TAKE_DOUBLE then
								print("=======================6666")
								--提取单牌
								for k = analyseResult.bSignedCount, 1, -1 do

									
									

									--终止判断
									if outCardResult.cbCardCount >= bTurnCardCount  then
										break
									end
									--设置扑克
									local bSignedCard = analyseResult.bSignedCardData[k]
									outCardResult.cbResultCard[outCardResult.cbCardCount + 1] = bSignedCard
									outCardResult.cbCardCount = outCardResult.cbCardCount + 1

								end

								--dump(outCardResult.cbResultCard,"=====================1")
								--提取对牌
								for k = analyseResult.bDoubleCount*2, 1, -2 do
									

									for m=1,2 do
										if outCardResult.cbCardCount >= bTurnCardCount then
											break
										end
										local bCardData = analyseResult.bDoubleCardData[k -m+1]
										outCardResult.cbResultCard[outCardResult.cbCardCount + 1] = bCardData
										outCardResult.cbCardCount = outCardResult.cbCardCount +1
									end
								end

								--dump(outCardResult.cbResultCard,"=====================2")
								--提取三牌
								for k = analyseResult.bThreeCount*3, 1, -3 do
									
									

									for m=1,2 do
										if outCardResult.cbCardCount >= bTurnCardCount then
											break
										end
										local bCardData = analyseResult.bThreeCardData[k -m+1]
										outCardResult.cbResultCard[outCardResult.cbCardCount + 1] = bCardData
										outCardResult.cbCardCount = outCardResult.cbCardCount +1
									end
								end


								
								
							end

							if outCardResult.cbCardCount >= bTurnCardCount then
								
								local allanalyseResult = GameLogic:AnalyseCardData(bCardData)

								if allanalyseResult.bFourCount ==0 then
									bBreak = true
									break
								else
									
								
									for n=1,allanalyseResult.bFourCount do
										if allanalyseResult.bFourLogicValue[n] == GameLogic:GetCardLogicValue(outCardResult.cbResultCard[1]) then
											
											outCardResult.cbCardCount = 0 
											outCardResult.cbResultCard = {}
											break
										elseif n ==allanalyseResult.bFourCount then
											bBreak = true
											break
										end
									end
								end

							end
							
						end
					end
				end
			end
			if bBreak then
				break
			end
		end
	elseif bTurnOutType == cmd.CT_BOMB then 		--炸弹
		print("炸弹")
		--获取数值
		local bLogicValue = GameLogic:GetCardLogicValue(bTurnCardData[bTurnCardCount])
		--搜索炸弹
		for i = bCardCount , 4, -1 do
			--获取数值
			local bHandLogicValue = GameLogic:GetCardLogicValue(bCardData[i])
			--构造判断
			if bHandLogicValue > bLogicValue then
				--炸弹判断
				local j = i - 1
				while j >= i - 3 do
					if GameLogic:GetCardLogicValue(bCardData[j]) ~= bHandLogicValue then
						break
					end
					j = j - 1
				end
				--完成处理
				if j == i - 4 then
					outCardResult.cbCardCount = bTurnCardCount
					outCardResult.cbResultCard[1] = bCardData[i - 3]
					outCardResult.cbResultCard[2] = bCardData[i - 2]
					outCardResult.cbResultCard[3] = bCardData[i - 1]
					outCardResult.cbResultCard[4] = bCardData[i]
					break
				end
			end
		end
	end
	--炸弹管非炸弹
	if bTurnOutType ~= cmd.CT_BOMB and outCardResult.cbCardCount == 0 then
		print("comming?")
		for i = bCardCount , 4, -1 do
			--获取数值
			local bHandLogicValue = GameLogic:GetCardLogicValue(bCardData[i])
			--炸弹判断
			local j = i - 1
			while j >= i - 3 do
				if GameLogic:GetCardLogicValue(bCardData[j]) ~= bHandLogicValue then
					break
				end
				j = j - 1
			end
			--完成处理
			if j == i - 4 then
				outCardResult.cbCardCount = 4
				outCardResult.cbResultCard = {}
				outCardResult.cbResultCard[1] = bCardData[i - 3]
				outCardResult.cbResultCard[2] = bCardData[i - 2]
				outCardResult.cbResultCard[3] = bCardData[i - 1]
				outCardResult.cbResultCard[4] = bCardData[i]
				break
			end
		end
	end

	return outCardResult
end

--查找炸弹
function GameLogic:SearchBomb(bTurnOutType, outCardResult, bCardData)
	if bTurnOutType ~= cmd.CT_BOMB and outCardResult.cbCardCount == 0 then
		local bCardCount = #bCardData
		for i = bCardCount , 4, -1 do
			--获取数值
			local bHandLogicValue = GameLogic:GetCardLogicValue(bCardData[i])
			--炸弹判断
			local j = i - 1
			while j >= i - 3 do
				if GameLogic:GetCardLogicValue(bCardData[j]) ~= bHandLogicValue then
					break
				end
				j = j - 1
			end
			--完成处理
			if j == i - 4 then
				outCardResult.cbCardCount = 4
				outCardResult.cbResultCard = {}
				outCardResult.cbResultCard[1] = bCardData[i - 3]
				outCardResult.cbResultCard[2] = bCardData[i - 2]
				outCardResult.cbResultCard[3] = bCardData[i - 1]
				outCardResult.cbResultCard[4] = bCardData[i]
				break
			end
		end
	end
end

return GameLogic