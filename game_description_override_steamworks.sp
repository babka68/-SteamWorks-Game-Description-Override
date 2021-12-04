#include <SteamWorks>
#pragma semicolon 1
#pragma newdecls required

char g_sDescription[MAX_TARGET_LENGTH];

public Plugin myinfo =  {
	name = "[SteamWorks] Game Description Override", 
	author = "babka68", 
	description = "Переопределяет описание игры в браузере сервера с помощью SteamWorks", 
	version = "1.0", 
	url = "https://vk.com/zakazserver68", 
};

public void OnPluginStart() {
	ConVar cvar;
	cvar = CreateConVar("game_description_override", "https://vk.com/zakazserver68", "Ваш текст в названии игры");
	GetConVarString(cvar, g_sDescription, sizeof(g_sDescription));
	HookConVarChange(cvar, CvarChanged);
	SteamWorks_SetGameDescription(g_sDescription);
}

public void CvarChanged(Handle cvar, const char[] oldVal, const char[] newVal) {
	GetConVarString(cvar, g_sDescription, sizeof(g_sDescription));
	SteamWorks_SetGameDescription(g_sDescription);
} 
