// Collision detection adapted from:
// http://happycoding.io/tutorials/processing/collision-detection

ArrayList<Rectangle> rectangles = new ArrayList<Rectangle>();
float initW;
float initH;
float diag;
boolean isDone = false;

void setup() {
  size(920, 580);
  noStroke();
  colorMode(HSB, 100, 100, 100, 100);
  
  initW = width/17;
  initH = height/17;
  
  for(int i = 0; i < width; i += initW){
    for(int j = 0; j < height; j += initH){
      float w = random(initW/3, initW/1.5);
      float h = random(initW/3, initW/1.5);
      float randomI = random(-initW/10, initH/10) - w/2;
      float randomJ = random(-initW/10, initH/10) - h/2;
      //float randomI = -w/2;
      //float randomJ = -h/2;
      float hue = random(1) > 0.2 ? 6 : 28;
      rectangles.add(new Rectangle(
        i + randomI,
        j + randomJ,
        w, h, hue
      ));
    }
  }
}

void draw() {
  background(0, 0, 20);
  
  if(isDone){
    background(0, 0, 70);
  } else {
    isDone();
    background(0, 0, 50);
  }
  
  //iterate over the rectangles
  for (int i = 0; i < rectangles.size(); i++) {
    Rectangle rectangle = rectangles.get(i);
    
    rectangle.prevX = rectangle.x;
    rectangle.prevY = rectangle.y;
    
    // compare this rectangle (i) with all the others
    for (int j = 0; j < rectangles.size(); j++) {
      Rectangle rectangle2 = rectangles.get(j);
      
      if(i != j){ // except with itself
        boolean checkCollision = (
            rectangle2.x + rectangle2.rectWidth > rectangle.x && 
            rectangle2.x < rectangle.x + rectangle.rectWidth &&
            rectangle2.y + rectangle2.rectHeight > rectangle.y && 
            rectangle2.y < rectangle.y + rectangle.rectHeight
          ) ||
          rectangle.x < -initW ||
          rectangle.x + rectangle.rectWidth > width + initW ||
          rectangle.y < -initH ||
          rectangle.y + rectangle.rectHeight > height + initH
        ;
        
        if(checkCollision){
          rectangle.x += random(-initW/8, initW/8);
          rectangle.y += random(-initH/8, initH/8);
        }
      }
    }

    if(
      rectangle.prevX == rectangle.x &&
      rectangle.prevY == rectangle.y
    ){
      rectangle.done = true;
    } else {
      rectangle.done = false;
    }

    drawRect(rectangle);
  }
}

boolean isDone(){
  for (int i = 0; i < rectangles.size(); i++) {
    Rectangle rectangle = rectangles.get(i);
    if(!rectangle.done) return false;
  }
  isDone = true;
  return true;
}

void drawRect(Rectangle rectangle){
  
  if(rectangle.done){
    fill(rectangle.hue, 60, 40);
  } else {
    fill(0,0,70);
  }
  
  rect(rectangle.x, rectangle.y, rectangle.rectWidth, rectangle.rectHeight);
}
