class Snake{
  
  void setup() {
  size(900, 600);
  smooth();
  background(0);
  noStroke();
  img= loadImage("2000px-Pacman.svg.png");
  
  
}

  void setupSnake(){
  background(0);
  fill(255);
  float xCoordFood = random(width);
  float yCoordFood = random(height);
  ellipse(xCoordFood, yCoordFood, 20, 20);
  }
  
  setUpCircles test2 = new setUpCircles();
  
  void addCirclesToArray(){
    

  
void draw() {
  color c1 = get(x + 20,y); //based on the radius of the moving circle
  color c2 = get(x,y + 20); //based on the radius of the moving circle
  if (c1!= 0 || c2 != 0){
  test.update(x,y);
  }
  //ArrayList<Integer>xcoords = new ArrayList<Integer>();
  //ArrayList<Integer>ycoords = new ArrayList<Integer>();
  //image(img, x, y, 100, 100);
  test.updateDraw(30);
  fill(100);
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
  //fill(255);
  //ellipse(x, y, 10, 10);
  //println(x + "," + y);
}

}


