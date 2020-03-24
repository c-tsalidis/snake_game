class Food {
  int x, y;

  Food() {
    x = grid.x[grid.x.length / 2];
    y = grid.y[grid.y.length / 2];
  }

  void display() {
    rect(this.x, this.y, size, size);
  }

  void changePosition() {
    int rx = (int) random(0, grid.x.length);
    int ry = (int) random(0, grid.y.length);
    this.x = grid.x[rx];
    this.y = grid.y[ry];
  }

  void check() {
    if (this.x == head.x && this.y == head.y) {
      changePosition();
      Body b;
      if (body.size() == 0) b = new Body(head.x + size * (-xDirection), head.y + size * (-yDirection));
      else b = new Body(body.get(body.size() - 1).x + size * (-xDirection), body.get(body.size() - 1).y + size * (-yDirection));
      body.add(b);
      bodyCount++;
      println(b.x, head.x, b.y, head.y);
      println("Eaten: " + bodyCount);
    }
  }
}
