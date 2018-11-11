void setup(){
  size(920, 580);
  //noLoop();
}

void draw(){
  background(255);
  xenakis(mouseX, mouseY, width/2, height/2);
}

void xenakis(float startX, float startY, float sizeX, float sizeY){
  float incr = width/20;
  
  for(float x = startX; x <= sizeX + startX; x += incr){
    float mapX = map(x - startX, 0, width, 0, height);
    float y = sizeY + startY - mapX;
    
    line(startX, y, x, startY);
  }
}
