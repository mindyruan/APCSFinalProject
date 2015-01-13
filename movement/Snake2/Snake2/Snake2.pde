int x = 0; // this is completely random
PImage img; //loading an image to test
int y = 50; // this is completely random
int xdir = 0;
int ydir = 0;
int counter = -10; // allow room for errors

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
  
 
  
  void addCirclesToArray(int x, int y){

    xStart.add(x);
    yStart.add(y);

  }


    boolean update(int x, int y){
      
      //allow room for error when snaking
      counter = -10;
      x -= -10;
      y -= -10;
      
      
      boolean on = false;
      
      while (counter <= 10){
        println("into counter");
      /*
      println(blackListX.indexOf(x) == -1);
      println(blackListY.indexOf(y) == -1);
      println(xStart.indexOf(x) != -1);
      println(yStart.indexOf(y) != -1);
      println(xStart.indexOf(x) == yStart.indexOf(y));
      */
      //int xRecordB = blackListX.indexOf(x);
      int xRecord = xStart.indexOf(x);
      //int yRecordB = blackListY.indexOf(y);
      int yRecord = yStart.indexOf(y);
      
      println(x + "," + xStart.get(x));
      println(y + "y" + yStart.get(y));
    if (xStart.indexOf(x) != -1 && yStart.indexOf(y) != -1 ){
      //&& (abs(yStart.get(xRecord) - y) <= 10 && abs(xStart.get(yRecord) - x) <= 10)
      on = true;
      /*
      //might need for later: && xStart.indexOf(x) == yStart.indexOf(y)
    if (blackListX.indexOf(x) == -1 || blackListY.indexOf(y) == -1 || blackListY.get(xRecordB) != y){
        score += 1;
    }
        blackListX.add(x);
        blackListY.add(y);
        //println(x + "," + y + "add to blacklist");
        //println(blackListX);
        //println(blackListY);
        */
        println("yay");
        return on;
        
    }
    counter += 1;
    x += 1;
    y += 1;
    
      }
      
      println("falseeeee");
      return on;
    }
      
  float randX = random(900);
  float randY = random(600);
  int xcoor = int(randX);
  int ycoor = int(randY);

  
  //make circles that exclude the ones pacman already ate.
  void updateDraw(int radius){
  background(0);
  textFont(f, 200);
  fill (100);
  text(score, 660, 220);
  
  println(xStart);
  println(yStart);
  
  if ((xStart.isEmpty() && yStart.isEmpty()) || (this.update(xcoor, ycoor) == true)){
    println("truee");
 
//  int tracker = blackListX.indexOf(xcoor);

//while (blackListX.indexOf(xcoor) != -1 && blackListY.indexOf(ycoor) != -1 && blackListY.get(tracker) == ycoor){
  
   randX = random(900);
   randY = random(600);
   xcoor = int(randX);
   ycoor = int(randY);
   
   counter = -10;
   xcoor -= 10;
   ycoor -= 10;
   while (counter <= 10){
   addCirclesToArray(xcoor, ycoor);
   counter += 1;
   xcoor += 1;
   ycoor += 1;
   }
//}
  }
  
    fill(100);
    ellipse(xcoor, ycoor, radius, radius);
    
    }
    
  }

  setUpCircles test = new setUpCircles();

void draw() {
  
  test.updateDraw(30);
  
  fill(255);
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
  point(x,y);
  println(x + "," + y);
}

  

