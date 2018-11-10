void setup(){
  //size(580, 920);
  size(464, 736);
  noLoop();
}

void draw(){
  //strokeWeight(5);
  
  //line(width/2, 0, width/2, height);
  
  //xenakis(height/2, height/8, 5);
  //xenakis(height - 20, height/2, 21);
  
  float vStep = height/40;
  for(int y = 0; y <= height; y += vStep){
    int pow = int(map(y, 0, height, 5, 21));
    if(pow % 2 == 0){
      pow += 1;
    }
    xenakis(y, y/2, pow);
  }
  
  //saveFrame("saved-png/" + year() + "-" + month() + "-" + day() + "-" + hour() + "-" + minute() + "-" + second() + "-xenakis.png");
}

void xenakis(float top, float ampl, float pow){
  beginShape();
  
  float step = width/40;
  for(float x = 0; x <= width/2; x += step){
    if(x > 0){
      float prevX = x - step;
      
      float angleX = map(x, 0, width, 180, 360 - 20);
      float anglePrevX = map(prevX, 0, width, 180, 360 - 20);
      
      float angleY = sin(radians(angleX));
      float anglePrevY = sin(radians(anglePrevX));
      float y = (pow(angleY, pow) * ampl) + top;
      float prevY = (pow(anglePrevY, pow) * ampl) + top;
      
      float oscX = sin(radians(angleX))/2 + 1.5;
      float oscPrevX = sin(radians(anglePrevX))/2 + 1.5;
      
      vertex(prevX * oscPrevX, top+20);
      vertex(prevX, prevY);
      vertex(x, y);
      vertex(x * oscX, top+20);
    }
  }
  endShape(CLOSE);
}
