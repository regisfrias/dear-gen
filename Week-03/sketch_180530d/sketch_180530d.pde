int subdivisionsX = 10;
int subdivisionsY = 30;

float periodX = 360;
float periodY = 360;

float distortionX;
float distortionY;

float rectWidth;
float rectHeight;

void setup(){
  size(900, 600);
  
  rectWidth = width/subdivisionsX;
  rectHeight = height/subdivisionsY;
  
  distortionX = width/10;
  distortionY = height/30;
}

void draw(){
  background(180);
  drawRects();
}

void drawRects(){
  for(float y = 0; y <= height; y += rectHeight){
    if(y > 0){
      float prevY = y - rectHeight;
      for(float x = 0; x <= width; x += rectWidth){
        if(x > 0){
          float prevX = x - rectWidth;
          
          float prevPhaseX = map(prevX, 0, width, 0, periodX);
          float phaseX = map(x, 0, width, 0, periodX);
          
          float prevAngleY = map(prevY, 0, height, 0, periodY);
          float angleY = map(y, 0, height, 0, periodY);
          
          float varPrevAmplX = cos(radians(prevPhaseX));
          float varAmplX = cos(radians(phaseX));
          
          float bendX1 = sin(radians(prevAngleY + prevPhaseX)) * distortionX*varPrevAmplX;
          float bendX2 = sin(radians(prevAngleY + phaseX)) * distortionX*varAmplX;
          float bendX3 = sin(radians(angleY + phaseX)) * distortionX*varAmplX;
          float bendX4 = sin(radians(angleY + prevPhaseX)) * distortionX*varPrevAmplX;
          
          float x1 = prevX + bendX1;
          float x2 = x + bendX2;
          float x3 = x + bendX3;
          float x4 = prevX + bendX4;
          
          float y1 = prevY + bendX1/3;
          float y2 = prevY + bendX2/3;
          float y3 = y + bendX3/3;
          float y4 = y + bendX4/3;
          
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
