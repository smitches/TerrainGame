float alpha = .866;
float beta = .5;
HashMap<String,Float> pointMap = new HashMap<String,Float>();
Game game = new Game();
Player activePlayer = new Player("Brian",1,color(24,58,242));

enum PStatus{
  ROAD, SETTLEMENT, CITY, INACTIVE, ACTIVE, ROBBER, DEVELOPMENT, TRADE;
}
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
  PStatus status;
  Player(String name, int number, color c){
    this.name = name;
    this.number = number;
    this.materials = new ArrayList<Material>();
    this.playerColor = c;
    game.players.add(this);
    this.status = PStatus.INACTIVE;
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
  void display(){
    
    strokeWeight(2);
    stroke(0);
    if (this.owner != null){stroke(this.owner.playerColor);strokeWeight(5);}
   
    line(this.i1.x , this.i1.y , this.i2.x , this.i2.y);
    
  }
  
  PVector getDistance(float x, float y){
    PVector result = new PVector(); 
    float x1 = this.i1.x;
    float y1 = this.i1.y;
    float x2 = this.i2.x;
    float y2 = this.i2.y;
    
    float dx = x2 - x1; 
    float dy = y2 - y1; 
    float d = sqrt( dx*dx + dy*dy ); 
    float ca = dx/d; // cosine
    float sa = dy/d; // sine 
    
    float mX = (-x1+x)*ca + (-y1+y)*sa; 
    
    if( mX <= 0 ){
      result.x = x1; 
      result.y = y1; 
    }
    else if( mX >= d ){
      result.x = x2; 
      result.y = y2; 
    }
    else{
      result.x = x1 + mX*ca; 
      result.y = y1 + mX*sa; 
    }
    
    dx = x - result.x; 
    dy = y - result.y; 
    result.z = sqrt( dx*dx + dy*dy ); 
    
    return result;
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
  float getDistance(float x, float y){
    return sqrt(sq(x - this.x) + sq(y - this.y));
  }
  void drawSettlement(){
    color cFill = owner.playerColor;
    fill(cFill);
    ellipse(x,y,10,10);
  }
  void drawCity(){
    color cFill = owner.playerColor;
    fill(cFill);
    ellipse(x,y,20,20);
  }
  void display(){
    if (status == IStatus.CITY){
      this.drawCity();
    }else if (status == IStatus.SETTLEMENT){
      this.drawSettlement();
    }
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
  void display(){
    for (Hexagon h : hexagons){h.drawHexagon();}
    for (Road r : roads){r.display();}
    for (Intersection i : intersections){i.display();}
  }
  Road closestRoad(float x, float y){
    Road returnRoad = roads.get(0);
    float minDist = returnRoad.getDistance(x,y).z;
    for (Road r : roads){
      if (minDist > r.getDistance(x,y).z){
        minDist = r.getDistance(x,y).z;
        returnRoad = r;
      }
    }
    return returnRoad;
  }
  Intersection closestIntersection(float x, float y){
    Intersection returnIntersection = intersections.get(0);
    float minDist = returnIntersection.getDistance(x,y);
    for (Intersection i : intersections){
      if (minDist > i.getDistance(x,y)){
        minDist = i.getDistance(x,y);
        returnIntersection = i;
      }
    }
    return returnIntersection;
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
