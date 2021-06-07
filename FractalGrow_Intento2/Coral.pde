class Coral {

  PVector position = new PVector();
  float radius;
  PVector vel = new PVector();
  boolean coralseed;
  float lineweight;
  int minRad = 1;
  int maxRad = 5;


  Coral() {

    position = new PVector (random (800), random(800));
    coralseed = false;
    lineweight = 0.3;
  }

  void render() {
    noStroke();
    fill(0);

    ellipse(this.position.x, this.position.y, this.radius * 2, this.radius * 2);
  }



  void update() {
    if (coralseed == false) {
      vel = new PVector(random(-6, 6), random(-6, 6)); //-5,5
      position.add(vel);
    }
  }
}
