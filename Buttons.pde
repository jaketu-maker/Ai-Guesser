class Buttons{
  float x;
  float y;
  String text;
  int w;
  int h;
  public Buttons(int x, int y, int w, int h, String text){
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h; 
    this.text = text;
  }
  
  boolean overButton(){
    if (mouseX >= this.x && mouseX <= this.x + this.w && mouseY >= this.y && mouseY <= this.y + this.h){
      return true;
    }
    else{
      return false;
    }
  }
}
