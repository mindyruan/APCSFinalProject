PImage img;

int x = 451;
int y = 300;
int xdir = 0;
int ydir = 0;
color wall = color(21,56,255);

void setup() {
  size(900, 600);
  smooth();
  background(0);
  noStroke();
  
  img = loadImage("exp2.png");
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
 color cupright = get(x+14,y-14);
 color cdownleft = get(x-14,y+14);
 color cdownright = get(x+14,y+14);
 
 if (checkWalls(y-14,y+13,x-14)){
   println("wall!!!!!");
 }
 
 
/*
if ((getRGB(cright).equals("2156255")) || (getRGB(cleft).equals("2156255"))){
    xdir = 0;
  }
  if ((getRGB(cup).equals("2156255")) || (getRGB(cdown).equals("2156255"))){
    ydir = 0;
  }
  */
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

String getRGB(color col){
  return ""+(int)red(col)+(int)green(col)+(int)blue(col);
}

boolean checkWalls(int startCoor,int endCoor, int bound){
 while (startCoor != endCoor){
   if ((bound == x-14)){
     color temp = get(bound, startCoor);
     if (getRGB(temp).equals("2156255")){
       return true;
     }else{
       startCoor++;
     }
   }
 }
 return false;
}
