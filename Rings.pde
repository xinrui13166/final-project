class Rings{
  float r;
  int Arc;
  float z;
  float angle;
  int gap;
  float speed;
  Rings(float zpos){
    angle = random(0,360);
    speed= random(1);
    r = random(300,400);
    Arc = floor(random(180,360));
    z = zpos;
    gap = floor(random(10));
  }
  
  void display(){
    push();
    translate(width/2,height/2);
    rotateZ(radians(angle));
    fft.analyze(spectrum);
    for(int i=0;i<Arc;i+=gap){
      int index = floor(map(i,0,360,0,spectrum.length));
      float l = 500*spectrum[index];
      float x = cos(radians(i))*r;
      float y = sin(radians(i))*r;
      line(x,y,z,x+20+l,y+20+l,z);
    }
    pop();
    angle += speed;
  }
}
