class particles{
  float x;
  float y;
  float z;
  PVector speed;
  boolean ifDelete = false;
  
  particles(){
    x = width/2;
    y = height/2;
    z = -2300;
    speed = PVector.random3D();
  }
  
  void move(){
    x = x + speed.x;
    y = y + speed.y;
    z = z + 50*speed.z+100;
  }
  
  void display(){
    push();
    stroke(255);
    strokeWeight(3);
    point(x,y,z);
    pop();
  }
  
  void Check(float n){
    float diff = n - z;
    if(diff<1000){
      ifDelete = true;
    }
  }
}
