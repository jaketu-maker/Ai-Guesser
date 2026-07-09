enum AppStates{COVER,QUESTION,GRADE};
AppStates currentState = AppStates.COVER;
Buttons begin = new Buttons(400,500,200,40,"Begin",15);
Buttons ai = new Buttons(25,600,400,80,"AI",45);
Buttons real = new Buttons(575,600,400,80,"REAL",45);
boolean mouseDown = false;
void setup(){
 background(255);
 size(1000,700);
}
void draw(){

  switch(currentState){
    case COVER:
    cover();
    break;
    case QUESTION:
    question();
    break;
    
    case GRADE:
    
    break;
  }

}
void mousePressed(){
  if(mouseButton == LEFT){
    mouseDown = true;
  }
}
void mouseReleased(){
  if(mouseButton == LEFT){
    mouseDown = false;
  }
}
void cover(){
  textSize(100);
  textAlign(CENTER,CENTER);
  text("BOT or NOT",500,200);
  begin.update();
}
void question(){
  background(255);
  ai.update();
  real.update();
}
