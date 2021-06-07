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
    coral = (PVector []) append(coral, new PVector (random (width), random (height), random (minRad, maxRad)));
  }
}


void draw()
{

  background(255);

  noStroke();
  fill(random(150,255),random(0,150),100);

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
  for (int i=0 ; i < coral.length; i++) {

    ellipse( coral[i].x, coral[i].y, coral[i].z*2, coral[i].z*2);
  }
}

void mousePressed ()
{
  setup();
}
