--[[
    NutScript is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    NutScript is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with NutScript.  If not, see <http://www.gnu.org/licenses/>.
--]]

ITEM.name = "Fire Axe"
ITEM.desc = "A sharp tool made out of metal and wood, used for chopping."
ITEM.model = "models/warz/melee/fireaxe.mdl"
ITEM.class = "hl2_m_fireaxe"
ITEM.weaponCategory = "melee"
ITEM.width = 3
ITEM.height = 1
ITEM.price = 0
ITEM.flag = "v"
ITEM.category = "Weapons - Melee"

ITEM.salvItem = {
	["j_scrap_metals"] = 2,
	["j_scrap_wood"] = 5
}

ITEM.iconCam = {
	pos = Vector(-200, -1, -3),
	ang = Angle(0, -0, 90),
	fov = 11,
}