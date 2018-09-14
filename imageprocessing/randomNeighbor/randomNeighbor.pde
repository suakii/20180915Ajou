/**
 Bryn Mawr College, Department of Computer Science <br>
 Randomly copying from one of the 9 neighbors in the 3x3 pixel neighborhood. <br>
 Click mouse to pause and resume.
 */

/* @pjs preload = "fall.jpg"; */

PImage img;
boolean stop = false;

void setup() {
  img = loadImage("fall.jpg");
  //size(img.width, img.height);
  size(658, 439);
  image(img, 0, 0);
  loadPixels();
  frameRate(10);
}

void draw() {
  if (!stop) {
    for (int y=0; y<height; y++) {
      for (int x=0; x<width; x++) {
        int newx = int(random(x-1, x+2));
        int newy = int(random(y-1, y+2));
        newx = constrain(newx, 0, width-1);
        newy = constrain(newy, 0, height-1);
        pixels[y*width+x] = pixels[newy*width+newx];
      }
    }
    updatePixels();
  }
}

void mousePressed() {
  stop = !stop;
}


