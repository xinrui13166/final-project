class Hallway {
  PVector pos;
  float r;
  float angle;
  float wid;
  float hei;
  PShape mirror;
  float px ;
  float py ;
  float pz,startz,speedz;
  boolean ifdelete = false;
  PVector p1, p2, p3, p4;
  float c;
  float add;
  float y1,y2,y3,y4;
  float x1,x2,x3,x4;
  
  Hallway(float fz1) {
    angle = radians(random(360));
    pos = PVector.fromAngle(angle);
    startz = -10000;
    speedz = 100;
    r = 700;  
    px = pos.x*r;
    py = pos.y*r;
    pz = fz1;
    c = random(100,255);
    wid = random(600,700);
    hei = random(680,780);
    x1 = px;
    y1 = random(py, py+hei/2);
    x2 = random(px+wid/2, px+wid);
    y2 = random(py+hei/2, py+hei);
    x3 = random(px+wid/2, px+wid);
    y3 = (py+hei);
    x4 = random(px, px+wid/2);
    y4 = random(py+hei/2, py+hei);
    
    //print(px,py,pz);
  }
  void Change(){
    startz += speedz;
    add = 1+amp1.analyze();
    if(startz < pz){
      p1 = new PVector(x1,y1, startz);
      p2 = new PVector(x2,y2, startz);
      p3 = new PVector(x3,y3, startz);
      p4 = new PVector(x4,y4, startz);
    }else{
      p1 = new PVector(add*x1,add*y1, startz);
      p2 = new PVector(add*x2,add*y2, startz);
      p3 = new PVector(add*x3,add*y3, startz);
      p4 = new PVector(add*x4,add*y4, startz);
    }
    
  }
  void display(int i) {
    
    pushMatrix();
    translate(width/2, height/2, 0);
    stroke(255);
    mirror = createShape();
    rotateZ(angle);
    mirror.beginShape();
    mirror.texture(manga[i]);
    mirror.vertex(p1.x, p1.y, p1.z,0,0);
    mirror.vertex(p2.x, p2.y, p2.z,200,0);
    mirror.vertex(p3.x, p3.y, p3.z, 200,279);
    mirror.vertex(p4.x, p4.y, p4.z,0,279);
    mirror.endShape();
    shape(mirror, 0,0);
    popMatrix();
  }
  
  void Stop(){
    if(startz > pz){
      speedz = 0;
    }
  }
  
  
}
