Piccolo piccolo;
Grande grande;
int Counter = 0;

void setup() {
  size(1500, 800);
  frameRate(1000000000);
  piccolo = new Piccolo(new PVector(width*3/10, height*5/6), 1);
  grande = new Grande(new PVector(width*5/10, height*5/6), 1000000);
}

void draw() {
  background(255);
  line(0, height*5/6, width, height*5/6);
  text("Collisions: "+Counter, width/2, height/8);
  text(piccolo.Matter+" kg", piccolo.Pos.x, piccolo.Pos.y-5);
  text("100^"+round(log(grande.Matter)/log(100))+" kg", grande.Pos.x, grande.Pos.y-5);
  piccolo.display();
  grande.display();
  piccolo = grande.edges(piccolo);
  piccolo.edges();
  grande.update();
  piccolo.update();
}
