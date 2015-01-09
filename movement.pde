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
  
  img = loadImage("try2.png");
}

void draw(){
 background(0);
 imageMode(CENTER);
 image(img,450,300);
 ellipse(x,y,26,26);
 
color c = get(x+13,y);
if ((""+(int)red(c)+(int)green(c)+(int)blue(c)).equals("2156255")){
  println("woof");
}
//println(""+(int)red(wall)+(int)green(wall)+(int)blue(wall));
 
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
