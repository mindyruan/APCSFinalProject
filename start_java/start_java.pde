int numberCircles = 0;
float rWidth= random (0, 1000 - 50);
float rHeight = random (0, 1000 - 50);
        
        void setup(){
          size(1000, 1000);
        
        }
        
        
        void draw(){
          while (numberCircles < 100){
          ellipse(rWidth + 50, rHeight + 50, 100, 100);
          numberCircles += 5;
          }
          
        }
          
         
