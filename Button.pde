class Button {
  int x, y, width, height;
  String text;
  boolean pressed;
  
  Button(int _x, int _y, int _width, int _height, String _text) {
    x = _x;
    y = _y;
    width = _width;
    height = _height;
    text = _text;
    pressed = false;
  }
  
  void draw() {
    noStroke();
    fill(150);
    rect(x, y, width, height);
    fill(180);
    rect(x+5, y + 5, width - 10, height -10);

    textSize(15);
    fill(0);
    text(text, x+(width/2 - 10), y+(height/2));
  }
  
  boolean pressed() {
    if ((mouseX > x) & (mouseX <= (x+width)) & (mouseY > y) & (mouseY <= (y+height)) && mousePressed) {
      return true;
    }
    return false;
  }
}

