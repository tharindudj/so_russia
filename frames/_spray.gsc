/*
 *	Script By 
 *	Zoro
 *	
 *	Discord: Zoro#6191
 */

#include maps\mp\_utility;

init()
{
	level thread onPlayerConnect();
	thread buildSprayInfo();
}

buildSprayInfo()
{
	level.sprayInfo = [];
	level.numSprays = 0;
	
	tableName = "mp/sprayTable.csv";

	for( idx = 1; isdefined( tableLookup( tableName, 0, idx, 0 ) ) && tableLookup( tableName, 0, idx, 0 ) != ""; idx++ )
	{
		id = int( tableLookup( tableName, 0, idx, 1 ) );
		level.sprayInfo[id]["effect"] = loadFx( tableLookup( tableName, 0, idx, 2 ) );
		level.numSprays++;
	}
}

onPlayerConnect()
{
	for(;;)
	{
		level waittill("connecting", player);
		player thread onMenuResponse();
	}
}

onMenuResponse()
{
	self endon("disconnect");
	
	for(;;)
	{
		self waittill("menuresponse", menu, response);

		switch( response )
		{
			case "spray_0":
			case "spray_1":
			case "spray_2":
			case "spray_3":
			case "spray_4":
			case "spray_5":
			case "spray_6":
			case "spray_7":
			case "spray_8":
			case "spray_9":
			case "spray_10":
			case "spray_11":
			case "spray_12":
			case "spray_13":
			case "spray_14":
			case "spray_15":
			case "spray_16":
			case "spray_17":
			case "spray_18":
			case "spray_19":
			case "spray_20":
			case "spray_21":
			case "spray_22":
			case "spray_23":
			case "spray_24":
				num = strTok(response, "_")[1];
				self setclientdvar("sprayimg", "spray"+num+"_menu");
				self setstat(61, int(strTok(response, "_")[1]) );
				break;
				
			case "spray":
				self thread sprayIt();
				break;
		}
	}
}

sprayIt()
{
	self endon( "disconnect" );

	angles = self getPlayerAngles();
	eye = self getTagOrigin( "j_head" );
	forward = eye + vector_scale( anglesToForward( angles ), 70 );
	trace = bulletTrace( eye, forward, false, self );
	
	if( trace["fraction"] == 1 )
		return;
	
	position = trace["position"] - vector_scale( anglesToForward( angles ), -2 );
	angles = vectorToAngles( eye - position );
	forward = anglesToForward( angles );
	up = anglesToUp( angles );
	sprayNum = self getStat( 61 );
	
	if( sprayNum < 0 || sprayNum > level.numSprays)
		sprayNum = 0;
	
	playFx( level.sprayInfo[sprayNum]["effect"], position, forward, up );
	self playSound( "sprayer" );
}