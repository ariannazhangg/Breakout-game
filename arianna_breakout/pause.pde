void pause() {
  //theme.pause();
  textFont(pixel);
  fill(darkblue);
  textSize(52);
  text("PAUSE", 400, 350);
  fill(white);
  textSize(50);
  text("PAUSE", 400, 350);
}

void pauseClicks() {
  if (dist(mouseX, mouseY, 80, 80) < 40) {
    mode = GAME;
    theme.play();
    button.rewind();
    button.play();
  }
}
