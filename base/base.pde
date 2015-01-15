PImage img;

int x = 450;
int y = 314;
int xdir = 0;
int ydir = 0;
color wall = color(21, 56, 255);

void setup() {
  size(900, 600);
  smooth();
  background(0);
  noStroke();

  img = loadImage("exp2.png");
}

void draw() {
  background(0);
  imageMode(CENTER);
  image(img, 450, 300);
  ellipse(x, y, 26, 26);

  color cright = get(x+13, y);
  color cleft = get(x-14, y);
  color cup = get(x, y-14);
  color cdown = get(x, y+13);
  color cupleft = get(x-14, y-14);
  color cupright = get(x+14, y-14);
  color cdownleft = get(x-14, y+14);
  color cdownright = get(x+14, y+14);


  if (keyPressed) {
    if ((key == 'a' || key =='A') &&//){//&& 
    //(((getRGB(cleft)).equals("000")) ||
    //(((getRGB(cupleft)).equals("000")) &&
    //((getRGB(cdownleft)).equals("000")) &&
    //((getRGB(cleft)).equals("000")))) &&
    (!(checkWalls(y-13, y+12, "x-14")))) { //go left
      xdir = -1;
      ydir = 0;
    }
    if ((key == 'd' || key == 'D') && //){//&& 
    //(((getRGB(cright)).equals("000")) ||
    //(((getRGB(cupright)).equals("000")) && 
    //((getRGB(cdownright)).equals("000")) &&
    //((getRGB(cright)).equals("000")))) &&
    (!(checkWalls(y-13, y+13, "x+13")))) { //go right #2(y+12)
      xdir = 1;
      ydir = 0;
    }
    if ((key == 'w' || key =='W') &&//){//&& 
    //(((getRGB(cup)).equals("000")) ||
    //(((getRGB(cupleft)).equals("000")) &&
    //((getRGB(cupright)).equals("000")) &&
    //((getRGB(cup)).equals("000")))) &&
    (!(checkWalls(x-13, x+13, "y-14")))) { //go up -13,+12,-14
      xdir = 0;
      ydir = -1;
    }

    if ((key == 's' || key == 'S') &&//){//&& 
    //(((getRGB(cdown)).equals("000")) || 
    //(((getRGB(cdownleft)).equals("000")) && 
    //((getRGB(cdownright)).equals("000")) &&
    //((getRGB(cdown)).equals("000")))) &&
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


/*
if ((getRGB(cright).equals("2156255")) || (getRGB(cleft).equals("2156255"))){
 xdir = 0;
 }
 if ((getRGB(cup).equals("2156255")) || (getRGB(cdown).equals("2156255"))){
 ydir = 0;
 }
 */
/*
  if (keyPressed) {
 if ((key == 'a' || key =='A') && 
 (((getRGB(cleft)).equals("000")) ||
 (((getRGB(cupleft)).equals("000")) &&
 ((getRGB(cdownleft)).equals("000")) &&
 ((getRGB(cleft)).equals("000"))))){ //go left
 xdir = -1;
 ydir = 0;
 }
 if ((key == 'd' || key == 'D') && 
 (((getRGB(cright)).equals("000")) ||
 (((getRGB(cupright)).equals("000")) && 
 ((getRGB(cdownright)).equals("000")) &&
 ((getRGB(cright)).equals("000"))))) { //go right
 xdir = 1;
 ydir = 0;
 }
 if ((key == 'w' || key =='W') &&
 (((getRGB(cup)).equals("000")) ||
 (((getRGB(cupleft)).equals("000")) &&
 ((getRGB(cupright)).equals("000")) &&
 ((getRGB(cup)).equals("000"))))) { //go up
 xdir = 0;
 ydir = -1;
 }
 if ((key == 's' || key == 'S') && 
 (((getRGB(cdown)).equals("000")) || 
 (((getRGB(cdownleft)).equals("000")) && 
 ((getRGB(cdownright)).equals("000")) &&
 ((getRGB(cdown)).equals("000"))))) { //go down
 xdir = 0;
 ydir = 1;
 }
 }
 x += xdir;
 y += ydir;
 
 color i = get((x+(14*xdir)),(y+(14*ydir)));
 if ((getRGB(i).equals("2156255"))){
 xdir = 0;
 ydir = 0; 
 }
 
 }
 */

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
