int x = 400;

void setup(){
 size(1000,700);
 smooth();
 background(0);
 noStroke();
}

void draw(){
 background(0);
 ellipse(x,400,100,100);
 x++;
}