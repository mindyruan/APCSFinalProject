PImage img;

int x = 450;
int y = 300;
int xdir = 0;
int ydir = 0;
color wall = color(21,56,255);

void setup() {
  size(900, 600);
  smooth();
  background(0);
  noStroke();
  
  img = loadImage("try.png");
}

void draw(){
 background(0);
 imageMode(CENTER);
 image(img,450,300);
 ellipse(x,y,26,26);
 
 color cright = get(x+13,y);
 color cleft = get(x-14,y);
 color cup = get(x,y-14);
 color cdown = get(x,y+13);
 color cupleft = get(x-14,y-14);
 color cupright = get(x+13,y-14);
 color cdownleft = get(x-14,y+13);
 color cdownright = get(x+13,y+13);
 
 if (getRGB(cup).equals("2156255")){
   println("wall!!!");
 }
 /*
 if((""+(int)red(cx)+(int)green(cx)+(int)blue(cx)).equals("2156255")){
   println("wall!!!");
 }
 */

/*
if ((""+(int)red(c)+(int)green(c)+(int)blue(c)).equals("2156255")){
  println("woof");
}
*/
if ((getRGB(cright).equals("2156255")) || (getRGB(cleft).equals("2156255"))){
    xdir = 0;
  }
  if ((getRGB(cup).equals("2156255")) || (getRGB(cdown).equals("2156255"))){
    ydir = 0;
  }
  if (keyPressed) {
    if ((!(getRGB(cleft)).equals("2156255")) && (key == 'a' || key =='A')
    && (!(getRGB(cupleft)).equals("2156255")) && (!(getRGB(cdownleft)).equals("2156255"))) { //go left
      xdir = -1;
      ydir = 0;
    }
    if ((!(getRGB(cright)).equals("2156255")) && (key == 'd' || key == 'D')
    && (!(getRGB(cupright)).equals("2156255")) && (!(getRGB(cdownright)).equals("2156255"))) { //go right
      xdir = 1;
      ydir = 0;
    }
    if ((!(getRGB(cup)).equals("2156255")) && (key == 'w' || key =='W')
    && (!(getRGB(cupleft)).equals("2156255")) && (!(getRGB(cupright)).equals("2156255"))) { //go up
      xdir = 0;
      ydir = -1;
    }
    if ((!(getRGB(cdown)).equals("2156255")) && (key == 's' || key == 'S')
    && (!(getRGB(cdownleft)).equals("2156255")) && (!(getRGB(cdownright)).equals("2156255"))) { //go down
      xdir = 0;
      ydir = 1;
    }
  }
  x += xdir;
  y += ydir;

//println(""+(int)red(wall)+(int)green(wall)+(int)blue(wall));
 /*
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
  */
}

String getRGB(color col){
  return ""+(int)red(col)+(int)green(col)+(int)blue(col);
}
