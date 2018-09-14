/**
Bryn Mawr College, Department of Computer Science <br>
Turn a image into an Obamicon.
*/

/* @pjs preload = "Lenna.png"; */

void setup() {
  PImage img = loadImage("Lenna.png");
  color darkBlue = color(0, 51, 76);
  color r = color(217, 26, 33);
  color lightBlue = color(112, 150, 158);
  color yellow = color(252, 227, 166);

  //size(img.width, img.height);
  size(512, 512);
  image(img, 0, 0);
  
  loadPixels();
  for (int i = 0; i < pixels.length; i++) {
    color c = pixels[i];
    float total = red(c)+green(c)+blue(c);
    if (total < 182) {
      pixels[i] = color(darkBlue);
    }
    else if (total < 364) {
      pixels[i] = color(r);
    }
    else if (total < 546) {
      pixels[i] = color(lightBlue);
    }
    else {
      pixels[i] = color(yellow);
    }
  }
  updatePixels();
}



