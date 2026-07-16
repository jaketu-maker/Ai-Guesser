class Buttons{
  float x;
  float y;
  String text;
  int size;
  int w;
  int h;
  public Buttons(int x, int y, int w, int h, String text,int size){
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h; 
    this.text = text;
    this.size = size;
    
  }
  void show(){
    fill(255);
    rect(x,y,w,h);
    fill(0);
    textAlign(CENTER, CENTER);
    textSize(size);
    text(text,x+w/2,y+h/2);
  }
  boolean overButton(){
    if (mouseX >= this.x && mouseX <= this.x + this.w && mouseY >= this.y && mouseY <= this.y + this.h){
      return true;
    }
    else{
      return false;
    }
  }
  boolean isClicked(){
    if(mouseDown && overButton()){
      return true;
    }
    return false;
  }
  void action(){
  
  }
  void update(){
    this.show();
    if(this.isClicked()){
      this.action();
    }
  }
}
class Begin extends Buttons{
  public Begin(){
    super(400,500,200,40,"Begin",15);
  }
  void show(){
    fill(0,255,0);
    rect(x,y,w,h);
    fill(0);
    textAlign(CENTER, CENTER);
    textSize(size);
    text(text,x+w/2,y+h/2);
  }
  void action(){
    currentState = AppStates.GENNEWQUESTION;
  }
}
class Ai extends Buttons{
  public Ai(){
    super(25,600,400,80,"AI",45);
  }
  void action(){
    userAnswer = "ai";
    currentState = AppStates.CHECKANSWER;
  }
}
class Real extends Buttons{
  public Real(){
    super(575,600,400,80,"REAL",45);
  }
  void action(){
    userAnswer = "real";
    currentState = AppStates.CHECKANSWER;
  }
}
class Next extends Buttons{
  public Next(){
    super(400,500,200,40,"NEXT",45);
  }
  void action(){
    if(total == 10){
      currentState = AppStates.GRADE;
    }
    else{
      currentState = AppStates.GENNEWQUESTION;
    }
    
  }
}
