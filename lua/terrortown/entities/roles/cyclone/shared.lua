if SERVER then
    AddCSLuaFile()

    util.AddNetworkString("ttt2_cyclone_role_sus")
	resource.AddFile("materials/vgui/ttt/dynamic/roles/icon_cyc")
end

function ROLE:PreInitialize()
    self.color                      = Color(156, 5, 57, 255)

	self.abbr                       = "cyc"
	self.surviveBonus               = 0
	self.score.killsMultiplier      = 2
	self.score.teamKillsMultiplier  = -8
	self.preventFindCredits         = false
	self.preventKillCredits         = false
	self.preventTraitorAloneCredits = false
	self.preventWin                 = false
	self.unknownTeam                = false

	self.defaultTeam                = TEAM_TRAITOR

	self.conVarData = {
		pct          = 0.15, -- necessary: percentage of getting this role selected (per player)
		maximum      = 1, -- maximum amount of roles in a round
		minPlayers   = 7, -- minimum amount of players until this role is able to get selected
		credits      = 2, -- the starting credits of a specific role
		shopFallback = SHOP_FALLBACK_TRAITOR, -- granting the role access to the shop
		togglable    = true, -- option to toggle a role for a client if possible (F1 menu)
		random       = 33
	} 
end

function ROLE:Initialize()
    roles.SetBaseRole(self, ROLE_TRAITOR)
end

if SERVER then
    local function ResetCyclone()
		local plys = player.GetAll()

		for i=1, #plys do
			local ply = plys[i]

			ply.cyc_data = {}
			ply.cyc_data.sus_shot = true

			ply:SetMaxHealth(100)
			ply:SetHealth(100)
		end
	end

	hook.Add("ScalePlayerDamage", "ttt2_role_cyclone_shoots", function(ply, hitgroup, dmginfo)

		-- cache CVARs for further purposes
		local cv_cyc_strip_weapons = GetConVar("ttt_cyclone_always_strip_weapons"):GetBool()
		local cv_cyc_max_health = GetConVar("ttt_cyclone_set_max_health"):GetInt()
		local cv_cyc_cur_health = GetConVar("ttt_cyclone_set_cur_health"):GetInt()

		-- get attacker and exclude specific cases
		local attacker = dmginfo:GetAttacker()

		if GetRoundState() ~= ROUND_ACTIVE or not IsValid(attacker) or not attacker:IsPlayer() or not IsValid(attacker:GetActiveWeapon()) then return end

		if not ply or not ply:IsPlayer() then return end

		local weap = attacker:GetActiveWeapon()

		-- if weap:GetClass() == "weapon_zm_improvised" then return end

		-- when the cyclone is able to flag another person, the message is sent
		if attacker.cyc_data.sus_shot and attacker:GetSubRole() == ROLE_CYCLONE then
			dmginfo:SetDamage(0)
			net.Start("ttt2_cyclone_role_sus")
			net.WriteEntity(ply)
			net.Broadcast()

			ply:SetMaxHealth(cv_cyc_max_health)
			ply:SetHealth(cv_cyc_cur_health)

			-- only remove, when clip size is above 1 and the cvar boolean is set on 'true'
			if weap:Clip1() > 1 and cv_cyc_strip_weapons then
				weap:Remove()
			end

			attacker.cyc_data.sus_shot = false
		end

		print("DEBUG MESSAGE")
	end)

	-- make sure to clear the cyclone's flag
	hook.Add("TTTEndRound", "ttt2_role_cyclone_roundend", function()
		ResetCyclone()
	end)

	hook.Add("TTTBeginRound", "ttt2_role_cyclone_roundbegin", function()
		ResetCyclone()
	end)

	hook.Add("TTTPrepareRound", "ttt2_role_cyclone_roundprep", function()
		ResetCyclone()
	end)

else -- CLIENT
	net.Receive("ttt2_cyclone_role_sus", function()
		local victim = net.ReadEntity()
		EPOP:AddMessage({text = LANG.GetParamTranslation("ttt2_cyclone_role_sus", {victim = LANG.TryTranslation(victim:Nick())}), color = CYCLONE.ltcolor}, "", 10)
	end)

	function ROLE:AddToSettingsMenu(parent)
		local form = vgui.CreateTTT2Form(parent, "header_roles_additional")

		form:MakeHelp({
			label = "label_cyclone_strip_intel"
		})

		form:MakeCheckBox({
			serverConVar = "ttt_cyclone_always_strip_weapons",
			label = "label_cyclone_always_strip_weapons"
		})

		form:MakeHelp({
			label = "label_cyclone_max_hp_intel"
		})

		form:MakeSlider({
			serverConVar = "ttt_cyclone_set_max_health",
			label = "label_cyclone_max_hp",
			min = 1,
			max = 500,
			decimal = 0
		})

		form:MakeHelp({
			label = "label_cyclone_cur_hp_intel"
		})

		form:MakeSlider({
			serverConVar = "ttt_cyclone_set_cur_health",
			label = "label_cyclone_cur_hp",
			min = 1,
			max = 500,
			decimal = 0
		})
	end
end
