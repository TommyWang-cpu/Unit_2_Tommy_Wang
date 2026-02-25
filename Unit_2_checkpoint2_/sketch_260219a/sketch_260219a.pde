
int EggX,EggY;

void setup(){
  size(800,800);
  EggX = 0;
  EggY = 0;
}

void draw(){
  background(200);
  Egg(EggX,500);
  Egg(400,EggY);
  Egg(EggX,EggY);
  EggY = EggY + 10;
  EggX = EggX + 10;
  if (EggX > 900){
    EggX = -100;
  }
  if (EggY > 900){
    EggY = -100;
  }
}

void Egg(int x,int y){
  pushMatrix();
  translate(x,y);
  fill(255);
  ellipse(0,0,100,100);
  fill(0,0,255);
  triangle(-50,0,50,0,0,-50);
  popMatrix();
}
