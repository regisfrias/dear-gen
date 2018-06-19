import processing.pdf.*;

int gridSubdivisionsW = 3;
int gridSubdivisionsH = 3;

boolean savePdf = false;
boolean showGrid = false;

// Set text to write
String textToWrite = "ALPHABET BY REGIS FRIAS 2018";

// Set which alphabet to use
int alphabetIndex = 3;
char[][] alphabet = {
  // 0: Latin (English)
  {'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z'},
  // 1: Latin with numbers
  {'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z','0','1','2','3','4','5','6','7','8','9'},
  // 2: Finnish/Swedish
  {'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z','Ä','Ö','Å'},
  // 3: Finnish/Swedish with numbers
  {'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z','Ä','Ö','Å','0','1','2','3','4','5','6','7','8','9'}
};
int numLetters = alphabet[alphabetIndex].length;

CreateLetters letters;

void setup(){
  size(1022, 638);
  createLetters();
}

void draw(){
  background(255);
  
  if(savePdf){
    String fileName = "saved/" + year() + "-" + month() + "-" + day() + "-" + hour() + "-" + minute() + "-" + second() + "-alphabet.pdf";
    beginRecord(PDF, fileName);
  }
  
  letters.returnLetters();
  
  if(savePdf){
    endRecord();
    savePdf = false;
  }
}

void createLetters(){
  float rectWidth = width/24;
  float em = rectWidth * 0.75;
  float lineHeight = em / 0.75;
  
  letters = new CreateLetters(lineHeight, em);
}

void keyPressed(){
  switch(key){
    case 's':
      savePdf = true;
      break;
    case 'g':
      showGrid = !showGrid;
      break;
    case 'r':
      createLetters();
      break;
  }
}
