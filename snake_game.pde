// Snake game
int xDirection, yDirection; // x and y directions of the snake (-1 || 1)
int headX, headY; // coordinates of the head in the x and y axis
int speed;

void setup() {
  size(600, 600);
  xDirection = 1;
  yDirection = 1;
  headX = 0;
  headY = 0;
  speed = 5;
}

void draw() {
  headX += speed * xDirection;
  headY += speed * yDirection;
  
  rect(headX, headY, 5, 5);
}



void keyPressed() {
  if(keyCode == UP) yDirection = -1;
  if(keyCode == DOWN) yDirection = 1;
  if(keyCode == LEFT) xDirection = -1;
  if(keyCode == RIGHT) xDirection = 1;
}
