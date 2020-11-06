//pause tactile
void pausetactile (int x, int y, int r)  {
 if (dist(x, y, mouseX, mouseY) < r) {
  stroke (sky);
  } else {
  stroke (lightpurple);
  }
}

//start tactile
void starttactile (int x, int y, int w, int h) {
    if(mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h) {
    strokeWeight(5);
    stroke(lightpurple);
  } else {
    stroke(sky);
  }
}

// reset
void reset () {
  lives = 3;
  score = 0;
  ballx = 400;
  bally = 650;
  balld = 30;
  paddlex = 400;
  paddley = 700;
  paddled = 100;
  
}

void arrayset() {
  //brick
 stroke(240, 252, 255);
 
  int i = 0;
  while (i < n) {
    alivebrickall(i);  
   
    
    i++;
  }
  
 
}
