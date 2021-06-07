
class Cell {

  PVector position;
  float radius;

  Cell (float x, float y, float radius) {
    this.position = new PVector(x, y);
    this.radius = radius;
  }
  
  /**
   * Dibuja la celula en la pantalla
   */
  void render() {
    noStroke();
    fill(0);
    
    ellipse(this.position.x, this.position.y, this.radius * 2, this.radius * 2);
  }
  
  /**
   * Calcula la distancia de esta celula a otra.
   */
  float distanceTo(Cell anotherCell) {
    return 0.0;
  }
}
