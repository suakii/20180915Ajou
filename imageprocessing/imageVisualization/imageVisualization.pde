/**
Bryn Mawr College, Department of Computer Science <br>
Sampling pixels and replacing with other primitives 
*/

/* @pjs preload = "Lenna.png"; */
PImage img;
int s = 10;

void setup() {
  img = loadImage("Lenna.png");   
  //size(img.width, img.height); 
  size(512, 512);  
  img.loadPixels();
  for (int y=0; y<img.height; y+=s) {
    for (int x=0; x<img.width; x+=s) {
      addShape(x, y);
    }
  }
}

void addShape(int x, int y) {
  int i = x + width*y;
  color c = img.pixels[i];
  
  
  noStroke();
  fill(c);
  ellipse(x, y, s+2, s+2);

  //try these
  //noStroke();
  //fill(c);
  //rect(x, y, s, s);
  
  //stroke(c);  
  //noFill();
  //rect(x, y, s, s);

  //stroke(c);
  //strokeWeight(3);
  //line(x, y, x+s, y+s);

  //float gray = red(c)*0.3+green(c)*0.59+blue(c)*0.11;
  //float fontSize = map(gray, 0, 255, 10, 20);
  //fill(c);
  //textSize(s);
  //text(x%9, x, y);
}


