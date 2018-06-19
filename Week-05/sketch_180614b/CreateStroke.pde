class CreateStroke {
  boolean isStraightLine = random(1) > 0.5 ? true : false;
  PVector initialPoint;
  PVector supportPoint;
  
  CreateStroke(PVector _initialPoint, PVector _supportPoint){
    initialPoint = _initialPoint;
    supportPoint = _supportPoint;
  }
  
  void draw(){
    if(isStraightLine){
      line(initialPoint.x, initialPoint.y, supportPoint.x, supportPoint.y);
    } else {
      this.drawArc(
        initialPoint,
        supportPoint,
        180
      );
    }
  }

  void drawArc(PVector initialPoint, PVector supportPoint, float arcAngle){
    float angleIncr = 5;
    PVector center = new PVector(
      (supportPoint.x + initialPoint.x)/2,
      (supportPoint.y + initialPoint.y)/2
    );
    
    float radius = dist(initialPoint.x, initialPoint.y, center.x, center.y);
    
    float deltaX = center.x - initialPoint.x;
    float deltaY = center.y - initialPoint.y;
    float initAngle = atan2(deltaY, deltaX)*180.0/PI;
    
    for (float theta = initAngle; theta <= arcAngle + initAngle; theta += angleIncr) {
      float x1 = cos(radians(theta)) * radius + center.x;
      float y1 = sin(radians(theta)) * radius + center.y;
      float x2 = cos(radians(theta-angleIncr)) * radius + center.x;
      float y2 = sin(radians(theta-angleIncr)) * radius + center.y;
      line(x1, y1, x2, y2);
    }
  }
}
