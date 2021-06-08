class Begin {
  int index;
  
  float xp;
  float yp;
  float angleB;
  PVector direction;

  Begin (int i) {
    index= i;
    angleB = radians(360/7);
    
    xp = -imgs[index].width/2;
    yp = -imgs[index].height/2;
    direction = PVector.fromAngle(PI+angleB*index);
  }

  void move() {
    xp += direction.x;
    yp += direction.y;
  }

  void display() {
    push();
    translate(width/2, height/2, 500);
    if(change%imgs.length==index || out == true){
      tint(255,255);
    }else{
      tint(255,10);
    }
    
    if (out == false && FB == true) {
      image(imgs[index], -imgs[index].width/2, -imgs[index].height/2);
    } else if (out == true && FB == true) {
      image(imgss[index], xp, yp);
    }
    pop();
  }
}
