/**
Bryn Mawr College, Department of Computer Science <br>
Grayscale filtering
*/

/* @pjs preload = "Lenna.png"; */
void setup() {
  PImage img = loadImage("Lenna.png");
  //size(img.width, img.height);
  size(512, 512);
  
  image(img, 0, 0);
  loadPixels();
  for (int i=0; i<pixels.length; i++) {
    color c = pixels[i];
    pixels[i] = color(red(c)*0.3+green(c)*0.59+blue(c)*0.11);
  }
  updatePixels();
}

