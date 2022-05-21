init(){ 
	for(;;){
		level waittill("connected",player);
		player thread helloSpectators();
	}
}
	
helloSpectators() {
	self endon( "disconnect" );
	for(;;) {
		self.spectators = [];
		players_ = getEntArray( "player", "classname" );
		for( i = 0; i < players_.size; i++ ) {
			if( self getEntityNumber() == players_[i].spectatorClient )
			self.spectators[ self.spectators.size ] = players_[i].name;
		}
		if( self.spectators.size > 0 ) {
			if( !isDefined( self.spectatorList ) ) {
				self.spectatorList = newClientHudElem( self );
				self.spectatorList.horzAlign = "right";
				self.spectatorList.vertAlign = "top";
				self.spectatorList.alignX = "right";
				self.spectatorList.alignY = "middle";
				self.spectatorList.x = -5;
				self.spectatorList.y = 100;
				self.spectatorList.font = "default";	
				self.spectatorList.fontscale = 1.4;	
				self.spectatorList.hidewheninmenu = true;
				self.spectatorList.color = (0.58, 0.58, 0.58);
			}
			spectatorString = "";
			for( i = 0; i < self.spectators.size; i++ ){
				spectatorString += self.spectators[i];
				if( i < self.spectators.size - 1 )
				spectatorString += "\n^7";
				if( i > 5 )
				spectatorString = self.spectators[0] + "\n^7" + self.spectators[1] + "\n^7" + self.spectators[2] + "\n^7" + self.spectators[3] + "\n^7" + self.spectators[4] + "\n^7" + "^0And More..";
			}
			self.spectatorList setText( "^0- Spectators -\n^7" + spectatorString );
		} 
		else if( isDefined( self.spectatorList ) )
			self.spectatorList destroy();
		//if ( self.killcam == true )
		//	self.spectatorList  destroy();
		wait 1;
	}
}