
local workshopIDs = { 
132470017, --lantern
104648051, --hl2 drivable
121438260, --glowsticks
415143062, --tfa base
296202013, --prosp content 1
575907820, --prosp content decals
795055947, --blood and gore 4
479464165, --pac gear
160250458, --wire
380225333, --nextbot zombies 2.0
296806391, --nextbot zombies 2.0 (zombie survival)
246756300, --3d stream radio
609281761, --prone mod models
106867422, --classic light stool
727161410, --witcher gates
685130934, --serverguard content
774729099, --respite npc content
778916461, --respite misc content
288026358, --tank
771487490, --simfphys vehicles
831680603, --simfphys armed vehicles
207739713, --nutscript content
880425071, --respite content 1
880423690, --respite content 2
880417421, --respite content 3
899354382, --respite effects
1076723138, --tfa content 1
1076732010, --tfa content 2
1076706011, --tfa content 3

--[[
player models
--]]

760262099, --tnb 1
760268522, --tnb 3
760265535, --tnb 2
873882787, --tnb 4
760255843, --tnb items
760256673, --tnb combine

--[[
Temporary Things (Like Maps)
--]]

337486491 --rp_lr_refuge

}

for k, v in pairs(workshopIDs) do

	resource.AddWorkshop(v)

end

function SCHEMA:OnCharCreated(client, character)
	local inventory = character:getInv()

	if (inventory) then		
		if (character:getFaction() == FACTION_SURVIVOR) then
			inventory:add("book_newchar", 1)
			inventory:add("book_combat", 1)
			inventory:add("food_water", 2)
			inventory:add("food_yams", 2)	
		elseif (character:getFaction() == FACTION_PLASTIC) then
			inventory:add("book_newchar", 1)
			inventory:add("book_combat", 1)
			inventory:add("cube_chip", 3)
			inventory:add("food_water_misc", 1)
			inventory:add("food_apple_plastic", 2)
			character:giveFlags("M")
		elseif (character:getFaction() == FACTION_ABER) then
			inventory:add("book_newchar", 1)
			inventory:add("book_combat", 1)
			inventory:add("haze_bottled", 1)
			inventory:add("food_banana", 1)
		end
	end
end 

function SCHEMA:PrePlayerLoadedChar(client, character, currentChar)
	if (character:getFaction() == FACTION_PLASTIC) then --material for plastic faction
		client:SetMaterial("phoenix_storms/mrref2")
	else
		client:SetMaterial("") --necessary for char swapping from plastic to anything else
	end
end

function SCHEMA:PlayerSpawnEffect(client, weapon, info)
	return client:IsAdmin() or client:getChar():hasFlags("E")
end

function SCHEMA:PlayerSpray(client)
    return true
end

function SCHEMA:Initialize()
	game.ConsoleCommand("net_maxfilesize 64\n");
	game.ConsoleCommand("sv_kickerrornum 0\n");

	game.ConsoleCommand("sv_allowupload 0\n");
	game.ConsoleCommand("sv_allowdownload 0\n");
	game.ConsoleCommand("sv_allowcslua 0\n");
end

--[[
function SCHEMA:PlayerSay(client, message)
	local chatType, message, anonymous = nut.chat.parse(client, message, true)

	if (chatType == "ic") then
		if (nut.command.parse(client, message)) then
			return ""
		end
	end

	nut.chat.send(client, chatType, message, anonymous)

	hook.Run("PostPlayerSay", client, message, chatType, anonymous)

	return ""
end
--]]

function SCHEMA:PostPlayerSay(client, message, chatType, anonymous)
	nut.log.add(client:Name().." said ["..chatType:upper().."] \""..message.."\"")
end
