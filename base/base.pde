import java.util.*;

PImage img;

int x = 450;
int y = 314;
int xdir = 0;
int ydir = 0;
int saveX = 450;
int saveY = 314;
int snakeX = 450;
int snakeY = 314;
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
  Arrays.asList(1, 15, 29, 
  2, 3, 4, 5, 6, 8, 10, 11, 12, 14, 15, 16, 18, 20, 22, 24, 25, 26, 27, 28, 
  4, 10, 12, 18, 19, 20, 26, 
  1, 2, 6, 7, 8, 14, 15, 16, 22, 23, 24, 28, 29, 
  4, 7, 10, 12, 15, 18, 20, 23, 26, 
  2, 4, 5, 9, 10, 12, 13, 17, 18, 20, 21, 25, 26, 28, 
  2, 4, 5, 7, 9, 10, 12, 13, 15, 17, 18, 20, 21, 23, 25, 26, 28, 
  4, 10, 12, 18, 20, 26, 
  1, 2, 6, 7, 8, 14, 15, 16, 22, 23, 24, 28, 29, 
  4, 7, 10, 11, 12, 15, 18, 20, 23, 26, 
  2, 3, 4, 5, 6, 8, 10, 12, 14, 15, 16, 18, 19, 20, 22, 24, 25, 26, 27, 28, 
  1, 15));


  ArrayList<Integer>badY = new ArrayList<Integer>(
  Arrays.asList(1, 1, 1, 
  2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 
  3, 3, 3, 3, 3, 3, 3, 
  4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 
  5, 5, 5, 5, 5, 5, 5, 5, 5, 
  6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 
  7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 
  8, 8, 8, 8, 8, 8, 
  9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 
  10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 
  11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 
  12, 12));

  ArrayList<Integer>gameX = new ArrayList<Integer>(
  Arrays.asList(1, 29, 1, 29));

  ArrayList<Integer>gameY = new ArrayList<Integer>(
  Arrays.asList(1, 1, 12, 12));


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

  boolean game(int xcoor, int ycoor) {
    for (int i = 0; i < gameX.size (); i++) {
      int echX = gameX.get(i);
      int echY = gameY.get(i);
      if (((58 + (28*(echX-1))) == xcoor) && 
        ((146 + (28*(echY-1))) == ycoor)) {
        gameX.remove(i);
        gameY.remove(i);
        return true;
      }
    }
    return false;
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
    //MINIGAME FOOD
    for (int i = 0; i < gameX.size (); i++) {
      int echX = gameX.get(i);
      int echY = gameY.get(i);
      //fill(255,0,0);
      ellipse((58+(28*(echX-1))), (146+(28*(echY-1))), 15, 15);
    }
  }
}

class setUpCirclesSnake {


  //  int lastxdir = 0;
  //  int lastydir = 0;
  boolean on = false;
  int score = 0;
  int numberOfCircles = score;
  PFont f= createFont("Arial", 25, true);
  int xCoorTail = 0;
  int yCoorTail = 0;
  int lastxdirc = 0;
  int lastydirc = 0;
  int prevX = 0;
  int prevY = 0;


  ArrayList<Integer>xStart = new ArrayList<Integer>();
  ArrayList<Integer>yStart = new ArrayList<Integer>();
  ArrayList<Integer>blackListX = new ArrayList<Integer>();
  ArrayList<Integer>blackListY = new ArrayList<Integer>();
  ArrayList<Integer>xdirection = new ArrayList<Integer>();
  ArrayList<Integer>ydirection = new ArrayList<Integer>();
  ArrayList<Integer>xTail = new ArrayList<Integer>();
  ArrayList<Integer>yTail = new ArrayList<Integer>();


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
  void updateDraw(int xc, int yc, int radius, int dirxc, int diryc) {
    background(0);
    textFont(f, 200);
    fill (100);
    text(score, 660, 220);
    //int saveX = savedX;
    //int saveY = savedY;


    if ((xStart.isEmpty() && yStart.isEmpty()) || (this.update(xc, yc) == true)) {
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
    //    xdirection.add(0, xdirc);
    //    ydirection.add(0, ydirc);

    xTail.clear();
    yTail.clear();
    
    if (score == 1){
      xCoorTail = xc;
      yCoorTail = yc;
      while (numberOfCircles <= score) {
          xCoorTail += (-1 * (lastxdirc) * 20);
          xTail.add(xCoorTail);
          yCoorTail += (-1 * (lastydirc) * 20);
          yTail.add(yCoorTail);
        numberOfCircles += 1;
      }
    }

    
      if (lastxdirc != dirxc || lastydirc != diryc) {
        xCoorTail = xc + (-1 * (dirxc) * 20);
        yCoorTail = yc + (-1 * (diryc) * 20);
        xTail.add(0, xCoorTail);
        yTail.add(0, yCoorTail);
        numberOfCircles = 1;
      }
      lastxdirc = dirxc;
      lastydirc = diryc;
    

    numberOfCircles = 0;

    while (numberOfCircles < score - 1) {
      ellipse(xTail.get(numberOfCircles), yTail.get(numberOfCircles), 20, 20);
      numberOfCircles += 1;
    }

    /*
    
     if (score != 0) {
     xCoorTail = (xc + (-1 * (lastxdirc) * 20));
     yCoorTail = (yc + (-1 * (lastydirc) * 20));
     while (numberOfCircles <= score) {
     xCoorTail += (-1 * (xdir) * 20);
     xTail.add(xCoorTail);
     yCoorTail += (-1 * (ydir) * 20);
     yTail.add(yCoorTail);
     numberOfCircles += 1;
     }
     }
     
     */


    /*
    xCoorTail = xc + (-1 * (dirxc) * 20);
     yCoorTail = yc + (-1 * (diryc) * 20);
     
     if (xdirection.isEmpty()) {
     xdirection.add(dirxc);
     ydirection.add(diryc);
     }
     
     while (numberOfCircles < score) {
     if (dirxc != xdirection.get(0) || diryc != ydirection.get(0)) {
     xdirection.add(0, dirxc);
     ydirection.add(0, diryc);
     }
     
     ellipse(xCoorTail, yCoorTail, 20, 20);
     numberOfCircles += 1;
     xCoorTail = xc + (-1 * (xdirection.get(numberOfCircles)) * 20);
     yCoorTail = yc + (-1 * (ydirection.get(numberOfCircles)) * 20);
     }
     
     
     */

    /*
    
     
     if (score != 0) {
     numberOfCircles = 0;
     
     xCoorTail = (xc + (-1 * (xdir) * 20));
     yCoorTail = (yc + (-1 * (ydir) * 20));
     //      xCoorTail += (-1 * (xdir) * 20);
     //      yCoorTail += (-1 * (ydir) * 20);
     if (xTail.isEmpty()){
     xTail.add(xCoorTail);
     yTail.add(yCoorTail);
     }
     //      numberOfCircles += 1;
     }
     println(xTail);
     println(yTail);
    /*
     numberOfCircles = 1;
     
     while (numberOfCircles < xTail.size()){
     println(xTail);
     println(yTail);
     prevX = xTail.set(numberOfCircles, prevX);
     prevY = yTail.set(numberOfCircles, prevY);
     numberOfCircles += 1;
     }
     
     
     numberOfCircles = 0;
     
     while (numberOfCircles < score - 1){
     ellipse(xTail.get(numberOfCircles), yTail.get(numberOfCircles), 20, 20);
     numberOfCircles += 1;
     }
     */

    /*
    
     xTail.add(xc);
     yTail.add(yc);
     
     if (lastxdirc != dirxc || lastydirc != diryc) {
     
     
     
     
     int addOnePlace = 0;
     if (score != 0) {
     numberOfCircles = 0;
     
     if (lastxdirc != dirxc || lastydirc != diryc) {
     xCoorTail = (xc + (-1 * (dirxc) * 20));
     yCoorTail = (yc + (-1 * (diryc) * 20));
     xTail.add(xCoorTail);
     yTail.add(yCoorTail);
     //        println(xTail);
     //        println(yTail);
     } else {
     while (addOnePlace < score + 10) {
     if (lastxdirc == +1) {
     xTail.set(addOnePlace, xTail.get(addOnePlace) + 1);
     } else {
     if (lastxdirc == -1) {
     xTail.set(addOnePlace, xTail.get(addOnePlace) - 1);
     } else {
     if (lastydirc == 1) {
     yTail.set(addOnePlace, yTail.get(addOnePlace) + 1);
     } else {
     if (lastydirc == -1) {
     yTail.set(addOnePlace, yTail.get(addOnePlace) - 1);
     }
     }
     }
     }
     addOnePlace += 1;
     }
     println(xTail.get(numberOfCircles) + "," + yTail.get(numberOfCircles));
     
     numberOfCircles = 0;
     while (numberOfCircles < score) {
     ellipse(xTail.get(numberOfCircles), yTail.get(numberOfCircles), 20, 20);
     numberOfCircles += 1;
     println(xTail.get(numberOfCircles) + "," + yTail.get(numberOfCircles));
     }
     lastxdirc = dirxc;
     lastydirc = diryc;
     
     
     
    /*
     
     while (numberOfCircles < score) {
     if (xdir != 0) {
     ellipse(xCoorTail, yc, 20, 20);
     xCoorTail += (-1 * (xdirection.get(numberOfCircles)) * 20);
     } else {
     if (ydir != 0) {
     ellipse(xc, yCoorTail, 20, 20);
     yCoorTail += (-1 * (ydirection.get(numberOfCircles)) * 20);
     }
     }
     numberOfCircles += 1;
     }
     }
     */
    if (score == 5) {
      or = false;
      score = 0;
      x = saveX;
      y = saveY;
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
    while (placeGhostDraw < 2) {
      ghostX.add(testinggX);
      ghostY.add(testinggY);
      testinggX += 448;
      placeGhostDraw += 1;
    }
    //    this.drawGhosts();
    //println(ghostX);
    //println(ghostY);
  }

  void drawGhosts() {
    placeGhostDraw = 0;
    //      println(ghostX.get(0));
    //      println(ghostX);
    //      println(ghostX);
    //      println(ghostY);
    while (placeGhostDraw < 2) {
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
        //println("new1");
        xdirG = 0;
        ydirG = 1;
      } else {
        //                  if (y < currentGY || !(this.checkWalls(x-13, x+13, "y-13"))){
        if (y <= currentGY && !(this.checkWalls(currentGX-13, currentGX+13, "y-14"))) {
          //println("4");
          xdirG = 0;
          ydirG = -1;
        }
      }
      return true;
    } else {
      if (y == currentGY) {
        if (x <= currentGX && !this.checkWalls(currentGY-13, currentGY+13, "x-14")) {
          //println("1");
          xdirG = -1;
          ydirG = 0;
        } else {
          //            if (y < currentGY || !(this.checkWalls(x-13, x+13, "y-13"))){
          if (x >= currentGX && !(this.checkWalls(currentGY-13, currentGY+13, "x+13"))) {
            //println("2");
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
    while (placeGhostNRandom < 2) { // 2 target ghosts
      currentGX = ghostX.get(placeGhostNRandom);
      currentGY = ghostY.get(placeGhostNRandom);
      //println(currentGX + "," + currentGY);
      //    rGX = random(2);
      //    rGY = random(2);
      //    randGXLeft = int(rGX)- 1;
      //    randGYUp = int(rGY) - 1;
      //    randGXRight = int(rGX) + 1;
      //    randGYDown = int(rGY) + 1;
      //        if (x < currentGX && !(this.checkWalls(currentGY-13, currentGY+13, "x-14"))){
      //    if (!noChoice()) {
      if (x <= currentGX && !(this.checkWalls(currentGY-13, currentGY+13, "x-14"))) {
        //println("1");
        xdirG = -1;
        ydirG = 0;
      } else {
        //            if (y < currentGY || !(this.checkWalls(x-13, x+13, "y-13"))){
        if (x >= currentGX && !(this.checkWalls(currentGY-13, currentGY+13, "x+13"))) {
          //println("2");
          xdirG = 1;
          ydirG = 0;
        } else {
          //              if (y > currentGY && !(this.checkWalls(x-13, x+13, "y+13"))){
          if (y >= currentGY && !(this.checkWalls(currentGX-13, currentGX+13, "y+13"))) {
            //println("3");
            xdirG = 0;
            ydirG = 1;
          } else {
            //                  if (y < currentGY || !(this.checkWalls(x-13, x+13, "y-13"))){
            if (y <= currentGY && !(this.checkWalls(currentGX-13, currentGX+13, "y-14"))) {
              //println("4");
              xdirG = 0;
              ydirG = -1;
            }
          }
        }
      }

      currentGX += xdirG;
      currentGY += ydirG;
      ghostX.set(placeGhostNRandom, currentGX);
      ghostY.set(placeGhostNRandom, currentGY);
      //println("place" + placeGhostRandom);
      placeGhostNRandom += 1;
      //println(ghostX);
      //println(ghostY);
    }
  }
}

setUpCircles test = new setUpCircles();
setUpCirclesSnake test2 = new setUpCirclesSnake();
setUpGhosts test3 = new setUpGhosts();

void draw() {
  background(0);
  imageMode(CENTER);
  image(img, 450, 300);
  or = true;
  if ((test.game(x, y)) == true) {
    or = true;
    saveX = x;
    saveY = y;
    x = 450;
    y = 314;
  }
  if (or == true) {
    test2.updateDraw(x, y, 30, xdir, ydir);
    println("savedX: "  + saveX + " savedY: " + saveY);
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

