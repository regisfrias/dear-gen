float strawWidth = 5;
float strawSeparation = strawWidth*2; 
float phaseShift = 120;
float frequency;

void setup() {
  //size(1200, 900, P3D);
  size(800, 600, P3D);
  frequency = width/strawSeparation;

  ortho();
  noFill();
  stroke(0);
  strokeWeight(strawWidth);
  colorMode(HSB, 360, 100, 100);
}

void draw() {
  background(360);
  translate(0, height);
  rotateX(PI);

  for (int i = 0; i < width; i += width/frequency) {
    stroke(
      map(i, 0, width, 50, 60),
      90,
      90
    );
    drawWaves(true, i, i * phaseShift);
    stroke(
      map(i, 0, width, 40, 50),
      80,
      80
    );
    drawWaves(false, i, i * phaseShift);
  }
}

void drawWaves(boolean horizontal, float posY, float phase) {
  float period = 360;
  int size = horizontal ? width : height;
  beginShape();
  for (int i = 0; i <= period; i += strawSeparation) {
    float bendPhase = i/3;
    float bendRadius = map(i, 0, period, -size/6, size/6);
    float bend = cos(radians(i - bendPhase)) * bendRadius;
    
    float x = horizontal ? map(i, 0, period, 0, size) : posY + bend;
    float y = horizontal ? posY + bend : map(i, 0, period, 0, size);
    float z = sin(radians(i * frequency + phase)) * 3;
    vertex(x, y, z);
  }
  endShape(OPEN);
}
