///////////////////////////////////////////////////////////////
////|         |///|        |///|       |/\  \/////  ///|  |////
////|  |////  |///|  |//|  |///|  |/|  |//\  \///  ////|__|////
////|  |////  |///|  |//|  |///|  |/|  |///\  \/  /////////////
////|          |//|  |//|  |///|       |////\    //////|  |////
////|  |////|  |//|         |//|  |/|  |/////    \/////|  |////
////|  |////|  |//|  |///|  |//|  |/|  |////  /\  \////|  |////
////|  |////|  |//|  | //|  |//|  |/|  |///  ///\  \///|  |////
////|__________|//|__|///|__|//|__|/|__|//__/////\__\//|__|////
///////////////////////////////////////////////////////////////
/*
	BraXi's Death Run Mod
	
	Website: www.braxi.org
	E-mail: paulina1295@o2.pl

	[DO NOT COPY WITHOUT PERMISSION]

	showCredit() written by Bipo.
*/

#include duffman\_common;

main()
{
	blackscreen = addTextHud( level, 0, 0, 0.9, "center", "middle", "center", "middle", 3, 0 );
	blackscreen thread fadeIn(2);
	blackscreen setShader("white",1000,1000);
	blackscreen.color = (0,0,0);
	
	level.creditTime = 5;
	freezeall();
	duffman\_common::cleanScreen();
	wait 1;

	thread showCredit( "_______________________________________", 2.7 );
	wait 0.4;
	thread showCredit( "^5Thank You for Playing", 2.8 );
	wait 0.4;
	thread showCredit( "^8---- ^2Welcome to ^5|SO|Russia ^8----", 2.6 );
	wait 0.4;
	thread showCredit( "^4Discord ^0- https://discord.gg/4etcmpMvww", 1.9 );
	wait 0.4;
	thread showCredit( "^1Our ^2VK Group ^0- ^3https://vk.com/sorussiacod4", 1.9 );
	wait 0.3;
	thread showCredit( "_______________________________________", 2.7 );
	wait 0.4;
	thread showCredit( "^4Owner: ^6|SO|GeRmaJax, ^2|SO|Vani$imu$", 2.5 );
	wait 0.4;
    thread showCredit( "^0Visit our other serversvisit ^3Our other servers", 1.5 );
	wait 0.4;
	thread showCredit( "_______________________________________", 2.7 );
	wait 0.4;
	thread showCredit( "^3For more information visit our website at...", 2.0 );
	wait 0.4;
	thread showCredit( "www.so-russia.tk", 1.9 );
	wait 0.2;
	thread showCredit( "______________", 2.5 );
	wait 0.3;
	thread showCredit( "**", 2.5 );


	wait 0.1; 
	
	self thread addDisplay();
	wait 4;
	wait level.creditTime;
	wait 1.2;

}

addDisplay(){
	
	creditAdd = newHudElem();
	creditAdd.font = "objective";
	creditAdd.alignX = "center";
	creditAdd.alignY = "top";
	creditAdd.horzAlign = "center";
	creditAdd.vertAlign = "top";
	creditAdd setShader( "so_logo", 400, 400 );
	creditAdd.x = 0;
	creditAdd.y = 540;
	creditAdd.sort = 2; //-3
	creditAdd.alpha = 1;
	creditAdd moveOverTime(level.creditTime);
	creditAdd.y = 30;
	creditAdd.foreground = true;
	wait level.creditTime;
	wait 5;
	creditAdd destroy();
}


showCredit( text, scale )
{
	end_text = newHudElem();
	end_text.font = "objective";
	end_text.fontScale = scale;
	end_text SetText(text);
	end_text.alignX = "center";
	end_text.alignY = "top";
	end_text.horzAlign = "center";
	end_text.vertAlign = "top";
	end_text.x = 0;
	end_text.y = 540;
	end_text.sort = 3; //-3
	end_text.alpha = 1;
	//end_text.glowColor = (0.5,0.1,0.8);
	//end_text.glowAlpha = 1;
	end_text moveOverTime(level.creditTime);
	end_text.y = -60;
	end_text.foreground = true;
	wait level.creditTime;
	end_text destroy();
}


neon()
{
	neon = addNeon( "^1www^0.so-russia^0.^1tk", 1.4 );
	while( 1 )
	{
		neon moveOverTime( 8 );
		neon.x = 800;
		wait 15;
		neon moveOverTime( 8 );
		neon.x = -800;
		wait 15;
	}
}

addNeon( text, scale )
{
	end_text = newHudElem();
	end_text.font = "objective";
	end_text.fontScale = scale;
	end_text SetText(text);
	end_text.alignX = "center";
	end_text.alignY = "top";
	end_text.horzAlign = "center";
	end_text.vertAlign = "top";
	end_text.x = -200;
	end_text.y = 8;
	end_text.sort = -1; //-3
	end_text.alpha = 1;
	//end_text.glowColor = (1,0,0.1);
	//end_text.glowAlpha = 1;
	end_text.foreground = true;
	return end_text;
}

freezeall()
{
	for(i=0;i<level.players.size;i++)
		level.players[i] freezecontrols(true);
}
