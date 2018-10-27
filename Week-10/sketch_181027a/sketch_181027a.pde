float stepX;
float stepY;
float halfStepX;
float halfStepY;
float quarterStepX;
float quarterStepY;
float lastY;

int padding;

void setup(){
  size(920, 580);
  noLoop();
  colorMode(HSB, 360, 100, 100, 100);
  padding = width/30;
  
  stepX = width/30;
  stepY = height/60;
  halfStepX = stepX/2;
  halfStepY = stepY/2;
  quarterStepX = stepX/4;
  quarterStepY = stepY/4;
  
  lastY = height - padding*2 + stepY;
}

void draw(){
  background(0, 0, 100);
  
  noStroke();
  for(int i = 0; i < 10; i++){
    sky();
  }
  
  for(int i = 0; i < 6; i++){
    float breakpoint = random(width/5, width/3);
    float top = random(21, 24);
    landscape(breakpoint, top);
  }
}

void landscape(float breakpoint, float top){
  noFill();
  
  for(float x = padding; x < width - padding; x += stepX){
    strokeWeight(0.5);
    if(x > padding){
      float prevX = x - stepX;
      bezLine(prevX, x, breakpoint, top);
    }
  }
}

void bezLine(float prevX, float currX, float breakpoint, float top){
  float lineStep = stepX/20;
  float offsetY = 0;
  float offsetX = 0;
  float alpha = 0;
  if(currX <= breakpoint){
    offsetY = pow(map(currX, 0, breakpoint, 0, 1.3), top);
    offsetX = pow(map(currX, 0, breakpoint, 0, 2), 5);
    alpha = map(currX, 0, breakpoint, 5, 80);
  } else {
    offsetY = pow(map(currX, breakpoint, width, 1.3, 0), top);
    offsetX = pow(map(currX, breakpoint, width, 2, 0), 5);
    alpha = map(currX, breakpoint, width, 80, 5);
  }
  
  stroke(0, 0, 0, alpha);
  
  beginShape();
  vertex(prevX, lastY);
  for(float x = prevX; x <= currX; x += lineStep){
    float y = (height - padding*2 + stepY) + stepY + random(-offsetY, height/100);
    if(x == currX){
      vertex(x, y);
      lastY = y;
    } else {
      curveVertex(
        x + random(-offsetX, offsetX),
        //x,
        prevX == x ? lastY : y
      );
    }
  }
  endShape();
  
  //beginShape();
  //for(float x = prevX; x <= currX; x += lineStep){
  //  float y = (height - padding*2 + stepY) + random(-20, 20);
  //  vertex(
  //    x,
  //    prevX == x ? lastY : y
  //  );
  //  lastY = y;
  //}
  //endShape();
}

void sky(){
  for(float x = padding; x < width - padding*2; x += stepX){
    for(float y = padding; y < height - padding*2; y += stepY){
      float angle = radians(20);
      float angleRadians = random(-angle, angle);
      float offsetX = random(-halfStepX, halfStepX);
      float offsetY = random(-halfStepY, halfStepY);
      float offsetW = random(quarterStepX);
      float offsetH = random(quarterStepY);

      float hueOffset = random(-10, 10);
      float brightnessOffset = random(-5, 5);
      
      float hue = map(y, 0, height, 220, 170) + hueOffset;
      float saturation = map(y, 0, height, 50, 20);
      float brightness = map(y, 0, height, 60, 80) + brightnessOffset;
      
      pushMatrix();
      fill(hue, saturation, brightness, 50);
      translate(x - halfStepX + offsetX, y - halfStepY + offsetY);
      rotate(angleRadians);
      rect(
        halfStepX + quarterStepX,
        halfStepY + quarterStepX,
        stepX + offsetW,
        stepY + offsetH
      );
      popMatrix();
    }
  }
}
