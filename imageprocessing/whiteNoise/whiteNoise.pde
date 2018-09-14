/**
Bryn Mawr College, Department of Computer Science <br>
White noise generation by setting pixels to random grayscale color
*/

int nPixels;

void setup() {
  size(400, 300);
  nPixels = width*height;
}

void draw() {
  float b;
  
  // Load colors into the pixels array
  loadPixels();

  // Fill pixel array with a random
  // grayscale value
  for (int i=0; i<nPixels; i++) {
    b = random(0, 255);
    pixels[i] = color(b);
  }

  // Update the sketch with pixel data
  updatePixels();
}


