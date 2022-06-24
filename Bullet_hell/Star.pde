class Star extends GameObject {
  //constructor: a special function that defines how an object of this class is born. Defines initial values for fields.
  Star() {
    super(random(width), 0, 0, 0, random(1,5), #FFFFFF, 1);
    vy = size;
  }

  //behaviour functions: these define what a star does
  void act() {
    super.act();
    if (y > height) lives = 0;
  }
}
