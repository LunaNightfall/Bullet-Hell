class Queen extends GameObject {
int healthNum;
  
  Queen() {
    super(random(width), 0, 0, 1, 20, purple, 1);
    threshold = 60;
    cooldown = threshold;
    healthNum = (int) random(1, 20);
  }

  void act() {
    super.act();
    cooldown++;
    if (cooldown >= threshold) {
      objects.add(new EnemyBullet(x, y, 0, 10));
      objects.add(new EnemyBullet(x, y, 10, 0));
      objects.add(new EnemyBullet(x, y, 0, -10));
      objects.add(new EnemyBullet(x, y, -10, 0));
      objects.add(new EnemyBullet(x, y, 10, 5));
      objects.add(new EnemyBullet(x, y, -10, 5));
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
      if (healthNum != 20) {
      objects.add(new HealthPowerUp(x, y));
      }
    }

    //remove if goes off screen
    if (offScreen()) lives = 0;
  }
}
