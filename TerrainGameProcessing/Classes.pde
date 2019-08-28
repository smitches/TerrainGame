float alpha = .866;
float beta = .5;
HashMap<String,Float> pointMap = new HashMap<String,Float>();
class Hexagon{
  float x,y;
  public Hexagon(float x, float y, float scale){
     float a = alpha * scale;
     float b = beta * scale;
     
     this.x = x;
     this.y = y;
     
     Tool helper = new Tool();
     
     fill(0)   ;
     stroke(0) ;
     helper.drawLine(x    , y + 2*b , x - a, y + b  );
     helper.drawLine(x - a, y + b   , x - a, y - b  );
     helper.drawLine(x - a, y - b   , x    , y - 2*b);
     helper.drawLine(x    , y - 2*b , x + a, y - b  );
     helper.drawLine(x + a, y - b   , x + a, y + b  );
     helper.drawLine(x + a, y + b   , x    , y + 2*b);
     
     
     pointMap.put("x",float(round(x)));
     pointMap.put("y",float(round(y)));
     pointMap.put("x-a",float(round(x-a)));
     pointMap.put("x+a",float(round(x+a)));
     pointMap.put("y+b",float(round(y+b)));
     pointMap.put("y+2b",float(round(y+2*b)));
     pointMap.put("y-b",float(round(y-b)));
     pointMap.put("y-2b",float(round(y-2*b)));
     
     println(pointMap);
  }
}
