PLUGIN.name = "Signal"
PLUGIN.author = "Black Tea"
PLUGIN.desc = "You can beep at other people."
local SIGNAL_CHATCOLOR = Color(100, 100, 255)

codeList = {}
codeList[0] = "Elephant"
codeList[1] = "Bird"
codeList[2] = "Dog"
codeList[3] = "Rat"
codeList[4] = "Mouse"
codeList[5] = "Cat"
codeList[6] = "Bear"
codeList[7] = "Wolf"
codeList[8] = "Tiger"
codeList[9] = "Moose"
codeList[10] = "Deer"
codeList[11] = "Bee"
codeList[12] = "Fly"
codeList[13] = "Ant"
codeList[14] = "Fish"
codeList[15] = "Rhino"
codeList[16] = "Jeffrey"
codeList[17] = "Fox"
codeList[18] = "Walrus"
codeList[19] = "Giraffe"
codeList[20] = "Squid"
codeList[21] = "Octopus"
codeList[22] = "Shark"
codeList[23] = "Toad"
codeList[24] = "Tortoise"
codeList[25] = "Zebra"
codeList[26] = "Hedgehog"
codeList[27] = "Donkey"
codeList[28] = "Gopher"
codeList[29] = "Turkey"
codeList[30] = "Horse"
codeList[31] = "Scorpion"
codeList[32] = "Spider"
codeList[32] = "Monkey"
codeList[33] = "Whale"
codeList[34] = "Lizard"
codeList[35] = "Gorilla"
codeList[36] = "Ferret"
codeList[37] = "Drifter"
codeList[38] = "Shadow"
codeList[39] = "Shade"
codeList[40] = "Abomination"
codeList[41] = "Haze"
codeList[42] = "Storm"
codeList[43] = "Snow"
codeList[44] = "Rain"
codeList[45] = "Fog"
codeList[46] = "Cloud"



if (CLIENT) then
	local PANEL = {}
	function PANEL:Init()
		self.number = 0
		self:SetWide(70)

		local up = self:Add("DButton")
		up:SetFont("Marlett")
		up:SetText("t")
		up:Dock(TOP)
		up:DockMargin(2, 2, 2, 2)
		up.DoClick = function(this)
			self.number = (self.number + 1)% 10
			surface.PlaySound("buttons/lightswitch2.wav")
		end

		local down = self:Add("DButton")
		down:SetFont("Marlett")
		down:SetText("u")
		down:Dock(BOTTOM)
		down:DockMargin(2, 2, 2, 2)
		down.DoClick = function(this)
			self.number = (self.number - 1)% 10
			surface.PlaySound("buttons/lightswitch2.wav")
		end

		local number = self:Add("Panel")
		number:Dock(FILL)
		number.Paint = function(this, w, h)
			draw.SimpleText(self.number, "nutDialFont", w/2, h/2, color_white, 1, 1)
		end
	end

	vgui.Register("nutSignalDial", PANEL, "DPanel")

	PANEL = {}

	function PANEL:Init()
		self:SetTitle("Signal Frequency")
		self:SetSize(330, 220)
		self:Center()
		self:MakePopup()

		self.submit = self:Add("DButton")
		self.submit:Dock(BOTTOM)
		self.submit:DockMargin(0, 5, 0, 0)
		self.submit:SetTall(25)
		self.submit:SetText("Submit")
		self.submit.DoClick = function()
			local str = ""
			for i = 1, 5 do
				if (i != 4) then
					str = str .. tostring(self.dial[i].number or 0)
				else
					str = str .. "."
				end
			end
			netstream.Start("signalAdjust", str, self.itemID)

			self:Close()
		end

		self.dial = {}
		for i = 1, 5 do
			if (i != 4) then
				self.dial[i] = self:Add("nutSignalDial")
				self.dial[i]:Dock(LEFT)
				if (i != 3) then
					self.dial[i]:DockMargin(0, 0, 5, 0)
				end
			else
				local dot = self:Add("Panel")
				dot:Dock(LEFT)
				dot:SetWide(30)
				dot.Paint = function(this, w, h)
					draw.SimpleText(".", "nutDialFont", w/2, h - 10, color_white, 1, 4)
				end
			end
		end
	end

	function PANEL:Think()
		self:MoveToFront()
	end

	vgui.Register("nutSignalMenu", PANEL, "DFrame")

	surface.CreateFont("nutDialFont", {
		font = "Agency FB",
		size = 100,
		weight = 1000
	})

	surface.CreateFont("nutRadioFont", {
		font = "Lucida Sans Typewriter",
		size = math.max(ScreenScale(7), 17),
		weight = 100
	})

	netstream.Hook("signalAdjust", function(freq, id)
		local adjust = vgui.Create("nutSignalMenu")

		if (id) then
			adjust.itemID = id
		end

		if (freq) then
			for i = 1, 5 do
				if (i != 4) then
					adjust.dial[i].number = tonumber(freq[i])
				end
			end
		end
	end)
else
	netstream.Hook("signalAdjust", function(client, freq, id)
		local inv = (client:getChar() and client:getChar():getInv() or nil)

		if (inv) then
			local item

			if (id) then
				item = nut.item.instances[id]
			else
				item = inv:hasItem("comm_signal")
			end

			local ent = item:getEntity()

			if (item and (IsValid(ent) or item:getOwner() == client)) then
				(ent or client):EmitSound("buttons/combine_button1.wav", 50, 170)
				item:setData("freq", freq, player.GetAll(), false, true)
			else
				client:notifyLocalized("You don't have a signalling device.")
			end
		end
	end)

	nut.command.add("sigfreq", {
		syntax = "<string name> [string flags]",
		onRun = function(client, arguments)
			local inv = client:getChar():getInv()

			if (inv) then
				item = inv:hasItem("comm_signal")

				if (item) then
					item:setData("freq", arguments[1], nil, nil, true)
				else
					client:notify("You don't have a signalling device.")
				end
			end
		end
	})
end

local find = {
	["comm_signal"] = false
}
local function endChatter(listener)
	timer.Simple(1, function()
		if (!listener:IsValid() or !listener:Alive()) then
			return false
		end

		listener:EmitSound("buttons/button18.wav", math.random(60, 70), math.random(80, 120))
	end)
end

nut.command.add("signal", {
	onRun = function(client, arguments)		
		nut.chat.send(client, "signal", arguments)
	end
})

nut.chat.register("signal", {
	format = "**%s's signalling device beeps.",
	font = "nutRadioFont",
	filter = "actions",
	onGetColor = function(speaker, text)
		return SIGNAL_CHATCOLOR
	end,
	onCanHear = function(speaker, listener)
		local listenerInv = listener:getChar():getInv()
		local freq

		if (!CURFREQ or CURFREQ == "") then
			return false
		end

		if (listenerInv) then
			for k, v in pairs(listenerInv:getItems()) do
				if (freq) then
					break
				end

				for id, far in pairs(find) do
					if (v.uniqueID == "comm_signal" and v:getData("power") == true) then
						if (CURFREQ == v:getData("freq", "000.0")) then
							endChatter(listener)
							return true
						end

						break
					end
				end
			end
		end

		return false
	end,
	onCanSay = function(speaker, text)
		local schar = speaker:getChar()
		local speakerInv = schar:getInv()
		local freq

		if (speakerInv) then
			for k, v in pairs(speakerInv:getItems()) do
				if (freq) then
					break
				end

				if (v.uniqueID == "comm_signal" and v:getData("power", false) == true) then
					freq = v:getData("freq", "000.0")
					break
				end
			end
		end

		if (freq) then
			CURFREQ = freq
			speaker:EmitSound("buttons/button18.wav", math.random(60, 70), math.random(80, 120))
		else
			speaker:notifyLocalized("You don't have an activated signalling device.")
			return false
		end
	end,
	onChatAdd = function(speaker, text, anonymous)
			--local name = anonymous and L"someone" or hook.Run("GetDisplayedName", speaker, chatType) or (IsValid(speaker) and speaker:Name() or "Console")

			color = SIGNAL_CHATCOLOR
			local codeNum = 0
			--local translated = L2(chatType.."Format", name, text)
			if(tonumber(text) != nil) then
				codeNum = tonumber(text)
			end
			local code
			if(codeNum < table.Count(codeList) and codeNum > -1) then
				code = codeList[codeNum]
			else
				code = "Plastic"
			end
			chat.AddText(color, code .. ".")
	end,	
	prefix = {"/signal"},
})