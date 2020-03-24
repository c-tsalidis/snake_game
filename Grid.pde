class Grid {
  // variables
  int x[];
  int y[];
  int size;
  
  // constructor
  Grid(int blockSize) {
    size = blockSize;
    x = new int[width / size];
    y = new int[height / size];

    stroke(255);
    // initialize each element from the x and y axis
    for(int i = 0; i < x.length; i++) {
      x[i] = i * size;
    }
    for(int i = 0; i < y.length; i++) {
      y[i] = i * size;
    }
  }
  
  void display() {
    stroke(255);
    // initialize each element from the x axis
    for(int i = 0; i < x.length; i++) {
      line(x[i], 0, x[i], height);
    }
    for(int i = 0; i < y.length; i++) {
      line(0, y[i], width, y[i]);
    }
    noStroke();
  }
}
