/**
Bryn Mawr College, Department of Computer Science <br>
Drag mouse to change POSTERIZE filter level. <br>
mouseY is mapped. Lower levels show more dramatic effects.
*/

/* @pjs preload = "andy-warhol2.jpg"; */

PImage img;

void setup() {
  img = loadImage("andy-warhol2.jpg");
  size(img.width, img.height);
  image(img, 0, 0);
}

void draw() {}

void drawImg(float val) {
  image(img, 0, 0);
  filter(POSTERIZE, val);
}

void mouseDragged() {
  float val = int(map(mouseY, 0, height, 2, 10));
  val = constrain(val, 2, 10);
  println("POSTERIZE filter level: " + val);
  drawImg(val);
}

