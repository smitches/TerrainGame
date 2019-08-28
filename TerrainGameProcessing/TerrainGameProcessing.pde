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
  Player p1 = new Player("Brian",1,color(200,0,200));
  Player p2 = new Player("Sofi",2,color(200,0,0));
  Player p3 = new Player("Jerry",3,color(0,0,200));  
  Player p4 = new Player("Damon",4,color(200,100,100));
  game.roads.get(10).owner = p1;
  game.roads.get(14).owner = p2;
  game.roads.get(2).owner = p3;
  game.roads.get(20).owner = p4;
  game.roads.get(4).owner = p4;
  game.drawGame();
}

void draw(){}
