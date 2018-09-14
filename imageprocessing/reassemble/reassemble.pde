/**
Bryn Mawr College, Department of Computer Science <br>
reassemble - reverse of crumble
*/

/* @pjs preload = "bmc3.jpg"; */
int nTiles = 12*9;
Tile[] tiles = new Tile[nTiles];
void setup() { 
  size(600, 450); 
  imageMode(CENTER); 
  PImage img = loadImage("bmc3.jpg");

  // Load and display image
  int c = 0;
  // Init all image tiles 
  for (int x=25; x<width; x=x+50) {
    for (int y=25; y<height; y=y+50) {
      tiles[c] = new Tile(img.get(x-25, y-25, 50, 50), x, y);
      c++;
    }
  }
}

void draw() { 
  background(127);

  // Randomly start tiles falling 
  int j = (int)random(nTiles);
  for (int i=0; i<nTiles; i++)
    tiles[i].update();

  // Draw tiles from the bottom to the top
  for (int i=nTiles-1; i>=0; i--)
    tiles[i].draw();
}

class Tile { // Tile class
  float xFinal;
  float yFinal;

  float xCurrent;
  float xStep;
  float yCurrent;
  float yStep;
  PImage img;
  float angle;
  float angleStep;
  int nFrames;

  Tile(PImage timg, float tx, float ty) { 
    img = timg; 
    xFinal = tx; 
    yFinal = ty;
    xCurrent = xFinal + random(-200, 200);
    yCurrent = yFinal + random(-200, 200);
    angle = random(-6*PI, 6*PI);
    
    nFrames = (int)random(100,300);
    xStep = (xFinal - xCurrent)/nFrames;
    yStep = (yFinal - yCurrent)/nFrames;
    angleStep = (0 - angle)/nFrames;
  }

  // Move and rotate tile to current location
  // and draw
  void draw() {
    resetMatrix(); 
    translate(xCurrent, yCurrent); 
    rotate(angle); 
    image(img, 0, 0);
  }

  // Update tile location and angle of rotation
  void update() {
    if (nFrames > 0) {
      angle += angleStep;
      xCurrent += xStep;
      yCurrent += yStep;

      nFrames--;
    }
  }
}


