
Coral[] elCoral = new Coral[500];

void setup() {

  background(0);
  size(800, 800);
  smooth();

  frameRate(200);

  for (int i = 0; i < elCoral.length; i ++) {
    elCoral[i] = new Coral();
  }

  PVector arribaizq = new PVector(425, 425); //donde comienza el coral
  elCoral[1].position.set(arribaizq);
  elCoral[1].coralseed  = true;

  PVector vertical = new PVector(425, 425);
  elCoral[2].position.set(vertical);
  elCoral[2].coralseed  = true;



}



void draw() {

  float s; // velocidad a la que aparece 

  for (int i=0; i< elCoral.length; i++) {
    elCoral[i].update();
  }

  elCoral[1].coralseed = true;

  for (int i = 0; i < elCoral.length; i++) {
    if (elCoral[i].coralseed == false) {
      for (int j = 0; j < elCoral.length; j++) {
        if (elCoral[j].coralseed == true) {

          s = PVector.dist(elCoral[i].position, elCoral[j].position); //distancia entre bolitas
          if (s <= 16) { //velocidad
            elCoral[i].coralseed=true;

            stroke(148, 255, 116,200);//color coral (148, 255, 116, 100)
            strokeWeight (10); //tamño bolitas coral
            line (elCoral[i].position.x, elCoral[i].position.y, elCoral[j].position.x, elCoral[j].position.y);
          }
        }
      }
    }
  }
  elCoral[2].coralseed = true;

  for (int i = 0; i < elCoral.length; i++) {
    if (elCoral[i].coralseed == false) {
      for (int j = 0; j < elCoral.length; j++) {
        if (elCoral[j].coralseed == true) {

          s = PVector.dist(elCoral[i].position, elCoral[j].position); //distancia entre bolitas
          if (s <= 18) { //velocidad
            elCoral[i].coralseed=true;

            stroke(0,100,200,200); //color coral (148, 255, 116, 100)
            strokeWeight (18); //tamño bolitas coral
            line (elCoral[i].position.x, elCoral[i].position.y, elCoral[j].position.x, elCoral[j].position.y);
          }
        }
      }
    }
  }
}

void keyPressed() { //hit the "s" key and save my image
  if (key=='s'||key=='S')

  {
    saveFrame();
  }
}

void saveFrame() {
  saveFrame("images/coral-###.png"); //when running on the web it will put the PNG in a new browser tab
}
