void gameover() {
  
  theme.pause();
  
  //gameover text
  textFont(pixel);
  strokeWeight(0);
  stroke(0);
  fill(white);
  textSize(70);
  
  if(score == n) {
    background(132, 240, 97);
    text("YOU WIN", 400, 400);
    win.play();
  }
  
  if (lives == 0) {
    background(240, 97, 97);
    text("YOU LOSE", 400, 400);
    lose.play();
  }
  
  text("GAMEOVER", 400, 300);
  
}

void gameoverClicks() {
  win.pause();
  win.rewind();
  lose.pause();
  lose.rewind();
  mode = INTRO;
  reset();
  arrayset();
  theme.play();
  
}
