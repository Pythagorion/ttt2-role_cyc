local L = LANG.GetLanguageTableReference("de")

-- GENERAL ROLE LANGUAGE STRINGS
L[CYCLONE.name] = "Zyklon"
L["info_popup_" .. CYCLONE.name] = [[Du bist der Zyklon!
Markiere eine Person als verdächtig. Alle erhalten eine Nachricht, wer verdächtig ist und derjenige kann nur eine bestimmte Menge an HP erhalten.]]
L["body_found_" .. CYCLONE.abbr] = "Er war ein Zyklon."
L["search_role_" .. CYCLONE.abbr] = "Diese Person ist ein Zyklon!"
L["target_" .. CYCLONE.name] = "Zyklon"
L["ttt2_desc_" .. CYCLONE.name] = [[Der Zyklon gewinnt mit den Verrätern!]]

-- OTHER ROLE LANGUAGE STRINGS
L["ttt2_cyclone_role_sus"] = "{victim} wurde als 'verdächtig' markiert!"

-- F1 MENU: CONVAR EXPLANATIONS
L["label_cyclone_strip_intel"] = "Ist es aktiviert, wird die Waffe, die zum markieren verwendet wurde, komplett entfernt."
L["label_cyclone_always_strip_weapons"] = "Entferne die Markierungswaffe aus dem Inventar des Zyklons"
L["label_cyclone_max_hp_intel"] = "Setze die Max-HP, die die markierte Person diese Runde erhalten kann."
L["label_cyclone_max_hp"] = "Setzte die Max-HP für den Verdächtigen"
L["label_cyclone_cur_hp_intel"] = "Setze die HP, die die markierte Person beim Markieren erhält."
L["label_cyclone_cur_hp"] = "Setzte die aktuellen HP für den Verdächtigen"