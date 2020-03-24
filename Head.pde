class Head {
  // variables
  int x, y;

  Head() {
    x = 0;
    y = 0;
  }

  void display() {
    rect(x, y, size, size);
  }

  void move() {
    if (isXAxis) {
      xCounter += xDirection;
      if (xCounter >= grid.x.length) isDead = true;
      if (xCounter < grid.x[0]) isDead = true;
      if (!isDead) x = grid.x[xCounter];
    }
    else {
      yCounter += yDirection;
      if (yCounter >= grid.y.length) isDead = true;
      if (yCounter < grid.y[0]) isDead = true;
      if (!isDead) y = grid.y[yCounter];
    }
  }
}
