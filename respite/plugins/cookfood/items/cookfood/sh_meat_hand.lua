ITEM.name = "Human Hand"
ITEM.uniqueID = "food_human_hand"
ITEM.model = "models/dismemberment/gibs/arms/hand.mdl"
ITEM.hungerAmount = 20
ITEM.foodDesc = "A hand that was once connected to a human being."
ITEM.quantity = 1
ITEM.price = 100
ITEM.width = 1
ITEM.height = 1
ITEM.color = Color(150,50,50)

ITEM.attribBoosts = { ["fortitude"] = 10 }

ITEM.iconCam = {
	pos = Vector(0, 1.25, 200),
	ang = Angle(90, 0, 0),
	fov = 1.8,
}

ITEM.functions.Convert = {
  tip = "Convert this item",
  icon = "icon16/cross.png",
  onRun = function(item)
    if (item.player:getChar():getInv():findEmptySlot(1, 1) != nil) then
		item.player:getChar():getInv():add("j_scrap_organic", 1, { Amount = 2 })
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