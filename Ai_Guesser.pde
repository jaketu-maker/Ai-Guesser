enum AppStates{COVER,QUESTION,GRADE};
AppStates currentState = AppStates.COVER;
Buttons begin = new Buttons(400,500,200,40,"Begin",15);
boolean mouseDown = false;
void setup(){
 size(1000,700);
}
void draw(){

  switch(currentState){
    case COVER:
    cover();
    break;
    case QUESTION:
    
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
  begin.show();
}
