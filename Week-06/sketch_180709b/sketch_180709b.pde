/**
 * Noise2D 
 * by Daniel Shiffman.  
 * 
 * Using 2D noise to create simple texture. 
 */

import processing.pdf.*;

float increment = 0.01;
int gridSize = 5;
int lineLength = gridSize*2;

void setup() {
  size(920, 580, P3D);
  strokeWeight(1);
  noLoop();
}

void draw() {
  String fileName = "saved/" + year() + "-" + month() + "-" + day() + "-" + hour() + "-" + minute() + "-" + second() + "-flow.pdf";
  beginRecord(PDF, fileName);
  colorMode(HSB, 360, 360, 360, 360);
  
  float ang = 240;
  background(ang, ang/2, ang/2, 360);
  
  noFill();
  strokeWeight(gridSize);

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
  
  endRecord();
  
  String fileName2 = "saved-png/" + year() + "-" + month() + "-" + day() + "-" + hour() + "-" + minute() + "-" + second() + "-flow.png";
  saveFrame(fileName2);
  
  exit();
}
