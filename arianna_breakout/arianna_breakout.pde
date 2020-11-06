//Arianna Zhang
// Block 1-2 A
// October 27 2020

//change theme

//sound
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

//keyboard variables
boolean leftkey, rightkey;

//colours
color darkblue = #3433A7;
color lightblue = #4546E5;
color purple = #C08BFA;
color lightpurple = #D4AFFF;
color sky = #CAF1FA;
color lightsky = #E3F6FA;
color grey = #939AA0;
color white = #FFFFFF;
color black = #000000;

//font variable
PFont pixel;
PImage[] gif;
int frame;

//mode framework
int mode;
final int INTRO = 1;
final int GAME = 2;
final int PAUSE = 3;
final int GAMEOVER = 4;

//entity variables
float paddlex, paddley, paddled; //paddles
float ballx, bally, balld; //ball
int leftscore, rightscore, timer;
float vx, vy; // target velocity

//score variable
int score, lives;

//Arrays
int[] x;
int[] y;
boolean [] alive;
int brickd;
int n;
int tempx;
int tempy;

// sound variables
Minim minim;
AudioPlayer theme, paddle, wall, scorenoise, button, win, lose, lifelose;

void setup() {
  size(800, 700);
  mode = INTRO;
  textAlign(CENTER, CENTER);
  
  //score
  lives = 3;
  score = 0;
  
  //font
  pixel = createFont("pixel.TTF", 200);
  
  //load gif
  gif = new PImage[2];
  
  int g = 0;
  while (g < 2) {
    gif[g] = loadImage("frame " +g+ ".gif");
    g++; 
  }
  
  //minim
  minim = new Minim(this);
  theme = minim.loadFile("honey milk island.mp3");
  paddle = minim.loadFile("paddle.wav");
  wall = minim.loadFile("wall.wav");
  scorenoise = minim.loadFile("score.wav");
  button = minim.loadFile("button.wav");
  win = minim.loadFile("win.mp3");
  lose = minim.loadFile("lose.mp3");
  lifelose = minim.loadFile("boop.wav");
  
  // paddle initial
  paddlex = 400;
  paddley = 700;
  paddled = 100;
  
  // ball initial
  ballx = 400;
  bally = 600;
  balld = 30;
  vx = 0;
  vy = -4;
 
 //brick
  n = 28;
  x = new int [n];
  y = new int [n];
  brickd = 50;
  alive = new boolean[n];
  
  tempx = 100;
  tempy = 120;
  
  int i = 0;
  while (i < n) {
    x[i] = tempx;
    y[i] = tempy;
    alive[i] = true;
    tempx = tempx + 100;
    if (tempx == width) {
      tempx = 100;
      tempy = tempy + 100;
    }
    i++; 
  }
  
  
}

void draw() {
  if (mode == INTRO) {
    intro();
  } else if (mode == GAME){
    game();
  } else if (mode == PAUSE){
    pause();
  } else if (mode == GAMEOVER){
    gameover();
  } else {
    println("Mode Error :" + mode);
  }
}
