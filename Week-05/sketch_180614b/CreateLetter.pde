class CreateLetter {
  CreateGrid grid;
  int numStrokes = int(random(2, 6));
  CreateStroke[] stroke = new CreateStroke[numStrokes];

  float lineHeight;
  float em;
  int gridW;
  int gridH;
  float x;
  float y;
  float w;
  float h;
  
  PVector initialPoint;
  PVector supportPoint;
  
  float cellW;
  float cellH;
  
  CreateLetter(float _lineHeight, float _em, int _gridW, int _gridH, float _x, float _y, float _w, float _h){
    lineHeight = _lineHeight;
    em = _em;
    gridW = _gridW;
    gridH = _gridH;
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    
    // Initial random points (for the first stroke)
    int randomInitX = int(random(gridW));
    int randomInitY = int(random(gridH));
    int randomSupportX = int(random(gridW));
    int randomSupportY = int(random(gridH));
    grid = new CreateGrid(lineHeight, em, gridW, gridH, x, y);
    initialPoint = grid.points()[randomInitX][randomInitY];
    supportPoint = grid.points()[randomSupportX][randomSupportY];
    
    for(int i = 0; i < numStrokes; i++){
      stroke[i] = new CreateStroke(initialPoint, supportPoint);
      
      // Calculate next initial and support points
      int randomNextX = int(random(gridW));
      int randomNextY = int(random(gridH));
      
      boolean isContinuous = random(1) > 0.5 ? true : false;
      if(isContinuous){
        initialPoint = supportPoint;
      } else {
        int randomNextInitX = int(random(gridW));
        int randomNextInitY = int(random(gridH));
        initialPoint = grid.points()[randomNextInitX][randomNextInitY];
      }
      
      supportPoint = grid.points()[randomNextX][randomNextY];
    }
  }
  
  void draw(){
    
    if(showGrid){
      pushStyle();
      stroke(0, 60);
      strokeWeight(1);
      fill(0, 1);
      
      float repositionRectX = (w - (grid.points()[gridH-1][0].x - grid.points()[0][0].x))/2;
      float repositionRectY = (h - (grid.points()[0][gridH-1].y - grid.points()[0][0].y))/2;
      
      rect(
        grid.points()[0][0].x - repositionRectX,
        grid.points()[0][0].y - repositionRectY,
        w,
        h
      );
      
      strokeWeight(5);
    
      for(int i = 0; i < grid.points().length; i++){
        for(int j = 0; j < grid.points()[i].length; j++){
          point(grid.points()[i][j].x, grid.points()[i][j].y);
        }
      }
      
      strokeWeight(1);
      line(
        grid.points()[0][0].x,
        grid.points()[0][0].y,
        grid.points()[0][gridH-1].x,
        grid.points()[0][gridH-1].y
      );
      line(
        grid.points()[0][gridH-1].x,
        grid.points()[0][gridH-1].y,
        grid.points()[gridH-1][gridW-1].x,
        grid.points()[gridH-1][gridW-1].y
      );
      line(
        grid.points()[gridH-1][gridW-1].x,
        grid.points()[gridH-1][gridW-1].y,
        grid.points()[gridH-1][0].x,
        grid.points()[gridH-1][0].y
      );
      line(
        grid.points()[gridH-1][0].x,
        grid.points()[gridH-1][0].y,
        grid.points()[0][0].x,
        grid.points()[0][0].y
      );
      
      popStyle();
    }
    
    strokeWeight(5);
    for(int i = 0; i < numStrokes; i++){
      stroke[i].draw();
    }
  }
}
