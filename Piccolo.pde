class Piccolo {
  PVector Pos;
  PVector Speed;
  float Matter;
  float Side;
  float Energy;

  Piccolo(PVector p, float m) {
    Pos = p;
    Matter = m;
    Side = 100;//sqrt(m)*10;
    Pos.y -= Side;
    Speed = new PVector(0, 0);
    Energy = Matter*pow(Speed.x, 2)/2;
  }

  void update() {
    Pos.add(Speed);
    Energy = Matter*pow(Speed.x, 2)/2;
  }

  void display() {
    fill(0, 255, 0);
    rect(Pos.x, Pos.y, Side, Side);
  }

  void edges() {
    if (Pos.x<0) {
      Speed.mult(-1);
      Counter++;
    }
  }

  void printInfos() {
    println("");
    println(posToString());
    println(speedToString());
    println(energyToString());
    println(matterAndSideToString());
    println("");
  }

  String posToString() {
    String r = "";
    r += "Posizione piccolo: "+Pos.x+" "+Pos.y;
    return r;
  }

  String speedToString() {
    String r = "";
    r += "Velocità piccolo: "+Speed.x;
    return r;
  }

  String energyToString() {
    String r = "";
    r += "Energia piccolo: "+Energy;
    return r;
  }

  String matterAndSideToString() {
    String r = "";
    r += "Massa piccolo: "+Matter+"     Lato piccolo: "+Side;
    return r;
  }
}
