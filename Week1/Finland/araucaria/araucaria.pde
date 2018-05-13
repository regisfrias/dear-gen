import processing.pdf.*;

PImage img;
String imgName;

float startSize;
float minSize;

int[] sortedColors;

void setup(){
  size(800, 600);
  noLoop();
  colorMode(HSB, 360, 100, 100);
  noStroke();
  
  startSize = width/1.5;
  minSize = 5;
  
  //imgName = "araucaria_araucana_3.jpg";
  //imgName = "araucaria_araucana_4.jpg";
  imgName = "araucaria_araucana-detail_2.jpg";
  //imgName = "araucaria.jpg";
  
  img = loadImage(imgName);
  img.loadPixels();
  
  sortedColors = new int[img.pixels.length];
  sortedColors = bubbleSort(img.pixels);
}

void draw(){
  //beginRecord(PDF, "saved/" +year() + "-" + month() + "-" + day() + "-" + hour() + "-" + minute() + "-" + second() + "-kuusi.pdf");
  noStroke();

  color c = sortedColors[
    constrain(
      (int)map(
        startSize, startSize, minSize, 0, sortedColors.length-1
      ),
      0,
      sortedColors.length-1
    )
  ];
  fill(c);
  background(c);
  noStroke();
  araucaria(width/1.5, new PVector(0, 0));
  
  saveFrame("saved-png/" +year() + "-" + month() + "-" + day() + "-" + hour() + "-" + minute() + "-" + second() + "-kuusi.png");
  
  //endRecord();
  exit();
  
  // to view the sorted colors uncomment the following lines:
  //strokeWeight(2);
  //for(int i = 0; i < sortedColors.length; i++){
  //  stroke(sortedColors[i]);
  //  float x = i % img.width;
  //  float y = i / img.width;
  //  point(x*2, y*2);
  //}
}

void araucaria(float diameter, PVector center){
  int numItems = 5;
  float angleStep = 360/numItems;
  float extraAngle = (int)map(diameter, startSize, minSize, 0, 360); // rotate a bit at every iteration for variety
  
  // color follows polygon diameter
  color c = sortedColors[
    constrain(
      (int)map(
        diameter + random(-minSize*10, minSize*10), startSize, minSize, 0, sortedColors.length-1
      ),
      0,
      sortedColors.length-1
    )
  ];
  fill(c);
  
  // draw polygon
  int polyNum = 6;
  float polyAngle = 360/polyNum; 
  beginShape();
  for(int i = 0; i < polyNum; i++){
    float x = cos(radians(i * polyAngle - 90 + extraAngle)) * diameter/2 + center.x + width/2;
    float y = sin(radians(i * polyAngle - 90 + extraAngle)) * diameter/2 + center.y + height/2;
    vertex(x, y);
  }
  endShape(CLOSE);
  
  // call the function recursively until diameter is too small
  if(diameter > minSize){
    float newDiameter = diameter/2.4;
    
    for(int i = 0; i < numItems; i++){
      float childX = cos(radians(i * angleStep - 90 + extraAngle)) * (diameter/2 + newDiameter/4) + center.x;
      float childY = sin(radians(i * angleStep - 90 + extraAngle)) * (diameter/2 + newDiameter/4) + center.y;
      araucaria(newDiameter, new PVector(childX, childY));
    }
  }
}

// sort colors by hue, inspired by:
// https://www.cs.cmu.edu/~adamchik/15-121/lectures/Sorting%20Algorithms/sorting.html
int[] bubbleSort(int ar[]) {
  for (int i = (ar.length - 1); i >= 0; i--){
    for (int j = 1; j <= i; j++){
      if (hue(ar[j-1]) > hue(ar[j])){
        int temp = ar[j-1];
        ar[j-1] = ar[j];
        ar[j] = temp;
      }
    }
  }
  return ar;
}
