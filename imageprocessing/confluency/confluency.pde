/**
Bryn Mawr College, Department of Computer Science <br>
Masking and filtering by a threshold <br>
Mouse click computers the confluency of a Petri dish and prints to terminal
*/
// Colony Confluency

/* @pjs preload = "colony.jpg, mask.png"; */

PImage img;
PImage mask;

void setup() {
  img = loadImage("colony.jpg");
  mask = loadImage("mask.png");
  size(img.width, img.height);
}

void draw() {
  image(img, 0, 0);
  blend(mask, 0, 0, mask.width, mask.height, 
              0, 0, img.width, img.height, SUBTRACT);
  filter(THRESHOLD, 0.6);
}

void mousePressed() {
  loadPixels();
  int count = 0;
  for (int i=0; i<pixels.length; i++)
    if (red(pixels[i]) == 255) count++;
  println("The current confluency is: " + count/42969.0);
}


