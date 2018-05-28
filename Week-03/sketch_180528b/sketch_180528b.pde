int detail = 20;
int detailY = 4;
float size;
float period = 360;
float variationX;
float variationY;

void setup(){
  size(800, 600);
  size = (width * detail)/period;
  variationY = height/15;
  variationX = variationY*2;
  noStroke();
  colorMode(HSB, 360, 100, 100);
}

void draw(){
  background(360);
  drawLine();
}

void drawLine(){
  for(int y = - int(variationY); y <= height + variationY; y += detailY){
    int prevY = y - detailY;
    float phase = map(y-detailY, 0, height, 0, period);
    float phase2 = map(y, 0, height, 0, period);
    
    for(int x = - int(period); x <= period*2; x += detail){
      int prevX = x - detail;
      if(y > -variationY && x > -period){
        float bendX1 = sin(radians(prevX + phase)) * variationX;
        float x1 = (width * prevX)/period + bendX1;
        
        float bendX2 = sin(radians(x + phase)) * variationX;
        float x2 = (width * x)/period + bendX2;
        
        float bendX3 = sin(radians(x + phase2)) * variationX;
        float x3 = (width * x)/period + bendX3;
        
        float bendX4 = sin(radians(prevX + phase2)) * variationX;
        float x4 = (width * prevX)/period + bendX4;
        
        float bendY1 = cos(radians(prevX + phase)) * variationY;
        float y1 = prevY + bendY1;
        
        float bendY2 = cos(radians(x + phase)) * variationY;
        float y2 = prevY + bendY2;
        
        float bendY3 = cos(radians(x + phase2)) * variationY;
        float y3 = y + bendY3;
        
        float bendY4 = cos(radians(prevX + phase2)) * variationY;
        float y4 = y + bendY4;
        
        float hueShift = map(y, -variationY, height + variationY, 10, 50);
        float h = (sin(radians(y*15 - x*4))/2 + .5)*20 + hueShift;
        float b = (sin(radians(y*15 - x*4))/2 + .5)*20 + 70;
        
        strokeWeight(1);
        stroke(h, 80, b-20);
        fill(h, 80, b);
        
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
