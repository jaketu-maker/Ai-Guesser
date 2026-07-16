import java.io.File;

enum AppStates{COVER,GENNEWQUESTION,QUESTION,ANSWER,CHECKANSWER,GRADE};
AppStates currentState = AppStates.COVER;
Buttons begin = new Begin();
Buttons ai = new Ai();
Buttons real = new Real();
Buttons next = new Next();
boolean mouseDown = false;
ArrayList<PImage> RealImages = new ArrayList<PImage>();
ArrayList<PImage> AIImages = new ArrayList<PImage>();
PImage picture;
String secretanswer = "";
String userAnswer = "";
int score = 0;
int total = 0;
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
    case GENNEWQUESTION:
    int coin = floor(random(0,2));
    if (coin == 1){
      picture = RealImages.get(floor(random(0,RealImages.size())));
      secretanswer = "real";
    }
    if (coin == 0){
      picture = AIImages.get(floor(random(0,AIImages.size())));

      secretanswer = "ai";
    }
    
    //pick a new image
    //record what the secrect answer is for this image
    currentState = AppStates.QUESTION;
    break;
    case CHECKANSWER:
    checkanswer();
    break;
    case ANSWER:
    answer();
    break;
    case QUESTION:
    question();
    break;
    
    case GRADE:
    grade();
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
  image(picture,250,50);
  ai.update();
  real.update();
}
void checkanswer(){
  background(255);
  if(userAnswer.equals(secretanswer)){
    score++;
    total++;
    currentState = AppStates.ANSWER;
  }
  else{
    total++;
    currentState = AppStates.ANSWER;
  }
}
void answer(){
  if(userAnswer.equals(secretanswer)){
    background(0,255,0);
    text(""+score, 500,350);
    next.update();
  }
  else{
    background(255,0,0);
    text(""+score, 500,350);
    next.update();
  }
}
void grade(){
  background(255);
}
