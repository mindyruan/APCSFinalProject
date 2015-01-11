 
PImage img; //loading an image to test
void setup() {
  size(900, 600);
  smooth();
  background(0);
  noStroke();
  img= loadImage("2000px-Pacman.svg.png");

  
}

class movementAll{
  int x = 0; // this is completely random

int y = 50; // this is completely random
int xdir = 0;
int ydir = 0;
  
ArrayList<Integer>xStart = new ArrayList<Integer>();
ArrayList<Integer>yStart = new ArrayList<Integer>();
ArrayList<Integer>blackListX = new ArrayList<Integer>();
ArrayList<Integer>blackListY = new ArrayList<Integer>();

PFont f= createFont("Arial", 25, true);
int score = 0;

  void setUpCircles(){

  // (below) : load the circles Pacman is eating
  int i1 = 0;
  int i2 = 50;
  
   while(i1 < 1000){
    xStart.add(i1);
    yStart.add(i2);
    i1 += 50;
  }
  /*
  while(i2 < 1000){
    yStart.add(i2);
    i2 += 50;
  }
  
  println(xStart);
  println(yStart);
  */
  }
  
  
    void update(int x, int y){
      
      //println(blackListX);
      //println(blackListY);
      /*
      println(blackListX.indexOf(x) == -1);
      println(blackListY.indexOf(y) == -1);
      println(xStart.indexOf(x) != -1);
      println(yStart.indexOf(y) != -1);
      println(xStart.indexOf(x) == yStart.indexOf(y));
      */
      int xRecordB = blackListX.indexOf(x);
      int xRecord = xStart.indexOf(x);
    if (xStart.indexOf(x) != -1 && yStart.indexOf(y) != -1 && yStart.get(xRecord) == y){
      //might need for later: && xStart.indexOf(x) == yStart.indexOf(y)
    if (blackListX.indexOf(x) == -1 || blackListY.indexOf(y) == -1 || blackListY.get(xRecordB) != y){
        score += 1;
      blackListX.add(x);
      blackListY.add(y);
      //println(x + "," + y + "add to blacklist");
      //println(blackListX);
      //println(blackListY);
    }
    }
    }

  
  //make circles that exclude the ones pacman already ate.
  void updateDraw(int radius){
  background(0);
  textFont(f, 200);
  fill (100);
  text(score, 660, 220);
  int i1 = 0;
  int i2 = 50;
  while (i1 < 1000){
    if (blackListX.indexOf(i1) == -1 || blackListY.indexOf(i2) == -1){

      while ((i1 < 1000) && (blackListX.indexOf(i1) == -1 || blackListY.indexOf(i2) == -1 || blackListX.indexOf(i1) != blackListY.indexOf(i2))){
      //while (i1 < 1000 && i2 < 1000){
        //println(i1 + "," + i2 + "add circle");
        fill(255);
        ellipse(i1, i2, radius, radius);
      i1 += 50;
//      i2 += 50;
      }
      }else{
        i1 += 50;
//        i2 += 50;
      }
    }
  }
  

void movingCircle() {
  color c1 = get(x + 20,y); //based on the radius of the moving circle
  color c2 = get(x,y + 20); //based on the radius of the moving circle
  if (c1!= 0 || c2 != 0){
  update(x,y);
  }
  //ArrayList<Integer>xcoords = new ArrayList<Integer>();
  //ArrayList<Integer>ycoords = new ArrayList<Integer>();
  //image(img, x, y, 100, 100);
  updateDraw(30);
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
}
  }
  


void draw(){
  movementAll tester = new movementAll();
  tester.setUpCircles();
  tester.movingCircle();
}