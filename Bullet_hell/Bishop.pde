class Bishop extends GameObject {
  
  Bishop() {
    super(random(width), 0, random(1,5), 3, 80, pink, 1);
    threshold = 30;
    cooldown = threshold;
  }
  
  void act() {
    super.act();
    
     //managing guns
    cooldown++;
    if (cooldown >= threshold) {
      objects.add(new EnemyBullet(x, y, 10, 0));
      objects.add(new EnemyBullet(x, y, 0, -10));
      objects.add(new EnemyBullet(x, y, -10, 0));
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
    
    //remove if goes off screen
    if (offScreen()) lives = 0;
  }
}
