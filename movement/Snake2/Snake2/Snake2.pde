//coordinate will not go into blackList until 5 times later

int x = 0; // this is completely random
PImage img; //loading an image to test
int y = 50; // this is completely random
int xdir = 0;
int ydir = 0;
int counter = -5; // allow room for errors
int placeX = 0;
int placeY = 0;

void setup() {
  size(900, 600);
  smooth();
  background(0);
  noStroke();

  
  
}


boolean checkCoord(ArrayList<Integer> exampleX, ArrayList<Integer>exampleY, int x, int y){
  placeX = 0;
  placeY = 0;
    while (placeY < exampleY.size()){
      if (((pow((y - exampleY.get(placeY)), 2)) + (pow((x - exampleX.get(placeY)), 2))) <= 100){
//        if (exampleX.get(placeY) == x){
          println("hello check coord true");
          return true;
//        }
      }
      placeY += 1;
    }
    println("hello check coord false");
    return false;
    
    
}


boolean checkCoordB(ArrayList<Integer> exampleX, ArrayList<Integer>exampleY, int x, int y){
  placeX = 0;
  placeY = 0;
    while (placeY < exampleY.size()){
     if (exampleY.get(placeY) == y){
        if (exampleX.get(placeY) == x){
          println("hello check coord true");
          return true;
        }       
      }
      placeY += 1;
    }
    println("hello blackList check coord false");
    return false;
    
    
}


class setUpCircles{
  boolean on = false;
  
  
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
      
      /*
      counter = -10;
      x -= -10;
      y -= -10;
      */
      
      on = false;
      

      
//      while (counter <= 10){
      /*
      println(blackListX.indexOf(x) == -1);
      println(blackListY.indexOf(y) == -1);
      println(xStart.indexOf(x) != -1);
      println(yStart.indexOf(y) != -1);
      println(xStart.indexOf(x) == yStart.indexOf(y));
      */
      //int xRecordB = blackListX.indexOf(x);
//      int xRecord = xStart.indexOf(x);
      //int yRecordB = blackListY.indexOf(y);
//      int yRecord = yStart.indexOf(y);
      
//    if (xStart.indexOf(x) != -1 && yStart.indexOf(y) != -1 && (abs(yStart.get(xRecord) - y) <= 10 && abs(xStart.get(yRecord) - x) <= 10)){
  if (checkCoord(xStart, yStart, x, y)){
    if (checkCoordB(blackListX, blackListY, x, y) == false){
      on = true;

      //
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

        blackListX.add(x);
        blackListY.add(y);
        score += 1;
        return on;
    }
  }
        
     
      println("falseeeee");
      return on;
    }
      
  float randX = random(900);
  float randY = random(600);
  int xcoor = int(randX);
  int ycoor = int(randY);

  
  //make circles that exclude the ones pacman already ate.
  void updateDraw(int x, int y, int radius){
  background(0);
  textFont(f, 200);
  fill (100);
  text(score, 660, 220);
  
  
  if ((xStart.isEmpty() && yStart.isEmpty()) || (this.update(x, y) == true)){
   randX = random(900);
   randY = random(600);
   xcoor = int(randX);
   ycoor = int(randY);
 
//  int tracker = blackListX.indexOf(xcoor);

//while (blackListX.indexOf(xcoor) != -1 && blackListY.indexOf(ycoor) != -1 && blackListY.get(tracker) == ycoor){ 
 
  while (checkCoordB(blackListX, blackListY, xcoor, ycoor) == true){
   randX = random(900);
   randY = random(600);
   xcoor = int(randX);
   ycoor = int(randY);
  }
  xStart.clear();
  yStart.clear();
  addCirclesToArray(xcoor, ycoor);


  
//  if ((xStart.isEmpty() && yStart.isEmpty()) || (this.update(x, y) == true)){
  /*
   counter = -5;
   xcoor -= 5;
   ycoor -= 5;
   while (counter <= 5 && checkCoord(blackListX, blackListY, xcoor, ycoor) == false){
     addCirclesToArray(xcoor, ycoor);
     counter += 1;
     xcoor += 1;
     ycoor += 1;
   }
   xcoor -= 5;
   ycoor -= 5;
   */
  }
  
    fill(100);
    ellipse(xcoor, ycoor, radius, radius);
    
    }
  }
    
  

  setUpCircles test = new setUpCircles();

void draw() {
  
  test.updateDraw(x, y, 30);
  
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
}

  

