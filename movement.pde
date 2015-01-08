int x = 400;
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
  ellipse(x, 400, 100, 100);
  if (x<850) { 
    if (keyPressed) {
      if (key == 'a' || key =='A') { //go left
        xdir = -1;
      }
      if (key == 'd' || key == 'D') { //go right
        xdir = 1;
      }
    }
    x += xdir;
  }
}
