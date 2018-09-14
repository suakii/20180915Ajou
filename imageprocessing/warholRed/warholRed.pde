/**
Bryn Mawr College, Department of Computer Science <br>
Red tinting using pixel manipulation
*/

/* @pjs preload = "andy-warhol2.jpg"; */
void setup() {
  PImage img = loadImage("andy-warhol2.jpg");
  size(img.width, img.height);
  
  image(img, 0, 0);
  loadPixels();
  for (int i=0; i<pixels.length; i++) {
    color c = pixels[i];
    pixels[i] = color(red(c), 0, 0);
  }
  updatePixels();
}

