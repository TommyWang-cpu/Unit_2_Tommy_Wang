class Structure {
  int type;
  float x;
  float y;
  float rot;
  
  Structure(int t, float px, float py, float r){
    type = t;
    x = px;
    y = py;
    rot = r;
  }
  
  void display(){
    if(type == 1){
      pillar1(x,y);
    }
    if(type == 2){
      pillar2(x,y);
    }
    if(type == 3){
      pushMatrix();
      translate(x,y);
      rotate(radians(rot));
      rect(0,0,200,30);
      popMatrix();
    }
  }
}

ArrayList<Structure> builds = new ArrayList<Structure>();


float angle;

color currentColor;
color targetColor;

float t = 0;  // transition progress

int season = 0; // 0=spring,1=summer,2=autumn,3=winter

int x2,y2;

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
boolean sun = true;
boolean moon = false;

void setup(){
  size(600,600);
  x1 = 0;
  y1 = 0;
  f = 0;
  
  x2 = 300;
  y2 = 300;

  currentColor = color(0,255,0);   // spring
  targetColor = color(0,255,0);
  
}

void draw(){
  
  background(200);
  fill(#05CFF5);
  rect(0,0,600,400);
  
  println(frozenX1,frozenY1, frozenX2,frozenY2, frozenX3,frozenY3,x1,y1);
  
  season(x2,300);

  x2 += 1;
  
  angle += 0.01;
  
  planet(300,300);
  
//  if (sun){
//    planet(300,300);
    //moon = false;
//    fill(#05CFF5);
//    rect(0,0,600,400);
//  }
//  if (moon){
//    planet2(300,300);
//    fill(#A6C6C2);
//    rect(0,0,600,400);
//  }

  if (x2 > 600){
    x2 = 0;
      
    season = (season + 1) % 4;
    
    if(season == 0) targetColor = color(0,255,0);     // spring
    if(season == 1) targetColor = color(0,200,0);     // summer
    if(season == 2) targetColor = color(255,150,0);   // autumn
    if(season == 3) targetColor = color(255);         // winter
    
    t = 0; // restart transition
  }

  // smooth color transition
  currentColor = lerpColor(currentColor, targetColor, 0.02);

  stroke(0);
  strokeWeight(5);
  fill(currentColor);
  rect(0,400,600,200);

  
  house();
  
  for(int i = 0; i < builds.size(); i++){
  builds.get(i).display();
}
  
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
  }
  if (drawShape){
  pillar1(frozenX1,frozenY1);
  pillar2(frozenX2,frozenY2);
  pillar3(frozenX3,frozenY3);
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
  if(key == ' '){
  
  int type = 1;
  
  if(draw1) type = 1;
  if(draw2) type = 2;
  if(draw3) type = 3;
  
  builds.add(new Structure(type, x1, y1, f));
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
  
  if (key == 'c'){
    clearAll();
  }
}

void house(){
  fill(255);
  //rect(0,400,600,200);//land
  
  //3 pillar
  stroke(0);
  strokeWeight(10);
  rect(100,300,30,200);
  rect(300,300,30,200);
  rect(500,300,30,200);
  
  rect(100,300,200,30);
  rect(300,300,200,30);
  
}

void pillar1(float x,float y){
  rect(x,y,30,200);
}

void pillar2(float x,float y){
  rect(x,y,200,30);
}

void pillar3(float x,float y){
  pushMatrix();
  translate(x,y);
  rotate(radians(f));
  rect(0,0,200,30);
  popMatrix();
}

void build(){
  //translate(x,y);
  fill(0);
  beginShape();
  vertex(100,300);
  vertex(frozenX1,frozenY1);
  vertex(frozenX2,frozenY2);
  vertex(frozenX3,frozenY3);
  vertex(530,300);
  endShape();
}


void planet (int x,int y){
  pushMatrix();
  translate(x,y);
  rotate(angle);
  stroke(#DEBB3C,220);
  strokeWeight(20);
  fill(255,255,0,220);
  circle(100,300,250);
  popMatrix();
}

void planet2 (int x,int y){
  pushMatrix();
  translate(x,y);
  rotate(angle);
  stroke(255, 255, 255, 220);
  strokeWeight(50);
  fill(255);
  circle(100,300,250);
  fill(#7B7172, 100);
  strokeWeight(5);
  ellipse(90,200-10, 50, 50);
  popMatrix();
}

void season(int x, int y){
  pushMatrix();
  translate(x,y);
  circle(0,300,50);
  popMatrix();
}

void clearAll(){
  frozenX1 = 0;
  frozenY1 = 0;
  frozenX2 = 0;
  frozenY2 = 0;
  frozenX3 = 0;
  background(200);
}

  
