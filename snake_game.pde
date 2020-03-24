// Snake game
int xDirection = 1, yDirection = 1; // x and y directions of the snake (-1 || 1)
int headX = 0, headY = 0; // coordinates of the head in the x and y axis
int speed = 5;
int size = 10;

int foodX, foodY;

boolean isDead = false;
boolean isXAxis = true;

int bodyCount;
ArrayList<Body> body;

int xCounter = 0, yCounter = 0;

Grid grid;

void setup() {
  size(600, 600);
  background(0);
  noStroke();
  grid = new Grid(size);
  foodX = width / 2;
  foodY = height / 2;
  body = new ArrayList<Body>();
  frameRate(30);
}

void draw() {
  background(0);
  fill(255);
  if (isXAxis){
    xCounter += xDirection;
    if(xCounter >= grid.x.length) isDead = true;
    if (xCounter < grid.x[0]) isDead = true;
    if(!isDead) headX = grid.x[xCounter];
  }
  else {
    yCounter += yDirection;
    if(yCounter >= grid.y.length) isDead = true;
    if (yCounter < grid.y[0]) isDead = true;
    if(!isDead) headY = grid.y[yCounter];
  }
  rect(headX, headY, size, size);

  if (body.size() > 0) {
    body.get(0).x = headX;
    body.get(0).y = headY;
    for (int i = bodyCount - 1; i > 0; i--) {
      body.get(i).x = body.get(i-1).x;
      body.get(i).y = body.get(i-1).y;
      rect(body.get(i).x, body.get(i).y, size, size);
    }
  }

  // if the head hits any part of its body, it's game over
  for (int i = 0; i < body.size(); i++) {
    if (abs(body.get(i).x - headX) < size && abs(body.get(i).y - headY) < size) {
      // println(body.get(i).x, headX, body.get(i).y, headY);
      // gameOver();
    }
  }

  checkFood();
  grid.display();

}

void checkFood() {
  // println(foodX, foodY);
  if (abs(foodX - headX) <= size && abs(foodY - headY) <= size) {
    foodX = (int)random(0, width - size);
    foodY = (int)random(0, height - size);
    Body b;
    if(body.size() == 0) b = new Body(headX + size * (-xDirection), headY + size * (-yDirection));
    else b = new Body(body.get(body.size() - 1).x + size * (-xDirection), body.get(body.size() - 1).y + size * (-yDirection));
    body.add(b);
    bodyCount++;
    println(b.x, headX, b.y, headY);
    println("Eaten: " + bodyCount);
  }
  rect(foodX, foodY, size, size);
}

void gameOver() {
  reset();
}

void reset() {
  body.clear();
  bodyCount = 0;
  headX = 0;
  headY = 0;
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
