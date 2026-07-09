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
    currentState = AppStates.QUESTION;
    
  }
  void update(){
    this.show();
    if(this.isClicked()){
      this.action();
    }
  }
}
