class Particle {
  float x; 
  float y;
  float dx;
  float dy;
  color c;
  float s;
  float life;

  Particle(float _x, float _y) {
    x = _x;
    y = _y;
    dx = random(-3, 3);
    dy = random(-3, 3);
    c = color(0, random(255), random(255));
    s = random(20,50);
    life = 20;
  }

  void display() {

    noStroke();
    fill(c);
    ellipse(x, y, s, s);
  }

  void update() {
    life--;
    s = map(life, 60, 0, 50, 0);
    
    if (x < s/2 || x > width-s/2) {
      dx *= -1;
    }
    if (y < s/2 || y > height-s/2) {
      dy *= -1;
    }
    x += dx;
    y += dy;
  }
  
  //void setSize(float siz) {
  //  s = siz;
  //}
}