int rectWidth = 6;
int rectHeight = 60;
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
  
  colorMode(HSB, 360, 100, 100);
}

void draw(){
  background(0);
  
  for(int y = 0; y < height; y++){
    float h = map(y, 0, height, 180, 360);
    stroke(h, 70, 30);
    line(0, y, width, y);
  }
  
  noStroke();
  drawRects();
}

void drawRects(){
  float compensateX = sin(radians(phaseX)) * variationX;
  float compensateY = sin(radians(phaseY)) * variationY;
  
  for(int x = - int(variationX*3); x <= width + variationX*3; x += rectWidth){
    if(x > -variationX*3){
      float prevX = x - rectWidth;
      float prevAngleX = map(prevX, 0, width, 0, period);
      float angleX = map(x, 0, width, 0, period);
      float prevBendX = sin(radians(prevAngleX*freqX + phaseX)) * variationX - compensateX;
      float bendX = sin(radians(angleX*freqX + phaseX)) * variationX - compensateX;
      
      for(int y = - int(variationY*4); y <= height + variationY*4; y += rectHeight){
        if(y > -variationY*4){
          float prevY = y - rectHeight;
          float prevAngleY = map(prevY, 0, height, 0, period);
          float angleY = map(y, 0, height, 0, period);
          
          float prevBendY = sin(radians(prevAngleY + phaseY + prevAngleX)) * variationY - compensateY;
          float bendY = sin(radians(angleY + phaseY + angleX)) * variationY - compensateY;
          
          float x1 = prevX + prevBendX + prevBendY;
          float x2 = x + bendX + prevBendY - 1;
          float x3 = x + bendX + bendY - variationY/10;
          float x4 = prevX + prevBendX + bendY;
          
          float y1 = prevY + prevBendY + prevBendX;
          float y2 = prevY + prevBendY + bendX;
          float y3 = y + bendY + bendX;
          float y4 = y + bendY + prevBendX;
          
          //float h = map(x1, 0, width, 20, 50);
          float h = cos(radians(y1*20 + x1)) * 10 + 40;
          
          fill(h, 90, 80);
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
