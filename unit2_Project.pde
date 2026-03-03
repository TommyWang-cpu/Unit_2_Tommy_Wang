int f;
float x1;
float y1;
float frozenX1;
float frozenY1;
float frozenX2;
float frozenY2;
float frozenX3;
float frozenY3;
boolean draw1 = false;
boolean draw2 = false;
boolean draw3 = false;
boolean draw4 = false;
boolean drawShape = false;

void setup(){
  size(600,600);
  x1 = 0;
  y1 = 0;
  f = 0;
}

void draw(){
  background(200);
  house();
  
  if (draw1){
   pillar1(x1,y1);
  }
  
  if (draw2){
   pillar2(x1,y1);
  }
  if (draw3){
   pillar3(x1,y1);
  }
  if (draw4){
   build();
  // build1();
  }
  if (drawShape){
   pillar1(frozenX1,frozenY1);
   draw1 = false;
  }
}

void keyPressed(){
  if (key == 'a'){
    x1 = x1-10;
  }
  if (key == 'd'){
    x1 = x1+10;
  }
    if (key == 'w'){
    y1 = y1-10;
  }
  if (key == 's'){
    y1 = y1+10;
  }
  if (key == ' '){
    drawShape = true;
    frozenX1 = x1;
    frozenY1 = y1;
}
  if (key == '2'){
    draw2 = true;
    draw1 = false;
    draw3 = false;
  }
  if (key == '1'){
    draw1 = true; 
    draw2 = false;
    draw3 = false;
  }
   if (key == '3'){
    draw1 = false; 
    draw2 = false;
    draw3 = true;
  }
  if (draw3){
    if (key == 'r'){
      f = f + 45;
    }
  }
  if (key == 'o'){
    draw4 = true;
  }
  
}

void house(){
  fill(255);
  rect(0,400,600,200);//land
  
  //3 pillar
  rect(100,300,30,200);
  rect(300,300,30,200);
  rect(500,300,30,200);
  
  rect(100,300,200,30);
  rect(300,300,200,30);
  
}

void pillar1(float x,float y){
  
  translate(x,y);
  rect(x,y,30,200);
}

void pillar2(float x,float y){
  
  translate(x,y);
  rect(x,y,200,30);
}

void pillar3(float x,float y){
  
  translate(x,y);
  rotate(f);
  rect(x,y,200,30);
}

void build(){
  //translate(x,y);
  fill(0);
  beginShape();
  vertex(100,300);
  vertex(x1,y1);
  vertex(530,300);
  endShape();
}
//void build1(){
  //translate(x,y);
//  fill(0);
//  rect(100,300,430,200);
//}
