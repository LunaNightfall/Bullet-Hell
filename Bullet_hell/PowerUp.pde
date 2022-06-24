class SpeedPowerUp extends GameObject {
  
  SpeedPowerUp (float x, float y) {
    super(x, y, 0, 0, 20, lightblue, 1);
  }
  
  void act () {
   if (collidingWith (player1)) {
    lives = 0; 
   }
  }
  
  void show () {
     super.show();
     circle(x, y, size);
  }
}


//===============================================
class HealthPowerUp extends GameObject {
 
  HealthPowerUp (float x, float y) {
    super(x, y, 0, 0, 20, darkpurple, 1);
  }
  
  void act () {
   if (collidingWith (player1)) {
    lives = 0; 
   }
  }
  
  void show () {
     super.show();
     circle(x, y, size);
  }
}
