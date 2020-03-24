// Snake game
int xDirection = 1, yDirection = 1; // x and y directions of the snake (-1 || 1)
int speed = 5;
int size = 10;

boolean isDead = false;
boolean isXAxis = true;

int bodyCount;
ArrayList<Body> body;

int xCounter = 0, yCounter = 0; // head grid counters --> to move based on the grid system

Grid grid;
Head head;
Food food;

void setup() {
  size(600, 600);
  background(0);
  noStroke();
  grid = new Grid(size);
  head = new Head();
  food = new Food();
  body = new ArrayList<Body>();
  frameRate(30);
}

void draw() {
  background(0);
  fill(255);
  head.move();
  head.display();

  // display and update the position of the body parts
  if (body.size() > 0) {
    body.get(0).x = head.x;
    body.get(0).y = head.y;
    for (int i = bodyCount - 1; i > 0; i--) {
      body.get(i).x = body.get(i-1).x;
      body.get(i).y = body.get(i-1).y;
      rect(body.get(i).x, body.get(i).y, size, size);
    }
  }

  // if the head hits any part of its body, it's game over
  for (int i = 1; i < body.size(); i++) {
    Body b = body.get(i);
    if (b.x == head.x && b.y == head.y) {
      // println(body.get(i).x, headX, body.get(i).y, headY);
      // gameOver();
    }
  }

  food.display();
  food.check();
  grid.display();
}

void gameOver() {
  reset();
}

void reset() {
  body.clear();
  bodyCount = 0;
  head.x = 0;
  head.y = 0;
  isDead = false;
  xDirection = 1;
  yDirection = 1;
  isXAxis = true;
  xCounter = 0;
  yCounter = 0;
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
