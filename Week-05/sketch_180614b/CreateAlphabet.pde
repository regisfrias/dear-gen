class CreateLetters {
  CreateGrid grid;
  CreateLetter[] letters = new CreateLetter[numLetters];
  
  int padding = width/12;
  float containerRatio;
  float rectWidth;
  float rectHeight;
  float rectRatio = 1.3;
  
  float containerWidth;
  float containerHeight;
  
  CreateLetters(float _lineHeight, float _em){
    grid = new CreateGrid(_lineHeight, _em, gridSubdivisionsW, gridSubdivisionsH);
    
    this.calculateSizes();
    
    float strokeWeight = _em/15;
    
    for(int i = 0; i < numLetters; i++){
      letters[i] = new CreateLetter(grid, _lineHeight, _em, strokeWeight);
    }
  }
  
  void calculateSizes(){
    containerWidth = width - padding*2;
    containerHeight = height - padding*2;
    containerRatio = containerWidth/containerHeight;
    rectWidth = sqrt(containerRatio/(numLetters*rectRatio)) * containerHeight;
    rectHeight = rectWidth * rectRatio;
    
    float bigSmallRatioW = containerWidth/rectWidth;
    int numCols = ceil(bigSmallRatioW);
    float extraWidth = numCols*rectWidth - containerWidth;
  
    float bigSmallRatioH = containerHeight/rectHeight;
    int numRows = ceil(bigSmallRatioH);
    float extraHeight = numRows*rectHeight - containerHeight;
  
    if(extraWidth > extraHeight){
      rectWidth = rectWidth - extraWidth/numCols;
      rectHeight = rectWidth * rectRatio;
    } else {
      rectHeight = rectHeight - extraHeight/numRows;
      rectWidth = rectHeight / rectRatio;
    }
  }
  
  void returnLetters(){
    
    int total = 0;
    for (float y = padding; y <= containerHeight + padding; y += rectHeight) {
      for (float x = padding; x <= containerWidth + padding - rectWidth; x += rectWidth) {
        if (total < numLetters) {
          shape(letters[total].returnLetter(), x, y);
        }
        total++;
      }
    }
    
    
    shape(letters[0].returnLetter(), padding, height-padding);
    
  }
}
