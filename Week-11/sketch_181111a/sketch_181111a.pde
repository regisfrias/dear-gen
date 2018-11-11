void setup(){
  size(920, 580);
  noLoop();
}

void draw(){
  background(255);
  xenakis(0, height/2, width/2, height/2);
}

void xenakis(float startX, float startY, float sizeX, float sizeY){
  float incr = width/20;
  
  for(float x = startX; x <= sizeX + startX; x += incr){
    float mapX = map(x - startX, incr, width, 0, height);
    float y = sizeY + startY - mapX;
    
    fill(240, 80);
    beginShape();
    vertex(startX, y);
    vertex(x, startY);
    vertex(startX, startY);
    endShape(CLOSE);
  }
}
