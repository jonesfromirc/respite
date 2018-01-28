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

ITEM.name = "Rocket"
ITEM.model = "models/weapons/w_missile_closed.mdl"
ITEM.ammo = "rpg_round" // type of the ammo
ITEM.ammoAmount = 1 // amount of the ammo
ITEM.width = 2
ITEM.desc = "%s rocket."
ITEM.category = "Ammunition"
ITEM.flag = "v"
ITEM.price = 0
ITEM.uniqueID = "ammo_rpg"

ITEM.iconCam = {
	pos = Vector(-200, 0, 5.5),
	ang = Angle(0, -0, 0),
	fov = 7,
}