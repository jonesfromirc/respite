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

ITEM.name = "Home Run-Away"
ITEM.desc = "A makeshift melee weapon made out of a baseball bat and a sawblade."
ITEM.model = "models/warz/melee/baseballbat.mdl"
ITEM.class = "hl2_m_homerunaway"
ITEM.uniqueID = "hl2_m_homerunaway"
ITEM.weaponCategory = "melee"
ITEM.width = 3
ITEM.height = 1
ITEM.price = 0
ITEM.flag = "v"
ITEM.category = "Weapons - Melee"

ITEM.salvItem = {
	["j_scrap_metals"] = 3,
	["j_scrap_wood"] = 3
}

ITEM.iconCam = {
	pos = Vector(-200, 0, 5),
	ang = Angle(0, -0, 90),
	fov = 8.5,
}
