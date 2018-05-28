int detail = 10;
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
    float phase = map(i, 0, height, 0, 360);
    for(int j = 0; j <= period; j += detail){
      float bendX = sin(radians(j + phase)) * 30;
      float x = (width * j)/period + bendX;
      
      float bendY = sin(radians(j + phase)) * 30;
      float y = i + bendY;
      
      float h = (sin(radians(j))/2 + .5)*20 + 50;
      
      stroke(h, 80, 60);
      fill(h, 80, 80);
      rect(x, y, size, size);
    }
  }
}
