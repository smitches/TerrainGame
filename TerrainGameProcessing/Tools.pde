class Button{
  float x,y;
  Button(float x, float y){
    this.x=x; 
    this.y=y;
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
    fill(200,0,0);ellipse(x,y,r,r);
  }
}
class RectButton extends Button{
  float w, h;
  color c;
  RectButton(float x, float y, float w, float h, color c){
    super(x,y);
    this.w=w; this.h=h; this.c = c;
  }
  boolean inRange(){ 
    return (x<mouseX && mouseX<(x+w) && y<mouseY && mouseY<(y+h));
  }
  void display(){
    fill(c); 
    rect(x,y,w,h);
  }
}
