PVector [] coral;
int minRadio= 1;
int maxRadio= 10;


void setup() {
  size(800, 800);
  smooth();

  frameRate (200);

  coral = new PVector[0];

  while (coral.length< 5) //controla cuantos corales se forman 
  {
    coral = (PVector []) append(coral, new PVector (400,400, random (minRadio, maxRadio)));
    //append son los datos devueltos por la función que se deben convertir al tipo de datos de la matriz de objetos (array)
  }
}


void draw()
{

  background(255);

  noStroke();

  float Radio = random(minRadio, maxRadio);
  float PosX = random(Radio, width-Radio);
  float PosY = random(Radio, height-Radio);


  float closestDist = 100000000;
  int closestIndex = 0;
  float distance;

  // DISTANCIA ENTRE CORALES 
  for (int i=0; i <coral.length; i++) 
  {
    distance = dist(PosX, PosY, coral[i].x, coral[i].y);
    if (distance < closestDist) {
      closestDist = distance;
      closestIndex = i;
    }
  }


  // ALINEAR LOS CORALES CONFORME SALGAN 
  float angle = atan2(PosY-coral[closestIndex].y, PosX-coral[closestIndex].x);
  //ATAN2 calcula el ángulo (en radianes) desde un punto especificado hasta el origen de las coordenadas

  PosX = coral[closestIndex].x + cos(angle) * coral [closestIndex].z;
  PosY = coral[closestIndex].y + sin(angle) * coral [closestIndex].z;

  coral = (PVector []) append (coral, new PVector (PosX, PosY, Radio));

  // DIBUJAR CORALES
  for (int i=0; i < coral.length; i++) {

    fill(0, 0, 255, 100);
    ellipse( coral[i].y, coral[i].x, coral[i].z*2, coral[i].z*2);
    fill(random(255,255),random(0,150),200);
    ellipse( coral[i].x, coral[i].y, coral[i].z*2, coral[i].z*2);
    fill(255,0,0,200);
    ellipse( coral[i].x, coral[i].y, coral[i].z*1, coral[i].z*1);
  }
}

void keyPressed() { //hit the "s" key and save my image
  if (key=='s'||key=='S')

  {
    saveFrame();
  }
}

void saveFrame() {
  saveFrame("images/coral-###.png"); 
}
