class Particle {
  float x, y, size;
  float randAngle;
  float partX, partY, anchorX, anchorY;
  float radius;
  
  Particle(float _x, float _y, float _angle, float _radius){
    x = _x;
    y = _y;
    radius= _radius;
    
    randAngle = random(-QUARTER_PI, QUARTER_PI);
    partX = cos(_angle + randAngle) * radius + x;
    partY = sin(_angle + randAngle) * radius + y;
    anchorX = cos(_angle) * radius/3 + x;
    anchorY = sin(_angle) * radius/3 + y;
  }
  
  PVector[] points(){
    PVector vertices = new PVector(partX, partY, radius/2);
    PVector control = new PVector(anchorX, anchorY);
    PVector[] points = new PVector[2];
    points[0] = vertices;
    points[1] = control;
    return points;
  }
}
