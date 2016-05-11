class Arrow {

  float x, y, z;
  float speedX, speedY;
  float angle;
  float targetX, targetY;
  boolean move;

  float clickX;
  float clickY;
  int click;
  
  Arrow() {
    x = 350;
    y = 100;  
    clickX = 0;
    clickY = 0;
    click = 0;

    move = false;
  }

  void display() {
    fill(180, 100, 80);
    rect(x, y, 30, 5);
    fill(200);
    triangle(x, y-5, x, y+10, x-10, y+3);
  }

  void move() {
    if (mousePressed && click == 0)
      click = 1;
    if (click == 1) {
      if (mouseX < 400)
        targetX = 400 - mouseX;
      else
        targetX = mouseX - 400;

      targetY = mouseY - 100;  
      z = sqrt((targetX * targetX) + (targetY * targetY));
      angle = cos((targetX)/z);
      speedX = (z * acos(angle))/20;
      speedY = (z * asin(angle))/20;
      if (mouseX < 400)
        x -= speedX;
      else
        x+= speedX;

      y += speedY;
    }
    
    if (x <= 0 || y >= 600 || x >= 800 || y <= 0)
    {
      x =380;
      y = 100;
      click = 0;
    }
  }

  boolean hit(Swordsman enemy) {
    if (x > enemy.x && x < enemy.x + 100 && y > enemy.y && y < enemy.y + 100) {
      return true;
    }
    return false;
  }
}

