int rectWidth = 20;
int rectHeight = 20;
float period = 360;
float variationY;
float variationX;
float phaseX = 0;
float phaseY = 0;
float freqX = 1;
float freqY = 1;

void setup(){
  size(800, 600);
  //variationX = width/20;
  //variationY = height/20;
  variationX = 40;
  variationY = 40;
}

void draw(){
  background(255);
  drawRects();
}

void drawRects(){
  float compensateX = sin(radians(phaseX)) * variationX;
  float compensateY = sin(radians(phaseY)) * variationY;
  
  for(int x = 0; x <= width; x += rectWidth){
    if(x > 0){
      float prevX = x - rectWidth;
      float prevAngleX = map(prevX, 0, width, 0, period);
      float angleX = map(x, 0, width, 0, period);
      float prevBendX = sin(radians(prevAngleX*freqX + phaseX)) * variationX - compensateX;
      float bendX = sin(radians(angleX*freqX + phaseX)) * variationX - compensateX;
      
      for(int y = 0; y <= height; y += rectHeight){
        if(y > 0){
          float prevY = y - rectHeight;
          float prevAngleY = map(prevY, 0, height, 0, period);
          float angleY = map(y, 0, height, 0, period);    
          float prevBendY = sin(radians(prevAngleY*freqY + phaseY)) * variationY - compensateY;
          float bendY = sin(radians(angleY*freqY + phaseY)) * variationY - compensateY;
          
          float x1 = prevX + prevBendX + prevBendY;
          float x2 = x + bendX + prevBendY;
          float x3 = x + bendX + bendY;
          float x4 = prevX + prevBendX + bendY;
          
          float y1 = prevY + prevBendY + prevBendX;
          float y2 = prevY + prevBendY + bendX;
          float y3 = y + bendY + bendX;
          float y4 = y + bendY + prevBendX;
          
          fill(100);
          beginShape();
          vertex(x1, y1);
          vertex(x2, y2);
          vertex(x3, y3);
          vertex(x4, y4);
          endShape(CLOSE);
        }
      }
    }
  }
}

void keyPressed(){
  if(key == ' '){
    String fileName = "saved-png/" + year() + "-" + month() + "-" + day() + "-" + hour() + "-" + minute() + "-" + second() + "-palha.png";
    saveFrame(fileName);
  }
}

void mouseDragged(){
  phaseX += float(pmouseX - mouseX)/width * 360;
  phaseY += float(pmouseY - mouseY)/height * 360;
}
