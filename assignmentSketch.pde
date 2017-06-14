
import controlP5.*;

PShape a,b;
int x,y; 
int alpha;
String animationState;
ControlP5 cp5;
color colour;
GUI gui;
int fps, TIRFrame,counter;
float scale;
int x1,y1, x2,y2,x3,y3;
    
PShape f;
void setup()
{
 
  TIRFrame = 0;
  x = 10;
  y = 10;
  x2 = 230;
  y2 = 230;
      
  x3 = 230;
  y3 = 230;

  f = new PShape();
  f = createShape(ELLIPSE, 10,10,10,10);
  counter++;
  scale = 1;
  fps = 10;
  frameRate(10);
  alpha = 255;
  animationState = "Alpha";
  size(500,400);
  a = new PShape();
  b = new PShape();    

  //gui setup 
  cp5 = new ControlP5(this);
  gui = new GUI();
  gui.setCP5(cp5);
  gui.setPApplet(this);
  gui.display();
 
}

void draw()
{
  clear();
  background(180);
  noStroke();
  frameRate(fps);
  if(animationState == "Alpha")
  {
    
    if(alpha > 0)
    {
      alpha--;
      
      colour = color(255,0,0);
      color colour2 = color(0,0,255,alpha);
    
      if(alpha >248 || alpha < 10)
      {
        frameRate(1);
      }
      else
      {
        frameRate(10);
      }
   
         
      fill(colour);
      text("Alpha level = " + alpha, 200,300);
      a = createShape(RECT, (height/2)-40,(width/2)-150,100,100);
      shape(a);  
      fill(colour2);
      
      if(alpha > 0)
      {
        b = createShape(RECT, (height/2)+10,(width/2)-100,100,100);
        shape(b); 
      }
      
      if(alpha <= 0)
      {
        scale =- 0.1;
      }
    }
  }
  
  if(animationState == "Screen-door Effect")
  {
    x1 = 230;
    y1 = 230;
    
    if(x < 100)
    { 
      x+= 10; y+= 10;
      clear();
      background(170);
    }

      color circleColour = color(100,0,0);
      fill(circleColour);
      f = createShape(ELLIPSE, 230,230,x,y);
      shape(f);
      stroke(0); 
      
      if (x2 < 320)
      {
        x2 += 10;
        x3 -= 10;
      }
      
      if(y2 < 320)
      {
        y2 += 10;
        y3 -= 10;
      }
      
      while(x1 != x2)
      {
        line(x1,150,x1,300);
        x1+=10;
      }
      
      while(y1 != y2)
      {
        line(150,y1,300,y1);
        y1+=10;  
      }
      
      
      x1 = 230;
      y1 = 230;
      while (x1 != x3)
      {
        line(x1,150,x1,300);
        x1-=10;
      }
      
      while(y1 != y3)
      {
        line(150,y1,300,y1);
        y1-=10;
      }

      if(x == 30)
        delay(2000);
      
      if(x == 40)
        delay(1000);
      
      if(x == 50)
        delay(1000);
        
      delay(1000);
  }
   
  if(animationState == "Total Internal Reflection")
  {
    
   delay(3000);
   TIRFrame++;
   frameRate(1);
   stroke(100,100);
   
   color lineColour0 = color(100,100,0,255);
   color lineColour1 = color(100,100,0,200);
   color lineColour2 = color(100,100,0,150);
   color lineColour3 = color(255,255,255);

   
   
   if(TIRFrame < 5)
   {
     fill(0,0,0);
     rect(130,130,180,180);   
     stroke(lineColour3);
     line(140,210,300,210);
   }
   
   if(TIRFrame == 1)
   {
     stroke(lineColour0);
     line(160,250,160,210);
     
     stroke(lineColour1);
     line(161,250,161,210);
     line(159,250,159,210);
     
     stroke(lineColour2);
     line(162,250,162,210);
     line(158,250,158,210);
     
     //reflection
     stroke(lineColour0);
     line(160,150,160,210);
     
     stroke(lineColour1);
     line(161,150,161,210);
     line(159,150,159,210);
     
     stroke(lineColour2);
     line(162,150,162,210);
     line(158,150,158,210);
   }

   if(TIRFrame == 2)
   {  
     stroke(lineColour0);
     line(160,250,170,210);
     
     stroke(lineColour1);
     line(161,250,171,210);
     line(159,250,169,210);
     
     stroke(lineColour2);
     line(162,250,172,210);
     line(158,250,168,210);
     
     
     //reflection
     stroke(lineColour0);
     line(170,210,200,160);
     
     stroke(lineColour1);
     
     line(171,210,201,160);
     line(169,210,199,160);
     
     stroke(lineColour2);
     line(172,210,202,160);
     line(168,210,198,160);
   }
   
   if(TIRFrame == 3)
   {
     stroke(lineColour0);
     line(160,250,190,210);
     
     //critical angle
     line(190,210,260,210);
     
     stroke(lineColour1);
     line(161,250,191,210);
     line(159,250,189,210);
 
     stroke(lineColour2);
     line(162,250,192,210);
     line(158,250,188,210);
   }
   
   if(TIRFrame == 4)
   {
     stroke(lineColour0);
     line(160,250,210,210);
     
     //reflection
     line(210,210,260,250);
     
     stroke(lineColour1);
     line(161,250,211,210);
     line(159,250,209,210);
     
     //reflection
     line(211,210,261,250);
     line(209,210,259,250);
     
     stroke(lineColour2);
     line(162,250,212,210);
     line(158,250,208,210);
     
     line(212,210,262,250);
     line(208,210,258,250);
     
     delay(2000);
   }
   
   if(TIRFrame > 5)
   {
      fill(0,0,0);
      noFill();
      bezier(150,150,180,130,250,180,300,150);
      bezier(150,180,180,160,250,210,300,180);
      ellipse(150,165,5,30);
      ellipse(300,165,5,30);
     if(TIRFrame == 5)
         delay(1000);
     
     else if(TIRFrame == 6)
       line(140,170,190,150);  
     
     else if(TIRFrame == 7)
     {
       line(140,170,190,150);
       line(190,150,225,185);
     }
     
     else if(TIRFrame == 8)
     {
       line(140,170,190,150);
       line(190,150,225,185);
       line(225,185,260,160);
     
     }
     else if(TIRFrame == 9)
     { 
       line(140,170,190,150);
       line(190,150,225,185);
       line(225,185,260,160);
       line(260,160,310,170);
     }  
   }
  }
   textSetup();
}



void textSetup()
{
 color textColour = color(0,0,0);
 fill(textColour);
 if(animationState == "Alpha")
 {
   if(alpha >248)
   {
     text("When the alpha is at 255, the shape is fully opaque " + 
     "and as a result the object behind cannot be seen,", 100,50,300,450);
   }
   else if(alpha > 50 && alpha <=248)
   {
     text("As the alpha levels decrease, the background(or in this case " +
     "another square) become visible through the object", 100,50,300,450);  
   }
   else
   {
     text("as the alpha levels start nearing 0, it starts becoming more and more " +
     "translucent, until eventually becoming fully transparent at alpha 0", 100,50,300,450);
   }
 }
 else if(animationState == "Screen-door Effect")
 {
   if(x == 20)
   {
     text("The screen-door effect is an issue where the lines seperating" + 
     " the pixels are visible to the viewer. It mostly occurs during " +
     "magnification, or stretching of pixels", 100,50,300,450); 
   }
   
   if(x == 30)
   {
     text("For example, if we 'zoom' in on the circle below", 100,50,300,450);  
   }
   
   if(x == 40)
   {
     text("The image stretches and as a result we can see " + 
     "the dividers between the pixels",100,50,300,450);
   }
   
 }
 else if(animationState == "Total Internal Reflection")
 {
   fill(100,0,0);
     
   if(TIRFrame == 1)
   {
     
     
     text("The refracted light",100,100,300,450);
     line(120,120,150,150);
     fill(255,255,255);
     text("The light source", 130,275,300,450);
     line(180,275,160,250);  
   }
   
   else if(TIRFrame == 3)
   {
     text("When the angle of incidence is perpendicular to the normal it becomes the critical angle. This means that light only is reflected on the boundary substance "
     ,100,50,300,450);
   }
   
   else if(TIRFrame == 4)
   {
     text("once the angle surpasses the critical angle, the light is then reflected in the " 
     + "phenomenom called Total Internal Reflection",100,50,300,450);
   }
   
   else if(TIRFrame == 5)
   {
     text("This technique is used within Fibre Optics cabling, similarly to as shown below",100,50,300,450);
   }
 }
}

void setAnimationState(String state)
{
  animationState = state;
}
  
void setFrameRate(int speed)
{
  fps = speed;
}

void restartAnimation()
{
  TIRFrame = 0;
  alpha = 255;
  x = 0;
  y = 0;
}