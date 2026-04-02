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

	defaults["terminatorbots/cfg/weapons/preferences.txt"] <- @"rifle_ak47,rifle_sg552,rifle_desert,rifle,autoshotgun,shotgun_spas,sniper_military,hunting_rifle,rifle_m60,grenade_launcher,sniper_scout,sniper_awp,smg_mp5,smg_silenced,shotgun_chrome,smg,pumpshotgun
*,machete,golfclub,katana,fireaxe,crowbar,cricket_bat,baseball_bat,tonfa,riotshield,shovel,electric_guitar,knife,frying_pan,pitchfork,pistol_magnum,pistol,chainsaw
pipe_bomb,molotov,vomitjar
first_aid_kit,defibrillator,upgradepack_explosive,upgradepack_incendiary
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