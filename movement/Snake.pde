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
  
  void draw(){
    ellipse(1, 1, 200, 200);
  }
}




