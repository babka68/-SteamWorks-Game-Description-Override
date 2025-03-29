/* ============================================================================================================
// EN: Connects the specified file/library
// RU: Подключает указанный файл/библиотеку
// ==========================================================================================================*/
#include <SteamWorks>

/* ============================================================================================================
// EN: Notifies the compiler that there should be a character at the end of each expression ;
// RU: Сообщает компилятору о том, что в конце каждого выражения должен стоять символ ;
// ==========================================================================================================*/

#pragma semicolon 1
/* =============================================================================================================
// EN: Notifies the compiler that the plugin syntax is exceptionally new
// RU: Сообщает компилятору о том, что синтаксис плагина исключительно новый
// ===========================================================================================================*/
#pragma newdecls required

/* =============================================================================================================
// EN: Public information about the plugin.
// RU: Общественная информация о плагине.
// ===========================================================================================================*/
public Plugin myinfo = 
{
	name = "[SteamWorks] --- Game Description Override", 
	author = "babka68", 
	description = "Переопределяет описание игры в браузере сервера с помощью SteamWorks", 
	version = "1.1", 
	url = "vk.com/zakazserver68", 
};

char g_sDescription[MAX_TARGET_LENGTH];
/* =============================================================================================================
// EN: A built-in global event whose function is a single call when the plugin is fully initialized.
// RU: Встроенное глобальное событие, функция которого - единождый вызов при полной инициализации плагина.
// =============================================================================================================*/
public void OnPluginStart()
{
	if (!LibraryExists("SteamWorks"))
		SetFailState("Не загружена библиотека SteamWorks");
	
	ConVar cvar;
	cvar = CreateConVar("game_description_override", "vk.com/zakazserver68", "Ваш текст в названии игры");
	cvar.AddChangeHook(ChangedGameDescription);
	cvar.GetString(g_sDescription, sizeof(g_sDescription));
	
	AutoExecConfig(true, "game_description_override");
	Set();
}

public void ChangedGameDescription(ConVar cvar, const char[] oldVal, const char[] newVal)
{
	cvar.GetString(g_sDescription, sizeof(g_sDescription));
}

public void Set()
{
	SteamWorks_SetGameDescription(g_sDescription);
}
