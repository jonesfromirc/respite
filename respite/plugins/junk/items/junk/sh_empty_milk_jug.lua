ITEM.name = "Empty Milk Jug"
ITEM.uniqueID = "j_empty_milk_jug"
ITEM.model = "models/props_junk/garbage_milkcarton001a.mdl"
ITEM.desc = "An empty milk jug, it smells like rotten milk.\nThis container can be filled with water."
ITEM.flag = "j"
ITEM.width = 2
ITEM.height = 2

ITEM.data = { scrapamount = 2 }
ITEM.salvItem = "j_scrap_plastics"

ITEM.functions.Fill = {
	icon = "icon16/box.png",
	sound = "ambient/water/distant_drip4.wav",
	onRun = function(item)
		local client = item.player
		local position = client:getItemDropPos()
			
		nut.item.spawn("food_water_misc", position) 
		client:notifyLocalized("Your container has been filled.")
	end,
	onCanRun = function(item)
		local client = item:getOwner() or item.player
		if(client:WaterLevel() < 1) then
			return false
		end
	end
}