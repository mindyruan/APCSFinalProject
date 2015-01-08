int x = 400;
PImage img; //loading an image to test
int y = 400;
int xdir = 0;
int ydir = 0;

void setup() {
  size(900, 600);
  smooth();
  background(0);
  noStroke();
  img= loadImage("2000px-Pacman.svg.png");
  
  
}

class setUpCircles{
  setUpCircles(){
  // (below) : load the circles Pacman is eating
  int i = 0;
  while (i < 1000){
    fill(255);
    ellipse(i, i, 30, 30);
    i += 50;
  }  
  }
  
  void update(int xCoor, int yCoor, int radius){
  int i = 0;
  while (i < 1000){
    fill(255);
    ellipse(i, i, 30, 30);
    i += 50;
  } 

fill (0);
ellipse(xCoor, yCoor, radius, radius);

}
}

void draw() {
  
  background(0);
  //ellipse(x, y, 20, 20);
  image(img, x, y, 100, 100);
  
  
  if (x == 50 || x == 850) {
    xdir = 0;
  }
  if (y == 50 || y == 550){
    ydir = 0;
  }
  if (keyPressed) {
    if (x>50 && (key == 'a' || key =='A')) { //go left
      xdir = -1;
      ydir = 0;
    }
    if (x<850 && (key == 'd' || key == 'D')) { //go right
      xdir = 1;
      ydir = 0;
    }
    if (y>50 && (key == 'w' || key =='W')) { //go up
      xdir = 0;
      ydir = -1;
    }
    if ((key == 's' || key == 'S') && y<550) { //go down
      xdir = 0;
      ydir = 1;
    }
  }
  x += xdir;
  y += ydir;
}
