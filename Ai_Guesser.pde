import java.io.File;

enum AppStates{COVER,QUESTION,GRADE};
AppStates currentState = AppStates.COVER;
Buttons begin = new Begin();
Buttons ai = new Ai();
Buttons real = new Real();
boolean mouseDown = false;
ArrayList<PImage> RealImages = new ArrayList<PImage>();
ArrayList<PImage> AIImages = new ArrayList<PImage>();
void setup(){
 background(255);
 size(1000,700);
 println(dataPath("/Real_Images"));
 File Realfolder = new File(dataPath("/Real_Images"));
 File[] listOfFiles = Realfolder.listFiles();
 if (listOfFiles != null){
   for (int i = 0; i <listOfFiles.length;i++){
     if (listOfFiles[i].isFile()){
       println("File: " + listOfFiles[i].getName());
       RealImages.add(loadImage(dataPath("/Real_Images") +"\\"+ listOfFiles[i].getName()));
     }
   }
 }
 File AIfolder = new File(dataPath("/Ai_Images"));
 File[] listOfAIFiles = AIfolder.listFiles();
 if (listOfAIFiles != null){
   for (int i = 0; i <listOfAIFiles.length;i++){
     if (listOfAIFiles[i].isFile()){
       println("File: " + listOfAIFiles[i].getName());
       AIImages.add(loadImage(dataPath("/Ai_Images") +"\\"+ listOfAIFiles[i].getName()));
     }
   }
 }
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
