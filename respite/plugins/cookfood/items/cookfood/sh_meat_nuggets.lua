ITEM.name = "Chicken Nuggets"
ITEM.model = "models/props_lab/box01a.mdl"
ITEM.material = "models/antlion/antlion_innards"
ITEM.foodDesc = "Delicious chicken nuggets."
ITEM.uniqueID = "food_nuggets"
ITEM.hungerAmount = 15
ITEM.quantity = 2
ITEM.price = 0
ITEM.width = 1
ITEM.height = 1
ITEM.mustCooked = true

ITEM.attribBoosts = { 
	["fortitude"] = 6,
	["end"] = 6
 }

ITEM.iconCam = {
	pos = Vector(-200, 0, 0),
	ang = Angle(0, -0, 0),
	fov = 3
}

ITEM.functions.Convert = {
  tip = "Convert this item",
  icon = "icon16/cross.png",
  onRun = function(item)
    if (item.player:getChar():getInv():findEmptySlot(1, 1) != nil) then
		item.player:getChar():getInv():add("j_scrap_organic", 1, { Amount = 5 })
		item:remove()
		return false 
    else
		item.player:notify("You don't have any room in your inventory!")
		return false 
    end
  end,
  onCanRun = function(item)
	if (item:getOwner() == nil) then
		return item.player:getChar():hasFlags("q") or item.player:getChar():getInv():hasItem("converter_meat")
	else
		return item:getOwner():getChar():hasFlags("q") or item:getOwner():getChar():getInv():hasItem("converter_meat")
	end
  end
}