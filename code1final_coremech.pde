import ddf.minim.*;

color c;

Minim minim;
AudioPlayer mySound;
AudioPlayer mySplash;

int n = 0;

final static ArrayList<Fish> fishy = new ArrayList();
ArrayList<ParticleSystem> systems = new ArrayList<ParticleSystem>();

Fish myFish;

void setup() {
  size(800, 200);
  smooth();
  mousePressed();
  
  minim = new Minim(this);
  mySound = minim.loadFile("HappyUkulele.mp3", 800);
  mySound.loop();
}

void draw() {
  background(0);
   c = color(0, random(255), random(255));
   
   stroke(c);
   for(int i = 0; i < mySound.bufferSize() - 1; i++)
  {
    float x1 = map( i, 0, mySound.bufferSize(), 0, width );
    float x2 = map( i+1, 0, mySound.bufferSize(), 0, width );
    line( x1, 50 + mySound.left.get(i)*50, x2, 50 + mySound.left.get(i+1)*50 );
    line( x1, 150 + mySound.right.get(i)*50, x2, 150 + mySound.right.get(i+1)*50 );
  }
   
  for(Fish f: fishy) f.run();
  
  for (int i = 0; i < systems.size(); i++) {
    ParticleSystem t = systems.get(i);
    t.update();
  }
  fill(c);
  //systems.add(new ParticleSystem(mouseX,mouseY));
}

void mousePressed(){
  fill(c);
  fishy.add(new Fish(mouseX, mouseY)); 
  
  systems.add(new ParticleSystem(mouseX,mouseY));
  
}

class Fish {
  float x, y;
  float speedX=3;
  float speedY=3;
  Fish(float _x, float _y) {
    x=_x;
    y=_y;
  }
  void run() {
    display ();
    move();
    bounce();
    gravity();
  }
  void gravity() {
    speedY+=0.3;
  }
  void bounce() {
    if (x>width) {
      speedX=speedX*-1;
     mySplash = minim.loadFile("Footstep_Water_04.mp3");
     mySplash.play();
    }
    if (x<0) {
      speedX=speedX*-1;
      mySplash = minim.loadFile("Footstep_Water_04.mp3");
      mySplash.play();
    }
    if (y>height) {
      speedY=speedY*-1;
      mySplash = minim.loadFile("Footstep_Water_04.mp3");
      mySplash.play();
    }
    if (y<0) {
      speedY=speedY*-1;
      mySplash = minim.loadFile("Footstep_Water_04.mp3");
    }
  }
  void move() {
    x=x+speedX;
    y=y+speedY;
  }
  void display() {
    c = color(0, random(255), random(255));
    fill(c);
    //triangle(x-8, y, x+8, y, x, y-8);
    //rect(x-2, y, 4, 25);
    ellipse(x, y, 40, 20);
    triangle(x-30, y-10, x-30, y+10, x-20, y);
  }
}


 void stop(){
   mySound.close();
   minim.stop();
   super.stop();
 }