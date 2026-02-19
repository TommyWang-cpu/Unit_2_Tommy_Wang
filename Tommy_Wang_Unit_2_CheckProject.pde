//Tommy Wang
//B1
//Feb, 17, 2026

//moon sun cosmic cloud 

int x1,x2,x3,x4,x5,x6,x7,x8,y1,y2,y3,y4,y5,y6,colourB,colourR,colourG;

void setup () {
  size(600,600);
  
  x1 = 0;
  x2 = -999;
  x3 = 200;
  x4 = 400;
  x5 = 600;
  x6 = 0;
  x7 = -20;
  x8 = 20;
  y1 = 0;
  y2 = 0;
  y3 = 0;
  y4 = 380;
  y5 = 350;
  y6 = 350;
  colourR = 0;
  colourG = 0;
  colourB = 0;
  
}

void draw() {
  
  background(colourR,colourG,colourB);
  
  //moon
  
  x1 = x1 + 4;
  stroke(255, 255, 255, 220);
  strokeWeight(50);
  fill(255);
  ellipse(x1,200,200,200);
  fill(#7B7172, 100);
  strokeWeight(5);
  ellipse(x1-10,200-10, 50, 50);
  
  //moon - sun 
  if (x1 > 700){
  x1 = -999;
  x2 = -100;
  }
  
  //sun
  
  x2 = x2 + 4;
  stroke(#DEBB3C,220);
  strokeWeight(20);
  fill(255,255,0,220);
  ellipse(x2,200,200,200);
  
  //sun - moon
  if (x2 > 700){
  x2 = -999;
  x1 = -150;
  }
  
  
  //cosmic
  
  
  //ellipse(x3,y1,50,50);
  //ellipse(x4,y2,50,50);
  //ellipse(x5,y3,50,50);
  
  if(x1 < 500){
  
  if (x1 > -151) {
    
    fill(255, 150);
    stroke(#0050F5, 100);
    strokeWeight(5);
    triangle(x3-5, y1-5, x3+5, y1+5, x3+150, y1-75);
    triangle(x4-5, y2-5, x4+5, y2+5, x4+150, y2-75);
    triangle(x5-5, y3-5, x5+5, y3+5, x5+150, y3-75);
    fill(255);
    stroke(179, 39, 24, 100);
    strokeWeight(10);
    ellipse(x3,y1,20,20);
    ellipse(x4,y2,20,20);
    ellipse(x5,y3,20,20);
    
    x3 = x3 - 4;
    x4 = x4 - 4;
    x5 = x5 - 4;
    y1 = y1 + 4;
    y2 = y2 + 4;
    y3 = y3 + 4;
   // y2 = y2 + 4;
   // y3 = y3 + 4;
    
    if(y1 > 600){
      y1 = 0;
      
    }
    
    if(x3 < -20){
      x3 = 200;
      //x4 = 400;
      //x5 = 600;
      y1 = -30;
    }
    
    if(x4 < -20){
      
       x4 = 400;
       y2 = -30;
       
    }
    if(x5 < -20){
      
      x5 = 600;
      y3 = -30;
    }
   }
 }
 
   //trees
  stroke(27,155,64,80);
  strokeWeight(8);
  fill(67,55,14);
  rect(30,500,20,100);
  fill(48,129,5);
  triangle(0,570,40,470,80,570);
  triangle(0,520,40,420,80,520);
  
  fill(67,55,14);
  rect(110,500,20,100);
  fill(48,129,5);
  triangle(80,570,120,470,160,570);
  triangle(80,520,120,420,160,520);
  
  fill(67,55,14);
  rect(190,500,20,100);
  fill(48,129,5);
  triangle(160,570,200,470,240,570);
  triangle(160,520,200,420,240,520);
 
  //cloud
  if(x2 > -100){ //x6,x7,x8
  
    stroke(19,107,211);
    strokeWeight(5);
    line(x6,y4,x6,y4-10);
    line(x7,y5,x7,y5-10);
    line(x8,y6,x8,y6-10);
    line(x7,y4-20,x7,y4-10);
    
    y4 = y4 + 5;
    y5 = y5 + 5;
    y6 = y6 + 5;
    
    if(y4 > 600){
      y4 = 380;
      y5 = 350;
      y6 = 350;
    }
    
    fill(255);
    strokeWeight(0);
    ellipse(x6,350,60,60);
    ellipse(x7,380,80,60);
    ellipse(x8,380,80,60);
    
    x6 = x6 + 3;
    x7 = x7 + 3;
    x8 = x8 + 3;
  }
  
  if(x2 < -101){
    x6 = -10;
    x7 = -20;
    x8 = 0;
  }
  
  //if (x2 > -151) {
  
  //night - day
  if (x1 > 500){
  colourB = colourB + 5;
  colourG = colourG + 3;
  colourR = colourR + 2;
  }
  
  //day - night
  if (x2 > 500){
  colourB = colourB - 5;
  colourG = colourG - 3;
  colourR = colourR - 2;
  }
  
  //observe station
  stroke(0);
  strokeWeight(0);
  fill(139,147,142);
  beginShape();
  vertex(400,400);
  vertex(450,350);
  vertex(320,300);
  vertex(300,350);
  endShape();
  fill(93,98,94);
  ellipse(425,400,200,200);
  fill(139,147,142);
  rect(300,450,250,200);
  fill(198,198,198);
  rect(350,520,50,80);
  fill(235);
  ellipse(390,570,10,10);

}
