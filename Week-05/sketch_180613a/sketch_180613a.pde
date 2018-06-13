void setup(){
  size(800, 600);
  noLoop();
}

void draw(){
  translate(width/4, height/4);
  drawLetter(false);
}

void drawLetter(boolean isStraightLine){
  //boolean isStraightLine = second() % 2 == 0 ? true : false;
  //boolean isStraightLine = true;
  int gridW = 4;
  int gridH = 4;
  PVector[][] grid = drawGrid(height/2, gridW, gridH);

  int randomX1 = int(random(gridW));
  int randomY1 = int(random(gridH));
  int randomX2 = int(random(gridW));
  int randomY2 = int(random(gridH));
  
  PVector initialPoint = grid[randomX1][randomY1];
  PVector supportPoint = grid[randomX2][randomY2];
  
  if(isStraightLine){
    stroke(0);
    strokeWeight(5);
    line(initialPoint.x, initialPoint.y, supportPoint.x, supportPoint.y);
    
    stroke(255,0,0);
    strokeWeight(8);
    point(initialPoint.x, initialPoint.y);
    point(supportPoint.x, supportPoint.y);
  } else {
    stroke(0);
    strokeWeight(5);
    noFill();
    drawArc(
      initialPoint,
      supportPoint,
      180
    );
    
    strokeWeight(8);
    stroke(255,0,0);
    point(initialPoint.x, initialPoint.y);
    stroke(0,255,0);
    point(supportPoint.x, supportPoint.y);
  }
}

PVector[][] drawGrid(float lineHeight, int gridW, int gridH){
  PVector[][] vector = new PVector[gridW][gridH];
  float em = lineHeight * 0.75;
  float cellW = em/gridW;
  float cellH = lineHeight/gridH;
  
  for(int i = 0; i < gridW; i++){
    for(int j = 0; j < gridH; j++){
      vector[i][j] = new PVector(i*cellW, j*cellH);
      strokeWeight(5);
      fill(0);
      point(i*cellW, j*cellH);
    }
  }
  
  return vector;
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