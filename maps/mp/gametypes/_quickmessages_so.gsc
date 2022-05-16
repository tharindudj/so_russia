init()
{
	game["menu_quickcommands"] = "quickcommands_fun_so";
	
	precacheMenu(game["menu_quickcommands_fun_so"]);
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
			saytext = "^1Gena Gorin DA-DA";
			break;

		case "2":
			soundalias = "so_fun_2";
			saytext = "^2Casino ";
			break;

		case "3":
			soundalias = "so_fun_3";
			saytext = "^3Yarik potik bochok";
			break;

		case "4":
			soundalias = "so_fun_4";
			saytext = "^4Pognali nahuy";
			break;

		default:
			assert(response == "5");
			soundalias = "^5so_fun_5";
			saytext = "Natalya Morskaya Pehota";
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