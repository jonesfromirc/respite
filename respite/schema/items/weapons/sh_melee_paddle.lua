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

ITEM.name = "Canoe Paddle"
ITEM.desc = "A wooden paddle used to move a canoe."
ITEM.model = "models/warz/melee/canoepaddle.mdl"
ITEM.class = "hl2_m_paddle"
ITEM.weaponCategory = "melee"
ITEM.width = 3
ITEM.height = 1
ITEM.price = 0
ITEM.flag = "v"
ITEM.category = "Weapons - Melee"

ITEM.data = { scrapamount = 5}
ITEM.salvItem = "j_scrap_wood"

ITEM.iconCam = {
	pos = Vector(-200, 0, -6.5),
	ang = Angle(0, -0, 90),
	fov = 12,
}