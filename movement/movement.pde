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
  
  
  ArrayList<Integer>xStart = new ArrayList<Integer>();
  ArrayList<Integer>yStart = new ArrayList<Integer>();
  ArrayList<Integer>blackListX = new ArrayList<Integer>();
  ArrayList<Integer>blackListY = new ArrayList<Integer>();
  
  setUpCircles(){
  // (below) : load the circles Pacman is eating
  int i1 = 0;
  int i2 = 2;
  //while (i1 < 1000){
  //  fill(255);
  // ellipse(i1, i2, 30, 30);
  // i += 50;
  //}  
   while(i1 < 1000){
    xStart.add(i1);
    i1 += 50;
  }
  while(i2 < 1000){
    yStart.add(i2);
    i2 += 50;
  }
  }
  
  void update(int x, int y){
    if (xStart.indexOf(x) != -1 && yStart.indexOf(y) != -1 && xStart.indexOf(x) == yStart.indexOf(y)){
      blackListX.add(x);
      blackListY.add(y);
    }
  }
    
  
  //make circles that exclude the ones pacman already ate.
  void updateDraw(int radius){
    
  int i1 = 0;
  int i2 = 2;
  while ((i1 < 1000 && i2 < 1000) && (blackListX.indexOf(i1) == -1 || blackListY.indexOf(i2) == -1 || blackListX.indexOf(i1) != blackListY.indexOf(i2))){
  //while (i1 < 1000 && i2 < 1000){
    fill(255);
    ellipse(i1, i2, radius, radius);
    i1 += 50;
    i2 += 50;
    }
   
    
  }
}


void draw() {
  //ArrayList<Integer>xcoords = new ArrayList<Integer>();
  //ArrayList<Integer>ycoords = new ArrayList<Integer>();
  setUpCircles test = new setUpCircles();
  background(0);
  //image(img, x, y, 100, 100);
  test.updateDraw(30);
  fill(100);
  ellipse(x, y, 20, 20);

  
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
  //fill(255);
  //ellipse(x, y, 10, 10);
  test.update(x,y);
}
