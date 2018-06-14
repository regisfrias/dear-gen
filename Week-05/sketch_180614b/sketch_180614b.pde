CreateAlphabet alphabet;

void setup(){
  size(1022, 638);
  colorMode(HSB, 360, 100, 100);

  alphabet = new CreateAlphabet();
}

void draw(){
  alphabet.draw();
}
