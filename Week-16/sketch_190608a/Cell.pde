class Cell {
  float age;
  public boolean isAlive;
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
    isAlive = true;
  }
  
  void reset(){
    nextX = 0;
    nextY = 0;
  }
  
  void grow(){
    if(age <= 100){
      age += 0.25;
    } else {
      isAlive = false;
    }
  }
  
  void update(float _nextX, float _nextY){
    nextX = _nextX;
    nextY = _nextY;
    radiusLimit = dist(x, y, nextX, nextY);
    angle = atan2(nextY - y, nextX - x);
  }
  
  void draw() { 
    //ellipse(x, y, radius, radius);
    //ellipse(x, y, 1, 1);
    if(!isNewLine && nextX >= 0 && nextY >= 0){
      if(radius <= radiusLimit){
        radius += 10;
        particles.add(new Particle(x, y, angle, radius*3));
      }
      
      float x1 = cos(angle) * radiusLimit + x;
      float y1 = sin(angle) * radiusLimit + y;
      //stroke(255, 0, 0, 100);
      stroke(0, 0, 0, 100 - age);
      fill(0, 0, 100, 100 - age);
      line(x, y, x1, y1);
      
      //stroke(0);
      //line(x, y, nextX, nextY);
      //ellipse(x, y, 8, 8);
      

      for (int i = 0; i < particles.size(); i++) {
        Particle p = particles.get(i);
        //p.draw();
        PVector values = p.values();
        line(x, y, values.x, values.y);
        //bezier(
        ellipse(values.x, values.y, values.z, values.z);
      }
    }
  } 
} 
