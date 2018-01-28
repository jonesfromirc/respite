ITEM.name = "Rubbing Alcohol"
ITEM.model = "models/props_junk/glassjug01.mdl"
ITEM.desc = "A bottle filled with rubbing alcohol."
ITEM.uniqueID = "drug_rubbingalcohol"
ITEM.duration = 3600
ITEM.price = 30

ITEM.attribBoosts = {
	["str"] = 5,
}

ITEM.iconCam = {
	pos = Vector(-200, 0, 6),
	ang = Angle(0, -0, 0),
	fov = 2.5,
}

ITEM:hook("_use", function(item)
	item.player:EmitSound("npc/barnacle/barnacle_gulp1.wav")
	item.player:ScreenFade(1, Color(255, 255, 255, 255), 3, 0)
end)
