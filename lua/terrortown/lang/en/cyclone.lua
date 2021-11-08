local L = LANG.GetLanguageTableReference("en")

-- GENERAL ROLE LANGUAGE STRINGS
L[CYCLONE.name] = "Cyclone"
L["info_popup_" .. CYCLONE.name] = [[You are the Cyclone!
Flag a person as 'suspicious'. This person will be suspicious for everyone and can gain only a specific amount of HP this round.]]
L["body_found_" .. CYCLONE.abbr] = "They were a Cyclone."
L["search_role_" .. CYCLONE.abbr] = "This person was a Cyclone!"
L["target_" .. CYCLONE.name] = "Cyclone"
L["ttt2_desc_" .. CYCLONE.name] = [[The Cyclone needs to win with the traitors!]]

-- OTHER ROLE LANGUAGE STRINGS
L["ttt2_cyclone_role_sus"] = "{victim} has been marked as 'suspicious'!"
L["ttt2_cyc_role_marked_pers"] = " is suspicious now"

-- F1 MENU: CONVAR EXPLANATIONS
L["label_cyclone_strip_intel"] = "If it's set on 'true', the weapon that was used for flagging a person, is removed completely, when its clip size is above 1 bullet."
L["label_cyclone_always_strip_weapons"] = "Remove weapon that was used for flagging from the inventory"
L["label_cyclone_max_hp_intel"] = "Set the maximum HP the suspicious person can receive in this round."
L["label_cyclone_max_hp"] = "Set the Max-HP for the suspicious person"
L["label_cyclone_cur_hp_intel"] = "Set the current HP the suspicious person will receive when they get flagged."
L["label_cyclone_cur_hp"] = "Set the current HP for the suspicious person"
L["label_cyclone_epop_intel"] = "If it's set on 'true', a pop-up with the name of the flagged person is additionally displayed besides the HUD element."
L["label_cyclone_epop_bool"] = "Print the Pop-up with information about the flagged player"