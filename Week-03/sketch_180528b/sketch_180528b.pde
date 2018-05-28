int detail = 20;
float size;
float period = 360;
float variation;

void setup(){
  size(800, 600);
  size = (width * detail)/period;
  variation = height/15;
  noStroke();
  colorMode(HSB, 360, 100, 100);
}

void draw(){
  background(360);
  drawLine();
}

void drawLine(){
  for(int y = - int(variation); y <= height + variation; y += detail){
    int prevY = y - detail;
    float phase = map(y-detail, 0, height, 0, period);
    float phase2 = map(y, 0, height, 0, period);
    
    for(int x = - int(period); x <= period*2; x += detail){
      int prevX = x - detail;
      if(y > -variation && x > -period){
        float bendX1 = sin(radians(prevX + phase)) * variation;
        float x1 = (width * prevX)/period + bendX1;
        
        float bendX2 = sin(radians(x + phase)) * variation;
        float x2 = (width * x)/period + bendX2;
        
        float bendX3 = sin(radians(x + phase2)) * variation;
        float x3 = (width * x)/period + bendX3;
        
        float bendX4 = sin(radians(prevX + phase2)) * variation;
        float x4 = (width * prevX)/period + bendX4;
        
        float bendY1 = cos(radians(prevX + phase)) * variation;
        float y1 = prevY + bendY1;
        
        float bendY2 = cos(radians(x + phase)) * variation;
        float y2 = prevY + bendY2;
        
        float bendY3 = cos(radians(x + phase2)) * variation;
        float y3 = y + bendY3;
        
        float bendY4 = cos(radians(prevX + phase2)) * variation;
        float y4 = y + bendY4;
        
        float h = (sin(radians(y*4 + x))/2 + .5)*20 + 40;
        float b = (sin(radians(y*4 + x))/2 + .5)*30 + 50;
        
        strokeWeight(1);
        stroke(h, 80, 60);
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
