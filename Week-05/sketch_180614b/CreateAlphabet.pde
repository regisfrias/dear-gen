class CreateAlphabet {
  int numLetters = 10;
  CreateLetter[] letter = new CreateLetter[numLetters];
  
  CreateAlphabet(){
    float lineHeight = height/8;
    float em = lineHeight * 0.75;
    int gridW = 3;
    int gridH = 3;

    float x = 50;
    float y = 50;
    float cellW = em/gridW;
    float cellH = lineHeight/gridH;
    
    for(int i = 0; i < numLetters; i++){
      letter[i] = new CreateLetter(
        lineHeight,
        em,
        gridW,
        gridH,
        (x + cellW)*i + x,
        y
      );
    }
  }
  
  void draw(){
    for(int i = 0; i < numLetters; i++){
      letter[i].draw();
    }
  }
}
