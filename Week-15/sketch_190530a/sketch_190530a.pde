float padding;

void setup(){
  //size(580, 920);
  size(580, 820);
  padding = width/8;
  noLoop();
}

void draw(){
  //translate(0, -height/2);
  
  noStroke();
  fill(0, 50);
  
  //PVector startPoint = new PVector(width - padding, padding);
  //PVector newTriangle = drawTriangle(startPoint);
  //drawTriangle(newTriangle);

  PVector lastPoint = new PVector(width - padding, padding);
  for(int i = 0; i < 4; i++){
    PVector newTriangle = drawTriangle(lastPoint);
    lastPoint = newTriangle;
  }
}

PVector drawTriangle(PVector startPoint) {
  float endPointX = startPoint.x < width/2 ? width - padding : padding;
  PVector endPoint = new PVector(endPointX, startPoint.y + padding);
  float slope = (startPoint.y - endPoint.y) / (startPoint.x - endPoint.x);
  
  float radius = height/2;
  float perpendicularSlope = -1 / slope;
  PVector midPoint = midPoint(startPoint, endPoint);
  
  PVector center = pointFromMidpoint(midPoint, radius, perpendicularSlope);
  
  noStroke();
  ellipse(startPoint.x, startPoint.y, 10, 10);
  ellipse(endPoint.x, endPoint.y, 10, 10);
  ellipse(center.x, center.y, 4, 4);

  stroke(255, 0, 0, 120);
  line(startPoint.x, startPoint.y, endPoint.x, endPoint.y);
  //println(center);
  return endPoint;
}

PVector midPoint(PVector startPoint, PVector endPoint) {
  float midPointX = (startPoint.x + endPoint.x) / 2;
  float midPointY = (startPoint.y + endPoint.y) / 2;
  PVector midPoint = new PVector(midPointX, midPointY);
  return midPoint;
}

// Calculate point l pixels away from midpoint with given slope
// Found here:
// https://www.geeksforgeeks.org/find-points-at-a-given-distance-on-a-line-of-given-slope/
PVector pointFromMidpoint(PVector source, float l, float m) {
  // m is the slope of line, and the  
  // required Point lies distance l  
  // away from the source Point 
  PVector pointA, pointB;

  // slope is 0 
  //if (m == 0) { 
  //  point = new PVector(source.x + l, source.y);
  //} 

  // if slope is infinte 
  //else if (m == std::numeric_limits<float>::max()) { 
  //    a.x = source.x; 
  //    a.y = source.y + l; 

  //    b.x = source.x; 
  //    b.y = source.y - l; 
  //}  
  //else { 
    float dx = (l / sqrt(1 + (m * m))); 
    float dy = m * dx; 
    pointA = new PVector(source.x + dx, source.y + dy);
    pointB = new PVector(source.x - dx, source.y - dy);
  //}
  
  PVector point;
  
  if(m < 0){
    point = pointB;
  } else {
    point = pointA;
  }

  stroke(0, 80);
  line(point.x, point.y, source.x, source.y);
  return point;
} 
