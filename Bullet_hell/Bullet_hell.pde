import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

//Alina Cheung 
//June 20, 2022
//2-4

//mode framework
int mode;
final int INTRO = 1;
final int GAME = 2;
final int PAUSE = 3;
final int GAMEOVER = 4;

boolean up, down, left, right, space;
boolean speed = false;
boolean health = false;

ArrayList<GameObject> objects;
Starfighter player1;

//COLORS
color white = #ffffff;
color black = #000000;
color lightorange = #F59228;
color blue = #3428F5;
color red = #D8111F;
color purple = #9828F5;
color pink = #F528E1;
color green = #43BC22;
color yellow = #F0DD35;
color lightblue = #59CFE3;
color darkpurple = #4B1347;

//SOUND Variables
Minim minim;
AudioPlayer intro, bouncing, hit;

PFont sketchzone;
PImage background, gameover;

int score;

void setup() {
  size (800, 600);
  mode = INTRO;
  textAlign(CENTER, CENTER);
  rectMode(CENTER);
  sketchzone = createFont("sketchzone.zip", 100);
  background = loadImage("intro.jpg");
  gameover = loadImage("gameover.png");
  
  //sound
  minim = new Minim(this);
  intro = minim.loadFile("intro.mp3");
  bouncing = minim.loadFile("bouncing.wav");
  hit = minim.loadFile("hit.wav");
  
  //initialize keys
  up = down = left = right = space = false;
  
  objects = new ArrayList<GameObject>();
  player1 = new Starfighter();
  objects.add(player1);
}

void draw() {
  if (mode == INTRO) {
    intro();
  } else if (mode == GAME) {
    game();
  } else if (mode == PAUSE) {
    pause(); 
  } else if (mode == GAMEOVER) {
    gameover();
  } else {
    println("Mode error: " + mode);
  }
}
