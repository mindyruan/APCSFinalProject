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
int scoreSnake = 0;
int place = 0;
int xdirG = 0;
int ydirG = 0;
int xGhost = 0;
int yGhost = 0;
boolean or = false;
int removedPlace = 0;
boolean win = false;

void setup() {
  size(900, 600);
  smooth();
  background(0);
  noStroke();

  img = loadImage("exp2.png");
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

  boolean on = false;
  //  int score = 0;
  int numberOfCircles = score;
  PFont f= createFont("Arial", 25, true);
  int xCoorTail = x;
  int yCoorTail = y;
  int lastxdirc = 0;
  int lastydirc = 0;
  int prevX = 0;
  int prevY = 0;
  int xTailPlace = 0;
  int yTailPlace = 0;
  int lengthTail = 1 + scoreSnake;
  int timee = millis();
  float randX = random(900);
  float randY = random(600);
  int xcoor = int(randX);
  int ycoor = int(randY);
  float xRGhostSnake = random(860);
  float yRGhostSnake = random(560);
  int xGhostSnake = int(xRGhostSnake) + 20;
  int yGhostSnake = int(yRGhostSnake) + 20;
  int xTargetSnake = 0;
  int yTargetSnake = 0;
  float RandomHoVertGhost = random (2);
  int HoVertGhost = int(RandomHoVertGhost);
  int tailPlaceSUBLIST = 0;


  ArrayList<Integer>xStart = new ArrayList<Integer>();
  ArrayList<Integer>yStart = new ArrayList<Integer>();
  //  ArrayList<Integer>blackListX = new ArrayList<Integer>();
  //  ArrayList<Integer>blackListY = new ArrayList<Integer>();
  //  ArrayList<Integer>xdirection = new ArrayList<Integer>();
  //  ArrayList<Integer>ydirection = new ArrayList<Integer>();
  ArrayList<Integer>xTail = new ArrayList<Integer>();
  ArrayList<Integer>yTail = new ArrayList<Integer>();
  ArrayList<Integer>xTailSUBLIST = new ArrayList<Integer>();
  ArrayList<Integer>yTailSUBLIST = new ArrayList<Integer>();

  setUpCirclesSnake() {
    int placeeS = 0;
    int xS = 450;
    int yS = 314;
    //    while (placeeS < 3) {
    xTail.add(xS);
    yTail.add(yS);
    //      xS += 20;
    //      yS += 0;
    //      placeeS += 1;
    //    }
    println(xTail);
    println(yTail);
  }

  void addCirclesToArray(int x, int y) {
    xStart.add(x);
    yStart.add(y);
  }

  boolean update(int x, int y) {
    on = false;

    /*

     while (xTailPlace < lengthTail) {
     //      if (checkCoordB(xTail.subList(0,lengthTail + 1), yTail.subList(0,lengthTail + 1), xTail.get(xTailPlace), yTail.get(yTailPlace))) {
     if (xTail.get(xTailPlace) - 10 <= 0 || xTail.get(xTailPlace) + 10 >= width || 
     yTail.get(yTailPlace) - 10 <= 0 || yTail.get(yTailPlace) + 10 >= height) {
     scoreSnake = 0;
     or = false;
     x = 450;
     y = 314;
     win = false;
     } else {
     xTailPlace += 1;
     yTailPlace += 1;
     }
     }
     */

    xTailPlace = 0;
    yTailPlace = 0;
    if (checkCoord(xStart, yStart, xTail.get(xTailPlace), yTail.get(yTailPlace))) {
      on = true;
      scoreSnake += 1;
      return on;
    }
    return on;
  }



  //make circles that exclude the ones pacman already ate.
  void updateDraw(int xc, int yc, int radius, int dirxc, int diryc) {
    background(0);
    textFont(f, 200);
    fill (100);
    text(scoreSnake, 660, 220);
    //int saveX = savedX;
    //int saveY = savedY;
    if (or != false) {
      if ((xStart.isEmpty() && yStart.isEmpty()) || (this.update(xc, yc) == true)) {
        randX = random(860);
        randY = random(560);
        xcoor = int(randX) + 20;
        ycoor = int(randY) + 20;
        xStart.clear();
        yStart.clear();
        addCirclesToArray(xcoor, ycoor);
      }

      fill(100);
      ellipse(xcoor, ycoor, radius, radius);

      /*
//    if (score >= 1) {
       println("hi1");
       xCoorTail = xc;
       yCoorTail = yc;
       numberOfCircles = 0;
       while (numberOfCircles <= score) {
       println("yoooooooooooooooooo");
       xCoorTail += (-1 * numberOfCircles * (dirxc) * 20);
       xTail.add(numberOfCircles, xCoorTail);
       yCoorTail += (-1 * numberOfCircles * (diryc) * 20);
       yTail.add(numberOfCircles, yCoorTail);
       numberOfCircles += 1;
       //      }
       } 
       */
      //      if (lastxdirc != dirxc || lastydirc != diryc) {
      if (or == true) {

        if (millis() - timee > 150) {
          xCoorTail = xTail.get(0) + ((dirxc) * 20);
          yCoorTail = yTail.get(0) + ((diryc) * 20);
          xTail.add(0, xCoorTail);
          yTail.add(0, yCoorTail);

          //    lastxdirc = dirxc;
          //    lastydirc = diryc;
          /*
         xTailPlace = xTail.size() - 1;
           yTailPlace = yTail.size() - 1;
           
           while (xTailPlace > 0) {
           xTail.set(xTailPlace, xTail.get(xTailPlace - 1));
           xTailPlace -= 1;
           }
           
           while (yTailPlace > 0) {
           yTail.set(yTailPlace, yTail.get(yTailPlace - 1));
           yTailPlace -= 1;
           }
           */

          timee = millis();
        }

        lengthTail = 1 + scoreSnake;
        numberOfCircles = 0;
        //    println(xTail.subList(0, 1));
        //    println(yTail.subList(0, 1));
        while (numberOfCircles < lengthTail) {
          ellipse(xTail.get(numberOfCircles), yTail.get(numberOfCircles), 20, 20);
          numberOfCircles += 1;
        }

        println(lengthTail);

        //    while (xTailPlace < lengthTail) {
        //      if (checkCoordB(xTail.subList(0,lengthTail + 1), yTail.subList(0,lengthTail + 1), xTail.get(xTailPlace), yTail.get(yTailPlace))) {
        if (xTail.get(0) - 10 <= 0 || xTail.get(xTailPlace) + 10 >= width || 
          yTail.get(0) - 10 <= 0 || yTail.get(yTailPlace) + 10 >= height) {
          scoreSnake = 0;
          or = false;
          x = 450;
          y = 314;
          win = false;
        } 



        //GHOSTS!!!!!!!!!!!!!!!!!!!!!!

        xTargetSnake = xTail.get(0);
        yTargetSnake = yTail.get(0);

        tailPlaceSUBLIST = 0;
        while (tailPlaceSUBLIST < lengthTail) {
          xTailSUBLIST.add(0);
          yTailSUBLIST.add(0);
          xTailSUBLIST.set(tailPlaceSUBLIST, xTail.get(tailPlaceSUBLIST));
          yTailSUBLIST.set(tailPlaceSUBLIST, yTail.get(tailPlaceSUBLIST));

          tailPlaceSUBLIST += 1;
        }


        RandomHoVertGhost = random (2);
        HoVertGhost = int(RandomHoVertGhost);
        if (checkCoord(xTailSUBLIST, yTailSUBLIST, xGhostSnake, yGhostSnake)) {

          //////STUFF TO END SNAKE GAME//////////////
          scoreSnake = 0;
          or = false;
          x = 450;
          y = 314;
          win = false;
        } else {
          if (HoVertGhost == 0) { // checking horizontally
            if (xTargetSnake < xGhostSnake) {
              xGhostSnake -= 1;
            } else {
              if (xTargetSnake > xGhostSnake) {
                xGhostSnake += 1;
              } else {
                if (xTargetSnake == xGhostSnake) {
                  if (yTargetSnake < yGhostSnake) {
                    yGhostSnake -= 1;
                  } else {
                    if (yTargetSnake > yGhostSnake) {
                      yGhostSnake += 1;
                    } else {
                      if (yTargetSnake == yGhostSnake) {
                        // STUFF TO END SNAKE GAME /////
                        scoreSnake = 0;
                        or = false;
                        x = 450;
                        y = 314;
                        win = false;
                      }
                    }
                  }
                }
              }
            }
          } else {
            if (HoVertGhost == 1) { //checking vertically
              if (yTargetSnake < yGhostSnake) {
                yGhostSnake -= 1;
              } else {
                if (yTargetSnake > yGhostSnake) {
                  yGhostSnake += 1;
                } else {
                  if (yTargetSnake == yGhostSnake) {
                    if (xTargetSnake < xGhostSnake) {
                      xGhostSnake -= 1;
                    } else {
                      if (xTargetSnake > xGhostSnake) {
                        xGhostSnake += 1;
                      } else {
                        if (xTargetSnake == xGhostSnake) {
                          // STUFF TO END SNAKE GAME /////
                          scoreSnake = 0;
                          or = false;
                          x = 450;
                          y = 314;
                          win = false;
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
        fill(255, 0, 0);
        ellipse(xGhostSnake, yGhostSnake, 20, 20);


        if (scoreSnake == 5) {
          or = false;
          scoreSnake = 0;
          x = saveX;
          y = saveY;
          win = true;
        }
      }
    }
  }
}


class setUpGhostsP {
  int ghostX1 = 842; //bottom right
  int ghostY1 = 454;
  int ghostX2 = 58;  // bottom left
  int ghostY2 = 454;
  int ghostX3 = 842; // top right
  int ghostY3 = 146;
  int ghostX4 = 58;  // top left
  int ghostY4 = 146;
  int xdir1 = 0;
  int ydir1 = -1;

  //bottom right - 842,454
  //bottom left - 58, 454
  //top right - 842,146
  //top left - 58,146

  void drawGhosts() {
    ellipse(ghostX1, ghostY1, 26, 26);
    ellipse(ghostX2, ghostY2, 26, 26);
    ellipse(ghostX3, ghostY3, 26, 26);
    ellipse(ghostX4, ghostY4, 26, 26);
    //ellipse(156,189,26,26);
  }

  void updateG() {
    if ((((ghostY1-y)<=10) && ((ghostY1-y)>=-10)) 
      && (((ghostX1-x)<=10) && ((ghostX1-x)>=-10))) {
      x = 450;
      y = 314;
      println("you lost a life! 1 ");
    }
    if ((((ghostY2-y)<=10) && ((ghostY2-y)>=-10)) 
      && (((ghostX2-x)<=10) && ((ghostX2-x)>=-10))) {
      x = 450;
      y = 314;
      println("you lost a life! 2 ");
    }
    if ((((ghostY3-y)<=10) && ((ghostY3-y)>=-10)) 
      && (((ghostX3-x)<=10) && ((ghostX3-x)>=-10))) {
      x = 450;
      y = 314;
      println("you lost a life! 3 ");
    }
    if ((((ghostY4-y)<=10) && ((ghostY4-y)>=-10)) 
      && (((ghostX4-x)<=10) && ((ghostX4-x)>=-10))) {
      x = 450;
      y = 314;
      println("you lost a life! 4 ");
    }

    if ((ydir1 == -1)  && (checkWallsG(ghostX1-13, ghostX1+13, "y-14"))) { //up
      ydir1 = 1;
    }
    if ((ydir1 == 1)  && (checkWallsG(ghostX1-13, ghostX1+13, "y+13"))) {
      ydir1 = 0;
      xdir1 = -1;
    }
    if ((xdir1 == -1) && (checkWallsG(ghostY1-13, ghostY1+13, "x-14"))) {
      xdir1 = 1;
    }
    if ((xdir1 == 1) && (checkWallsG(ghostY1-13, ghostY1+13, "x+13"))) {
      xdir1 = 0;
      ydir1 = -1;
    }

    ghostY1 += ydir1;
    ghostX1 += xdir1;
    ghostY2 += ydir1;
    ghostX2 -= xdir1;
    ghostY3 -= ydir1;
    ghostX3 += xdir1;
    ghostY4 -= ydir1;
    ghostX4 -= xdir1;
  }

  boolean checkWallsG(int startCoor, int endCoor, String bound) {
    color temp = get(ghostX1, ghostY1);
    for (int i = startCoor; i != endCoor; i++) {
      if (bound.equals("x-14")) {
        temp = get(ghostX1-14, i);
      }
      if (bound.equals("x+13")) {
        temp = get(ghostX1+11, i);
      }
      if (bound.equals("y-14")) {
        temp = get(i, ghostY1-12);
      }
      if (bound.equals("y+13")) {
        temp = get(i, ghostY1+11);
      }
      if ((getRGB(temp)).equals("2156255")) {
        return true;
      }
    }
    return false;
  }
}

setUpCircles test = new setUpCircles();
setUpCirclesSnake test2 = new setUpCirclesSnake();
setUpGhostsP test3 = new setUpGhostsP();

void draw() {
  background(0);
  imageMode(CENTER);
  image(img, 450, 300);
  //or = true;
  if ((test.game(x, y)) == true) {
    or = true;
    saveX = x;
    saveY = y;
    x = 450;
    y = 314;
  }
  if (or == true) {
    test2.updateDraw(x, y, 30, xdir, ydir);
    //println("savedX: "  + saveX + " savedY: " + saveY);
  } else {
    test.update(x, y);
    test.updateDraw(8);
    test3.updateG();
    test3.drawGhosts();
    ellipse(x, y, 26, 26);
  }
  //ellipse(x, y, 26, 26);
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

