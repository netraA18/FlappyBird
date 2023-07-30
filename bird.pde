void moveBird() {
  pos.add(vel);
  vel.add(gravity);
}

void keyPressed() {
  if (key == ' ') {
    vel.y = -8; 
    
  }
  
}


void moveOutWindow() {
  if (pos.y + imgH/2 > height) {

    exit();
  }
}
