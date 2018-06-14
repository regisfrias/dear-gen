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
  
  PVector initialPoint;
  PVector supportPoint;
  
  CreateLetter(float _lineHeight, float _em, int _gridW, int _gridH, float _x, float _y){
    lineHeight = _lineHeight;
    em = _em;
    gridW = _gridW;
    gridH = _gridH;
    x = _x;
    y = _y;
    
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

    //stroke(0, 100);
    //strokeWeight(3);
    //for(int i = 0; i < grid.points().length; i++){
    //  for(int j = 0; j < grid.points()[i].length; j++){
    //    point(grid.points()[i][j].x, grid.points()[i][j].y);
    //  }
    //}
    
    stroke(0);
    strokeWeight(5);
    for(int i = 0; i < numStrokes; i++){
      stroke[i].draw();
    }
  }
}
