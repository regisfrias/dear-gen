class CreateAlphabet {
  int numLetters;
  CreateLetter[] letter;
  
  int padding = width/12;
  float containerRatio;
  float rectWidth;
  float rectHeight;
  float rectRatio = 1.3;
  
  float containerWidth;
  float containerHeight;
  
  CreateAlphabet(int _numLetters){
    numLetters = _numLetters;
    letter = new CreateLetter[numLetters];
    
    this.calculateSizes();

    int gridW = 3;
    int gridH = 3;
    float em = rectWidth * 0.9;
    float lineHeight = em / 0.75;
    
    int total = 0;
    for (float y = padding; y <= containerHeight + padding; y += rectHeight) {
      for (float x = padding; x <= containerWidth + padding - rectWidth; x += rectWidth) {
        if (total < numLetters) {
          letter[total] = new CreateLetter(
            lineHeight,
            em,
            gridW,
            gridH,
            x,
            y
          );

        }
        
        total++;
      }
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
  
  void draw(){
    for(int i = 0; i < numLetters; i++){
      letter[i].draw();
    }
  }
}
