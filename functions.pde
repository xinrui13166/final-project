import processing.sound.*;
FFT fft;
FFT fft2;
Amplitude amp1,amp2,amp3;
SoundFile drum;
SoundFile leadGuitar;
SoundFile rhythmGuitar;
int timer = 0;
int time = 0;
int change = 0;
float ypos = -5000;
float a = 0;
color c;
boolean out = false;
float move=0, s = 0, acc = 0;
int wid = 3000;
//float xp = -608/2;
//float yp = -400/2;

void funcD(){
  for(int i = 0;i<dList.length;i++){
    door d = dList[i];
    d.move();
    d.Shapes();
    d.display((float)n,10000-200*i);
    d.Check(); 
  }
}

void funcH(){
  timer ++;
  if (timer%12==0){
    time ++;
  }
  
 
  for (int i = 0;i<HList.size();i++){
     if(time>i){
      Hallway h = HList.get(i);
      h.Change();
      h.display(i);
      h.Stop();
     }
  }  
}

void funcP(){
  for (int i = 0; i<PList.size();i++){
    particles p = PList.get(i);
    p.move();
    p.display();
    p.Check((float)n);
    if(p.ifDelete == true){
      PList.remove(i);
    }
  }
}

void funcR(){
  for (int i = 0;i<RList.size();i++){
    Ray r = RList.get(i);
    r.move();
    r.display();
    r.Restart();
    
  }
}

void funcF(){
  for (int i = 0; i<FList.size();i++){
    Fall f = FList.get(i);
    f.move();
    f.display();
    f.Check();
    if(f.ifDelete == true){
      FList.remove(i);
    }
  }
}

void funcI(){
  for (int j = 0;j<IList.size();j++){
    Rings i = IList.get(j);
    i.display();
    
  }
}

void funcC(){
  push();
  translate(width/2,-3000,-10000);
  randomSeed(20);
  fft2.analyze(spectrum2);
  float add = map(amp1.analyze(),0,1,0,1000);
  for(int j=0;j<3;j++){
    push();
    rotateX(PI/2);
    float rp = random(50,200);
    float r1 = random(1000,1500)+add;    
    int gap = floor(random(10));
    int z = -100*j;
    if(end == true){
        r1 -= 1000;
      }
    for(int i=0;i<360;i+=gap){    
      stroke(255);
      strokeWeight(3);
      int index =floor( map(i,0,360,0,spectrum.length));
      float l = 1000*spectrum2[index];
      float r2 = r1 + rp +l;
      PVector ver = PVector.fromAngle(radians(i));
      PVector ver1 = PVector.mult(ver,(r1-10));      
      PVector ver2 = PVector.mult(ver,(r2-10)); 
      line(ver1.x,ver1.y,z,ver2.x,ver2.y,z); 
      
     }
    
    pop();
  }
  noFill();
  stroke(255);
  sphere(1000);
  for (int i = 0;i<VList.size();i++){
    VLines v = VList.get(i);
    v.move();
    v.display();
    v.Restart();
  }
  pop();
}

void funcB(){
  float d = amp1.analyze();
  if(floor(d*10)==6 || floor(d*10)==7 ||floor(d*10)==4 ){
      change++;
    }
   for (int i = 0;i<BList.size();i++){
      Begin b = BList.get(i);
      if(run == true){
        b.move();
      }      
      b.display();
      
  }
}


void funcS(){
  push();
  translate(width/2,-3500,-12000);
  rotateX(PI/2);
  //image(shine,-shine.width/2,0); 
  //if(shine.width<5000){
  //  wid+=100;
  //}
  fill(255,255,255,a);
  rect(0,3000,6000,6000);
  a+=10;
  pop();
}
