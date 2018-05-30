int subdivisionsX = 10;
int subdivisionsY = 30;

float periodX = 360;
float periodY = 360*1.5;

float distortionX;
float distortionY;

float rectWidth;
float rectHeight;

void setup(){
  size(900, 600);
  
  rectWidth = width/subdivisionsX;
  rectHeight = height/subdivisionsY;
  
  distortionX = width/10;
  distortionY = height/2;
}

void draw(){
  background(180);
  drawRects();
}

void drawRects(){
  for(float y = 0; y <= height; y += rectHeight){
    if(y > 0){
      float prevY = y - rectHeight;
      float y1 = prevY;
      float y2 = prevY;
      float y3 = y;
      float y4 = y;
      
      for(float x = 0; x <= width; x += rectWidth){
        if(x > 0){
          float prevX = x - rectWidth;
          
          float prevPhaseX = map(prevX, 0, width, 0, periodX);
          float phaseX = map(x, 0, width, 0, periodX);
          
          float prevAngleY = map(prevY, 0, width, 0, periodY);
          float angleY = map(y, 0, width, 0, periodY);
          
          float bendY1 = sin(radians(prevAngleY + prevPhaseX)) * distortionX;
          float bendY2 = sin(radians(prevAngleY + phaseX)) * distortionX;
          float bendY3 = sin(radians(angleY + phaseX)) * distortionX;
          float bendY4 = sin(radians(angleY + prevPhaseX)) * distortionX;
          
          float x1 = prevX + bendY1;
          float x2 = x + bendY2;
          float x3 = x + bendY3;
          float x4 = prevX + bendY4;
          
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
