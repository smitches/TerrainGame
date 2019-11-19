class Button{
  float x,y;
  boolean disabled;
  Button(float x, float y){
    this.x=x; 
    this.y=y;
    disabled = false;
  }
}
class CircleButton extends Button{
  float r;
  CircleButton(float x, float y, float r){
    super(x, y);
    this.r =r;
  }
  boolean inRange(){
    return (dist(mouseX,mouseY,x,y)<r);
  }
  void display(){ 
    if(disabled){
      fill(200);
    }else{
      fill(100,150,200);
    }
    ellipse(x,y,r,r);
  }
}
class RectButton extends Button{
  float w, h;
  color c;
  String text;
  RectButton(float x, float y, float w, float h, color c, String text){
    super(x,y);
    this.w=w; 
    this.h=h; 
    this.c = c;
    this.text = text;
  }
  boolean inRange(){ 
    return (x<mouseX && mouseX<(x+w) && y<mouseY && mouseY<(y+h)) && !disabled;
  }
  void display(){
    if(disabled){
      fill(200);
    }else{
      fill(c);
    }
    rect(x,y,w,h);
    fill(0);
    textAlign(CENTER,CENTER);
    text(text, (x+(x+w))/2+2, (y+(y+h))/2);
  }
}

void makeHexagons(){
  float scale = 50;
  float offset = 2 * scale * alpha;
  float alpha_offset = alpha * offset;
  float alpha_scale = scale * alpha;
  float w = width/2, h = height/2;
  
  //center row
  Hexagon hex = new Hexagon(w                   , h                   , scale); hex.number = 2; hex.type = MType.DESERT;
  hex = new Hexagon(w +     offset      , h                   , scale); hex.number = 3; hex.type = MType.BRICK;
  hex = new Hexagon(w -     offset      , h                   , scale); hex.number = 12; hex.type = MType.ORE;
  hex = new Hexagon(w + 2 * offset      , h                   , scale); hex.number = 10; hex.type = MType.WHEAT;
  hex = new Hexagon(w - 2 * offset      , h                   , scale); hex.number = 8; hex.type = MType.SHEEP;
  
  //row 1 above & 1 below
  hex = new Hexagon(w -     alpha_scale , h +     alpha_offset, scale); hex.number = 9; hex.type = MType.WHEAT;
  hex = new Hexagon(w -     alpha_scale , h -     alpha_offset, scale); hex.number = 4; hex.type = MType.BRICK;
  hex = new Hexagon(w - 3 * alpha_scale , h +     alpha_offset, scale); hex.number = 11; hex.type = MType.WOOD;
  hex = new Hexagon(w - 3 * alpha_scale , h -     alpha_offset, scale); hex.number = 3; hex.type = MType.WHEAT;
  
  hex = new Hexagon(w +     alpha_scale , h +     alpha_offset, scale); hex.number = 5; hex.type = MType.SHEEP;
  hex = new Hexagon(w +     alpha_scale , h -     alpha_offset, scale); hex.number = 11; hex.type = MType.SHEEP;
  hex = new Hexagon(w + 3 * alpha_scale , h +     alpha_offset, scale); hex.number = 6; hex.type = MType.ORE;
  hex = new Hexagon(w + 3 * alpha_scale , h -     alpha_offset, scale); hex.number = 10; hex.type = MType.WOOD;
  
  //row 2 above & 2 below
  hex = new Hexagon(w                   , h + 2 * alpha_offset, scale); hex.number = 3; hex.type = MType.WOOD;
  hex = new Hexagon(w + 2 * alpha_scale , h + 2 * alpha_offset, scale); hex.number = 2; hex.type = MType.WHEAT;
  hex = new Hexagon(w - 2 * alpha_scale , h + 2 * alpha_offset, scale); hex.number = 8;  hex.type = MType.BRICK;

  hex = new Hexagon(w                   , h - 2 * alpha_offset, scale); hex.number = 5;  hex.type = MType.ORE;
  hex = new Hexagon(w + 2 * alpha_scale , h - 2 * alpha_offset, scale); hex.number = 6; hex.type = MType.BRICK;
  hex = new Hexagon(w - 2 * alpha_scale , h - 2 * alpha_offset, scale); hex.number = 4; hex.type = MType.WOOD;
}
void makePlayers(){
  new Player("Brian",1,color(0,0,200));
  new Player("Sofi",2,color(200,0,0));
  new Player("Jerry",3,color(100,200,100));  
  new Player("Damon",4,color(200,0,200));
}
