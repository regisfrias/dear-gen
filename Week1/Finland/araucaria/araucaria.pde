import processing.pdf.*;

PImage img;
String imgName;

void setup(){
  size(800, 600);
  noLoop();
  colorMode(HSB, 360, 100, 100);
  noStroke();
  
  //imgName = "araucaria-angustifolia71398.jpg";
  //imgName = "Araucaria_araucana.jpg";
  //imgName = "Araucaria_araucana-detail.jpg";
  imgName = "araucaria_araucana_2.jpg";
  img = loadImage(imgName);
}

void draw(){
  //beginRecord(PDF, "saved/" +year() + "-" + month() + "-" + day() + "-" + hour() + "-" + minute() + "-" + second() + "-kuusi.pdf");
  noStroke();
  
  color c = img.get((int)random(width), (int)random(height));
  fill(c);
  background(c);
  noStroke();
  araucaria(width/1.5, new PVector(0, 0));
  
  //endRecord();
  //exit();
}

void araucaria(float diameter, PVector center){
  int numItems = 5;
  float angleStep = 360/numItems;
  
  color c = img.get(int(center.x + width/2), int(center.y + height/2));
  fill(c);
  
  // draw polygon
  int polyNum = 5;
  float polyAngle = 360/polyNum; 
  beginShape();
  for(int i = 0; i < polyNum; i++){
    float x = cos(radians(i * polyAngle - 90)) * diameter/2 + center.x + width/2;
    float y = sin(radians(i * polyAngle - 90)) * diameter/2 + center.y + height/2;
    vertex(x, y);
  }
  endShape(CLOSE);
  
  if(diameter > 5){
    float newDiameter = diameter/2.4;
    
    for(int i = 0; i < numItems; i++){
      float childX = cos(radians(i * angleStep - 90)) * (diameter/2 + newDiameter/4) + center.x;
      float childY = sin(radians(i * angleStep - 90)) * (diameter/2 + newDiameter/4) + center.y;
      //float childX = cos(radians(i * angleStep)) * (diameter/2) + center.x;
      //float childY = sin(radians(i * angleStep)) * (diameter/2) + center.y;
      araucaria(newDiameter, new PVector(childX, childY));
    }
  }
}
