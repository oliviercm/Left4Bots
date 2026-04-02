/*
If the 'realism' scripts are not defined, use the 'coop' ones.
Search path order:
1. terminatorbots/automation/coop/[map name].nut
2. terminatorbots/automation/coop/l4b_[map name].nut
3. terminatorbots/automation/coop/automation_map_default.nut
4. terminatorbots/automation/coop/l4b_automation_map_default.nut
*/
local path = "terminatorbots/automation/coop/";
if (!IncludeScript(path + ::Left4Bots.MapName))
{
	if (!IncludeScript(path + "l4b_" + ::Left4Bots.MapName))
	{
		if (!IncludeScript(path + "automation_map_default"))
			IncludeScript(path + "l4b_automation_map_default");
	}
}
