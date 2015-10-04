class Archer {
  float x, y;

  float speed, speedX, speedY, rotSpeed;
  float angle;
  float targetAngle;
  float easing = 0.1;
  float r, g, b;


  int hp;
  int click;
  Arrow arrow;

  Archer() {
    arrow = new Arrow();
    hp = 400;
    x = 0;
    click = 0;
    y = 0; 
    angle = 0;
    speed = 2;
    rotSpeed = 2;
  }

  void display() {

    g = 0;
    b =0;

    drawTower();

    pushMatrix();
    translate( 400, 100 );
    rotate(targetAngle);
    stroke(155,155,90);
    line(x, y, 150, 0);

    popMatrix();

    arrow.display();
  }


  void move() {
    int y = mouseY-100;
    int x = mouseX-400;
    angle = atan2(y, x);
    if ( angle < 0 ) 
      angle = TWO_PI + angle;
    targetAngle += (angle - targetAngle);
  }

  void shoot() {

    if (mousePressed && click == 0) {
      click++;
    }
    if (click == 1)
    {
      //r = 255; 
      arrow.move();
    }
    if (arrow.x < 0 || arrow.y > 600) {
      click = 0;
    }
  }

  boolean hit(Swordsman enemy) {
    if (arrow.hit(enemy))
      return true;
    return false;
  }

  void drawTower() {
    //draws tower
    fill(50);
    rect(340,150,100,420);
    rect(315, 125, 150, 50, 0, 0, 25, 25);
    rect(315, 100, 25, 25, 25, 25, 0, 0);
    rect(380, 100, 25, 25, 25, 25, 0, 0);
    rect(440, 100, 25, 25, 25, 25, 0, 0);
    rect(315, 550, 150, 30, 50, 50, 0, 0);
    fill(0, 0, 255);
    noStroke();
    rect(350, 150, 100, 420);
    rect(325, 125, 150, 50, 0, 0, 25, 25);
    rect(325, 100, 25, 25, 25, 25, 0, 0);
    rect(390, 100, 25, 25, 25, 25, 0, 0);
    rect(450, 100, 25, 25, 25, 25, 0, 0);
    rect(325, 550, 150, 30, 50, 50, 0, 0);
    fill(100);
    rect(370, 180, 45, 85,5,5,5,5);
  }

  void setHP(int num) {
    hp = hp + num;
  }

  int getHP() {
    return hp;
  }
}//end of class

