float x0,   y0,
      x1,   y1,
      x2,   y2,
      ang,  freq,
      r1,   r2;
final float rad = TWO_PI/3;

void setup() {
  size(500,500);
  //fullScreen(P2D);
  r1 = 140;
  r2 = 120;
  ang = freq = 0;
  stroke(#eeeeee);
}

void draw() {
  background(#222222);
  fill(#eeeeee);
  text("Frequency: " + nf(freq, 1, 3), 20, 20);
  translate(mouseX, mouseY);

  x0 = r1 * cos(ang);
  y0 = r1 * sin(ang);

  ang += freq;
  if (freq > 0) freq -= 0.0005;
  else freq = 0;

  x1 = r1 * cos(ang + rad);
  y1 = r1 * sin(ang + rad);

  x2 = r1 * cos(ang + rad * 2);
  y2 = r1 * sin(ang + rad * 2);

  fill(#222222);
  strokeWeight(100);
  line(0, 0, x0, y0);
  line(0, 0, x1, y1);
  line(0, 0, x2, y2);

  strokeWeight(35);
  ellipse(0, 0, r2, r2);
  ellipse(x0, y0, r2, r2);
  ellipse(x1, y1, r2, r2);
  ellipse(x2, y2, r2, r2);
}

void mouseClicked() {
  freq = 0.6;
}