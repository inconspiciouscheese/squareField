PVector location, mousePosition;
float squareSize, distance;
int maxSize, density, radius, minSize, colorSquare;

void setup() {
  size(1000, 1000);
  rectMode(CENTER);
  colorMode(RGB);
  noStroke();

  density = 20;
  maxSize = width/density;
  radius = 300;
  minSize = 0;
  colorSquare = 0;
}

void draw() {
  background(0);

  mousePosition = new PVector (mouseX, mouseY);

  for (int i = 0; i < density; i++) {
    for (int j = 0; j < density; j++) {
      location = new PVector (maxSize * i+maxSize/2, maxSize * j + maxSize/2);
      distance = location.dist(mousePosition);
      if (distance < radius) {
        squareSize = maxSize * (radius - distance)/radius;
      } else {
        squareSize = minSize;
      }
      //I'm too lazy to figure out the math so this will be a good catch all:
      if (squareSize < minSize) {
        squareSize = minSize;
      }
      //Blue-purple
      fill(location.x/width * 255, location.y/width * 255, 255);

      //Red-pink-yellow
      //fill(255, location.y/width * 255, location.x/width * 255);

      //green-yellow-blue
      //fill(location.x/width * 255, 255, location.y/width * 255);

      rect(location.x, location.y, squareSize, squareSize);
    }
  }

  //mouse
  fill(255, 255, 255);
  rect(mouseX, mouseY, 10, 10);
}
