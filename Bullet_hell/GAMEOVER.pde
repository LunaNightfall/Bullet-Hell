void gameover() {
  intro.pause();
  background(0, 0, 255);
  rectMode(CORNER);
  image(gameover, 0, 0, width, height);
  rectMode(CENTER);

  //Text
  textSize(50);
  fill(darkpurple);
  text("You died while", width/2, 200);
  text("choking on peas...", width/2, 300);
}

void gameoverClicks() {
  mode = INTRO;

  objects = new ArrayList<GameObject>();
  player1 = new Starfighter();
  objects.add(player1);
}
