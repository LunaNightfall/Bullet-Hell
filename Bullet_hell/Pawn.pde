class Pawn extends GameObject {
int speedNum;

  Pawn() {
    super(random(width), 0, 0, 3, 40, yellow, 1);
    threshold = 20;
    cooldown = 60;
    speedNum = (int) random(1,4);
  }

  void act() {
    super.act();

    //managing guns
    cooldown++;
    if (cooldown >= threshold) {
      objects.add(new EnemyBullet(x, y, 0, 10));
      cooldown = 0;
    }

    //collisions
    int i = 0;
    while (i < objects.size()) {
      GameObject obj = objects.get(i);
      if (obj.lives > 0 && obj instanceof Bullet) {
        if (collidingWith(obj)) {
          lives--;
          obj.lives = 0;
          score++;
          hit.rewind();
          hit.play();
        }
      }
      i++;
    }
    
    
    if (lives <= 0) { 
      int j = 0;
      while(j < 20) {
       objects.add(new Particle(x, y));
       j++;
      }
      if (speedNum != 4) {
      objects.add(new SpeedPowerUp(x, y));
      }
    }

    //remove if goes off screen
    if (offScreen()) lives = 0;
  }
}
