RectButton roadBtn,settlementBtn,cityBtn,tradeBtn,devBtn,finishBtn;
void setup(){
  //called only once
  size(1000,500);
  background(255);
  
  float scale = 50;
  float offset = 2 * scale * alpha;
  float alpha_offset = alpha * offset;
  float alpha_scale = scale * alpha;
  float w = width/2, h = height/2;
  
  //center row
  Hexagon h1 = new Hexagon(w                   , h                   , scale);
  Hexagon h2 = new Hexagon(w +     offset      , h                   , scale);
  Hexagon h3 = new Hexagon(w -     offset      , h                   , scale);
  Hexagon h4 = new Hexagon(w + 2 * offset      , h                   , scale);
  Hexagon h5 = new Hexagon(w - 2 * offset      , h                   , scale);
  
  //row 1 above & 1 below
  Hexagon h6 = new Hexagon(w -     alpha_scale , h +     alpha_offset, scale);
  Hexagon h7 = new Hexagon(w -     alpha_scale , h -     alpha_offset, scale);
  Hexagon h8 = new Hexagon(w - 3 * alpha_scale , h +     alpha_offset, scale);
  Hexagon h9 = new Hexagon(w - 3 * alpha_scale , h -     alpha_offset, scale);
  
  Hexagon hA = new Hexagon(w +     alpha_scale , h +     alpha_offset, scale);
  Hexagon hB = new Hexagon(w +     alpha_scale , h -     alpha_offset, scale);
  Hexagon hC = new Hexagon(w + 3 * alpha_scale , h +     alpha_offset, scale);
  Hexagon hD = new Hexagon(w + 3 * alpha_scale , h -     alpha_offset, scale);
  
  //row 2 above & 2 below
  Hexagon hE = new Hexagon(w                   , h + 2 * alpha_offset, scale);
  Hexagon hF = new Hexagon(w + 2 * alpha_scale , h + 2 * alpha_offset, scale);
  Hexagon hG = new Hexagon(w - 2 * alpha_scale , h + 2 * alpha_offset, scale);

  Hexagon hH = new Hexagon(w                   , h - 2 * alpha_offset, scale);
  Hexagon hI = new Hexagon(w + 2 * alpha_scale , h - 2 * alpha_offset, scale);
  Hexagon hJ = new Hexagon(w - 2 * alpha_scale , h - 2 * alpha_offset, scale);
  
  print(game.intersections.size());
  //Player p2 = new Player("Sofi",2,color(200,0,0));
  //Player p3 = new Player("Jerry",3,color(0,0,200));  
  //Player p4 = new Player("Damon",4,color(200,100,100));
  //game.roads.get(14).owner = p2;
  //game.roads.get(2).owner = p3;
  //game.roads.get(20).owner = p4;
  //game.roads.get(4).owner = p4;
  game.display();
  
  roadBtn = new RectButton(15,15,100,50, color(255));
  settlementBtn = new RectButton(15,75,100,50, color(255));
  cityBtn = new RectButton(15,135,100,50, color(255));
  tradeBtn = new RectButton(15,195,100,50, color(255));
  devBtn = new RectButton(15,255,100,50, color(255));
  finishBtn = new RectButton(15,315,100,50, color(255));
  roadBtn.display();
  settlementBtn.display();
  cityBtn.display();
  tradeBtn.display();
  devBtn.display();
  finishBtn.display();
  
}

void draw(){}

void mouseClicked(){
  if (roadBtn.inRange()){
    activePlayer.status = PStatus.ROAD;
    return;
  }else if(cityBtn.inRange()){
    activePlayer.status = PStatus.CITY;
    return;
  }else if(settlementBtn.inRange()){
    activePlayer.status = PStatus.SETTLEMENT;
    return;
  }else if(devBtn.inRange()){
    activePlayer.status = PStatus.DEVELOPMENT;
    return;
  }else if(tradeBtn.inRange()){
    activePlayer.status = PStatus.TRADE;
    return;
  }else if(finishBtn.inRange()){
    activePlayer.status = PStatus.INACTIVE;
    return;
  }//TODO ROBBER
  
  if (activePlayer.status == PStatus.ROAD){
    Road closestRoad = game.closestRoad(mouseX,mouseY);
    closestRoad.owner = activePlayer;
    closestRoad.display();
  }else if (activePlayer.status == PStatus.SETTLEMENT){
    Intersection closestIntersection = game.closestIntersection(mouseX, mouseY);
    closestIntersection.owner = activePlayer;
    closestIntersection.drawSettlement();
  }else if (activePlayer.status == PStatus.CITY){
    Intersection closestIntersection = game.closestIntersection(mouseX, mouseY);
    closestIntersection.owner = activePlayer;
    closestIntersection.drawCity();
  }else if (activePlayer.status == PStatus.DEVELOPMENT){
    //TODO
  }else if (activePlayer.status == PStatus.TRADE){
    //TODO
  }else if (activePlayer.status == PStatus.INACTIVE){
    //TODO
  }
}
