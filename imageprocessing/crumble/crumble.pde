/**
Bryn Mawr College, Department of Computer Science <br>
Tiles rotate and fall from an image
*/

/* @pjs preload = "bmc3.jpg"; */
int nTiles = 12*9;
Tile[] tiles = new Tile[nTiles];

void setup() {
  size(600, 450);    // Load and display image
  imageMode(CENTER);
  PImage img = loadImage("bmc3.jpg");
  
  int c = 0;         // Init all image tiles
  for (int y=25; y<450; y=y+50) {
    for (int x=25; x<600; x=x+50) {
      tiles[c] = new Tile(
          img.get(x-25, y-25, 50, 50), x, y);
      c++;
    }
  }
}

void draw() {
  background(127);
  
  // Randomly start tiles falling
  int j = (int)random(nTiles);
  tiles[j].falling = true;
  for (int i=0; i<nTiles; i++) 
    tiles[i].update();
    
  // Draw tiles from the bottom to the top
  for (int i=nTiles-1; i>=0; i--) 
    tiles[i].draw();
}
class Tile {
  // Tile class 
  float x;
  float y;
  PImage img;
  float angle = 0;
  boolean falling = false;
  
  Tile(PImage timg, float tx, float ty) {
    img = timg;
    x = tx;
    y = ty;
  }
  
  // Move and rotate tile to current location
  // and draw
  void draw() {
    resetMatrix();
    translate(x, y);
    rotate(angle);
    image(img, 0, 0);
  }
  
  // Update tile location and angle of rotation
  void update() {
    if (!falling) return;
    if (y > height) return;
    angle = (angle + 0.1) % TWO_PI;
    y += 3.0;
  }
}

