void setup(){
  //called only once
  size(1000,500);
  background(255);
  
  float scale = 50;
  float offset = 2 * scale * alpha;
  float alpha_offset = alpha * offset;
  float alpha_scale = scale * alpha;
  float half_offset = 1.5 * alpha_scale;
  Hexagon h1 = new Hexagon(width/2             , height/2, scale);
  Hexagon h2 = new Hexagon(width/2 + offset    , height/2, scale);
  Hexagon h3 = new Hexagon(width/2 - offset    , height/2, scale);
  Hexagon h4 = new Hexagon(width/2 + 2 * offset, height/2, scale);
  Hexagon h5 = new Hexagon(width/2 - 2 * offset, height/2, scale);
  
  Hexagon h6 = new Hexagon(width/2 - alpha_scale    , height/2 + alpha_offset, scale);
  Hexagon h7 = new Hexagon(width/2 - alpha_scale    , height/2 - alpha_offset, scale);
  Hexagon h8 = new Hexagon(width/2 - 3 * alpha_scale, height/2 + alpha_offset, scale);
  Hexagon h9 = new Hexagon(width/2 - 3 * alpha_scale, height/2 - alpha_offset, scale);
  
  Hexagon hA = new Hexagon(width/2 + alpha_scale    , height/2 + alpha_offset, scale);
  Hexagon hB = new Hexagon(width/2 + alpha_scale    , height/2 - alpha_offset, scale);
  Hexagon hC = new Hexagon(width/2 + 3 * alpha_scale, height/2 + alpha_offset, scale);
  Hexagon hD = new Hexagon(width/2 + 3 * alpha_scale, height/2 - alpha_offset, scale);
  
  Hexagon hE = new Hexagon(width/2                   , height/2 + 2 * alpha_offset, scale);
  Hexagon hF = new Hexagon(width/2 + 2 * alpha_scale , height/2 + 2 * alpha_offset, scale);
  Hexagon hG = new Hexagon(width/2 - 2 * alpha_scale , height/2 + 2 * alpha_offset, scale);

  Hexagon hH = new Hexagon(width/2                   , height/2 - 2 * alpha_offset, scale);
  Hexagon hI = new Hexagon(width/2 + 2 * alpha_scale , height/2 - 2 * alpha_offset, scale);
  Hexagon hJ = new Hexagon(width/2 - 2 * alpha_scale , height/2 - 2 * alpha_offset, scale);
}
