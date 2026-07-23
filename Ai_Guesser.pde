import java.io.File;

enum AppStates{COVER,GENNEWQUESTION,QUESTION,ANSWER,CHECKANSWER,GRADE};
AppStates currentState = AppStates.COVER;
Buttons begin = new Begin();
Buttons ai = new Ai();
Buttons real = new Real();
Buttons next = new Next();
Buttons reset = new Reset();
boolean mouseDown = false;
ArrayList<PImage> RealImages = new ArrayList<PImage>();
ArrayList<PImage> AIImages = new ArrayList<PImage>();
ArrayList<PImage> realGarbage = new ArrayList<PImage>();
ArrayList<PImage> aiGarbage = new ArrayList<PImage>();
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
      picture = RealImages.remove(floor(random(0,RealImages.size())));
      secretanswer = "real";
      realGarbage.add(picture);
      
    }
    if (coin == 0){
      picture = AIImages.remove(floor(random(0,AIImages.size())));

      secretanswer = "ai";
      aiGarbage.add(picture);
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
  //original width and height of the image
  int imgWidth = picture.width;
  int imgHeight = picture.height;
  ////////////////////////////////////////
  int newWidth = 0;
  int newHeight = 0;
  //what kind of math equation can you code 
  //so that you can shrink the image down to the appropriate screen size
  //but keep the same aspect ratio
  float m = 380.0f/imgHeight;
  println(m);
  newWidth = floor(imgWidth*m);
  newHeight = floor(imgHeight*m);
  image(picture,500-(0.5*newWidth),50,newWidth,newHeight);
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
  textSize(50);
  text(""+score+"/10",500,300);
  textSize(30);
  if(score == 10){
    text("GET OFF YOUR PHONE!!",500, 450);
  }
  else if(score >= 7 && score <= 9){
    text("GEN Z",500, 450);
  }
  else if(score >= 4 && score <= 6){
    text("UNC STATUS",500, 450);
  }
  else if(score >= 1 && score <= 3){
    text("GRANDPA NEEDS A LITTLE HELP.",500, 450);
  }
  for(int i = 0;i < realGarbage.size();i++){
    RealImages.add(realGarbage.get(i));
  }
  realGarbage.clear();
  for(int i = 0;i < aiGarbage.size();i++){
    AIImages.add(aiGarbage.get(i));
  }
  aiGarbage.clear();
  reset.update();
  
}
