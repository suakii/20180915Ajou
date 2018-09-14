/**
Bryn Mawr College, Department of Computer Science <br>
Sepia toning, using a generated palette stored in an array.
*/
/* @pjs preload = "bmc3.jpg"; */
void setup() {
  size(604, 446);
  color[] palette = new color[256];
  int r = 255; 
  int g = 240;	// change green value to 220 for a red-toned sepia palette
  int b = 192;

  // generate palette
  for (int i=0; i<palette.length; i++) {
    palette[i] = color(r*i/255, g*i/255, b*i/255);
  }
  
  PImage img = loadImage("bmc3.jpg");
  image(img, 0, 0);
  
  loadPixels();
  for (int i = 0; i < pixels.length; i++) {
    color c = pixels[i];
    float gray = red(c)*0.3+green(c)*0.59+blue(c)*0.11;
    pixels[i] = palette[int(gray)];
  }
  updatePixels();
}

