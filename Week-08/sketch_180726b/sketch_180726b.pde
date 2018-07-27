void setup(){
  size(920, 580);
  noLoop();
  colorMode(HSB, 360, 100, 100, 100);
  noStroke();
  noFill();
  ellipseMode(CENTER);
}

void draw(){
  background(240, 50, 40);
  
  //fill(0, 0, 100);
  //ellipse(width - width/3, height/2, width/8, width/8);
  
  //drawArcs(180, 360);
  drawArcs(0, 180);
}

void drawArcs(int start, int end){
  int step = 180/20;
  
  int incr = 8;
  int init = width/6;
  
  for(int i = 0; i < init; i += incr){
    int startAngle = start + int(sin(radians(i*2 + 180)) * height/30);
    int endAngle = end + int(sin(radians(i*3)) * height/30);
    
    float centerX = width - width/3 + sin(radians(i*2 + 180))*width/20;
    float centerY = height/2 + pow(i, .7);
    
    float radius = (width/15) + pow(i, 1.3);
    
    float h = map(i, incr, init, 360 + 45, 180 + 30) % 360;
    float s = map(radius, 0, width, 40, 80);
    
    float lineLength = width/30 + i/6;
    float lineWidth = lineLength/3 + i/6;
    strokeWeight(lineWidth);
    
    float radiusVar = (sin(radians(i + 180))/2 + 1);

    for(int j = startAngle; j < endAngle/2; j += step){
      float angleVar = random(10, 20);
      
      float x = cos(radians(j)) * radius + centerX - lineLength/2;
      float y = sin(radians(j)) * radius*radiusVar + centerY;
      
      float x2 = cos(radians(j-angleVar)) * radius + centerX + lineLength/2;
      float y2 = sin(radians(j-angleVar)) * radius*radiusVar + centerY;
      
      float bVar = sin(radians(j)) * 30 - 30;
      float b = map(radius, 0, width, 150, 0) + bVar;
      
      stroke(h + bVar, s, b);
      line(x, y, x2, y2);
    }
    
    for(int j = endAngle; j > endAngle/2; j -= step){
      float angleVar = random(10, 50);
      
      float x = cos(radians(j)) * radius + centerX - lineLength/2;
      float y = sin(radians(j)) * radius*radiusVar + centerY;
      
      float x2 = cos(radians(j-angleVar)) * radius + centerX + lineLength/2;
      float y2 = sin(radians(j-angleVar)) * radius*radiusVar + centerY;
      
      float bVar = sin(radians(j)) * 30 - 30;
      float b = map(radius, 0, width, 150, 0) + bVar;
      
      stroke(h + bVar, s, b);
      line(x, y, x2, y2);
    }
  }
  
}
