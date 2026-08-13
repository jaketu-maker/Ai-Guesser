class Buttons{
  float x;
  float y;
  String text;
  int size;
  int w;
  int h;
  color c;
  float targetH;
  float targetW;
  float currentH;
  float currentW;
  float scale;
  public Buttons(int x, int y, int w, int h, String text,int size,color c){
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h; 
    this.text = text;
    this.size = size;
    this.c = c;
    this.targetH = h;
    this.targetW = w;
    this.currentH = h;
    this.currentW = w;
    scale = 1.1;
  }
  void show(){
    currentW = lerp(currentW,targetW,0.15);
    currentH = lerp(currentH,targetH,0.15);
    fill(c);
    rect(x,y,currentW,currentH,20);
    fill(0);
    textAlign(CENTER, CENTER);
    textSize(size);
    text(text,x+currentW/2,y+currentH/2);
  }
  boolean overButton(){
    if (mouseX >= this.x && mouseX <= this.x + this.w && mouseY >= this.y && mouseY <= this.y + this.h){
      targetH = h*scale;
      targetW = w*scale;
      return true;
    }
    else{
      targetH = h;
      targetW = w;
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
    this.overButton();
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
    rect(x,y,w,h,20);
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
  void show(){
    textFont(roboFont);
    currentW = lerp(currentW,targetW,0.15);
    currentH = lerp(currentH,targetH,0.15);
    fill(c);
    rect(x,y,currentW,currentH,20);
    fill(0);
    textAlign(CENTER, CENTER);
    textSize(size);
    text(text,x+currentW/2,y+currentH/2);
  }
  void action(){
    userAnswer = "ai";
    currentState = AppStates.CHECKANSWER;
  }
}
class Real extends Buttons{
  public Real(){
    super(550,550,400,80,"Real",40,#00ddaa);
    
  }
  void show(){
    textFont(realFont);
    currentW = lerp(currentW,targetW,0.15);
    currentH = lerp(currentH,targetH,0.15);
    fill(c);
    rect(x,y,currentW,currentH,20);
    fill(0);
    textAlign(CENTER, CENTER);
    textSize(size);
    text(text,x+currentW/2,y+currentH/2);
  }
  void action(){
    userAnswer = "real";
    currentState = AppStates.CHECKANSWER;
    
  }
}
class Next extends Buttons{
  public Next(){
    super(400,470,200,50,"NEXT",35,#00ccff);
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
