Swordsman player;
Archer archer;
boolean gameEnd;
boolean menu;
boolean play;
int winState;
Timer time;
Cloud [] clouds;

Button playButton;
Button reset;

void setup() {
  clouds = new Cloud[10];
  for (int i = 0; i < 10; i++) {
    clouds[i] = new Cloud();
  }
  size(800, 600); 
  archer = new Archer();
  player = new Swordsman();
  time = new Timer(20);
  gameEnd = false;
  menu = true;
  play = false;
  winState = 0;
  playButton = new Button(600, 400, 100, 50, "Play");
  reset = new Button(380, 400, 100, 50, "Reset");
}//end of setup

void draw() {
  //draws menu screen
  if (menu) {
    drawBackground();
    archer.drawTower();
    textMode(CENTER);
    textSize(100);
    fill(255, 230, 100);
    text("Archer    Tower", 5, 260);
    //textSize(25);
    //text("Press any button to Play", 300, 400);
    playButton.draw();

    textSize(15);
    fill(255, 0, 0);
    text("Knight: Left and right arrow to move to the tower to damage the tower", 0, 20);
    fill(0, 0, 255);
    text("Archer: Click mouse to shoot and damage at the horseman", 50, 55);
    if (playButton.pressed())
      play = true;
  }//end of menu page

  //draws the end game screen
  if (gameEnd) {
    drawBackground();
    archer.drawTower();
    textMode(CENTER);
    textSize(75);
    fill(255, 230, 100);
    if (winState == 1)
      text("Tower Wins", 100, 200);
    else if (winState == 2)
      text("Horseman wins", 100, 200);
    textSize(25);
    //text("Press any button to replay", 300, 400);
    reset.draw();
    if (reset.pressed())
      this.setup();
  }//end of lose screen

  //draws the game state
  if (play) {
    drawBackground();
    time.startTimer();
    archer.display();
    player.display();

    //draws the score board
    textSize(20);
    fill(255, 0, 0);
    text("Knight", 15, 30);
    rect(10, 40, player.getHP(), 30);  
    fill(255);
    text(player.getHP(), 15, 60);

    fill(0, 0, 255);
    text("Archer", 700, 30);
    rect(700, 40, (archer.getHP()/4), 30);
    fill(255);
    text(archer.getHP(), 705, 60);

    if (time.timerDone()) {
      archer.move();
      archer.shoot();
      if (keyPressed) {
        switch (keyCode) {
        case RIGHT:
          player.move("forward");
          break;
        case LEFT:
          player.move("backward");
          break;
        }
      }
    }


    if (player.getHP() <= 0) {
      fill(0, 0, 255);
      println("Archer wins!");
      player.x = -10000;
      gameEnd = true;
      play = false;
      winState = 1;
    }
    if (archer.getHP() <= 0) {
      fill(255, 0, 0);
      println("Player wins!");
      archer.x = -10000;
      gameEnd = true;
      play = false;
      winState = 2;
    }


    if ((player.reachedEnd(archer)))
      archer.setHP(-2);
    if (archer.hit(player))
      player.setHP(-1);
  }//end of play screen
}//end of draw

void drawBackground() {
  background(0, 170, 190);

  //draws clouds
  for (int i = 0; i < 10; i++) {
    clouds[i].display();
    clouds[i].move();
  }
  
  //draws ground
  fill(0, 200, 0);
  rect(0, 550, 800, 50);
}

