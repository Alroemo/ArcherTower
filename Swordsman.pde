class Swordsman {
  float x, y;
  float w, h;
  float angle;
  float speed, speedX, speedY;
  int hp;
  int direction;

  Swordsman() {
    hp= 100;
    x = 50;
    y = 490;
    w = 1;
    h = 1;
    angle = 0;
    speed = 2;  
    int hp;
  }
  void display() {
    pushMatrix();
    //shield
    fill(200);
    rect(x+10, y+30, 25, 40);

    noStroke();
    //main body
    //head
    fill(50);
    ellipse(x+13, y+15, 23, 35);
    ellipse(x+25, y+25, 10, 1);
    fill(255, 0, 0);
    rect(x+10, y-5, 20, 30, 10);
    //knight body
    fill(50);
    rect(x, y+30, 30, 30, 3);
    fill(200, 0, 0);
    rect(x+5, y+30, 25, 30, 0, 0, 0, 45);
    //hand
    stroke(1);
    fill(50);
    ellipse(x, y+40, 20, 10);
    fill(255, 0, 0);
    ellipse(x+10, y+40, 10, 10);
    //horse
    noStroke();

    fill(255, 180, 100);
    //horse body
    rect(x-10, y+60, 60, 20, 25, 0, 25, 0);
    //horse head
    rect(x+40, y+40, 40, 20, 35, 55, 95, 0);
    //horse mane
    fill(200, 130, 50);
    rect(x+39, y+40, 35, 5);
    rect(x+38, y+40, 5, 15);
    rect(x-15, y+60, 5, 10);
    //saddle
    fill(180, 110, 30);
    rect(x-5, y+55, 50, 15, 25, 0, 10, 25);
    //horse ear
    fill(255, 180, 100);
    rect(x+40, y+35, 7, 10, 50, 50, 0, 25);
    //horse legs
    rect(x-10, y+80, 10, 20);
    rect(x+20, y+80, 10, 20);
    //knightleg
    fill(255, 0, 0);
    rect(x+10, y+55, 10, 20);

    //stick thing
    fill(180);
    rect(x+10, y+33, 80, 5);
    stroke(1);
    rect(x+10, y+30, 10, 20);


    //knight hole
    fill(0);
    noStroke();
    rect(x+17, y+10, 13, 5);
    //horse eye
    ellipse(x+50, y+50, 5, 5);
    popMatrix();
  }


  void move(String direction) {

    speedX = speed * cos(radians(angle));
    speedY = speed * sin(radians(angle));

    if (x >= 0 && x <= 750) {
      if (direction == "forward") {
        x +=10 * speedX;
        y += speedY;
      } else if (direction == "backward") {
        x -= 10 * speedX;
        y -= speedY;
      }
    } else {
      if (x <= 0)
        x+= 5;
      else if (x >= 750)
        x-= 5;
    }
  }

  boolean reachedEnd(Archer enemy) {
    if (x <= 400 && x >= 350)
    {
      enemy.hp --;
      return true;
    } else
      return false;
  }
  boolean hit() {
    if (keyPressed) {
      //if (key == 'SPACE') 
      //return true;
    }
    return false;
  }

  void setHP(int num) {
    hp = hp + num;
  }

  int getHP() {
    return hp;
  }
}

