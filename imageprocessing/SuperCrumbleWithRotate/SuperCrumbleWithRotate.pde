/**
Bryn Mawr College, Department of Computer Science <br>
Click mouse to start.
*/
/* @pjs preload = "angry-birds_yellow-bomb-bird.jpg, angry_birds_hard_level-t2.jpg"; */

int frameCount = 0;
PImage bombBird;

// super crumble
ArrayList<Tile> tiles = new ArrayList();

void setup() { 
  imageMode(CENTER); 
  bombBird = loadImage("angry-birds_yellow-bomb-bird.jpg");
  PImage img = loadImage("angry_birds_hard_level-t2.jpg");
  size(960, 600); 

  // Load and display image
  int c = 0;
  // Init with a single image tiles
  Tile startTile = new Tile(img, width/2, height/2);
  tiles.add(startTile);
  startTile.draw();
}

void draw() { 
  frameCount++;
  if (frameCount < 180) {
    return;
  } 
  else if (frameCount < 280) {
    image(bombBird, width/2, height/2, width, height);
    return;
  }
  background(127);
  // Randomly split tiles
  int i = (int)random(tiles.size());

  PImage img1;
  PImage img2;
  float img1XCenter, img1YCenter, img2XCenter, img2YCenter;
  float initialAngle = tiles.get(i).angle;
  if (random(0, 1)<0.5) {
    float yTop = tiles.get(i).y - tiles.get(i).img.height/2.0;
    int splitPoint = (int)random(tiles.get(i).img.height/4.0, tiles.get(i).img.height*3.0/4.0);
    img1 = tiles.get(i).img.get(0, 0, tiles.get(i).img.width, splitPoint);
    img1XCenter = tiles.get(i).x;
    img1YCenter = yTop + img1.height/2.0;
    img2 = tiles.get(i).img.get(0, splitPoint, tiles.get(i).img.width, tiles.get(i).img.height-splitPoint);
    img2XCenter = tiles.get(i).x;
    img2YCenter = yTop + img1.height + img2.height/2.0;
  } 
  else {
    float xLeft = tiles.get(i).x - tiles.get(i).img.width/2.0;
    int splitPoint = (int)random(tiles.get(i).img.width/4.0, tiles.get(i).img.width*3.0/4.0);
    img1 = tiles.get(i).img.get(0, 0, splitPoint, tiles.get(i).img.height);
    img1XCenter = xLeft + img1.width/2.0;
    img1YCenter = tiles.get(i).y;
    img2 = tiles.get(i).img.get(splitPoint, 0, tiles.get(i).img.width-splitPoint, tiles.get(i).img.height);
    img2XCenter = xLeft + img1.width + img2.width/2.0;
    img2YCenter = tiles.get(i).y;
  }

  // rotate the displacement to take into account the angle of the tile we are splitting
  float xDiff1 = img1XCenter - tiles.get(i).x;
  float xDiff2 = img2XCenter - tiles.get(i).x;
  float yDiff1 = img1YCenter - tiles.get(i).y;
  float yDiff2 = img2YCenter - tiles.get(i).y;

  img1XCenter =  tiles.get(i).x + xDiff1*cos(initialAngle) - yDiff1*sin(initialAngle);
  img2XCenter =  tiles.get(i).x + xDiff2*cos(initialAngle) - yDiff2*sin(initialAngle);
  img1YCenter =  tiles.get(i).y + xDiff1*sin(initialAngle) + yDiff1*cos(initialAngle);
  img2YCenter =  tiles.get(i).y + xDiff2*sin(initialAngle) + yDiff2*cos(initialAngle);

  Tile tile1 = new Tile(img1, img1XCenter, img1YCenter);
  Tile tile2 = new Tile(img2, img2XCenter, img2YCenter);

  float averageVAngle = (abs(tile1.vangle) + abs(tile2.vangle))/2.0;

  tile1.vangle = averageVAngle;
  tile2.vangle = -averageVAngle;
  tile1.falling = tiles.get(i).falling;
  tile2.falling = tiles.get(i).falling;
  tile1.angle = tiles.get(i).angle;
  tile2.angle = tiles.get(i).angle;
  tiles.remove(i);

  tiles.add(tile1);
  tiles.add(tile2);

  // Randomly start tiles falling 
  int j = (int)random(tiles.size());
  tiles.get(j).falling = true;
  for (i=0; i<tiles.size(); i++)
    tiles.get(i).update();

  // Draw tiles from the bottom to the top
  for (i=0; i < tiles.size(); i++) {
    tiles.get(i).draw();
  }
  println("There are " + tiles.size() + " tiles");
}

class Tile { // Tile class
  // fields
  float x;      // x position of the center of the Tile
  float y;      // y position of the center of the Tile
  float vy;
  float angle = 0;
  float vangle;
  PImage img;   // pixels in the Tile region
  boolean falling = false;  // has the tile begun to fall

  Tile(PImage timg, float xCenter, float yCenter) { 
    img = timg; 
    x = xCenter; 
    y = yCenter;
    vy = random(0.5, 2);
    vangle = random(-.02, .02);
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
    y += vy;
    x += random(-3, 3);  //add some jitter
    angle += vangle;
  }
}


