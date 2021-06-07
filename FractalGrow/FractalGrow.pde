
ArrayList<Cell> cells;

void setup () {
  size(700, 700);
  smooth();

  cells = new ArrayList<Cell>();
  
  // Se agrega la primer celula que va en el centro
  Cell centerCell = new Cell(width / 2.0, height / 2.0, 10); 
  cells.add(centerCell);
}

void draw () {
  background(255);

  addNewCell();
  renderCells();
}

//------

/**
 * Este metodo agrega una nueva celula al coral.
 */
void addNewCell() {
  
  // 1. Se crea una nueva celula con posicion y radio aleatorio 
  float x = random(width);
  float y = random(height);
  float radius = random(6, 10);
  Cell newCell = new Cell(x, y, radius);
  
  // 2. Se obtiene la mas cercana
  Cell nearest = getNearestCell(newCell);
  
  // 3. Se calcula la nueva posicion (aqui va tu codigo)
  PVector newPosition;
  newCell.position = newPosition;

  cells.add(newCell);
}

/**
 * Encuentra la celula mas cercana de la lista a una celula dada.
 */
Cell getNearestCell (Cell aCell) {
  Cell nearest = null;
  float minDistance = 0;

  for (Cell anotherCell : cells) {
    float distance = aCell.distanceTo(anotherCell);

    if (nearest == null || distance < minDistance) {
      nearest = anotherCell;
      minDistance = distance;
    }
  }

  return nearest;
}

/**
 * Dibuja todas las celulas llamando el metodo render de cada una de ellas
 */
void renderCells() {
  for (Cell aCell : cells) {
    aCell.render();
  }
}
