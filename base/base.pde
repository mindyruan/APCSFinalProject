import java.util.*;

PImage img;

int x = 450;
int y = 314;
int xdir = 0;
int ydir = 0;
int placeX = 0;
int placeY = 0;
int score = 0;
int place = 0;
int xdirG = 0;
int ydirG = 0;
int xGhost = 0;
int yGhost = 0;
boolean or = false;
int removedPlace = 0;

void setup() {
  size(900, 600);
  smooth();
  background(0);
  noStroke();

  img = loadImage("try2.png");
}

//x = 45: blank space begins
//x = 854; ends
//y = 133; blank space begins
//y = 466; ends

//foods
//x = 54 left edge, 61, right edge, 82 begin, 89;
//y = 142 up edge, 149, down edge, 170 begin, 177 end;

boolean checkCoord(ArrayList<Integer> exampleX, ArrayList<Integer>exampleY, int x, int y) {
  placeX = 0;
  placeY = 0;
  while (placeY < exampleY.size ()) {
    if (((pow((y - exampleY.get(placeY)), 2)) + (pow((x - exampleX.get(placeY)), 2))) <= 100) {
      removedPlace = placeY;
      //println("hello check coord true");
      return true;
    }
    placeY += 1;
  }
  //println("hello check coord false");
  return false;
}


boolean checkCoordB(ArrayList<Integer> exampleX, ArrayList<Integer>exampleY, int x, int y) {
  placeX = 0;
  placeY = 0;
  while (placeY < exampleY.size ()) {
    if (exampleY.get(placeY) == y) {
      if (exampleX.get(placeY) == x) {
        //println("hello check coord true");
        return true;
      }
    }
    placeY += 1;
  }
  //println("hello blackList check coord false");
  return false;
}


class setUpCircles {
  boolean on = false;

  ArrayList<Integer>xStart = new ArrayList<Integer>();
  ArrayList<Integer>yStart = new ArrayList<Integer>();
  ArrayList<Integer>blackListX = new ArrayList<Integer>();
  ArrayList<Integer>blackListY = new ArrayList<Integer>();

  //rest in peace me
  ArrayList<Integer>badX = new ArrayList<Integer>(
  Arrays.asList(15,
  2,3,4,5,6,8,10,11,12,14,15,16,18,20,22,24,25,26,27,28,
  4,10,12,18,19,20,26,
  1,2,6,7,8,14,15,16,22,23,24,28,29,
  4,7,10,12,15,18,20,23,26,
  2,4,5,9,10,12,13,17,18,20,21,25,26,28,
  2,4,5,7,9,10,12,13,15,17,18,20,21,23,25,26,28,
  4,10,12,18,20,26,
  1,2,6,7,8,14,15,16,22,23,24,28,29,
  4,7,10,11,12,15,18,20,23,26,
  2,3,4,5,6,8,10,12,14,15,16,18,19,20,22,24,25,26,27,28,
  15));

  
  ArrayList<Integer>badY = new ArrayList<Integer>(
  Arrays.asList(1,
  2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,
  3,3,3,3,3,3,3,
  4,4,4,4,4,4,4,4,4,4,4,4,4,
  5,5,5,5,5,5,5,5,5,
  6,6,6,6,6,6,6,6,6,6,6,6,6,6,
  7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,
  8,8,8,8,8,8,
  9,9,9,9,9,9,9,9,9,9,9,9,9,
  10,10,10,10,10,10,10,10,10,10,
  11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,
  12));


// s = a + (n-1)d  arithmetic sequences heck yeah
//58 + 6(28) = 226   [[ 58 + (x-1)28 ]]
//146 + 3(28) = 230  [[ 146 + (x-1)28 ]]

//first circle = 58,146
//col 7, row 4 = 226,230


  PFont f= createFont("Arial", 25, true);
  int score = 0;

  void addCirclesToArray(int col) {
    // (below) : load the circles Pacman is eating
    //int xfood = 58;
    int yfood = col; //146

    for (int xfood = 58; xfood <= 860; xfood+=28) {
      if (pleaseGoAway(xfood, yfood)) {
        xStart.add(xfood);
        yStart.add(yfood);
      }
    }
  }

  boolean pleaseGoAway(int xcor, int ycor) {
    int index = badX.indexOf(((xcor-58)/28)+1);
    if (index == -1) {
      return true;
    }
    for (int i = 0; i < badX.size (); i++) {
      int noX = badX.get(i);
      int noY = badY.get(i);
      if (((58 + (28*(noX - 1))) == xcor)
        && ((146 + (28*(noY - 1))) == ycor)) {
        badX.remove(i);
        badY.remove(i);
        return false;
      }
    }
    return true;
  }

  void update(int x, int y) {  
    if (xStart.isEmpty() && yStart.isEmpty()) {
      int startYCoor = 146;
      while (startYCoor < 470) {
        test.addCirclesToArray(startYCoor);
        startYCoor += 28;
      }
    }


    if (checkCoord(xStart, yStart, x, y)) {
      score += 1;
      xStart.remove(removedPlace);
      yStart.remove(removedPlace);
    }
  }
   
  //make circles that exclude the ones pacman already ate.
  void updateDraw(int radius) {
    textFont(f, 100);
    fill (100);
    text(score, 660, 120);
    place = 0;
    while (place < xStart.size () - 1) {
      fill(255);
      ellipse(xStart.get(place), yStart.get(place), radius, radius);
      place += 1;
    }
  }
}

class setUpCirclesSnake {


  int lastxdir = 0;
  int lastydir = 0;
  boolean on = false;
  int score = 0;
  int numberOfCircles = score;
  PFont f= createFont("Arial", 25, true);
  int xCoorTail = 0;
  int yCoorTail = 0;


  ArrayList<Integer>xStart = new ArrayList<Integer>();
  ArrayList<Integer>yStart = new ArrayList<Integer>();
  ArrayList<Integer>blackListX = new ArrayList<Integer>();
  ArrayList<Integer>blackListY = new ArrayList<Integer>();


  void addCirclesToArray(int x, int y) {

    xStart.add(x);
    yStart.add(y);
  }


  boolean update(int x, int y) {
    on = false;
    if (checkCoord(xStart, yStart, x, y)) {
      on = true;
      score += 1;
      return on;
    }
    //println("falseeeee");
    return on;
  }

  float randX = random(900);
  float randY = random(600);
  int xcoor = int(randX);
  int ycoor = int(randY);


  //make circles that exclude the ones pacman already ate.
  void updateDraw(int x, int y, int radius) {
    background(0);
    textFont(f, 200);
    fill (100);
    text(score, 660, 220);


    if ((xStart.isEmpty() && yStart.isEmpty()) || (this.update(x, y) == true)) {
      randX = random(900);
      randY = random(600);
      xcoor = int(randX);
      ycoor = int(randY);
      while (checkCoordB (blackListX, blackListY, xcoor, ycoor) == true) {
        randX = random(900);
        randY = random(600);
        xcoor = int(randX);
        ycoor = int(randY);
      }
      xStart.clear();
      yStart.clear();
      addCirclesToArray(xcoor, ycoor);
    }

    fill(100);
    ellipse(xcoor, ycoor, radius, radius);
    if (score != 0) {
      numberOfCircles = 1;

      xCoorTail = (x + (-1 * (xdir) * 20));
      yCoorTail = (y + (-1 * (ydir) * 20));
      while (numberOfCircles <= score) {
        if (xdir != 0) {
          ellipse(xCoorTail, y, 20, 20);
          xCoorTail += (-1 * (xdir) * 20);
        } else {
          if (ydir != 0) {
            ellipse(x, yCoorTail, 20, 20);
            yCoorTail += (-1 * (ydir) * 20);
          }
        }
        numberOfCircles += 1;
      }
    }
  }
} 

class setUpGhosts {

  ArrayList<Integer>ghostX = new ArrayList<Integer>();
  ArrayList<Integer>ghostY = new ArrayList<Integer>();
  int placeGhostNRandom = 0;
  int placeGhostRandom = 0;
  int currentGX = 0;
  int currentGY = 0;
  float rGX = random(2);
  float rGY = random(2);
  int randGXLeft = int(rGX)- 1;
  int randGYUp = int(rGY) - 1;
  int randGXRight = int(rGX) + 1;
  int randGYDown = int(rGY) + 1;
  float rGX2 = random(3);
  float rGY2 = random(3);
  int randGXRandom = int(rGX2) - 1;
  int randGYRandom = int(rGY2) - 1;
  int placeGhostDraw = 0;
  int testinggX = 226;
  int testinggY = 230;
  float rWallChase = random (4);
  int randWallChase = int(rWallChase);


  void addInitalCoordsG() {
    placeGhostDraw = 0;
    testinggX = 226;
    testinggY = 282;
    while (placeGhostDraw < 3) {
      ghostX.add(testinggX);
      ghostY.add(testinggY);
      testinggX += 224;
      placeGhostDraw += 1;
    }
    //    this.drawGhosts();
    println(ghostX);
    println(ghostY);
  }

  void drawGhosts() {
    placeGhostDraw = 0;
    //      println(ghostX.get(0));
    //      println(ghostX);
    //      println(ghostX);
    //      println(ghostY);
    while (placeGhostDraw < 3) {
      //        println(placeGhostDraw);
      //      println(ghostX.get(0));
      currentGX = ghostX.get(placeGhostDraw);
      currentGY = ghostY.get(placeGhostDraw);
      fill (255, 0, 0);
      ellipse(currentGX, currentGY, 26, 26);
      placeGhostDraw += 1;
    }
  }

  boolean checkWalls(int startCoor, int endCoor, String bound) {
    color temp = get(currentGX, currentGY);
    for (int i = startCoor; i != endCoor; i++) {
      if (bound.equals("x-14")) {
        temp = get(currentGX-14, i);
      }
      if (bound.equals("x+13")) {
        temp = get(currentGX+13, i);
      }
      if (bound.equals("y-14")) {
        temp = get(i, currentGY-14);
      }
      if (bound.equals("y+13")) {
        temp = get(i, currentGY+13);
      }
      if ((getRGB(temp)).equals("2156255")) {
        return true;
      }
    }
    return false;
  }

  void onlyWallChase() {
    rWallChase = random (4);
    randWallChase = int(rWallChase);      

    if (!this.checkWalls(currentGY-13, currentGY+13, "x-14")) {
      xdirG = -1;
      ydirG = 0;
    } else {
      if (!(this.checkWalls(currentGX-13, currentGX+13, "y-14"))) {
        xdirG = 0;
        ydirG = -1;
      } else {
        if (!(this.checkWalls(currentGX-13, currentGX+13, "y+13"))) {
          xdirG = 0;
          ydirG = 1;
        } else {
          if (!(this.checkWalls(currentGY-13, currentGX+13, "x+13"))) {
            xdirG = 1;
            ydirG = 0;
          }
          /*else{
           rWallChase = random (4);
           randWallChase = int(rWallChase); 
           onlyWallChase();
           }
           */
        }
      }
    }
  }


  boolean oneDirectionEQ() {
    if (x == currentGX) {
      if (y >= currentGY && !(this.checkWalls(currentGX-13, currentGX+13, "y+13"))) {
        println("new1");
        xdirG = 0;
        ydirG = 1;
      } else {
        //                  if (y < currentGY || !(this.checkWalls(x-13, x+13, "y-13"))){
        if (y <= currentGY && !(this.checkWalls(currentGX-13, currentGX+13, "y-14"))) {
          println("4");
          xdirG = 0;
          ydirG = -1;
        }
      }
      return true;
    } else {
      if (y == currentGY) {
        if (x <= currentGX && !this.checkWalls(currentGY-13, currentGY+13, "x-14")) {
          println("1");
          xdirG = -1;
          ydirG = 0;
        } else {
          //            if (y < currentGY || !(this.checkWalls(x-13, x+13, "y-13"))){
          if (x >= currentGX && !(this.checkWalls(currentGY-13, currentGY+13, "x+13"))) {
            println("2");
            xdirG = 1;
            ydirG = 0;
          }
        }

        return true;
      }
    }
    return false;
  }

  boolean noChoice() {
    if ((x > currentGX && (this.checkWalls(currentGY-13, currentGY+13, "x+13"))) || 
      (x < currentGX && (this.checkWalls(currentGY-13, currentGY+13, "x-14"))) || 
      (y > currentGY && (this.checkWalls(currentGX-13, currentGX+13, "y+13"))) || 
      (y < currentGY && (this.checkWalls(currentGX-13, currentGX+13, "y-14"))) ) {

      this.onlyWallChase();
      return true;
    }
    return false;
  }





  void updateG() {
    float rGX = random(2);
    float rGY = random(2);
    int randGXLeft = int(rGX)- 1;
    int randGYUp = int(rGY) - 1;
    int randGXRight = int(rGX) + 1;
    int randGYDown = int(rGY) + 1;
    if (ghostX.isEmpty()) {
      this.addInitalCoordsG();
    }
    placeGhostNRandom = 0;
    //      while (placeGhostNRandom < 2){ // 2 ghosts target
    currentGX = ghostX.get(placeGhostNRandom);
    currentGY = ghostY.get(placeGhostNRandom);
    rGX = random(2);
    rGY = random(2);
    randGXLeft = int(rGX)- 1;
    randGYUp = int(rGY) - 1;
    randGXRight = int(rGX) + 1;
    randGYDown = int(rGY) + 1;
    println(currentGX + "," + currentGY);

    //        if (x < currentGX && !(this.checkWalls(currentGY-13, currentGY+13, "x-14"))){
    //    if (!noChoice()) {
    if ((y == currentGY || x <= currentGX) && !this.checkWalls(currentGY-13, currentGY+13, "x-14")) {
      println("1");
      xdirG = -1;
      ydirG = 0;
    } else {
      //            if (y < currentGY || !(this.checkWalls(x-13, x+13, "y-13"))){
      if ((y == currentGY || x >= currentGX) && !(this.checkWalls(currentGY-13, currentGY+13, "x+13"))) {
        println("2");
        xdirG = 1;
        ydirG = 0;
      } else {
        //              if (y > currentGY && !(this.checkWalls(x-13, x+13, "y+13"))){
        if ((x == currentGX ||  y >= currentGY) && !(this.checkWalls(currentGX-13, currentGX+13, "y+13"))) {
          println("3");
          xdirG = 0;
          ydirG = 1;
        } else {
          //                  if (y < currentGY || !(this.checkWalls(x-13, x+13, "y-13"))){
          if ((x == currentGX || y <= currentGY) && !(this.checkWalls(currentGX-13, currentGX+13, "y-14"))) {
            println("4");
            xdirG = 0;
            ydirG = -1;
          }
        }
      }
    }
    //        }


    /*
          if (x > currentGX && !(this.checkWalls(currentGY-13, currentGY+13, "x+14"))){
     //            xdirG = randGXRight;
     xdirG = 1;
     if (randGXRight == 0){
     if (y > currentGY && !(this.checkWalls(currentGX-13, currentGX+13, "y+13"))){
     ydirG = 1;
     }else{
     if (y < currentGY && !(this.checkWalls(currentGX-13, currentGX+13, "y-13"))){
     ydirG = -1;
     }else{
     xdirG = 1;
     }
     }
     }
     }
     if (x == currentGX){
     if (y > currentGY && !(this.checkWalls(x-13, x+13, "y+13"))){
     ydirG = 1;
     }else{
     ydirG = -1;
     }
     }
     
     
     currentGX += xdirG;
     currentGY += ydirG;
     ghostX.set(placeGhostNRandom, currentGX);
     ghostY.set(placeGhostNRandom, currentGY);
     //        placeGhostNRandom += 1;
     //      }
     //      placeGhostRandom = 2;
     placeGhostRandom = 1;
     //      while (placeGhostRandom < 4){
     while (placeGhostRandom < 3){
     rGX2 = random(3);
     rGY2 = random(3);
     randGXRandom = int(rGX2) - 1;
     randGYRandom = int(rGY2) - 1;
     currentGX = ghostX.get(placeGhostRandom);
     currentGY = ghostY.get(placeGhostRandom);
     xdirG = randGXRandom;
     if (randGXRandom == 0){
     while (randGYRandom != 0){
     rGY2 = random(3);
     randGYRandom = int(rGY2) - 1;
     }
     ydirG = randGYRandom;
     }
     currentGX += xdirG;
     currentGY += ydirG;
     ghostX.set(placeGhostNRandom, currentGX);
     ghostY.set(placeGhostNRandom, currentGY);
     placeGhostRandom += 1;
     }
     
     
     */

    currentGX += xdirG;
    println(xdirG);
    currentGY += ydirG;
    ghostX.set(placeGhostNRandom, currentGX);
    ghostY.set(placeGhostNRandom, currentGY);
    println(ghostX);
    println(ghostY);
  }
}







setUpCircles test = new setUpCircles();
setUpCirclesSnake test2 = new setUpCirclesSnake();
setUpGhosts test3 = new setUpGhosts();

void draw() {
  background(0);
  imageMode(CENTER);
  image(img, 450, 300);
  or = false;
  if (or == true) {
    test2.updateDraw(x, y, 30);
  } else {
    test.update(x, y);
    test.updateDraw(8);
    test3.updateG();
    test3.drawGhosts();
  }
  ellipse(x, y, 26, 26);
  //ellipse(58,146,8,8);

  color rr = get(mouseX, mouseY);
  //println(mouseX + " " + mouseY + " " + getRGB(rr));
  //println("x: " + x+" y: "+y);

  //FIRST GHOST: (226,230)
  //MIDDLE GHOST : (450,230)
  //LAST GHOST: (674,230)


  if (keyPressed) {
    if ((key == 'a' || key =='A') &&
      (!(checkWalls(y-13, y+13, "x-14")))) { //go left
      xdir = -1;
      ydir = 0;
    }
    if ((key == 'd' || key == 'D') &&
      (!(checkWalls(y-13, y+13, "x+13")))) { //go right
      xdir = 1;
      ydir = 0;
    }
    if ((key == 'w' || key =='W') &&
      (!(checkWalls(x-13, x+13, "y-14")))) { //go up
      xdir = 0;
      ydir = -1;
    }

    if ((key == 's' || key == 'S') &&
      (!(checkWalls(x-13, x+13, "y+13")))) { //go down
      xdir = 0;
      ydir = 1;
    }
  }

  color i = get((x+(14*xdir)), (y+(14*ydir)));
  if (xdir == 1 || ydir == 1) {
    i = get((x+(13*xdir)), (y+(13*ydir)));
  }

  if ((getRGB(i).equals("2156255"))) {
    xdir = 0;
    ydir = 0;
  }

  x += xdir;
  y += ydir;
}


String getRGB(color col) {
  return ""+(int)red(col)+(int)green(col)+(int)blue(col);
}


boolean checkWalls(int startCoor, int endCoor, String bound) {
  color temp = get(x, y);
  for (int i = startCoor; i != endCoor; i++) {
    if (bound.equals("x-14")) {
      temp = get(x-14, i);
    }
    if (bound.equals("x+13")) {
      temp = get(x+13, i);
    }
    if (bound.equals("y-14")) {
      temp = get(i, y-14);
    }
    if (bound.equals("y+13")) {
      temp = get(i, y+13);
    }
    if ((getRGB(temp)).equals("2156255")) {
      return true;
    }
  }
  return false;
}
