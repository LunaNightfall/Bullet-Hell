void pause() {
  intro.pause();
  background(lightorange);
  
  fill(black);
  textSize(100);
  text("PAUSE", width/2, height/2);
  
}

void pauseClicks() {
  mode = GAME;
}
