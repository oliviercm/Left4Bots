::Left4Bots.DefaultConfigFiles <- function ()
{
	local defaults = {};

	// Default convars.txt file
	defaults["terminatorbots/cfg/convars.txt"] <- @"allow_all_bot_survivor_team 1
sb_all_bot_game 1
sb_max_team_melee_weapons 4
sb_temp_health_consider_factor 1
sb_friend_immobilized_reaction_time_expert 0
sb_friend_immobilized_reaction_time_hard 0
sb_friend_immobilized_reaction_time_normal 0
sb_friend_immobilized_reaction_time_vs 0
sb_melee_approach_victim 0
sb_sidestep_for_horde 1
sb_vomit_blind_time 0
sb_enforce_proximity_range 20000"; // "sb_unstick 0" // TODO: unstick logic

	// Default itemstoavoid.txt file
	defaults["terminatorbots/cfg/itemstoavoid.txt"] <- @"weapon_ammo
weapon_upgrade_item
upgrade_ammo_explosive
upgrade_ammo_incendiary
upgrade_laser_sight
pain_pills
adrenaline";

	// Default vocalizer.txt file
	defaults["terminatorbots/cfg/vocalizer.txt"] <- @"PlayerLeadOn = bots lead,botname lead
PlayerWaitHere = bots wait,botname wait
PlayerEmphaticGo = bots goto,botname goto
PlayerWarnWitch = bot witch,botname witch
PlayerMoveOn = bot use,botname use
PlayerStayTogether = bots cancel,botname cancel
PlayerFollowMe = bot follow me,botname follow me
iMT_PlayerSuggestHealth = bots heal,botname heal
PlayerHurryUp = bots hurry,botname hurry
AskForHealth2 = bot heal me,botname heal me
PlayerAnswerLostCall = bot give,botname give
iMT_PlayerHello = bot swap,botname swap
PlayerImWithYou = bots automation all,botname automation all";
//"TODO PlayerYellRun = ?
//"TODO = bots warp,botname warp
//"TODO = bot tempheal,botname tempheal
//"TODO = bot deploy,botname deploy
//"TODO = bot throw,botname throw
//"TODO = bots die,botname die

	// -------------------------------------------------------

	defaults["terminatorbots/cfg/weapons/preferences.txt"] <- @"rifle_desert,rifle_ak47,rifle,rifle_sg552,smg_silenced,smg,smg_mp5,shotgun_spas,autoshotgun,sniper_military,hunting_rifle,shotgun_chrome,pumpshotgun,sniper_scout,sniper_awp,rifle_m60,grenade_launcher
pistol_magnum,katana,machete,fireaxe,knife,crowbar,tonfa,frying_pan,golfclub,electric_guitar,shovel,cricket_bat,baseball_bat,pitchfork,riotshield,pistol,chainsaw
vomitjar,pipe_bomb,molotov
upgradepack_explosive,upgradepack_incendiary,first_aid_kit,defibrillator
pain_pills,adrenaline";

	// -------------------------------------------------------

	foreach (filename, content in defaults)
	{
		if (!Left4Utils.FileExists(filename))
		{
			Left4Utils.StringToFileCRLF(filename, content);
			Logger.Info("Config file '" + filename + "' was not found and has been recreated");
		}
	}
}