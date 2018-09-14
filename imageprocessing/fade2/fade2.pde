/**
Bryn Mawr College, Department of Computer Science <br>
Pixel-based fading. This is slow under Javascript.
*/

/* @pjs preload = "Lenna.png"; */

PImage img;
float fade = 0.99;

void setup() {
  img = loadImage("Lenna.png");
  //size(img.width, img.height);
  size(512, 512);
  image(img, 0, 0);
}

void draw() {
  loadPixels();
  for (int i = 0; i < pixels.length; i++) {
    color c = pixels[i];
    pixels[i] = color(red(c)*fade, green(c)*fade, blue(c)*fade);
  }
  updatePixels();
}


