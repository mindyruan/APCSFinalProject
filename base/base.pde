PImage img;

int x = 450;
int y = 314;
int xdir = 0;
int ydir = 0;

void setup() {
  size(900, 600);
  smooth();
  background(0);
  noStroke();

  img = loadImage("try.png");
}

//x = 45: blank space begins
//x = 854; ends
//y = 133; blank space begins
//y = 466; ends

//foods
//x = 54 left edge, 61, right edge, 82 begin, 89;
//y = 142 up edge, 149, down edge, 170 begin, 177 end;

void draw() {
  background(0);
  imageMode(CENTER);
  image(img, 450, 300);
  //ellipse(x, y, 26, 26);
  ellipse(58,146,8,8);

color rr = get(mouseX,mouseY);
//println(mouseX + " " + mouseY + " " + getRGB(rr));


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
  
  //checkWalls

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
