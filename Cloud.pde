class Cloud {
  int x, y, width, height;
  int speed;
  
  Cloud() {
    x = (int)random(800);
    y = (int)random(500);
    width = (int)random(120,230);
    height = 50;
    speed = (int)random(1,3);
  }
  
  void display() {
    fill(240);
    noStroke();
    ellipse(x, y, width, height);
  }
  
  void move() {
    x+= speed;
    if (x >= 800) {
      x = -100;
      y = (int)random(400);
    }
  }
}

