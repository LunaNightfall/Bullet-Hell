class Particle extends GameObject {
  float Sp;
  
  Particle(float x, float y) {
    super(x, y, random(-3, 3), random(-3, 3), 5, lightorange, 1);
    Sp = 0.2;
  }
  
  void act() {
    super.act();
    size -= Sp;
  }
  
  void show() {
   super.show();
   circle(x, y, size);
   if (size <= 0)
   lives = 0;
  }
}
