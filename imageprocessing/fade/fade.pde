/**
Bryn Mawr College, Department of Computer Science <br>
Fade images into each other. <br> 
This is slow under Javascript.
*/

/* @pjs preload = "bmc0.jpg, bmc1.jpg, bmc2.jpg, bmc3.jpg, bmc4.jpg"; */

PImage[] img = new PImage[5];
int alpha = 255;
int i1 = 0, i2 = 1;

void setup() {
  size(600,450);
  imageMode(CENTER);
  // Load images
  for (int i=0; i<img.length; i++) img[i] = loadImage("bmc"+i+".jpg");
}

void draw() {
  background(255);
  
  // Fade out current image
  tint(255, alpha);
  image(img[i1], 300, 225);
  
  // Fade in next image
  tint(255, 255-alpha);
  image(img[i2], 300, 225);
  
  // Swap images when fade complete
  alpha--;
  if (alpha < 0) {
    i1 = (i1 + 1) % img.length;
    i2 = (i2 + 1) % img.length;
    alpha = 255;
  }
}

