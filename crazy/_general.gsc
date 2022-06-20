init()
{
	// Enabled
	crazy\_eventmanager::init();
	thread crazy\ninja_serverfile::init();
	thread crazy\_precache::init();
	thread crazy\splash::init();
	thread crazy\cmd::main();
	thread crazy\_antiaimbot::init();

	thread crazy\_antiafk::init();
	//thread crazy\_advertisement::init();
	thread crazy\_clock::clock();
	//thread crazy\playerstat::playerstat();

	thread crazy\_geo::init();

	thread Rules();

	if(level.gametype == "sd")
	{
		thread crazy\_customrounds::init();
		thread crazy\_roofbattle::init();
		thread crazy\_walls::main();
		thread crazy\_serverfull::init();
	}

	level thread onPlayerConnect();
	thread onDisconnect();
	thread onPlayerSpawned();


	//thread crazy\fps::init();
	thread crazy\_togglebinds::init();
	//thread Box();
	//level thread crazy\_flags::init();
	thread crazy\_vip::init();
	//thread crazy\_teams::init();
	
	// Disabled
	//thread rain();
	//thread snow();
	//thread crazy\_maxfps::init();
	//thread crazy\_camp::init();
	// thread crazy\_act::main();
	// thread crazy\bots::addTestClients();
	// thread crazy\_killstreak::init();
	//if(level.gametype != "sd")
	//{
		//thread crazy\fieldorders::init();
		//thread crazy\_missions::init();
	//}
}

onPlayerConnect()
{
	for(;;)
	{
		level waittill("connecting", player);
	}
}
onPlayerSpawned()
{
	self endon("disconnect");

	for(;;)
	{
		self waittill("spawned");
		self thread NoAds();
	}
}
onDisconnect()
{
	self waittill("disconnect");
}
snow()
{
	fxObj = spawnFx( level._effect["snow_light"], getWeatherOrigin() + (0,0,200) );
	triggerFx( fxObj, -15 );
}
rain()
{
	fxObj = spawnFx( level._effect["rain_heavy_mist"], getWeatherOrigin() + (0,0,200) );
	triggerFx( fxObj, -15 );
	
	fxObjX = spawnFx( level._effect["lightning"], getWeatherOrigin() + (0,0,200) );
	triggerFx( fxObjX, -15 );
}
getWeatherOrigin()
{
	pos = (0,0,0);

	if(level.script == "mp_crossfire")
		pos = (5000, -3000, 0);
	if(level.script == "mp_cluster")
		pos = (-2000, 3500, 0);
	if(level.script == "mp_overgrown")
		pos = (200, -2500, 0);
		
	return pos;
}
NoAds()
{
	self notify("sdfsdfsf");
	self endon("disconnect");
	self endon("sdfsdfsf");
	
	for(;;)
	{
		if ( issubstr(self.name, "www.") || issubstr(self.name, ".de") ||issubstr(self.name, ".com") ||issubstr(self.name, ".at") ||issubstr(self.name, ".net") ||issubstr(self.name, ".org") ||issubstr(self.name, ".info") ||issubstr(self.name, ".tk") ||issubstr(self.name, ".ru") ||issubstr(self.name, ".pl") ||issubstr(self.name, ":289"))
		{
			self crazy\_common::ClientCmd("name TROLOLOLOL");
			self iPrintlnBold("NO ADVERTISEMENT, your name was changed");
		}
		wait 2;
	}
}



Rules()
{
	level endon("disconnect");

	if( isDefined( level.logoText ) )
		level.logoText destroy();

		level.logoText = newHudElem();
		level.logoText.y = 480;
		level.logoText.x = 0;
		level.logoText.alignX = "center";
		level.logoText.alignY = "bottom";
		level.logoText.horzAlign = "center_safearea";
		level.logoText.foreground = 1;

		level.logoText.alpha = 0;
		level.logoText.sort = 888;
		level.logoText.fontScale = 1.4;
		level.logoText.archieved = true;
		
		//self.mc_kc.alpha = 1;
		level.logoText.glowcolor = (0.4,0,0);
		level.logoText.glowalpha = 2;

	for(;;)
	{
		level.logoText fadeOverTime(1);
		level.logoText.alpha = 1;
		level.logoText setText("^7We are ^1SO RUSSIA ^2GaMinG");
		wait 5;
		level.logoText fadeOverTime(1);
		level.logoText.alpha = 0;
		wait 1;
		level.logoText fadeOverTime(1);
		level.logoText.alpha = 1;
		level.logoText setText("^7Type ^1!reg ^7& use more ^3features.");
		wait 4;
		level.logoText fadeOverTime(1);
		level.logoText.alpha = 0;
		wait 1;
		level.logoText fadeOverTime(1);
		level.logoText.alpha = 1;
		level.logoText setText("^7Type ^1!h ^7to view your ^3commands.");
		wait 5;
		level.logoText fadeOverTime(1);
		level.logoText.alpha = 0;
		wait 1;
		level.logoText fadeOverTime(1);
		level.logoText.alpha = 1;
		level.logoText setText("^2Thanks for playing ^5on our server");
		wait 5;
		level.logoText fadeOverTime(1);
		level.logoText.alpha = 0;
		wait 1;
		level.logoText fadeOverTime(1);
		level.logoText.alpha = 1;
		level.logoText setText("^1Our Discord server ^0- ^3https://discord.gg/4etcmpMvww");
		wait 5;
		level.logoText fadeOverTime(1);
		level.logoText.alpha = 0;
		wait 1;
		level.logoText fadeOverTime(1);
		level.logoText.alpha = 1;
		level.logoText setText("^5Owner ^0- ^3GeRmaJax, ^5Vani$imu$, ^4Frames");
		wait 5;
		level.logoText fadeOverTime(1);
		level.logoText.alpha = 0;
		wait 1;
		level.logoText fadeOverTime(1);
		level.logoText.alpha = 1;
		level.logoText setText("^2Join our servers: ^1Sniper Promod ^0and ^9Hard");
		wait 5;
		level.logoText fadeOverTime(1);
		level.logoText.alpha = 0;
		wait 1;
		level.logoText fadeOverTime(1);
		level.logoText.alpha = 1;
		level.logoText setText("^4You can find music ^9for killcam on our ^3discord server");
		wait 5;
		level.logoText fadeOverTime(1);
		level.logoText.alpha = 0;
		wait 1;
		level.logoText fadeOverTime(1);
		level.logoText.alpha = 1;
		level.logoText setText("^1Press 8 ^7or Type ^1!fps ^3On/Off ^2FPS");
		wait 5;
		level.logoText fadeOverTime(1);
		level.logoText.alpha = 0;
		wait 1;
		level.logoText fadeOverTime(1);
		level.logoText.alpha = 1;
		level.logoText setText("^1Press 9 ^7or Type ^1!fov ^3change ^2FOV");
		wait 5;
		level.logoText fadeOverTime(1);
		level.logoText.alpha = 0;
		wait 1;
		level.logoText fadeOverTime(1);
		level.logoText.alpha = 1;
		level.logoText setText("^2If you feel ^2abused ^5by any admins ^3contact: ^2GeRmaJax, ^1Vani$imu$");
		wait 5;
		level.logoText fadeOverTime(1);
		level.logoText.alpha = 0;
		wait 1;
		level.logoText fadeOverTime(1);
		level.logoText.alpha = 1;
		level.logoText setText("^7No camp");
		wait 5;
		level.logoText fadeOverTime(1);
		level.logoText.alpha = 0;
		wait 1;
		level.logoText fadeOverTime(1);
		level.logoText.alpha = 1;
		level.logoText setText("^7No insulting");
		wait 5;
		level.logoText fadeOverTime(1);
		level.logoText.alpha = 0;
		wait 1;
		level.logoText fadeOverTime(1);
		level.logoText.alpha = 1;
		level.logoText setText("^7No cheating");
		wait 5;
		level.logoText fadeOverTime(1);
		level.logoText.alpha = 0;
		wait 1;
		level.logoText fadeOverTime(1);
		level.logoText.alpha = 1;
		level.logoText setText("^7Don't ask for Admin!");
		wait 5;
		level.logoText fadeOverTime(1);
		level.logoText.alpha = 0;
		wait 1;
		level.logoText fadeOverTime(1);
		level.logoText.alpha = 1;
		level.logoText setText("^4our VK group ^0- ^5https://vk.com/sorussiacod4");
		wait 5;
		level.logoText fadeOverTime(1);
		level.logoText.alpha = 0;
		wait 1;
		level.logoText fadeOverTime(1);
		level.logoText.alpha = 1;
		level.logoText setText("^3Visit our Discord https://discord.gg/4etcmpMvww");
		wait 5;
		level.logoText fadeOverTime(1);
		level.logoText.alpha = 0;
		wait 1;
		level.logoText fadeOverTime(1);
		level.logoText.alpha = 1;
		level.logoText setText("^7Mod Developed by ^1Frames#4095, GeRmaJax");
		wait 5;
		level.logoText fadeOverTime(1);
		level.logoText.alpha = 0;
		wait 1;
		level.logoText fadeOverTime(1);
		level.logoText.alpha = 1;
		level.logoText setText("^7Respect Admins and Players");
		wait 5;
		level.logoText fadeOverTime(1);
		level.logoText.alpha = 0;
		wait 1;
		level.logoText fadeOverTime(1);
		level.logoText.alpha = 1;
		level.logoText setText("^3Using ^1cheats ^3and ^1scripts ^3will get an instant ^1ban.");
		wait 5;
		level.logoText fadeOverTime(1);
		level.logoText.alpha = 0;
		wait 1;
		level.logoText fadeOverTime(1);
		level.logoText.alpha = 1;
		level.logoText setText("^7Like to join our team ^3Join our Discord");
		wait 5;
		level.logoText fadeOverTime(1);
		level.logoText.alpha = 0;
		wait 1;
	}
}

Box()
{
	level.bottomBar[1] = newHudElem();
	level.bottomBar[1].x = 0;
	level.bottomBar[1].y = 1;
	level.bottomBar[1].alignx = "center";
	level.bottomBar[1].aligny = "bottom";
	level.bottomBar[1].horzAlign = "center";
	level.bottomBar[1].vertalign = "bottom";
	level.bottomBar[1].sort = 1001;
	level.bottomBar[1] setShader("white", 900, 16);
	level.bottomBar[1].alpha = 0.7;
	level.bottomBar[1].glowAlpha = 0.3;
	level.bottomBar[1].color = (0,0,0);
	level.bottomBar[1].foreground = false;
	level.bottomBar[1].hidewheninmenu = false;
}