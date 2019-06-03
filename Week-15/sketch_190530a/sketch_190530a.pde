float padding;

void setup(){
  //size(580, 920);
  size(580, 820);
  padding = width/6;
  noLoop();
}

void draw(){ 
  background(100);
  noStroke();
  
  PVector lastPoint = new PVector(width - padding, padding);
  
  while(lastPoint.y < height - padding){
    PVector newTriangle = drawTriangle(lastPoint);
    lastPoint = newTriangle;
  }
}

PVector drawTriangle(PVector startPoint) {
  //float increment = map(startPoint.y, padding, height - padding, padding, padding/5);
  float increment = padding * 0.6;
  float endPointY = startPoint.y + increment;
  float mapEndPoint = map(endPointY, padding, height - padding, padding, width/2 - padding/2); 
  float endPointX = startPoint.x < width/2 ? width - mapEndPoint : mapEndPoint;
  PVector endPoint = new PVector(endPointX, endPointY);
  float slope = (startPoint.y - endPoint.y) / (startPoint.x - endPoint.x);
  
  float distanceToNewPoint = height/2;
  float perpendicularSlope = -1 / slope;
  PVector midPoint = midPoint(startPoint, endPoint);
  
  PVector center = pointFromMidpoint(midPoint, distanceToNewPoint, perpendicularSlope);
  float radius = dist(center.x, center.y, startPoint.x, startPoint.y);
  
  noStroke();
  fill(0, 50);
  //ellipse(startPoint.x, startPoint.y, 10, 10);
  //ellipse(endPoint.x, endPoint.y, 10, 10);
  //ellipse(center.x, center.y, 4, 4);
  
  // Angle between center and startPoint
  float angStart = atan2(startPoint.y - center.y, startPoint.x - center.x);
  // Angle between center and endPoint
  float angEnd = atan2(endPoint.y - center.y, endPoint.x - center.x);
  
  fill(240, 240);
  float angStep = QUARTER_PI/60;
  float radiusVar = radius/20;
  if(angStart < angEnd){
    for(float ang = angStart; ang < angEnd; ang += angStep){
      float x = cos(ang) * (radius + radiusVar) + center.x;
      float y = sin(ang) * (radius + radiusVar) + center.y;
      float x2 = cos(ang) * (radius - radiusVar) + center.x;
      float y2 = sin(ang) * (radius - radiusVar) + center.y;
      //ellipse(x, y, 5, 5);
      //stroke(0, 100);
      //line(x, y, x2, y2);
      beginShape();
      vertex(x, y);
      vertex(x+6, y);
      vertex(x2+6, y2);
      vertex(x2, y2);
      endShape(CLOSE);
    }
  } else {
    for(float ang = angEnd; ang < angStart; ang += angStep){
      float x = cos(ang) * (radius + radiusVar) + center.x;
      float y = sin(ang) * (radius + radiusVar) + center.y;
      float x2 = cos(ang) * (radius - radiusVar) + center.x;
      float y2 = sin(ang) * (radius - radiusVar) + center.y;
      //ellipse(x, y, 5, 5);
      //stroke(0, 100);
      //line(x, y, x2, y2);
      beginShape();
      vertex(x, y);
      vertex(x+6, y);
      vertex(x2+6, y2);
      vertex(x2, y2);
      endShape(CLOSE);
    }
  }

  //stroke(255, 0, 0, 120);
  //line(startPoint.x, startPoint.y, endPoint.x, endPoint.y);
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

  //stroke(0, 50);
  //line(point.x, point.y, source.x, source.y);
  return point;
} 
