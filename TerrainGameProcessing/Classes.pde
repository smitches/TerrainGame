float alpha = .866;
float beta = .5;
HashMap<String,Float> pointMap = new HashMap<String,Float>();
Game game = new Game();

enum IStatus{
  EMPTY, SETTLEMENT, CITY;
}
enum MType{
  WOOD, BRICK, ORE, WHEAT, SHEEP;
}

class Material{
  MType type;
}

class Player{
  String name;
  int number;
  ArrayList<Material> materials;
  color playerColor;
  Player(String name, int number, color c){
    this.name = name;
    this.number = number;
    this.materials = new ArrayList<Material>();
    this.playerColor = c;
    game.players.add(this);
  }
}

class Road{
  Intersection i1, i2;
  Player owner;
  Road(Intersection i1, Intersection i2){
    this.i1 = i1;
    this.i2 = i2;
  }
  boolean available(){
    return this.owner == null;
  }
  void drawRoad(){
    
    strokeWeight(2);
    stroke(0);
    if (this.owner != null){stroke(this.owner.playerColor);strokeWeight(5);}
   
    line(this.i1.x , this.i1.y , this.i2.x , this.i2.y);
    
  }
}

class Intersection{
  float x,y;
  ArrayList<Hexagon> hexagons;
  IStatus status;
  Player owner;
  Intersection(float x, float y){
    this.x = x;
    this.y = y;
    status = IStatus.EMPTY;
    hexagons = new ArrayList<Hexagon>();
  }
  void addHexagon(Hexagon h){
    hexagons.add(h);
  }
}

class Game{
  ArrayList<Intersection> intersections = new ArrayList<Intersection>();
  ArrayList<Road> roads = new ArrayList<Road>();
  ArrayList<Hexagon> hexagons = new ArrayList<Hexagon>();
  ArrayList<Player> players = new ArrayList<Player>();
  Intersection getIntersection(float x, float y){
    for (Intersection i : intersections){
      if (i.x == x && i.y == y){return i;}
    }
    Intersection i = new Intersection(x,y);
    intersections.add(i);
    return i;
  }
  Road getRoad(Intersection i1, Intersection i2){
    for (Road r : roads){
      if ((r.i1 == i1 && r.i2 == i2) || (r.i1 == i2 && r.i2 == i1)){
        return r;
      }
    }
    Road r = new Road(i1, i2);
    roads.add(r);
    return r;
  }
  void drawGame(){
    for (Hexagon h : hexagons){h.drawHexagon();}
    for (Road r : roads){r.drawRoad();}
  }
}

class Hexagon{
  float x,y;
  ArrayList<Intersection> hexIntersections;
  MType type;
  
  public Hexagon(float x, float y, float scale){
     float a = alpha * scale;
     float b = beta * scale;
     
     this.x = x;
     this.y = y;
     this.hexIntersections = new ArrayList<Intersection>();
     
     Intersection i1 = game.getIntersection(round(x)    , round(y + 2*b));
     Intersection i2 = game.getIntersection(round(x)    , round(y - 2*b));
     Intersection i3 = game.getIntersection(round(x + a), round(y +   b));
     Intersection i4 = game.getIntersection(round(x + a), round(y -   b));
     Intersection i5 = game.getIntersection(round(x - a), round(y -   b));
     Intersection i6 = game.getIntersection(round(x - a), round(y +   b));
     
     hexIntersections.add(i1);  i1.addHexagon(this);
     hexIntersections.add(i6);  i6.addHexagon(this);
     hexIntersections.add(i5);  i5.addHexagon(this);
     hexIntersections.add(i2);  i2.addHexagon(this);
     hexIntersections.add(i4);  i4.addHexagon(this);
     hexIntersections.add(i3);  i3.addHexagon(this);
     
     this.drawHexagon();
     game.hexagons.add(this);
  }
  
  void setMaterial(MType m){
    this.type = m;
  }
  
  void drawHexagon(){
    fill(200);
    beginShape();
    for (Intersection i : this.hexIntersections){
      vertex(i.x,i.y);
    }
    endShape(CLOSE);
    
    for (int i = 0; i<this.hexIntersections.size()-1; i++){
      game.getRoad(hexIntersections.get(i), hexIntersections.get(i+1));
    }
    
  }
}
