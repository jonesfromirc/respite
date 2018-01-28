ITEM.name = "Device - Breakfaster"
ITEM.uniqueID = "breakfaster"
ITEM.model = "models/props_lab/filecabinet02.mdl"
ITEM.material = "phoenix_storms/plastic"
ITEM.desc = "An object that has an openable door that objects can be placed into, and an output slot."
ITEM.width = 2
ITEM.height = 2
ITEM.flag = "v"
ITEM.price = 500
ITEM.category = "Machines"
ITEM.color = Color(50, 150, 50)

ITEM.data = { producing2 = 0 }

ITEM.iconCam = {
	pos = Vector(332.59982299805, 279.31066894531, 202.58592224121),
	ang = Angle(25, 220, 0),
	fov = 5.2785362827253,
}

ITEM.functions.Milk = {
	name = "Milk",
	icon = "icon16/cup.png",
	sound = "HL1/fvox/hiss.wav",
	onRun = function(item)
		local client = item.player
		local inventory = client:getChar():getInv()
		
		local water = inventory:hasItem("food_water") or inventory:hasItem("food_water_mountain") or inventory:hasItem("food_blood")
		if(!water) then
			client:notify("You need water.")
			return false
		end
		
		local organic = inventory:hasItem("j_scrap_organic")
		
		if(!organic) then --need organic materials
			client:notify("You need five organic material.")
			return false
		end
		
		local amount = organic:getData("Amount", 1)
		
		if(amount < 5) then --need a certain amount of said materials
			client:notify("You need five organic material.")
			return false
		end
		
		if(amount > 5) then --if more than five, subtract from the stack.
			organic:setData("Amount", amount - 5)
		else --if five, just remove the item.
			organic:remove()
		end
		
		
		client:notify("Converting has started.")
		nut.chat.send(client, "itclose", "The machine accepts the objects, and begins to make some strange squishing noises.")	
		
		item:setData("producing2", CurTime())
		
		water:remove()
		
		timer.Simple(30, 
			function()
				timer.Simple(amount, 
					function()
						local reward = "food_milk_carton"
						if(math.random(0,3) == 3) then --25% chance to get milk jug
							reward = "food_milk_jug"
						end
					
						if(!IsValid(item:getEntity())) then --checks if item is not on the ground
							if(!inventory:add(reward)) then --if the inventory has space, put it in the inventory
								nut.item.spawn(reward, client:getItemDropPos()) --if not, drop it on the ground
							end
						else --if the item is on the ground
							nut.item.spawn(reward, item:getEntity():GetPos() + item:getEntity():GetUp()*50) --spawn the grow item above the item
						end
					end
				)
				client:notify("Converting has finished.")
				nut.chat.send(client, "itclose", "A container filled with milk comes out of the device.")
			end
		)
		
		return false
	end,
	onCanRun = function(item) --only one conversion action should be happening at once with one item.
		local player = item.player or item:getOwner()
		local endTime = item:getData("producing2") + 45
		if (CurTime() > endTime or item:getData("producing2") > CurTime() or item:getData("producing2") == 0) then
			return true 
		else
			return false
		end
	end
}

ITEM.functions.Egg = {
	name = "Egg",
	icon = "icon16/cup.png",
	sound = "HL1/fvox/hiss.wav",
	onRun = function(item)
		local client = item.player
		local inventory = client:getChar():getInv()
		
		local water = inventory:hasItem("food_water") or inventory:hasItem("food_water_mountain") or inventory:hasItem("food_blood")
		if(!water) then
			client:notify("You need water.")
			return false
		end
		
		local organic = inventory:hasItem("j_scrap_organic")
		
		if(!organic) then --need organic materials
			client:notify("You need two organic material.")
			return false
		end
		
		local amount = organic:getData("Amount", 1)
		
		if(amount < 2) then --need a certain amount of said materials
			client:notify("You need two organic material.")
			return false
		end
		
		if(amount > 2) then --if more than five, subtract from the stack.
			organic:setData("Amount", amount - 2)
		else --if five, just remove the item.
			organic:remove()
		end
		
		
		client:notify("Converting has started.")
		nut.chat.send(client, "itclose", "The machine accepts the objects, and begins to make some strange squishing noises.")	
		
		item:setData("producing2", CurTime())
		
		water:remove()
		
		timer.Simple(45, 
			function()
				timer.Simple(amount, 
					function()
						local reward = "food_egg"
					
						if(!IsValid(item:getEntity())) then --checks if item is not on the ground
							if(!inventory:add(reward)) then --if the inventory has space, put it in the inventory
								nut.item.spawn(reward, client:getItemDropPos()) --if not, drop it on the ground
							end
						else --if the item is on the ground
							nut.item.spawn(reward, item:getEntity():GetPos() + item:getEntity():GetUp()*50) --spawn the grow item above the item
						end
					end
				)
				client:notify("Converting has finished.")
				nut.chat.send(client, "itclose", "A single egg comes out of the device.")
			end
		)
		
		return false
	end,
	onCanRun = function(item) --only one conversion action should be happening at once with one item.
		local player = item.player or item:getOwner()
		local endTime = item:getData("producing2") + 45
		if (CurTime() > endTime or item:getData("producing2") > CurTime() or item:getData("producing2") == 0) then
			return true 
		else
			return false
		end
	end
}