local L = LANG.GetLanguageTableReference("de")

-- GENERAL ROLE LANGUAGE STRINGS
L[HURRICANE.name] = "Orkan"
L["info_popup_" .. HURRICANE.name] = [[Du bist der Orkan!
Markiere eine Person als verdächtig. Alle erhalten eine Nachricht, wer verdächtig ist und derjenige kann nur eine bestimmte Menge an HP erhalten.]]
L["body_found_" .. HURRICANE.abbr] = "Er war ein Orkan."
L["search_role_" .. HURRICANE.abbr] = "Diese Person ist ein Orkan!"
L["target_" .. HURRICANE.name] = "Orkan"
L["ttt2_desc_" .. HURRICANE.name] = [[Der Orkan gewinnt mit den Verrätern!]]

-- OTHER ROLE LANGUAGE STRINGS
// Hurricane does not need any role-specific language strings. They use the Cyclone's ones.

-- F1 MENU: CONVAR EXPLANATIONS
L["label_hurricane_strip_intel"] = "Ist es aktiviert, wird die Waffe, die zum markieren verwendet wurde, komplett entfernt."
L["label_hurricane_always_strip_weapons"] = "Entferne die Markierungswaffe aus dem Inventar des Orkans"

L["label_hurricane_epop_intel"] = "Ist es aktiviert, wird zusätzlich zu dem HUD-Element ein Pop-Up angezeigt, dass den Namen des verdächtigen Spielers enthält."
L["label_hurricane_epop_bool"] = "Zeige Infos über den markierten Spieler mittels Pop-Up an"

L["label_hurricane_mute_intel"] = "Ist es aktiviert, kann der markierte Spieler nicht mit anderen reden, solange er markiert ist."
L["label_hurricane_mute_bool"] = "Deaktiviere den Voice Chat für den markierten Spieler"

L["label_hurricane_tchat_intel"] = "Ist es aktiviert, kann der markierte Spieler den Team-Text-Chat nicht nutzen, solange er markiert ist."
L["label_hurricane_tchat_bool"] = "Deaktiviere den Team-Text-Chat für den markierten Spieler"

L["label_hurricane_gchat_intel"] = "Ist es aktiviert, kann der markierte Spieler den globalen Text-Chat nicht nutzen, solange er markiert ist."
L["label_hurricane_gchat_bool"] = "Deaktiviere den globalen Text-Chat für den markierten Spiele"

L["label_hurricane_max_hp_intel"] = "Setze die Max-HP, die die markierte Person diese Runde erhalten kann."
L["label_hurricane_max_hp"] = "Setzte die Max-HP für den Verdächtigen"

L["label_hurricane_cur_hp_intel"] = "Setze die HP, die die markierte Person beim Markieren erhält."
L["label_hurricane_cur_hp"] = "Setzte die aktuellen HP für den Verdächtigen"
