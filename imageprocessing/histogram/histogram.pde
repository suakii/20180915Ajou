/**
Bryn Mawr College, Department of Computer Science <br>
Color histogram of an image.
*/

/* @pjs preload = "kodim02.png"; */

// Arrays to hold histogram values
int[] aa = new int[256];  // Count up shades of gray (all)
int[] ra = new int[256];  // Count up shades of red
int[] ga = new int[256];  // Count up shades of green
int[] ba = new int[256];  // Count up shades of blue

PImage img;

void setup() {
  size(516, 516);
  
  // Load the image to analyze
  img = loadImage("kodim02.png");  
  img.loadPixels();
  
  // Sum up all pixel values from all colors
  for (int i=0; i<img.pixels.length; i++) {
    int r = (int)red(img.pixels[i]);
    int g = (int)green(img.pixels[i]);
    int b = (int)blue(img.pixels[i]);
    
    // Increment histogram item amounts
    ra[ r ]++;
    ga[ g ]++;
    ba[ b ]++;
    aa[ int((r+g+b)/3.0) ]++;
  }
  
  // Find max value
  float max = 0.0;
  for (int i=0; i<256; i++) {
    if (ra[i] > max) max = ra[i];
    if (ga[i] > max) max = ga[i];
    if (ba[i] > max) max = ba[i];
    if (aa[i] > max) max = aa[i];
  }

  // Draw scaled histogram
  background(255);
  noFill();

  // Borders
  stroke(0);
  rect(0, 0, 256, 256);
  stroke(255,0,0);
  rect(257, 0, 256, 256);
  stroke(0,255,0);
  rect(0, 257, 256, 256);
  stroke(0,0,255);
  rect(257, 257, 256, 256);
  
  // Lines
  float h;
  for (int i=0; i<256; i++) {
    // all
    stroke(0);
    h = map(aa[i], 0, max, 0, 255);
    line(i, 255, i, 255-h);
    
    // red
    stroke(255,0,0);
    h = map(ra[i], 0, max, 0, 255);
    line(257+i, 255, 257+i, 255-h);
    
    // green
    stroke(0,255,0);
    h = map(ga[i], 0, max, 0, 255);
    line(i+1, 514, i+1, 514-h);
    
    // blue
    stroke(0,0,255);
    h = map(ba[i], 0, max, 0, 255);
    line(257+i, 514, 257+i, 514-h);
  }
}


