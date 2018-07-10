/**
 * Noise2D 
 * by Daniel Shiffman.  
 * 
 * Using 2D noise to create simple texture. 
 */
 
float increment = 0.01;
int gridSize = 5;
int lineLength = gridSize*2;

void setup() {
  size(960, 740, P3D);
  strokeWeight(1);
  noLoop();
}

void draw() {
  colorMode(HSB, 360, 360, 360, 360);
  
  float ang = 50;
  background(ang, ang/2, 360, 360);
  
  //stroke(0, 40);
  //fill(0, 20);
  noFill();
  strokeWeight(gridSize);
  //noStroke();

  float xoff = 0.0; // Start xoff at 0
  float xoff2 = xoff + increment;
  //float detail = map(mouseX, 0, width, 0.1, 0.8);
  float detail = 0.8;
  noiseDetail(8, detail);
  
  // For every x,y coordinate in a 2D space, calculate a noise value and produce a brightness value
  for (int x = 0; x < width; x += gridSize) {
    xoff += increment;   // Increment xoff
    xoff2 += increment;
    
    float yoff = 0.0;   // For every xoff, start yoff at 0
    float yoff2 = yoff + increment;
    
    for (int y = 0; y < height; y += gridSize) {
      yoff += increment; // Increment yoff
      
      // Calculate noise and scale by 360
      float angle = noise(xoff, yoff) * 360;
      
      float x1 = cos(radians(angle)) * lineLength + x;
      float y1 = sin(radians(angle)) * lineLength + y;
      float x2 = cos(radians(angle+180)) * lineLength + x;
      float y2 = sin(radians(angle+180)) * lineLength + y;
      
      stroke(angle, angle/3, angle/3, angle);
      line(x1, y1, x2, y2);
    }
  }
}
