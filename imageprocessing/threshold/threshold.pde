/**
Bryn Mawr College, Department of Computer Science <br>
Drag mouse vertically to change THRESHOLD filter level.
*/
/* @pjs preload = "kodim01.png"; */
PImage img;

void setup() {
  img = loadImage("kodim01.png");
  //size(img.width, img.height);
  size(768, 512);
  image(img, 0, 0);
}

void draw() {}

void drawImg(float thresh) {
  image(img, 0, 0);
  filter(THRESHOLD, thresh);
}

void mouseDragged() {
  float thresh = map(mouseY, 0, height, 0.0, 1.0);
  println("THRESHOLD filter level " + thresh);
  drawImg(thresh);
}


