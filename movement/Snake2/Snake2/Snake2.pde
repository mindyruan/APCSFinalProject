int x = 0; // this is completely random
PImage img; //loading an image to test
int y = 50; // this is completely random
int xdir = 0;
int ydir = 0;

void setup() {
  size(900, 600);
  smooth();
  background(0);
  noStroke();

  
  
}

class setUpCircles{
  
  
ArrayList<Integer>xStart = new ArrayList<Integer>();
ArrayList<Integer>yStart = new ArrayList<Integer>();
ArrayList<Integer>blackListX = new ArrayList<Integer>();
ArrayList<Integer>blackListY = new ArrayList<Integer>();

  
  PFont f= createFont("Arial", 25, true);
  int score = 0;
  
  void addXToArray(int x){
    xStart.add(x);
  }
  
  void addYToArray(int y){
    yStart.add(y);
  }
  
  void addCirclesToArray(int x, int y){

    xStart.add(x);
    yStart.add(y);

  }

  
    void update(int x, int y){
      int counter = -5

      //allow room for error when snaking
      x -= 5;
      y -= 5;
      while (counter <= 5){
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
      counter += 1;
      x += 1;
      y += 1;
    }
    }
    }
    }

  
  //make circles that exclude the ones pacman already ate.
  void updateDraw(int radius){
  background(0);
  textFont(f, 200);
  fill (100);
  text(score, 660, 220);
  
  float randX = random(width);
  float randY = random(height);
  int tracker = blackListX.indexOf(int(randX));

  
  ellipse(int(randX), int(randY));
  
while (blackListX.indexOf(int(randX)) != -1 && blackListY.indexOf(int(randY)) != -1 && blackListY.get(tracker) != int(randY)){
  float randX == random(width);
  float randY = random(height);
}
     ellipse(int(randX), int(randY), 20 20);
  }
}
   

  setUpCircles test = new setUpCircles();

void draw() {
  
  test.update(x,y);
  }
  //ArrayList<Integer>xcoords = new ArrayList<Integer>();
  //ArrayList<Integer>ycoords = new ArrayList<Integer>();
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
  //println(x + "," + y);
  
  }
  
}
