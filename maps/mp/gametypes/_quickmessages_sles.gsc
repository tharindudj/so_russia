init()
{
	game["menu_quickcommands"] = "quickcommands_fun_sles";
	
	precacheMenu(game["menu_quickcommands_fun_sles"]);
	//precacheHeadIcon("talkingicon");

}

quickcommands_so_fun(response)
{
	self endon ( "disconnect" );
	
	if(!isdefined(self.pers["team"]) || self.pers["team"] == "spectator" || isdefined(self.spamdelay))
		return;

	self.spamdelay = true;
	
	switch(response)		
	{
		case "1":
			soundalias = "so_fun_1";
			saytext = "SO FUN SOUND 1";
			break;

		case "2":
			soundalias = "so_fun_2";
			saytext = "SO FUN SOUND 2";
			break;

		case "3":
			soundalias = "so_fun_3";
			saytext = "SO FUN SOUND 3";
			break;

		case "4":
			soundalias = "so_fun_4";
			saytext = "SO FUN SOUND 4";
			break;

		case "5":
			soundalias = "so_fun_5";
			saytext = "SO FUN SOUND 5";
			break;

		case "6":
			soundalias = "so_fun_6";
			saytext = "SO FUN SOUND 6";
			break;

		case "7":
			soundalias = "so_fun_7";
			saytext = "SO FUN SOUND 7";
			break;

		case "8":
			assert(response == "8");
			soundalias = "so_fun_8";
			saytext = "SO FUN SOUND 8";
			break;
		
		default:
			assert(response == "9");
			soundalias = "so_fun_9";
			saytext = "SO FUN SOUND 9";
			break;
	}

	self saveHeadIcon();
	self doQuickMessage(soundalias, saytext);

	wait 2;
	self.spamdelay = undefined;
	self restoreHeadIcon();	
}

doQuickMessage( soundalias, saytext )
{
	if(self.sessionstate != "playing")
		return;

		self.headiconteam = "none";
		self.headicon = "talkingicon";

		//self playSound( soundalias );
		level thread maps\mp\gametypes\_endroundmusic::playSoundOnAllPlayersX( soundalias );
		self sayAll(saytext);
}

saveHeadIcon()
{
	if(isdefined(self.headicon))
		self.oldheadicon = self.headicon;

	if(isdefined(self.headiconteam))
		self.oldheadiconteam = self.headiconteam;
}

restoreHeadIcon()
{
	if(isdefined(self.oldheadicon))
		self.headicon = self.oldheadicon;

	if(isdefined(self.oldheadiconteam))
		self.headiconteam = self.oldheadiconteam;
}