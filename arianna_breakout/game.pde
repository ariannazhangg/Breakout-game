void game() {
  
  background(235, 210, 242);

  //score text
  fill(white);
  stroke(0);
  textSize(25);
  text("Score: " + score, 300, 50);
  text("Lives: " + lives, 500, 50);
  
  //pause button
  strokeWeight(4);
  stroke(52, 51, 167);
  fill(white);
  pausetactile(70, 70, 35);
  circle(60, 60, 70);
  fill(black);
  stroke(10);
  line(50, 50, 50, 75);
  line(70, 50, 70, 75);
  
  
  //ball
  strokeWeight(5);
  stroke(lightsky);
  fill(sky);
  circle(ballx, bally, balld);
  
  //moving ball
  //if (timer < 0) {
    ballx = ballx + vx;
    bally = bally + vy;
 // }
  
  //border ball
  if (bally < balld/2) {
    vy = vy * -1;
    wall.rewind();
    wall.play();
  }
  
  if (ballx < balld/2 || ballx > width-balld/2) {
    vx = vx * -1;
    wall.rewind();
    wall.play();
  }
  
  // draw paddles
  strokeWeight(5);
  stroke(lightpurple);
  fill(purple);
  circle(paddlex, paddley, paddled);
  
   //paddle collision
  if (dist(paddlex, paddley, ballx, bally) <= paddled/2 + balld/2) {
    vx = (ballx - paddlex)/10;
    vy = (bally - paddley)/10;
    paddle.rewind();
    paddle.play();
  }
  
  //move paddles
  if(leftkey == true) paddlex = paddlex - 10;
  if(rightkey == true) paddlex = paddlex + 10;
  
  //border paddle
  if (paddlex > 750) {
    paddlex = 750;
  }
  if (paddlex < 50) {
    paddlex = 50;
  }
  
  //brick
 stroke(240, 252, 255);
 
  int i = 0;
  while (i < n) {
    if (alive[i] == true) {
    managebrick(i);  
   }
    
    i++;
  }
  
  
  
  // lose life reset
  if (bally > 700) {
    lives = lives - 1;
    ballx = 400;
    bally = 650;
    balld = 30;
    vx = 0;
    vy = -4;
    lifelose.play();
    lifelose.rewind();
  }
   
   if(score == n) mode = GAMEOVER;
   
   // go to gameover
   if (lives == 0) {
     mode = GAMEOVER;
    }
}

void gameClicks() {
 if (dist(mouseX, mouseY, 80, 80) < 40) {
    mode = PAUSE;
    button.rewind();
    button.play();
    theme.pause();
  }
}

void managebrick(int i) {
    if(y[i] == 120)fill(250, 174, 227);
    if(y[i] == 220)fill(228, 174, 250);
    if(y[i] == 320)fill(174, 233, 250);
    if(y[i] == 420)fill(174, 250, 221);
    
    
    circle(x[i], y[i], brickd);
    
    //brick bounce collision
    if (dist(x[i], y[i], ballx, bally) < brickd/2 + balld/2) {
      vx = (ballx - x[i])/10;
      vy = (bally - y[i])/10;
      alive[i] = false;
      score++;
      scorenoise.rewind();
      scorenoise.play();
    }
}

void alivebrickall(int i) {
    alive[i] = true;    
}
