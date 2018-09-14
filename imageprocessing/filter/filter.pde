/**
Bryn Mawr College, Department of Computer Science <br>
INVERT filter
*/

/* @pjs preload = "woods.jpg"; */

void setup() {
  PImage img = loadImage("woods.jpg");

  //size(img.width, img.height);
  size(658, 439);
  image(img, 0, 0);
  filter(INVERT);
}

