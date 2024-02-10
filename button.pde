// button class stolen from hexahedron1

int textSize = 15;
Button[] buttons = {};
void mousePressed() {
  for (int i = 0; i < buttons.length; i++) {
    if (buttons[i].checkHover()) {
      buttonClick(buttons[i].ID);
    }
  }
}

void buttonClick(String id) {
  //do whatever
}
class Button {
  String text;
  String ID;
  float w;
  float h;
  float x;
  float y;
  private boolean wasHovered;
  Button(String t, float _x, float _y, String _id, int _w, int _h) {
    text = t;
    if(w == 0){
      w = textWidth(t);
    } else {
      w = _w;
    }
    if(h == 0){
      h = textSize;
    } else {
      h = _h;
    }
    h = textSize;
    x = _x;
    y = _y;
    ID = _id;
  }
  void display() {
    if (checkHover())
      fill(150);
    else
      fill(100);
    stroke(255);
    rect(x, y, w + 4, h);
    fill(255);
    text(text, x + 2, y + 2 + textSize);
  }
  boolean checkHover() {
    boolean hover = mouseX > x && mouseX < y + w && mouseY > y && mouseY < y + h;
    // if (hover && !wasHovered)
      
    wasHovered = hover;
    return hover;
  }
}
