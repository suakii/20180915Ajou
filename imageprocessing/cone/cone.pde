/**
Bryn Mawr College, Department of Computer Science <br>
Color of pixel is set to a gradient color depending on distance from center of sketch
*/

void setup() {
  size(400, 400);
    
  // Load colors into the pixels array
  loadPixels();

  // Access pixels as a 2D array
  for (int y=0; y<height; y++) {
    for (int x=0; x<width; x++) {
      
      // Compute distance to center point
      float d = dist(x, y, width/2, height/2);

      // Set pixel as distance to center
      pixels[y*height+x] = color(d);
    }
  }

  // Update the sketch with pixel data
  updatePixels();
}


