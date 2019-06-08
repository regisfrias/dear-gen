PImage img;

void settings(){
  //img = loadImage("IMG_20160617_224625.jpg");
  img = loadImage("IMG_20160903_231508.jpg");
  //img = loadImage("IMG_20170107_212747.jpg");
  size(img.width, img.height, P3D);
}

void setup(){
  //size(920, 580);
  noLoop();
  img.loadPixels();
}

void draw(){
  background(0);
  
  float incrY = height/30;
  for(float y = height; y > 0; y -= incrY){
    pixelWave(height - y, y, incrY);
  }
  
  for(float y = height; y > 0; y -= incrY){
    pixelWave(y, 3, incrY);
  }
  
  String fileName = "saved/" + year() + "-" + month() + "-" + day() + "-" + hour() + "-" + minute() + "-" + second() + "-pixels.png";
  saveFrame(fileName);
}

void pixelWave(float maxHeight, float offsetY, float incrY){
  float incr = 0.005;
  float power = 60;
  for(float i = 0; i <= 1 + incr; i += incr){
    if(i > 0){
      float x = pow(i, power) * width;
      float angY = map(x, 0, width, PI, TWO_PI);
      float y = cos(angY) * maxHeight/2 + maxHeight/2 + offsetY;
      
      float prevX = pow(i - incr, power) * width;
      float prevAngY = map(prevX, 0, width, PI, TWO_PI);
      float prevY = cos(prevAngY) * maxHeight/2 + maxHeight/2 + offsetY;
      
      if(x < width && y < height){
        color c = img.pixels[int(prevY)*img.width+int(prevX)];
        color c2 = img.pixels[int(y)*img.width+int(x)];

        noStroke();
        
        beginShape();
        fill(c);
        vertex(prevX, prevY - incrY);
        //fill(c2);
        vertex(x, y - incrY);
        vertex(x, y);
        //fill(c);
        vertex(prevX, prevY);
        endShape();
      }
    }
  }
}
