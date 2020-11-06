void intro() {
  theme.play();
  
  background(73, 184, 214);
  textFont(pixel);
  
  image(gif[frame], 0, 0, width, height);
  if (frameCount % 6 == 0) {
  frame = frame + 1;
  }
  if (frame == 2) frame = 0;
  
  //start button
  strokeWeight(5);
  fill(247, 197, 227);
  starttactile(250, 400, 300, 100);
  rect(250, 400, 300, 100);
  fill(white);
  textSize(30);
  text("START", 400, 445);
  
  //text
  textFont(pixel);
  textSize(52);
  fill(lightsky);
  text("THE", 400, 160);
  text("SPECTACULAR", 400, 230);
  text("BREAKOUT GAME", 400, 300);
  textSize(50);
  fill(white);
  text("THE", 400, 160);
  text("SPECTACULAR", 400, 230);
  text("BREAKOUT GAME", 400, 300);
}

void introClicks() {
  //start button click
  if (mouseX > 250 && mouseX < 550 && mouseY > 400 && mouseY < 500) {
  mode = GAME;
  button.play();
  }
}
