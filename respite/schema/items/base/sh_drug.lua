ITEM.name = "Drug Base"
ITEM.model = "models/healthvial.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.desc = ""
ITEM.category = "Medical"
ITEM.flag = "v"
ITEM.duration = 30

-- sorry, for name order.
ITEM.functions._use = { 
	name = "Use",
	tip = "useTip",
	icon = "icon16/pill.png",
	onRun = function(item)
		local client = item.player
		local char = client:getChar()
		if (char and client:Alive()) then
			if (item.attribBoosts) then
				for k, v in pairs(item.attribBoosts) do
					char:addBoost(item.uniqueID, k, v)
				end
			end
			
			local charID = char:getID()
			local name = item.name
			timer.Create("DrugEffect_" .. item.uniqueID .. "_" .. client:EntIndex(), item.duration, 1, function()
				if (client and IsValid(client)) then
					local curChar = client:getChar()
					if (curChar and curChar:getID() == charID) then
						client:notify(Format("%s has worn off.", name))

						if (item.attribBoosts) then
							for k, v in pairs(item.attribBoosts) do
								char:removeBoost(item.uniqueID, k)
							end
						end
					end
				end
			end)
			
			if(item:getData("Amount", 0) > 1) then --for drugs that stack
				item:setData("Amount", item:getData("Amount") - 1)
				return false
			else
				return true
			end
		end
		return false
	end,
	onCanRun = function(item)
		return (!IsValid(item.entity))
	end
}


local quality = {}
quality[0] = "Terrible"
quality[1] = "Awful"
quality[2] = "Bad"
quality[3] = "Poor"
quality[4] = "Normal"
quality[5] = "Decent"
quality[6] = "Good"
quality[7] = "Great"
quality[8] = "Excellent"
quality[9] = "Master"
quality[10] = "Perfect"

function ITEM:getDesc()
	local desc = self.desc
	
	if(self:getData("quality") != nil) then
		desc = desc .. "\nQuality: " .. quality[math.Round(self:getData("quality"))]
	end
	
	return Format(desc)
end
