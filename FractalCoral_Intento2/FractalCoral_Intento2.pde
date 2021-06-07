
Coral[] elCoral = new Coral[2000];

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

  PVector vertical = new PVector(425, 125);
  elCoral[2].position.set(vertical);
  elCoral[2].coralseed  = true;

  PVector abajoizq = new PVector(425, 375);
  elCoral[3].position.set(abajoizq);
  elCoral[3].coralseed  = true;

  /*PVector abajoder = new PVector(375, 375);
  elCoral[4].location.set(abajoder);
  elCoral[4].coralseed  = true;*/
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
          if (s <= 10) { //velocidad
            elCoral[i].coralseed=true;

            stroke(random(150,255),random(0,150),50);//color coral (148, 255, 116, 100)
            strokeWeight (15); //tamño bolitas coral
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
          if (s <= 13) { //velocidad
            elCoral[i].coralseed=true;

            stroke(255, 0, 0, 100); //color coral (148, 255, 116, 100)
            strokeWeight (15); //tamño bolitas coral
            line (elCoral[i].position.x, elCoral[i].position.y, elCoral[j].position.x, elCoral[j].position.y);
          }
        }
      }
    }
  }
  elCoral[3].coralseed = true;

  for (int i = 0; i < elCoral.length; i++) {
    if (elCoral[i].coralseed == false) {
      for (int j = 0; j < elCoral.length; j++) {
        if (elCoral[j].coralseed == true) {

          s = PVector.dist(elCoral[i].position, elCoral[j].position); //distancia entre bolitas
          if (s <= 11) { //velocidad
            elCoral[i].coralseed=true;

            stroke(0, 0, 255, 100);//color coral (148, 255, 116, 100)
            strokeWeight (8); //tamño bolitas coral
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
