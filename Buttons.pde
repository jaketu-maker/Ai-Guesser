class Buttons{
  float x;
  float y;
  String text;
  int size;
  int w;
  int h;
  color c;
  public Buttons(int x, int y, int w, int h, String text,int size,color c){
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h; 
    this.text = text;
    this.size = size;
    this.c = c;
  }
  void show(){
    fill(c);
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
    super(325,500,350,70,"BEGIN",35, #00ccff);
  }
  void show(){
    fill(0,144,255);
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
    super(50,550,400,80,"AI",45,#ff6600);
  }
  void action(){
    userAnswer = "ai";
    currentState = AppStates.CHECKANSWER;
  }
}
class Real extends Buttons{
  public Real(){
    super(550,550,400,80,"REAL",45,#00ddaa);
    
  }
  void action(){
    userAnswer = "real";
    currentState = AppStates.CHECKANSWER;
  }
}
class Next extends Buttons{
  public Next(){
    super(400,400,200,40,"NEXT",35,#00ccff);
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
class Reset extends Buttons{
  public Reset(){
    super(400,600,200,40,"RESET",45,#00ccff);
  }
  void action(){
    score = 0;
    total = 0;
    currentState = AppStates.COVER;
  }
}
