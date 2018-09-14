/**
Bryn Mawr College, Department of Computer Science <br>
Negative filtering
*/

/* @pjs preload = "prinzipal.jpg"; */

void setup() {
  PImage img = loadImage("prinzipal.jpg");
  //size(img.width, img.height);
  size(639, 959);
  image(img, 0, 0);
  
  loadPixels();
  for (int i=0; i<pixels.length; i++) {
    color c = pixels[i];
    pixels[i] = color(255-red(c), 255-green(c), 255-blue(c));
  }
  updatePixels();
}

