import peasy.*;

PeasyCam cam;
//PeasyCam cam1;
PImage img;
double scale=0.05;
float rotY1=0;
float rotY2=0;
float z=0;
int doorNum = 3;
int HallNum = 20;
int PNum = 100;
int FNum = 3;
int RNum = 100;
int INum = 10;
int VNum = 100;
int band =256 ;
double n;
PShape mirror;
PImage[] imgs = new PImage[7];
PImage[] imgss = new PImage[7];
PImage[] manga = new PImage[20];
PImage shine;

//Array
ArrayList<Hallway> HList = new ArrayList<Hallway>();
ArrayList<particles> PList = new ArrayList<particles>();
ArrayList<Fall> FList = new ArrayList<Fall>();
ArrayList<Ray> RList = new ArrayList<Ray>();
ArrayList<Rings> IList = new ArrayList<Rings>();
ArrayList<VLines> VList = new ArrayList<VLines>();
ArrayList<Begin> BList = new ArrayList<Begin>();
door[] dList = new door[doorNum];
float[] spectrum = new float[band];
float[] spectrum2 = new float[band];


//boolean
boolean FD = false;
boolean FR = false;
boolean FH = false;
boolean FP = false;
boolean FI = false;
boolean FC = false;
boolean FL = false;
boolean FV = false;
boolean FB = false;
boolean FS = false;
boolean end = false;
boolean run = false;


void setup(){
  size(1000,1000,P3D);
  
  //load img
  for(int i =0;i<imgs.length;i++){
    imgs[i] = loadImage("pic/pic_"+i+".png");
    imgss[i] = loadImage("pic/pic_1_"+i+".png");
  }
  for(int i =0;i<manga.length;i+=2){
    manga[i] = loadImage("images/mag_"+i/2+"_01.png");
    manga[i+1] = loadImage("images/mag_"+i/2+"_02.png");
  }
  shine = loadImage("pic/shine.png");
  rectMode(CENTER);
  
  //import music
  drum = new SoundFile(this,"music/Drum.wav");
  leadGuitar = new SoundFile(this,"music/Lead Guitar.wav");
  rhythmGuitar = new SoundFile(this,"music/Rhythm Guitar.wav");
  
  //amplitude
  amp1 = new Amplitude(this);
  amp1.input(drum);
  amp2 = new Amplitude(this);
  amp2.input(leadGuitar);
  amp3 = new Amplitude(this);
  amp3.input(rhythmGuitar);
  
  //FFT
  fft = new FFT(this,band);
  fft.input(leadGuitar);
  fft2 = new FFT(this,band);
  fft2.input(rhythmGuitar);
  
  //sound play
  drum.play();
  leadGuitar.play();
  rhythmGuitar.play();
  
  cam = new PeasyCam(this,11000);
  cam.setWheelScale(scale);
  double x = width/2;
  double y = height/2;
  double z = -10000;
  cam.lookAt(x,y,z);
  
  //set door
  for(int i=0;i<doorNum;i++){
    dList[i]=new door(300*i,-10000+300*1/(i+1),250,0.1,(90/doorNum)*i,0);
  }
  
  //set Hallway
  for(int i=0;i<HallNum;i++){
    //HList[i]=new Hallway(300,380);
    HList.add(new Hallway(-2000-800*i));
  }
  
  //set particles
  for(int i=0;i<PNum;i++){
    //HList[i]=new Hallway(300,380);
    PList.add(new particles());
  }
  
  //set Fall
  for(int i=0;i<FNum;i++){
    //HList[i]=new Hallway(300,380);
    FList.add(new Fall());
  }
  
  //set Ray
  for(int i=0;i<RNum;i++){
    //HList[i]=new Hallway(300,380);
    RList.add(new Ray());
  }
  
  //set Rings
  for(int i=0;i<INum;i++){
    IList.add(new Rings(-1000-800*i));
  }
  
  //set VLines
  for(int i=0;i<VNum;i++){
    VList.add(new VLines());
  }
  
  //set Begin
  for(int i=0;i<imgs.length;i++){
    BList.add(new Begin(i));
  }
  //
  
}

void draw(){
  background(0);
  
  n = cam.getDistance();
  funcB();
  //funcC();
  //funcL();
  //funcV();
  //pushMatrix();
  //translate(width/2,height/2,-10000);
  //sphere (200);
  //popMatrix();
  //stroke(255);
  //for(int i=-width/2;i<width/2;i+=10){
  //  point(i,0,0);
  //}
  //for(int i=-height/2;i<height/2;i+=10){
  //  point(0,i,0);
  //}
  //for(int i=-800;i<800;i+=10){
  //  point(0,0,i);
  //}
  //circle(0,0,20);
  //popMatrix();
  Events();
  //int f = floor((float)n);
  //print(f);
  //funcD();
  //funcH();
  
  //funcP();
  
  
}

void Events(){
  if(FD == true){
    funcD();
  }
  if(FR == true){
    funcR();
  }
  if(FH == true){
    funcH();
  }
  if(FP == true){
    funcP();
  }
  if(FI == true){
    funcI();
  }
  if(FC == true){
    funcC();
  }
  //if(FL == true){
  //  funcL();
  //}
  if(FB == true){
    funcB();
  }
  if(FS == true){
    funcS();
  }
  //if(FV == true){
  //  funcV();
  //}
}

void keyReleased(){
  if(keyCode == 68){
    FD = !FD;
  }
  if(keyCode == 82){
    FR = !FR;
  }
  if(keyCode == 72){
    FH = !FH;
  }
  if(keyCode == 80){
    FP = !FP;
  }
  if(keyCode == 73){
    FI = !FI;
  }
  //if(keyCode == 73){
    
  //}
  if(keyCode == 65){
    out = !out;
  }
  if(keyCode == 76){
    FL = !FL;
  }
  if(keyCode == 66){
    FB = !FB;
  }
  if(keyCode == 86){
    FV = !FV;
  }
  if(keyCode == 67){
    FC = !FC;
  }
  if(keyCode == 83){
    FS = !FS;
  }
  if(keyCode == 32){
    run = !run;
  }
  if(keyCode == 69){
    end = !end;
  }
}
