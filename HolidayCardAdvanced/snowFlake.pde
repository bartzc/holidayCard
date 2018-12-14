
interface snow {
  void display();
  void move();
}



public class snowFlake implements snow {
  float x = (int)(Math.random()*width); 
  float y = (int)(Math.random()*height);
  float r = (int)(Math.random()*10);
  float speed = (float)(Math.random()*5)+1;
  float w = (float)(Math.random()*5)-1;
  public snowFlake() {
  }
  public void display() {
    fill(255);

    ellipse(x, y, r, r);
  }
  void move() {
   /* if (mousePressed) {
      if (((int)(Math.random()*10)+1)%2!=0) {
        w = (float)(Math.random()*20)+5;
        speed = 5; 
        y = (int)(Math.random()*height);
      }
    }else{
      w = (float)(Math.random()*5)-1;
      speed = (float)(Math.random()*5)+1;
      
    }*/
    y+=speed;
    x+=w;
    if (y>height||x>width||x<0) {
      y=0; 
      x = (int)(Math.random()*width);
    }
  }
}
