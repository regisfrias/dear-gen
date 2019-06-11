class Cell { 
  float x, y;
  float nextX = -1;
  float nextY = -1;
  boolean isNewLine;
  float radius = 0;
  float radiusLimit;
  float angle;
  ArrayList<Particle> particles = new ArrayList<Particle>();
  
  Cell (float _x, float _y, boolean _isNewLine) {
    x = _x;
    y = _y;
    isNewLine = _isNewLine;
  }
  
  void reset(){
    nextX = 0;
    nextY = 0;
  }
  
  void update(float _nextX, float _nextY){
    nextX = _nextX;
    nextY = _nextY;
    radiusLimit = dist(x, y, nextX, nextY);
    angle = atan2(nextY - y, nextX - x);
  }
  
  void draw() { 
    //ellipse(x, y, radius, radius);
    ellipse(x, y, 1, 1);
    if(!isNewLine && nextX >= 0 && nextY >= 0){
      if(radius <= radiusLimit){
        radius += 10;
      
        float randAngle = random(-HALF_PI, HALF_PI);
        float partX = cos(angle + randAngle) * radius*3 + x;
        float partY = sin(angle + randAngle) * radius*3 + y;
        particles.add(new Particle(x, y, partX, partY, radius*3));
      }
      
      float x1 = cos(angle) * radiusLimit + x;
      float y1 = sin(angle) * radiusLimit + y;
      //stroke(255, 0, 0, 100);
      line(x, y, x1, y1);
      
      //stroke(0);
      //line(x, y, nextX, nextY);
      //ellipse(x, y, 8, 8);
      

      for (int i = 0; i < particles.size(); i++) {
        Particle p = particles.get(i);
        p.draw();
      }
    }
  } 
} 
