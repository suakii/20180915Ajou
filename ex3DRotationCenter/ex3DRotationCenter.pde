PShape horn, body;
float rotX, rotY;

void setup() {
  size(600,600, P3D);
  smooth();
  
  body = loadShape("body.obj");
  horn = loadShape("tmp.obj");
}

void draw() {
  lights();
  background(32);
  
  translate(width/2, height/2, -100);
  
  rotateX(rotX);
  rotateY(-rotY);
  
  scale(4);
  shape(body);
  
  translate(0, 10, 20);
  rotateZ(radians(frameCount));
  
  shape(horn);
}

void mouseDragged(){
    rotY -= (mouseX - pmouseX) * 0.01;
    rotX -= (mouseY - pmouseY) * 0.01;
}