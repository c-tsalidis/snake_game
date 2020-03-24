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

Grid grid;

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
  
  grid = new Grid(size);
  
  body = new ArrayList<Body>();
}

void draw() {
  background(0);
  fill(255);
  if (isXAxis) headX += speed * xDirection;
  else headY += speed * yDirection;

  if (headX > width) headX = 0;
  if (headX < 0) headX = width;
  if (headY > height) headY = 0;
  if (headY < 0) headY = height;
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
