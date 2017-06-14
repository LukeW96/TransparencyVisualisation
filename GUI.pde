class GUI implements ControlListener
{
 ControlP5 cp5;
 PApplet p;
 String[] animationName = {"Total Internal Reflection", "Alpha", "Screen-door Effect"}; 
 int i,j,current;
 public GUI()
 {
   i = 0;
   current = 1;
   j = 2;
 }
  
 void setCP5(ControlP5 cp5)
 {
   this.cp5 = cp5;
 }
 
 void setPApplet(PApplet p)
 {
   this.p = p;
 }
 
 void display()
 {
    
   
    cp5.addButton("Restart Animation")
    .setPosition(200,350)
    .setSize(110,20)
    .setId(1)
    .addListener(this);
    
    cp5.addButton("backAnAnimation")
    .setPosition(10,150)
    .setSize(110,20)
    .setId(3)
    .setLabel(animationName[i])
    .addListener(this);
                                                                                                                                                                                                                                                 
    cp5.addButton("forwardAnAnimation")
    .setPosition(370,150)
    .setSize(110,20)
    .setId(4)
    .setLabel(animationName[j])
    .addListener(this);

 }
   
 void controlEvent(ControlEvent theEvent)
 {
   
   
   if(theEvent.getId() == 1)
   {
     print("restarting");
     restartAnimation();    
   }
   
   if(theEvent.getId() == 3)
   {
     i--;
     j--;
     current--;
     if(i == -1)
       i = 2;
     else if(j == -1)
       j = 2;
     else if(current == -1)
       current = 2;
 
     cp5.getController("backAnAnimation").setLabel(animationName[i]);
     cp5.getController("forwardAnAnimation").setLabel(animationName[j]);
 
     setAnimationState(animationName[current]);
   }
   
   if(theEvent.getId() == 4)
   {
     i++;
     j++;
     current++;
     if(i == 3)
       i = 0;
     else if(j == 3)
       j = 0;
     else if(current == 3)
       current = 0;
   
     cp5.getController("backAnAnimation").setLabel(animationName[i]);
     cp5.getController("forwardAnAnimation").setLabel(animationName[j]);
     setAnimationState(animationName[current]);
   }  
 }
}