ITEM.name = "Charger"
ITEM.uniqueID = "charger"
ITEM.model = "models/props_combine/suit_charger001.mdl"
ITEM.material = "models/props_wasteland/quarryobjects01"
ITEM.desc = "A strange metal box, It has a large slot that is labelled 'BATTERY', another slot labelled 'COINS', and a small output slot labelled 'CHARGED'."
ITEM.width = 2
ITEM.height = 2
ITEM.flag = "v"
ITEM.price = 500
ITEM.category = "Machines"
ITEM.color = Color(128, 128, 128)

ITEM.iconCam = {
	pos = Vector(200, 0, 0),
	ang = Angle(180, -0, 180),
	fov = 14,
}

ITEM.functions.Charge = {
	name = "Charge Battery",
	icon = "icon16/lightning.png",
	sound = "ambient/energy/zap9.wav",
	onRun = function(item)
		local client = item.player
		local position = client:getItemDropPos()
		local inventory = client:getChar():getInv()
		local battery = inventory:hasItem("j_battery_dead")	
		local char = client:getChar()
		
		nut.chat.send(client, "itclose", "The machine accepts the dead battery and the money, vibrates intensely, and outputs a freshly charged battery.")
		
		char:takeMoney(40)
		battery:remove()
		
		if(!inventory:add("ammo_battery")) then
			nut.item.spawn("ammo_battery", position)
		end
		
		return false
	end,
	onCanRun = function(item)
		local player = item.player or item:getOwner()
		
		if (!player:getChar():getInv():hasItem("j_battery_dead") or player:getChar():getMoney() < 40) then --if item of importance isn't in the inventory.
			return false
		end
	end
}