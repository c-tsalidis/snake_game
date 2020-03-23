// Snake game
int xDirection, yDirection; // x and y directions of the snake (-1 || 1)
int headX, headY; // coordinates of the head in the x and y axis
int speed;
int size;

int foodX, foodY;

boolean isDead;
boolean isXAxis;

int bodyCount;
ArrayList<Body> body;

void setup() {
  size(600, 600);
  background(0);
  noStroke();
  xDirection = 1;
  yDirection = 1;
  headX = 0;
  headY = 0;
  speed = 5;
  size = 10;
  foodX = width / 2;
  foodY = height / 2;
  isDead = false;
  isXAxis = true;

  body = new ArrayList<Body>();
  /*
  for (int i = 0; i < 5; i++) {
    Body b = new Body(headX, headY, size);
    body.add(b);
  }
  */
}

void draw() {
  background(0);
  fill(255);
  if (isXAxis) headX += speed * xDirection;
  else headY += speed * yDirection;
  
  if(headX > width) headX = 0;
  if(headX < 0) headX = width;
  if(headY > height) headY = 0;
  if(headY < 0) headY = height;
  rect(headX, headY, size, size);
  
  if(body.size() > 0) {
    body.get(0).x = headX;
    body.get(0).y = headY;
  }
  
  for (int i = bodyCount - 1; i > 0; i--) {
    body.get(i).x = body.get(i-1).x;
    body.get(i).y = body.get(i-1).y;
    // use body parts class for the body --> x, y, size
    rect(body.get(i).x, body.get(i).y, size, size);
  }
  

  checkFood();
}

void checkFood() {
  // println(foodX, foodY);
    if(abs(foodX-headX) <= size && abs(foodY- headY) <= size) {
    foodX = (int)random(0, width - size);
    foodY = (int)random(0, height - size);
    Body b = new Body(headX, headY, size);
    body.add(b);
    bodyCount++;
    println("Eaten: " + bodyCount);
  }
  rect(foodX, foodY, size, size);
}

void keyPressed() {
  if (keyCode == UP) {
    yDirection = -1;
    isXAxis = false;
  }
  if (keyCode == DOWN) {
    yDirection = 1;
    isXAxis = false;
  }    
  if (keyCode == LEFT) {
    xDirection = -1;
    isXAxis = true;
  }
  if (keyCode == RIGHT) {
    xDirection = 1;
    isXAxis = true;
  }
}
