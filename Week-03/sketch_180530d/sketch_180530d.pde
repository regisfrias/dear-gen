int subdivisionsX = 15;
int subdivisionsY = 60;

float rectWidth;
float rectHeight;

void setup(){
  size(900, 600);
  
  rectWidth = width/subdivisionsX;
  rectHeight = height/subdivisionsY;
}

void draw(){
  background(180);
  drawRects();
}

void drawRects(){
  for(float x = 0; x <= width; x += rectWidth){
    if(x > 0){
      float prevX = x - rectWidth;
      float x1 = prevX;
      float x2 = x;
      float x3 = x;
      float x4 = prevX;
      
      for(float y = 0; y <= height; y += rectHeight){
        if(y > 0){
          float prevY = y - rectHeight;
          float y1 = prevY;
          float y2 = prevY;
          float y3 = y;
          float y4 = y;
          
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
