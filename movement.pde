int x = 400;
int y = 400;
int xdir = 0;
int ydir = 0;

void setup() {
  size(900, 600);
  smooth();
  background(0);
  noStroke();
}

void draw() {
  background(0);
  ellipse(x, y, 100, 100);
  if (x<850 && x>100 && y<550 && y>100) { 
    if (keyPressed) {
      if (key == 'a' || key =='A') { //go left
        xdir = -1;
        ydir = 0;
      }
      if (key == 'd' || key == 'D') { //go right
        xdir = 1;
        ydir = 0;
      }
      if (key == 'w' || key =='W') { //go up
        xdir = 0;
        ydir = -1;
      }
      if (key == 's' || key == 'S') { //go down
        xdir = 0;
        ydir = 1;
      }
    }
    x += xdir;
    y += ydir;
  }
}
