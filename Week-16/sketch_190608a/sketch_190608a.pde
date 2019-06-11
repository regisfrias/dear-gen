ArrayList<Cell> cells = new ArrayList<Cell>();

void setup(){
  size(920, 580);
}

void draw(){
  background(255);
  for (int i = 0; i < cells.size(); i++) {
    Cell c = cells.get(i);
    c.draw();
  }
}

void mouseClicked(){
  createParticle();
}

void mouseDragged(){
  createParticle();
}

void mouseReleased() {
  cells.add(new Cell(mouseX, mouseY, true));
}

void keyPressed(){
  if(key == 'c'){
    for (int i = cells.size() - 1; i >= 0; i--) {
      cells.remove(i);
    }
  }
}

void createParticle(){
  cells.add(new Cell(mouseX, mouseY, false));
  
  for (int i = 0; i < cells.size(); i++) {
    Cell c = cells.get(i);
    if(i > 0){
      Cell prevPart = cells.get(i-1);
      prevPart.update(c.x, c.y);
    }
  }
}
