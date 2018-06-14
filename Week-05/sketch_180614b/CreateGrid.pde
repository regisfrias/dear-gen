class CreateGrid {
  float lineHeight;
  float em;
  int gridW;
  int gridH;
  float x;
  float y;
  
  PVector[][] vector;
  float cellW;
  float cellH;
  
  CreateGrid(float _lineHeight, float _em, int _gridW, int _gridH, float _x, float _y){
    lineHeight = _lineHeight;
    em = _em;
    gridW = _gridW;
    gridH = _gridH;
    x = _x;
    y = _y;
    
    vector = new PVector[gridW][gridH];
    cellW = em/gridW;
    cellH = lineHeight/gridH;
  }
  
  PVector[][] points(){
    for(int i = 0; i < gridW; i++){
      for(int j = 0; j < gridH; j++){
        vector[i][j] = new PVector(i*cellW + x, j*cellH + y);
      }
    }
    
    return vector;
  }
}
