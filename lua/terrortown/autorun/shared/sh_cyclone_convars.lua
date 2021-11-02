-- replicated convars have to be created on both client and server
CreateConVar("ttt_cyclone_always_strip_weapons", 1, {FCVAR_ARCHIVE, FCVAR_NOTIFY, FCVAR_REPLICATED})
CreateConVar("ttt_cyclone_set_max_health", 50, {FCVAR_ARCHIVE, FCVAR_NOTIFY, FCVAR_REPLICATED})
CreateConVar("ttt_cyclone_set_cur_health", 50, {FCVAR_ARCHIVE, FCVAR_NOTIFY, FCVAR_REPLICATED})