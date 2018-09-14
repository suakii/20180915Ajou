
PShape body;

void setup() {
  size(600,600,P3D);
  smooth();
  
  body = loadShape("body.obj");
}

void draw() {

  shape(body);

}