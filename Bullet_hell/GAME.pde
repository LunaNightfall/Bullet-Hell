void game() {
  intro.play();
  
  fill(black, 150);
  rect(width/2, height/2, width, height);
  
  fill(white);
  rectMode(CORNER);
  rect(10, 10, 50, 50);
  fill(black);
  rect(15, 15, 10, 40);
  rect(40, 15, 10, 40);
  rectMode(CENTER);
  
  fill(white);
  textSize(20);
  text("Score:" + score, width/2, 50);
  
  fill(white);
  textSize(20);
  text("Lives:" + player1.lives, width/2, 100);
  
  
  
  addObjects();
  gameEngine();
  //debug();
}

void addObjects(){
  objects.add(0, new Star());
  
  if (frameCount % 30 == 0) objects.add(new Pawn());
  if(frameCount % 100 == 0) objects.add(new Bishop());
  if(frameCount % 200 == 0) objects.add(new Queen());
}

void gameEngine(){
  int i = 0;
  while (i < objects.size()) {
    GameObject obj = objects.get(i);
    obj.act();
    obj.show();
    if (obj.lives <= 0) {
      //if(!(obj instanceof Bullet && obj instanceof EnemyBullet && obj instanceof Particle)) {
      //objects.add(new Particle(obj.x, obj.y));
      //}
      objects.remove(i);
    } else {
      i++;
    }
  }
}

//void debug() {
//  fill(255);
//  text(frameRate, 20, 20);
//  text(objects.size(), 20, 40);
//}

void gameClicks() {
  if(mouseX > 10 && mouseX < 60 && mouseY > 10 && mouseY < 60) {
  mode = PAUSE;
  }
}
