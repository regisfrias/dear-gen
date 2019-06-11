class Particle {
  float centerX, centerY, x, y, size;
  
  Particle(float _centerX, float _centerY, float _x, float _y, float _size){
    x = _x;
    y = _y;
    size = _size;
    centerX = _centerX;
    centerY = _centerY;
  }
  
  void draw(){
    line(x, y, centerX, centerY);
    ellipse(x, y, size/2, size/2);
  }
}
