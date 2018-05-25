class Bubble {
  float x,y;
  float diameter;
  String name;
  
  boolean over = false;
  
  PVector[] positions;
  color c = color(random(5, 30), random(5, 35), random(0, 25));
  
  Bubble(float x_, float y_, float diameter_, String s) {
    x = x_;
    y = y_;
    diameter = diameter_;
    name = s;
    
    if(diameter > 0){
      positions = new PVector[int(diameter)];
      for(int i = 0; i < int(diameter); i++){
        float randomR = random(diameter);
        float randomA = random(360);
        float thisX = cos(radians(i * randomA)) * randomR + x;
        float thisY = sin(radians(i * randomA)) * randomR + y;
        positions[i] = new PVector(thisX, thisY);
      }
    }
  }
  
  void display() {
    //fill(255);
    //ellipse(x, y, 20, 20);
    
    stroke(c);
    strokeWeight(1);
    noFill();
    
    beginShape();
    if(diameter > 0){
      for(int i = 0; i < int(diameter); i++){
        curveVertex(positions[i].x, positions[i].y);
      }
    }
    endShape();
  }
}
