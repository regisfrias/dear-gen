float gridWidth;
float gridHeight;
float increment = 0.05;
float radius;

void setup(){
  size(920, 580, P3D);
  gridWidth = width/50;
  //gridHeight = height/60;
  gridHeight = 2;
  radius = gridHeight;
  noLoop();
  colorMode(HSB, 360, 100, 100, 100);
}

void draw(){
  background(255);
  //float detail = map(mouseX, 0, width, 0.1, 0.6);
  noiseDetail(2, 0.6);
  drawGrid();
}

void drawGrid(){
  float xoff = 0.0; // Start xoff at 0
  noFill();
  for(float x = -gridWidth; x < width + gridWidth; x += gridWidth){
    xoff += increment;   // Increment xoff
    float yoff = 0.0;   // For every xoff, start yoff at 0
    
    for(float y = -gridHeight; y < height + gridHeight; y += gridHeight){
      yoff += increment; // Increment yoff
      
      //float angle = atan2(mouseY-y, mouseX-x);
      float angle1 = noise(xoff, yoff) * TWO_PI;
      float angle2 = noise(xoff+increment, yoff) * TWO_PI;
      float angle3 = noise(xoff+increment, yoff+increment) * TWO_PI;
      float angle4 = noise(xoff, yoff+increment) * TWO_PI;
      float x1 = cos(angle1) * radius + x;
      float y1 = sin(angle1) * radius + y;
      float x2 = cos(angle2) * radius + x + gridWidth;
      float y2 = sin(angle2) * radius + y;
      float x3 = cos(angle3) * radius + x + gridWidth;
      float y3 = sin(angle3) * radius + y + gridHeight;
      float x4 = cos(angle4) * radius + x;
      float y4 = sin(angle4) * radius + y + gridHeight;
      
      float size1 = map(dist(x1, y1, x4, y4), 0, gridHeight, 190, 70);
      float size2 = map(dist(x2, y2, x3, y3), 0, gridHeight, 190, 70);
      
      //noStroke();
      //ellipse(x1, y1, 5, 5);
      //noFill();
      //stroke(0);
      //line(x1, y1, x2, y2);
      
      float h = map(y, 0, height, 180, 230);
      
      float s1 = map(dist(x1, y1, x4, y4), 0, gridHeight, 20, 120);
      float s2 = map(dist(x2, y2, x3, y3), 0, gridHeight, 20, 120);

      beginShape();
      fill(h, s1, size1);
      stroke(h, s1, size1);
      vertex(x1, y1);
      fill(h, s2, size2);
      stroke(h, s2, size2);
      vertex(x2, y2);
      vertex(x3, y3);
      fill(h, s1, size1);
      stroke(h, s1, size1);
      vertex(x4, y4);
      endShape(CLOSE);
      
      //fill(0);
      //text(dist, x, y);
      //text(degrees(angle), x, y+15);
    }
  }
}
