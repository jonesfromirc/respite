ITEM.name = "Memory Wraps"
ITEM.model = "models/props_lab/box01a.mdl"
ITEM.material = "models/props_lab/security_screens"
ITEM.width = 1
ITEM.height = 1
ITEM.healAmount = 15
ITEM.healSeconds = 1
ITEM.price = 0
ITEM.desc = "A small box filled with some strange wrappings.\nThese wrappings help deal with numbness caused by blight damage and cure mental ailments. They lose all effectiveness after used once."
ITEM.uniqueID = "medical_memory"
ITEM.flag = "v"
ITEM.container = "j_empty_bandage"
ITEM.color = Color(0, 128, 128)

ITEM.iconCam = {
	pos = Vector(89.432174682617, 74.904991149902, 54.501823425293),
	ang = Angle(25, 220, 0),
	fov = 5,
}

ITEM.cures = {
	["fort_pani"] = true, 
	["fort_nost"] = true,
	["fort_conf"] = true,
	["fort_headache"] = true,
	["fort_migraine"] = true,
	["fort_hall"] = true,
	["fort_para"] = true,
}


local function healPlayer(client, target, amount, seconds)
	hook.Run("OnPlayerHeal", client, target, amount, seconds)

	if (client:Alive() and target:Alive()) then
		local id = "nutHeal_"..FrameTime()
		timer.Create(id, 1, seconds, function()
			if (!target:IsValid() or !target:Alive()) then
				timer.Destroy(id)	
			end

			target:SetHealth(math.Clamp(target:Health() + (amount/seconds), 0, target:GetMaxHealth()))
		end)
	end
end

// On player uneqipped the item, Removes a weapon from the player and keep the ammo in the item.
ITEM.functions.use = { -- sorry, for name order.
	name = "Use",
	tip = "useTip",
	icon = "icon16/add.png",
	onRun = function(item)
		local client = item.player
		local char = client:getChar()
	
		if (item.player:Alive()) then
		
			local position = item.player:getItemDropPos()
			healPlayer(item.player, item.player, item.healAmount, item.healSeconds)
			if(item.container) then
				nut.item.spawn(item.container, position)
			end	
			
			for k, v in pairs(DISEASES.diseases) do --removes all of them for now
				if(char:getData(k) and item.cures[k]) then
					char:setData(k, nil) --removes fort diseases
					
					nut.chat.send(client, "body", table.Random(v.cure)) --sends them a message about being cured
				end
			end
		end
	end,
	onCanRun = function(item)
		local player = item.player or item:getOwner()
		local char = player:getChar()

		if (char:getFaction() == FACTION_PLASTIC) then
			return false
		end
    end
}

// On player uneqipped the item, Removes a weapon from the player and keep the ammo in the item.
ITEM.functions.usef = { -- sorry, for name order.
	name = "Use Forward",
	tip = "useTip",
	icon = "icon16/arrow_up.png",
	onRun = function(item)
		local client = item.player
		local position = client:getItemDropPos()
		local trace = client:GetEyeTraceNoCursor() -- We don't need cursors.
		local target = trace.Entity

		if (target and target:IsValid() and target:IsPlayer() and target:Alive()) then
			healPlayer(item.player, target, item.healAmount, item.healSeconds)

			return true
		end
		
		local char = target:getChar()
		for k, v in pairs(DISEASES.diseases) do --removes all of them for now
			if(char:getData(k) and item.cures[k]) then
				char:setData(k, nil) --removes fort diseases
				
				nut.chat.send(client, "body", table.Random(v.cure)) --sends them a message about being cured
			end
		end

		return false
	end,
	onCanRun = function(item)
		return (!IsValid(item.entity))
	end
}