/**
Bryn Mawr College, Department of Computer Science <br>
Erode+Dilate to Despeckle <br>
left click to apply Erode then Dilate, right click to revert. <br>
Right clicking is not reported correctedly in Javascript on a Mac.
*/

/* @pjs preload = "andy-warhol2.jpg"; */

PImage img;

int nStep = 0;

void setup() {
  img = loadImage("andy-warhol2.jpg");
  size(img.width, img.height);
  image(img, 0, 0);
}

void draw() {
  image(img, 0, 0);
  if (nStep >= 1) filter(ERODE);
  if (nStep >= 2) filter(DILATE);
}

void mousePressed() {
  if (mouseButton == LEFT)  nStep++;
  if (mouseButton == RIGHT) nStep--;
  nStep = constrain(nStep, 0, 2);
}


