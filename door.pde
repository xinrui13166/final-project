class door {
  float xPos, yPos, zPos, zSpeed, w, rSpeed;
  int s = 50;
  PShape door1=createShape();
  PShape door2=createShape();
  float pangle;
  PVector ver;
  float r;
  //constructor
  door(float y,float z, float wid, float angle,float rangle,float rad) {
    pangle = rangle;
    xPos = width/2;
    yPos = height/2-y;
    zPos = z;
    zSpeed = 4;
    w = wid;
    rSpeed = radians(angle);
  }
  //creating
  void Shapes(){
    door1.beginShape();
    door1.texture(img);
    door1.vertex(0,-w/2,0,0,0);
    door1.vertex(w,-w/2,0,640,0);
    door1.vertex(w,w/2,0,640,640);
    door1.vertex(0,w/2,0,0,640);
    door1.endShape(CLOSE);
    
    door2.beginShape();
    door2.texture(img);
    door2.vertex(-w,-w/2,0,640,0);
    door2.vertex(0,-w/2,0,0,0);
    door2.vertex(0,w/2,0,0,640);
    door2.vertex(-w,w/2,0,640,640);
    door2.endShape(CLOSE);
  }
  //Moving by changing z
  void move() {
    rotY1+=rSpeed;
    rotY2-=rSpeed;   
  }

  //display
  void display(float n, float a) {
    //rotation
    pushMatrix();
    translate(xPos,yPos,zPos);
    rotateX(-radians(pangle));
    pushMatrix();
    translate(-w,0,0);
    float d = n-a;
    if(abs(d)<w){
      rotateY(rotY1);
    }  
    //door1.fill(255);
    //shape(door1, xPos, yPos);
    shape(door1,0,0);
    popMatrix();
    
    pushMatrix();
    translate(w,0,0);
    if(abs(d)<w){
      rotateY(rotY2);
    }
    shape(door2,0,0);
    popMatrix();
    popMatrix();
    //print(floor(d));
    
  }

  //stop rotation
  void Check() {
    if (rotY1>radians(75)) {
      rSpeed=0;
    }
  }
}
