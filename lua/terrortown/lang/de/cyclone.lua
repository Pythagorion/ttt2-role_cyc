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
L["ttt2_cyc_role_marked_pers"] = " ist nun verdächtig"
L["ttt2_text_chat_jam_" .. CYCLONE.name] = "Du darfst den Text-Chat nicht verwenden, solange du markiert bist."

-- F1 MENU: CONVAR EXPLANATIONS
L["label_cyclone_strip_intel"] = "Ist es aktiviert, wird die Waffe, die zum markieren verwendet wurde, komplett entfernt."
L["label_cyclone_always_strip_weapons"] = "Entferne die Markierungswaffe aus dem Inventar des Zyklons"

L["label_cyclone_epop_intel"] = "Ist es aktiviert, wird zusätzlich zu dem HUD-Element ein Pop-Up angezeigt, dass den Namen des verdächtigen Spielers enthält."
L["label_cyclone_epop_bool"] = "Zeige Infos über den markierten Spieler mittels Pop-Up an"

L["label_cyclone_mute_intel"] = "Ist es aktiviert, kann der markierte Spieler nicht mit anderen reden, solange er markiert ist."
L["label_cyclone_mute_bool"] = "Deaktiviere den Voice Chat für den markierten Spieler"

L["label_cyclone_tchat_intel"] = "Ist es aktiviert, kann der markierte Spieler den Team-Text-Chat nicht nutzen, solange er markiert ist."
L["label_cyclone_tchat_bool"] = "Deaktiviere den Team-Text-Chat für den markierten Spieler"

L["label_cyclone_gchat_intel"] = "Ist es aktiviert, kann der markierte Spieler den globalen Text-Chat nicht nutzen, solange er markiert ist."
L["label_cyclone_gchat_bool"] = "Deaktiviere den globalen Text-Chat für den markierten Spiele"

L["label_cyclone_max_hp_intel"] = "Setze die Max-HP, die die markierte Person diese Runde erhalten kann."
L["label_cyclone_max_hp"] = "Setzte die Max-HP für den Verdächtigen"

L["label_cyclone_cur_hp_intel"] = "Setze die HP, die die markierte Person beim Markieren erhält."
L["label_cyclone_cur_hp"] = "Setzte die aktuellen HP für den Verdächtigen"
