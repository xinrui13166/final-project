class Fall{
  float x;
  float y;
  float z;
  PVector startp;
  PVector start;
  PVector Fallspeed;
  boolean ifDelete = false;
  
  Fall(){
    startp = PVector.fromAngle(radians(random(180,360)));
    x = startp.x * height/2;
    y = startp.y * height/2;
    //x = random(-width/2, width/2);
    //y = random(-height/2,-height);
    z = random(-2300,-1000);
    Fallspeed = startp.mult(-1);
    //Fallspeed = new PVector(random());
    start = new PVector(x,y,z);
  }
  
  void move(){
    x = x + 10*Fallspeed.x;
    y = y + 10*Fallspeed.y;
    start.add(Fallspeed.mult(3));
  }
  
  void display(){
    push();
    stroke(255);
    strokeWeight(10);
    point(x,y,z);
    strokeWeight(3);
    line(start.x,start.y,start.z,x,y,z);
    pop();
  }
  
  void Check(){
    if(x > width/2 || y >width/2 || x<-width/2 || y<-height/2){
      ifDelete = true;
    }
  }
}
