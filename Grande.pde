class Grande {
  PVector Pos;
  PVector Speed;
  float Matter;
  float Side;
  float Energy;

  Grande(PVector p, float m) {
    Pos = p;
    Matter = m;
    Side = 200;//pow(m, 0.25);
    Pos.y -=Side;
    Speed = new PVector(-sqrt(m)/10000, 0);
    Energy = Matter*pow(Speed.x, 2)/2;
  }

  void update() {
    Pos.add(Speed);
    Energy = Matter*pow(Speed.x, 2)/2;
  }

  void display() {
    fill(0, 0, 255);
    rect(Pos.x, Pos.y, Side, Side);
  }

  Piccolo edges(Piccolo piccolo) {
    if (Pos.x<0) {
      Speed.mult(-1);
    }
    if (Pos.x<(piccolo.Pos.x+piccolo.Side)) {
      float VI = Speed.x;
      float vi = piccolo.Speed.x;
      Speed.x = ( Matter*VI + piccolo.Matter*vi + piccolo.Matter*abs(VI-vi) )/(Matter + piccolo.Matter); 
      piccolo.Speed.x  = Matter*VI/piccolo.Matter - Matter*Speed.x/piccolo.Matter + vi;
      Counter++;
      return piccolo;
    }
    return piccolo;
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
    r += "Posizione grande: "+Pos.x+" "+Pos.y;
    return r;
  }

  String speedToString() {
    String r = "";
    r += "Velocità grande: "+Speed.x;
    return r;
  }

  String energyToString() {
    String r = "";
    r += "Energia grande: "+Energy;
    return r;
  }

  String matterAndSideToString() {
    String r = "";
    r += "Massa grande: "+Matter+"     Lato grande: "+Side;
    return r;
  }
}
