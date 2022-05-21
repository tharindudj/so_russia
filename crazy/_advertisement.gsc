#include duffman\_common;

init()
{
	level.delay = 10;
	level thread advertisement();
}

saytxt(txt)
{
	level hudmsg(txt);
}

advertisement()
{	
	while(1)
	{
	
		level hudmsg("^2SO RUSSIA");
	
		wait level.delay;
	
		//level hudmsg("^9Check Your Xlrstats By Typing ^1!XLRstats ^9 or Visit  ^8htttp://www.128.199.189.160/cod4");
	
		//wait level.delay;
	
//		level hudmsg("^3Visit Our Web Site ^2: ^8so-russia.tk");
		
//		wait level.delay;
		
		level hudmsg("^2Join our ^4Discord");
		
		wait level.delay;
		
		level hudmsg("^3SO Russia Gaming");
		
		wait level.delay;
		
		level hudmsg("^3Server developed by ^0: ^7 Early NoOBs");
		
		wait level.delay;
		
		level hudmsg("^7Now server admins can take ^1player's screenshots.");
		
		wait level.delay;

	}
}

hudmsg(text) 
{
	msg = addTextHud( level, 750, 470, 1, "left", "middle", undefined, undefined, 1.6, 888 );
	msg SetText(text);
	msg.sort = 102;
	msg.foreground = 1;
	msg.archived = true;
	msg.alpha = 1;
	msg.fontScale = 1.5;
	msg.color = level.randomcolour;
	msg MoveHud(30,-1300);
	wait 20;
	msg destroy();
}