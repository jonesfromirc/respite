ITEM.name = "Shard Dust"
ITEM.uniqueID = "shard_dust"
ITEM.desc = "A stange dust that emits a small amount of light."
ITEM.model = "models/props_lab/box01a.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.flag = "1"
ITEM.category = "Shard"
ITEM.color = Color(255, 255, 255)
ITEM.maxstack = 45

ITEM.data = {
	Amount = 1
}

if (CLIENT) then
	function ITEM:drawEntity(entity, item)
		entity:DrawModel()
		entity:SetModelScale(.7)
		entity:DrawShadow(false)
		
		local pos = entity:GetPos()
		local dlight = DynamicLight(entity:EntIndex())
		local perc = ( ( 9000000 - CurTime() )/ 9000000 )
		dlight.Pos = pos
		dlight.r = 255
		dlight.g = 255
		dlight.b = 255
		dlight.Brightness = 3
		dlight.Size = 32
		dlight.Decay = 128
		dlight.style = 5
		dlight.DieTime = CurTime() + .1	
	end
end