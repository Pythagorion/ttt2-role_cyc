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

	-- using this function to reset all values for the coming round
    local function ResetCyclone()
		local plys = player.GetAll()

		for i=1, #plys do
			local ply = plys[i]

			ply.cyc_data = {}
			ply.cyc_data.sus_shot = true

			if ply.isFlagged then
				ply:SetMaxHealth(100)
				ply:SetHealth(100)
				ply.isFlagged = false
			end
		end

		SetGlobalBool("ply_is_flagged", false)
	end

	hook.Add("ScalePlayerDamage", "ttt2_role_cyclone_shoots", function(ply, hitgroup, dmginfo)

		-- cache CVARs for further purposes
		local cv_cyc_strip_weapons = GetConVar("ttt_cyclone_always_strip_weapons"):GetBool()
		local cv_cyc_epop_bool = GetConVar("ttt_cyclone_print_anounce_popup"):GetBool()
		local cv_cyc_mute_marked_ply = GetConVar("ttt_cyclone_mute_marked_ply"):GetBool()
		local cv_cyc_disable_general_chat = GetConVar("ttt_cyclone_disable_gchat"):GetBool()
		local cv_cyc_disable_team_chat = GetConVar("ttt_cyclone_disable_tchat"):GetBool()
		local cv_cyc_max_health = GetConVar("ttt_cyclone_set_max_health"):GetInt()
		local cv_cyc_cur_health = GetConVar("ttt_cyclone_set_cur_health"):GetInt()

		-- get attacker/inflictor and exclude specific cases
		local attacker = dmginfo:GetAttacker()

		local inflictor = dmginfo:GetInflictor()

		if GetRoundState() ~= ROUND_ACTIVE or not IsValid(attacker) or not attacker:IsPlayer() or not IsValid(attacker:GetActiveWeapon()) then return end

		if not ply or not ply:IsPlayer() then return end

		local weap = attacker:GetActiveWeapon()

		if weap:GetClass() == "weapon_zm_improvised" then return end

		if inflictor.Kind == WEAPON_NADE then return end

		-- when the cyclone is able to flag another person, the message is sent
		if attacker.cyc_data.sus_shot and attacker:GetSubRole() == ROLE_CYCLONE then

			-- iterate through all players to reset Health of previously marked plys
			local plys = player.GetAll()

			for i=1, #plys do
				local f_ply = plys[i]

				if f_ply.isFlagged and f_ply ~= ply then
					f_ply:SetHealth(100)
					f_ply:SetMaxHealth(100)
					f_ply.isFlagged = false
				end
			end

			-- tell TTT2 not to calculate damage for that shot
			dmginfo:SetDamage(0)

			-- tell the HUD to display marked player
			SetGlobalEntity("flagged_ply", ply)
			SetGlobalBool("ply_is_flagged", true)

			-- tell the players then through EPOP
			if cv_cyc_epop_bool then
				net.Start("ttt2_cyclone_role_sus")
				net.WriteEntity(ply)
				net.Broadcast()
			end

			-- tell the HUD to display marked player
			ply:SetMaxHealth(cv_cyc_max_health)
			ply:SetHealth(cv_cyc_cur_health)
			ply.isFlagged = true

			-- only remove, when clip size is above 1 and the cvar boolean is set on 'true'
			if weap:Clip1() >= 1 and cv_cyc_strip_weapons then
				WEPS.DropNotifiedWeapon(attacker, weap, false, false)
				weap:Remove()
			end

			timer.Simple(0, function()
				if not IsValid(attacker) then return end

				attacker.cyc_data.sus_shot = false
			end)
		end
	end)
	
	-- disable the chats of the marked one, if its configured so via cvars
	hook.Add("TTT2CanUseVoiceChat", "ttt2_role_cyc_disable_vc", function(ply, isTeam)

		if ply == GetGlobalEntity("flagged_ply") and GetConVar("ttt_cyclone_mute_marked_ply"):GetBool() then
			return false
		end
	end)

	hook.Add("TTT2AvoidGeneralChat", "ttt2_role_cyc_disable_g_chat", function(sender, msg)

		if sender == GetGlobalEntity("flagged_ply") and GetConVar("ttt_cyclone_disable_gchat"):GetBool() then
			LANG.Msg(sender, "ttt2_text_chat_jam_" .. CYCLONE.name, nil, MSG_CHAT_WARN)

			return false
		end
	end)

	hook.Add("TTT2AvoidTeamChat", "ttt2_role_cyc_disable_t_chat", function(sender, msg)
		if sender == GetGlobalEntity("flagged_ply") and GetConVar("ttt_cyclone_disable_tchat"):GetBool() then
			LANG.Msg(sender, "ttt2_text_chat_jam_" .. CYCLONE.name, nil, MSG_CHAT_WARN)

			return false
		end
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
		EPOP:AddMessage({text = LANG.GetParamTranslation("ttt2_cyclone_role_sus", {victim = LANG.TryTranslation(victim:Nick())}), color = Color(50, 168, 82, 255)}, "", 10)
	end)

	-- Always disable Voice Chat client-side too, to hide teh UI element and stop the voice chat
	hook.Add("TTT2CanUseVoiceChat", "cl_ttt2_role_cyc_disable_vc", function(ply, isTeam)
		local mark_pers = GetGlobalEntity("flagged_ply")

		if ply == mark_pers and GetConVar("ttt_cyclone_mute_marked_ply"):GetBool() then
			return false
		end
	end)

	function ROLE:AddToSettingsMenu(parent)
		local form = vgui.CreateTTT2Form(parent, "header_roles_additional")

		-- Add ttt_cyclone_always_strip_weapons to the menu (boolean)
		form:MakeHelp({
			label = "label_cyclone_strip_intel"
		})
		
		form:MakeCheckBox({
			serverConvar = "ttt_cyclone_always_strip_weapons",
			label = "label_cyclone_always_strip_weapons"
		})

		-- Add ttt_cyclone_print_anounce_popup to the menu (boolean)
		form:MakeHelp({
			label = "label_cyclone_epop_intel"
		})

		form:MakeCheckBox({
			serverConvar = "ttt_cyclone_print_anounce_popup",
			label = "label_cyclone_epop_bool"
		})

		-- Add ttt_cyclone_mute_marked_ply to the menu (boolean)
		form:MakeHelp({
			label = "label_cyclone_mute_intel"
		})

		form:MakeCheckBox({
			serverConvar = "ttt_cyclone_mute_marked_ply",
			label = "label_cyclone_mute_bool"
		})

		-- Add ttt_cyclone_disable_tchat to the menu (boolean)
		form:MakeHelp({
			label = "label_cyclone_tchat_intel"
		})

		form:MakeCheckBox({
			serverConvar = "ttt_cyclone_disable_tchat",
			label = "label_cyclone_tchat_bool"
		})

		-- Add ttt_cyclone_disable_gchat to the menu (boolean)
		form:MakeHelp({
			label = "label_cyclone_gchat_intel"
		})

		form:MakeCheckBox({
			serverConvar = "ttt_cyclone_disable_gchat",
			label = "label_cyclone_gchat_bool"
		})

		-- Add ttt_cyclone_set_max_health to the menu (integer)
		form:MakeHelp({
			label = "label_cyclone_max_hp_intel"
		})

		form:MakeSlider({
			serverConvar = "ttt_cyclone_set_max_health",
			label = "label_cyclone_max_hp",
			min = 1,
			max = 500,
			decimal = 0
		})

		-- Add ttt_cyclone_set_cur_health to the menu (integer)
		form:MakeHelp({
			label = "label_cyclone_cur_hp_intel"
		})

		form:MakeSlider({
			serverConvar = "ttt_cyclone_set_cur_health",
			label = "label_cyclone_cur_hp",
			min = 1,
			max = 500,
			decimal = 0
		})
	end
end
