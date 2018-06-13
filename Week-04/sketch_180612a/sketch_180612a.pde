import processing.pdf.*; 
int spacing = 2;

void setup() {
  size(511, 319);
  noLoop();
}

void draw() {
  beginRecord(PDF, "file.pdf");
  background(255);
  
  generateGrid(true, false);
  generateGrid(false, true);
  generateGrid(false, false);
  endRecord();
  exit();
}

void generateGrid(boolean isBentX, boolean isBentY){
  for (int x = 0; x < width; x+=spacing) {
    for (int y = 0; y < height; y+=spacing) {
      float offsetVarX = cos(radians(map(x, 0, width, 0, 180))) * spacing;
      float offsetX = map(y, 0, height, offsetVarX, offsetVarX);
      float offsetVarY = cos(radians(map(y, 0, height, 0, 90)+45)) * spacing;
      float offsetY = map(x, 0, width, offsetVarY, offsetVarY);
      
      if(!isBentX) { offsetX = 0; }
      if(!isBentY) { offsetY = 0; }
      
      noStroke();
      fill(0);
      ellipse(x + offsetX, y + offsetY, 1, 1);
    }
  }
}
