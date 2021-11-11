local L = LANG.GetLanguageTableReference("en")

-- GENERAL ROLE LANGUAGE STRINGS
L[HURRICANE.name] = "Hurricane"
L["info_popup_" .. HURRICANE.name] = [[You are the Hurricane!
Flag a person as 'suspicious'. This person will be suspicious for everyone and can gain only a specific amount of HP this round.]]
L["body_found_" .. HURRICANE.abbr] = "They were a Hurricane."
L["search_role_" .. HURRICANE.abbr] = "This person was a Hurricane!"
L["target_" .. HURRICANE.name] = "Hurricane"
L["ttt2_desc_" .. HURRICANE.name] = [[The Hurricane needs to win with the traitors!]]

-- OTHER ROLE LANGUAGE STRINGS
// Hurricane does not need any role-specific language strings. They use the Cyclone's ones.

-- F1 MENU: CONVAR EXPLANATIONS
L["label_hurricane_strip_intel"] = "If it's set on 'true', the weapon that was used for flagging a person, is removed completely, when its clip size is above 1 bullet."
L["label_hurricane_always_strip_weapons"] = "Remove weapon that was used for flagging from the inventory"

L["label_hurricane_epop_intel"] = "If it's set on 'true', a pop-up with the name of the flagged person is additionally displayed besides the HUD element."
L["label_hurricane_epop_bool"] = "Print the Pop-up with information about the flagged player"

L["label_hurricane_mute_intel"] = "If it's set on 'true', the marked player will not be able to use the voice chat, while being marked."
L["label_hurricane_mute_bool"] = "Disable possibility for marked player to use voice chat"

L["label_hurricane_tchat_intel"] = "If it's set on 'true', the marked player will not be able to use the team chat, while being marked."
L["label_hurricane_tchat_bool"] = "Disable possibility for marked player to use team chat"

L["label_hurricane_gchat_intel"] = "If it's set on 'true', the marked player will not be able to use the general chat, while being marked."
L["label_hurricane_gchat_bool"] = "Disable possibility for marked player to use general chat"

L["label_hurricane_max_hp_intel"] = "Set the maximum HP the suspicious person can receive in this round."
L["label_hurricane_max_hp"] = "Set the Max-HP for the suspicious person"

L["label_hurricane_cur_hp_intel"] = "Set the current HP the suspicious person will receive when they get flagged."
L["label_hurricane_cur_hp"] = "Set the current HP for the suspicious person"
