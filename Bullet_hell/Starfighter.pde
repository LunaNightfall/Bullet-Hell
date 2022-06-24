class Starfighter extends GameObject {
  //constructor: a special function that defines how an object of this class is born. Defines initial values for fields.
  Starfighter() {
    super(width/2, height/2, 0, 0, 40, red, 10);
    threshold = 20;
    cooldown = threshold;
  }


  void act() {
    super.act();
    //managing guns
    cooldown++;
    if (space && cooldown >= threshold) {
      objects.add(new Bullet());
      cooldown = 0;
      if (speed == true && threshold > 1) {
       threshold--; 
      } 
      
      //if (health == true && 
    }

    //controlling the Starfighter
    if (up)     vy = -5;
    if (down)   vy = 5;
    if (left)   vx = -5;
    if (right)  vx = 5;

    if (!up && !down)     vy = vy * 0.9;
    if (!left && !right)   vx = vx * 0.9;
    
    //collisions
    int i = 0;
    while (i < objects.size()) {
      GameObject obj = objects.get(i);
      if (obj instanceof EnemyBullet) {
        if (collidingWith(obj)) {
          lives--;
          obj.lives = 0;
          hit.rewind();
          hit.play();
        }
      }
      
      if (obj instanceof SpeedPowerUp) {
       if (collidingWith(obj)) {
         speed = true;
       }else {
         speed = false;
       }
      } 
      i++;
    }

    //borders
    if (x <= size/2){
       bouncing.rewind();
       bouncing.play();
       x = size/2;
    }
    
    if (y <= size/2) {
      bouncing.rewind();
      bouncing.play();
      y = size/2;
    }
    
    if (x >= width-size/2) {
      bouncing.rewind();
      bouncing.play();
      x = width-size/2;
    }
    
    if(y >= height-size/2) {
      bouncing.rewind();
      bouncing.play();
      y = height-size/2;
    }
    
    if (lives <= 0) {
     mode = GAMEOVER; 
    }
  }
}
