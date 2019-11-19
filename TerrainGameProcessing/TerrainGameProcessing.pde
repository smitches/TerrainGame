//Make buttons active/inactive
//Draweverything in loop
//Allow player to change
//Only allow one build per turn
//Display materials owned
//Trade materials with the bank
//Trade materials with other users


float alpha = .866;
float beta = .5;
Game game = new Game();
Player activePlayer;

void setup(){
  //called only once
  size(1000,500);
  
  makeHexagons();
  
  makePlayers();
  
  game.nextActivePlayer();
  
  
}


void draw(){
  background(activePlayer.playerColor);
  drawBoardBackground();
  game.display();
  activePlayer.display();
}
void drawBoardBackground(){
  fill(54,250,255);
    
  //draw the shape
  beginShape();
  vertex(.35*width, 30);
  vertex(.25*width, .5*height);
  vertex(.35*width, height-30);
  vertex(.65*width, height-30);
  vertex(.75*width, .5*height);
  vertex(.65*width, 30);
  endShape(CLOSE);
  
}
void seeIfBtnIsClicked(){
    if (activePlayer.roadBtn.inRange()){
    activePlayer.status = PStatus.ROAD;
    return;
  }else if(activePlayer.cityBtn.inRange()){
    activePlayer.status = PStatus.CITY;
    return;
  }else if(activePlayer.settlementBtn.inRange()){
    activePlayer.status = PStatus.SETTLEMENT;
    return;
  }else if(activePlayer.devBtn.inRange()){
    activePlayer.status = PStatus.DEVELOPMENT;
    return;
  }else if(activePlayer.tradeBtn.inRange()){
    activePlayer.status = PStatus.TRADE;
    return;
  }else if(activePlayer.finishBtn.inRange()){
    game.nextActivePlayer();
    return;
  }//TODO ROBBER

}
void mouseClicked(){
  seeIfBtnIsClicked();
  
  if (activePlayer.status == PStatus.ROAD){
    Road closestRoad = game.closestRoad(mouseX,mouseY);
    if (closestRoad.owner != null){return;}
    closestRoad.owner = activePlayer;
    closestRoad.display();
  }else if (activePlayer.status == PStatus.SETTLEMENT){
    Intersection closestIntersection = game.closestIntersection(mouseX, mouseY);
    if (closestIntersection.owner != null){return;}
    closestIntersection.status = IStatus.SETTLEMENT;
    closestIntersection.owner = activePlayer;
    closestIntersection.display();
  }else if (activePlayer.status == PStatus.CITY){
    Intersection closestIntersection = game.closestIntersection(mouseX, mouseY);
    //if (closestIntersection.proposedOwner != null){return;}
    closestIntersection.status = IStatus.CITY;
    closestIntersection.owner = activePlayer;
    closestIntersection.display();
  }else if (activePlayer.status == PStatus.DEVELOPMENT){
    //TODO
  }else if (activePlayer.status == PStatus.TRADE){
    //TODO
  }else if (activePlayer.status == PStatus.INACTIVE){
    //TODO
  }
}
