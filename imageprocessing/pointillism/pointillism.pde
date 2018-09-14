/**
Bryn Mawr College, Department of Computer Science <br>
Pointillism effect by adding many randomly sampled dots.
*/

/* @pjs preload = "bmc3.jpg"; */
PImage img;

void setup() {
  img = loadImage("bmc3.jpg");   
  //size(img.width, img.height);  
  size(604, 446); 
  imageMode(CENTER);
  image(img, width/2, height/2);
  noStroke();
  ellipseMode(CENTER);
  loadPixels();          // Cover with random circles
  for (int i=0; i<10000; i++) {
    addPoint();
  }
}

void addPoint() {
  // Add a random filled circle to image
  int x = (int)random(width);
  int y = (int)random(height);
  int i = x + width*y;
  color c = pixels[i];
  fill(c);
  ellipse(x, y, 7, 7);
}

void draw() {
  addPoint();
}


