final class Player {
  boolean isLeft, isRight, isUp, isDown, shoot;
  float x, y;
  float vx = 0;
  float vy = 0;
  float a, m;
  
  Player(final int xx, final int yy, final float aa, final float mm) {
    x = xx;
    y = yy;
    a = aa;
    m = mm;
  }
 
  void display() {
    fill(255);
    rect(x-50/2, y-90/2, 50, 90);
  }
 
  void move() {
    x += vx;
    y += vy;
    if (x<0) x = 0;
    if (y<0) y = 0;
    if (x>width) x = width;
    if (y>height) y = height;
    vx *= 0.9;
    vy *= 0.9;
    if(isDown) vy = max(vy+a, -m);
    if(isUp) vy = min(vy-a, m);
    if(isRight) vx = max(vx+a, -m);
    if(isLeft) vx = min(vx-a, m);
    if(shoot) {
      shoot(1, p.x, p.y, true);
    }
  }
 
  boolean setMove(final int k, final boolean b) { // thank GOD THIS EXISTS AAAAAA
    switch (k) {
    case +'W':
    case UP:
      return isUp = b;
 
    case +'S':
    case DOWN:
      return isDown = b;
 
    case +'A':
    case LEFT:
      return isLeft = b;
 
    case +'D':
    case RIGHT:
      return isRight = b;
    
    case 32:
      return shoot = b;
 
    default:
      return b;
    }
  }
}
 
void keyReleased() {
  p.setMove(keyCode, false);
}
