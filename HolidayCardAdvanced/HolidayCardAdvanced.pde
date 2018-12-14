import processing.video.*;
import processing.sound.*;

PImage main, poster, card, tv, lamp;
Movie movie;
SoundFile music;
snowFlake[] mySnow = new snowFlake[100];
boolean mainRun = false;
boolean sideRun = false;
boolean play = false;
int count = 0;

void setup() {
  size(700, 540);

  for (int i = 0; i<mySnow.length; i++) {
    mySnow[i] = new snowFlake();
  }
  main = loadImage("holidayImage.png");
  poster = loadImage("holidayImagePoster.jpg");
  card = loadImage("holidayImageCard.png");
  tv = loadImage("holidayImageTV.png");
  lamp = loadImage("streetLamp.png");
  movie = new Movie(this, "song1.mp4");
  music = new SoundFile(this, "headAndShoulders.mp3");
}
void draw() {
  background(0);
  println(mouseX+"   "+mouseY);
  noStroke();
  ellipse(120, 500, 400, 250);
  ellipse(280, 500, 320, 220);
  ellipse(490, 500, 450, 200);
  image(lamp, -40,-100);
  for (int i = 0; i<mySnow.length; i++) {
    stroke(.5);
    mySnow[i].display();
    mySnow[i].move();
  }

  //ellipse(120,500, 400,250);
  if (key == CODED) {
    if (keyCode == SHIFT) {
      mainRun = true;
      sideRun = false;
      movie.stop();
    }
  }
  if (mousePressed) {
    sideRun = true;
  }
  if (play == true && count<1) {
    music.play();
    play = false;
    count++;
  }
  if (mainRun == true) {
    image(main, 0, 0);
    if (sideRun == true) {
      mouseChecker();
    }
  }
}

void mouseChecker() {
  int x = mouseX;
  int y = mouseY;

  if (x>=120&&x<=240&&y>=70&&y<=150) {
    poster();
  }
  if (x>=490&&x<=520&&y>=190&&y<=230) {
    card();
  }
  if (x>=305&&x<=430&&y>=130&&y<=220) {
    movie();
  }
  if (x>=580&&x<=700&&y>=75&&y<=185) {
    outside();
  }
}


void poster() {
  image(poster, 100, 100);
  play = true;
}
void card() {
  image(card, 50, 0);
}
void movie() {
  image(tv, 0, 0);
  movie.play();
  image(movie, 140, 80);
}
void movieEvent(Movie m) {//coded using processing api
  m.read();
}
void outside() {

  mainRun = false;



  if (key == CODED) {
    if (keyCode == SHIFT) {
      mainRun = true;
    }
  }
}
