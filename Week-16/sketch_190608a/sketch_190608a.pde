ArrayList<Cell> particles = new ArrayList<Cell>();

void setup(){
  size(920, 580);
}

void draw(){
  background(255);
  for (int i = 0; i < particles.size(); i++) {
    Cell part = particles.get(i);
    part.draw();
  }
}

void mouseClicked(){
  createParticle();
}

void mouseDragged(){
  createParticle();
}

void mouseReleased() {
  particles.add(new Cell(mouseX, mouseY, true));
}

void createParticle(){
  particles.add(new Cell(mouseX, mouseY, false));
  
  for (int i = 0; i < particles.size(); i++) {
    Cell part = particles.get(i);
    if(i > 0){
      Cell prevPart = particles.get(i-1);
      prevPart.update(part.x, part.y);
    }
  }
}
