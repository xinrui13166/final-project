class Ray{
  float xpos;
  float ypos;
  float origz;
  float zpos;
  float speed;
  float l;
  float acc;
  float inc;
  int c;
  int weight;
  
  Ray(){
    xpos = random(-width/2,width/2);
    ypos = random(-height/2,height/2);
    zpos = random(-9000,500);
    origz = zpos;
    l = random(15,20);
    speed = 0;
    acc = 0;
    inc = random(0.5,1);    
    c = floor(random(180,255));
    weight = floor(random(3,5));
  }
  
  void move(){
    
    acc += inc;
    speed += acc;
    zpos += speed;
    
  }
  
  void display(){
    
    
    push();
    translate(width/2,height/2);
    stroke(c);
    strokeWeight(weight);
    line(xpos,ypos,zpos-l,xpos,ypos,zpos+l);
    pop();
    
  }
  
  void Restart(){
    if(zpos>0){
      zpos = origz;
      speed =0;
      acc = 0;
    }
  }
 
}
