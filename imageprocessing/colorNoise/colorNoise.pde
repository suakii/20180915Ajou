/**
Bryn Mawr College, Department of Computer Science <br>
Noise generation by setting pixels to random color
*/

void setup() {
  size(400, 300);
}

void draw() {
  float r;
  float g;
  float b;
  
  // Load colors into the pixels array
  loadPixels();

  // Fill pixel array with a random
  // color value
  for (int i=0; i<pixels.length; i++) {
    r = random(0, 255);
    g = random(0, 255);
    b = random(0, 255);
    pixels[i] = color(r,g,b);
  }

  // Update the sketch with pixel data
  updatePixels();
}


