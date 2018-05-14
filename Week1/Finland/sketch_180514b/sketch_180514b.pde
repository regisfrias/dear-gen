int[] sortedColors;
PImage img;
String imgName;
int imgScale = 3;

void settings(){
  //imgName = "araucaria-angustifolia71398.jpg";
  //imgName = "araucaria_araucana.jpg";
  //imgName = "araucaria_araucana-detail.jpg";
  imgName = "araucaria_araucana_5.jpg";
  
  img = loadImage(imgName);
  img.loadPixels();
  size(img.width * imgScale, img.height * imgScale);
}

void setup(){
  noLoop();
  noStroke();
  
  sortedColors = new int[img.pixels.length];
  sortedColors = bubbleSort(img.pixels);
}

void draw(){
  colorMode(HSB, 360, 100, 100);
  rectMode(CENTER);
  ellipseMode(CENTER);
  
  noStroke();
  
  for(int i = 0; i < sortedColors.length; i++){
    float brightness = brightness(sortedColors[i]);
    fill(sortedColors[i], 100 - brightness);
    float x = (i % img.width) * imgScale;
    float y = (i / img.width) * imgScale;
    //float ellipseSize = map(brightness, 0, 100, imgScale/7, imgScale*5);
    float ellipseSize = map(brightness, 0, 100, imgScale*2, imgScale*20);
    ellipse(x, y, ellipseSize, ellipseSize);
    //rect(x, y, imgScale*2, imgScale*2);
  }
  
  saveFrame("saved-png/" +year() + "-" + month() + "-" + day() + "-" + hour() + "-" + minute() + "-" + second() + "-saturation.png");
  exit();
}

// sort colors by hue, ripped off from:
// https://www.cs.cmu.edu/~adamchik/15-121/lectures/Sorting%20Algorithms/sorting.html
int[] bubbleSort(int ar[]) {
  for (int i = (ar.length - 1); i >= 0; i--){
    for (int j = 1; j <= i; j++){
      if (saturation(ar[j-1]) > saturation(ar[j])){
        int temp = ar[j-1];
        ar[j-1] = ar[j];
        ar[j] = temp;
      }
    }
  }
  return ar;
}
