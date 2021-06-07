PVector [] coral;
int minRad= 1;
int maxRad= 10;


void setup() {
  size(800, 800);
  smooth();

  frameRate (200);

  coral = new PVector[0];

  while (coral.length< 5) //controla cuantos corales se forman 
  {
    coral = (PVector []) append(coral, new PVector (400,400, random (minRad, maxRad)));
  }
}


void draw()
{

  background(255);

  noStroke();

  float newRad = random(minRad, maxRad);
  float newX = random(newRad, width-newRad);
  float newY = random(newRad, height-newRad);


  float closestDist = 100000000;
  int closestIndex = 0;
  float distance;

  // DISTANCIA ENTRE BOLITAS 
  for (int i=0; i <coral.length; i++) 
  {
    distance = dist(newX, newY, coral[i].x, coral[i].y);
    if (distance < closestDist) {
      closestDist = distance;
      closestIndex = i;
    }
  }


  // ALINEAR LAS BOLITAS CONFORME SALGAN 
  float angle = atan2(newY-coral[closestIndex].y, newX-coral[closestIndex].x);


  newX = coral[closestIndex].x + cos(angle) * coral [closestIndex].z;
  newY = coral[closestIndex].y + sin(angle) * coral [closestIndex].z;

  coral = (PVector []) append (coral, new PVector (newX, newY, newRad));

  // DIBUJAR BOLITAS
  for (int i=0; i < coral.length; i++) {

    fill(0, 0, 255, 200);
    ellipse( coral[i].x, coral[i].y, coral[i].z*2, coral[i].z*2);
    fill(0,255,0,200);
    ellipse( coral[i].y, coral[i].x, coral[i].z*2, coral[i].z*2);
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
