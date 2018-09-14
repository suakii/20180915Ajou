/**
Bryn Mawr College, Department of Computer Science <br>
Warhol image tinted 3 ways, using tint()
*/

/* @pjs preload = "andy-warhol2.jpg"; */
void setup() {
  // Load the image three times
  PImage warhol = loadImage("andy-warhol2.jpg");
  size(750, 327);

  // Draw modified images
  tint(255, 0, 0);
  image(warhol, 0, 0);
  tint(0, 255, 0);
  image(warhol, 250, 0);
  tint(0, 0, 255);
  image(warhol, 500, 0);
}


