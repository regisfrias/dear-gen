int detail = 20;
float size;
float period = 360;

void setup(){
  size(800, 600);
  size = (width * detail)/period;
  noStroke();
  colorMode(HSB, 360, 100, 100);
}

void draw(){
  background(360);
  drawLine();
}

void drawLine(){
  for(int i = 0; i <= height; i += detail){
    float phase = map(i, 0, height, 0, period);
    float phase2 = map(i-detail, 0, height, 0, period);
    for(int j = 0; j <= period; j += detail){
      if(i > 0 && j > 0){
        float bendX1 = sin(radians(j + phase)) * 30;
        float x1 = (width * j)/period + bendX1;
        float bendX2 = sin(radians(j-detail + phase)) * 30;
        float x2 = (width * (j-detail))/period + bendX2;
        
        float bendY1 = sin(radians(j+phase2)) * 30;
        float y1 = i + bendY1;
        float bendY2 = sin(radians(j-detail + phase)) * 30;
        float y2 = (i-detail) + bendY2;
        
        float h = (sin(radians(j))/2 + .5)*20 + 40;
        
        stroke(h, 80, 60);
        fill(h, 80, 80, 70);
        
        beginShape();
        vertex(x1, y1);
        vertex(x2, y1);
        vertex(x2, y2);
        vertex(x1, y2);
        endShape(CLOSE);
      }
    }
  }
}
