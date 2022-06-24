void intro() {
  intro.play();
  background(255,0,0);
  rectMode(CORNER);
  image(background, 0, 0, width, height);
  rectMode(CENTER);
  
  //text
  textSize(100);
  textFont(sketchzone);
  fill(red);
  text("Pea Hell", width/2, 200);
}

void introClicks() {
  mode = GAME; 
}
