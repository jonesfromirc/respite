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

ITEM.name = "Metal Pole"
ITEM.desc = "A long metallic pole, it is very heavy."
ITEM.model = "models/props_c17/signpole001.mdl"
ITEM.class = "hl2_m_pole"
ITEM.uniqueID = "hl2_m_pole"
ITEM.weaponCategory = "melee"
ITEM.width = 5
ITEM.height = 1
ITEM.price = 0
ITEM.flag = "v"
ITEM.category = "Weapons - Melee"

ITEM.data = { scrapamount = 5 }
ITEM.salvItem = "j_scrap_metals"

ITEM.iconCam = {
	pos = Vector(-200, 0, 54),
	ang = Angle(0, -0, 90),
	fov = 32,
}
