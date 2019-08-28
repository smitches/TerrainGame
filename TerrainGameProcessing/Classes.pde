class Intersection{
  float x,y;
  ArrayList<Hexagon> hexagons;
  Intersection(float x, float y){
    this.x = x;
    this.y = y;
    hexagons = new ArrayList<Hexagon>();
  }
  void addHexagon(Hexagon h){
    hexagons.add(h);
  }
}

class Intersections{
  ArrayList<Intersection> intersections = new ArrayList<Intersection>();
  Intersection getIntersection(float x, float y){
    for (Intersection i : intersections){
      if (i.x == x && i.y == y){return i;}
    }
    Intersection i = new Intersection(x,y);
    intersections.add(i);
    return i;
  }
  
}

float alpha = .866;
float beta = .5;
HashMap<String,Float> pointMap = new HashMap<String,Float>();
Intersections intersections = new Intersections();

class Hexagon{
  float x,y;
  ArrayList<Intersection> hexIntersections;
  public Hexagon(float x, float y, float scale){
     float a = alpha * scale;
     float b = beta * scale;
     
     this.x = x;
     this.y = y;
     hexIntersections = new ArrayList<Intersection>();
     
     Intersection i1 = intersections.getIntersection(round(x)    , round(y + 2*b));
     Intersection i2 = intersections.getIntersection(round(x)    , round(y - 2*b));
     Intersection i3 = intersections.getIntersection(round(x + a), round(y +   b));
     Intersection i4 = intersections.getIntersection(round(x + a), round(y -   b));
     Intersection i5 = intersections.getIntersection(round(x - a), round(y -   b));
     Intersection i6 = intersections.getIntersection(round(x - a), round(y +   b));
     
     hexIntersections.add(i1);  i1.addHexagon(this);
     hexIntersections.add(i6);  i6.addHexagon(this);
     hexIntersections.add(i5);  i5.addHexagon(this);
     hexIntersections.add(i2);  i2.addHexagon(this);
     hexIntersections.add(i4);  i4.addHexagon(this);
     hexIntersections.add(i3);  i3.addHexagon(this);
     
     this.drawHexagon();
     
     //pointMap.put("x",float(round(x)));
     //pointMap.put("y",float(round(y)));
     //pointMap.put("x-a",float(round(x-a)));
     //pointMap.put("x+a",float(round(x+a)));
     //pointMap.put("y+b",float(round(y+b)));
     //pointMap.put("y+2b",float(round(y+2*b)));
     //pointMap.put("y-b",float(round(y-b)));
     //pointMap.put("y-2b",float(round(y-2*b)));
     
     //println(pointMap);
  }
  void drawHexagon(){
    fill(200);
    beginShape();
    for (Intersection i : this.hexIntersections){
      vertex(i.x,i.y);
    }
    endShape(CLOSE);
  }
}
