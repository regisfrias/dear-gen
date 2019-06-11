class Particle {
  float x, y, size;
  float randAngle;
  float partX;
  float partY;
  float radius;
  
  Particle(float _x, float _y, float _angle, float _radius){
    x = _x;
    y = _y;
    radius= _radius;
    
    randAngle = random(-QUARTER_PI, QUARTER_PI);
    partX = cos(_angle + randAngle) * radius + x;
    partY = sin(_angle + randAngle) * radius + y;
  }
  
  void draw(){
    line(x, y, partX, partY);
    //bezier(
    ellipse(partX, partY, radius/2, radius/2);
  }
  
  PVector values(){
    PVector values = new PVector(partX, partY, radius/2);
    return values;
  }
}
