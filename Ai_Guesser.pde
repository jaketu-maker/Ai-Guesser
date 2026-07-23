import java.io.File;

enum AppStates {
  COVER, GENNEWQUESTION, QUESTION, ANSWER, CHECKANSWER, GRADE
};
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
HashMap<String, String> AiDescriptions = new HashMap<String, String>();
HashMap<String, String> RealDescriptions = new HashMap<String, String>();

void setup() {
  background(255);
  size(1000, 700);
  println(dataPath("/Real_Images"));
  File Realfolder = new File(dataPath("/Real_Images"));
  File[] listOfFiles = Realfolder.listFiles();
  if (listOfFiles != null) {
    for (int i = 0; i <listOfFiles.length; i++) {
      if (listOfFiles[i].isFile()) {
        println("File: " + listOfFiles[i].getName());
        RealImages.add(loadImage(dataPath("/Real_Images") +"\\"+ listOfFiles[i].getName()));
      }
    }
  }
  File AIfolder = new File(dataPath("/Ai_Images"));
  File[] listOfAIFiles = AIfolder.listFiles();
  if (listOfAIFiles != null) {
    for (int i = 0; i <listOfAIFiles.length; i++) {
      if (listOfAIFiles[i].isFile()) {
        println("File: " + listOfAIFiles[i].getName());
        AIImages.add(loadImage(dataPath("/Ai_Images") +"\\"+ listOfAIFiles[i].getName()));
      }
    }
  }
  AiDescriptions.put("Image 1", "This image appears AI-generated because of several subtle inconsistencies. While it looks highly realistic overall, close inspection reveals that some people have slightly unnatural proportions and poses, and small details like faces and hands lack realistic definition. The bicycle and baskets contain minor structural irregularities, while the flowers, fruit, and decorative elements appear overly perfect and repetitive. The cobblestone street, building textures, and ivy are detailed but have a slightly painterly quality rather than the natural variation of a real photograph. Additionally, the lighting and composition are exceptionally balanced, giving the scene an idealized, almost staged appearance that is characteristic of AI-generated images.");
  AiDescriptions.put("Image 2", "This image has several characteristics that could suggest it is AI-generated, though it is more convincing than many AI images. The hiker's silhouette and backpack lack some fine detail, with the limbs and gear blending slightly into the surrounding light. The clouds and mist have a smooth, painterly appearance with repetitive patterns rather than the natural randomness of real atmospheric conditions. The lighting is exceptionally dramatic and evenly balanced, creating an almost cinematic look that is common in AI-generated landscapes. Additionally, some rock textures and edges appear softened or slightly inconsistent, lacking the sharp, irregular detail typically found in high-resolution photographs. Together, these subtle anomalies make the image appear highly realistic while still showing signs consistent with AI generation.");
  AiDescriptions.put("Image 3", "This portrait is highly realistic, but there are several subtle features that could indicate it is AI-generated. The skin texture and wrinkles are extremely detailed, yet some areas appear overly uniform and stylized rather than naturally varied. The hands and fingers holding the fishing net show slight inconsistencies in shape and proportion, and the net itself has irregular strands that blend together unnaturally. The lighting creates a dramatic, cinematic effect with very smooth transitions between highlights and shadows, which is common in AI-generated portraits. Additionally, the background blur is exceptionally clean and the subject is almost perfectly isolated, giving the image an idealized, polished appearance that is often characteristic of AI-generated imagery.");
  AiDescriptions.put("Image 4", "This image shows several traits often associated with AI generation rather than a straightforward photograph. The lichen and moss patterns on the rocks appear unusually uniform and painted-on rather than organically irregular, while the raked gravel lines are crisp and geometric in places but lose logical continuity elsewhere. The foliage, especially the tree in the upper left, has a soft, painterly quality that blends into the fog instead of showing distinct leaf detail. The bamboo water spout's joints and proportions also look slightly inconsistent with real physical construction. Combined with the overly smooth, evenly diffused fog and the idealized, rounded shapes of the moss mounds, these cues suggest the image may be AI-generated or heavily digitally altered, though none of these signs alone is fully conclusive.");
  AiDescriptions.put("Image 5", "This market scene has several hallmarks of AI generation: the produce displays are almost too perfectly arranged, with fruit and vegetables sitting in unnaturally uniform, symmetrical piles. Several background figures show anatomical inconsistencies—blurred or malformed hands, oddly positioned limbs, and faces that lack distinct individual detail. The stonework and shutters on the buildings repeat with a slightly too-regular texture, and architectural lines occasionally warp or don't align logically at the edges. Lighting is dramatically golden and consistent across the whole scene in a way that feels idealized rather than naturally captured. Overall, the hyper-polished, storybook quality of the composition suggests digital generation rather than an unedited photograph.");
  AiDescriptions.put("Image 6", "This image actually looks far more consistent with a genuine photograph than the previous two. The shallow depth of field is optically coherent, with a natural falloff from the sharply focused glove and ball to the softly blurred field and bleachers behind it. The wood grain, weathering, and scattered leaves on the bench show irregular, realistic detail rather than repeating or idealized patterns. The glove's leather has authentic creasing, scuffing, and stitching wear consistent with real material aging. Lighting and shadows fall logically from a single consistent source, with no warping or inconsistency in reflections or edges. Overall, this photo lacks the telltale smoothing, symmetry, or anatomical/textural irregularities seen in AI-generated images, making it much more likely to be an authentic photograph.");
  AiDescriptions.put("Image 7", "The image appears AI-generated because of several subtle inconsistencies. The shooter's hands and arm positions look slightly unnatural, the basketball's position doesn't perfectly match the shooting motion, and the lighting isn't completely consistent across the scene. Background elements like the trees, fence, and houses become slightly soft and painterly upon close inspection, while textures on the clothing and basketball lack the fine imperfections of a real photograph. Although the composition is highly realistic and convincing, these small anatomical, lighting, and texture anomalies are common indicators of AI-generated imagery.");

  AiDescriptions.get("Image 1");

  RealDescriptions.put("Image 1", "This is a real photograph because of the natural golden-hour sunlight creating authentic volumetric rays piercing through mist and tree leaves with realistic diffusion and lens flare. The wooden gate shows natural wear, uneven paint, and organic shadows, while the thatched roof and 1919 plaque have precise architectural details typical of traditional Danish farmhouses. Ground vegetation includes varied wild plants and uneven grass growth that would be hard for AI to render consistently without repetition artifacts. The overall composition has a documentary feel with balanced depth of field and subtle atmospheric haze that matches real-world environmental photography.");
  RealDescriptions.put("Image 2", "This is clearly a real photo due to the natural candle flames with proper light refraction in the crystal glasses and realistic wax drips. The lace tablecloth has authentic fabric texture with slight wrinkles and light interaction, while the silverware shows genuine metallic reflections and patina. Food items like the cheese plate and pie slice exhibit natural imperfections and realistic moisture/glare that AI often struggles with. The background mirrors and framing create believable depth and room ambiance without the common AI inconsistencies in object placement or symmetry.");
  RealDescriptions.put("Image 3", "The image is real because of the natural daylight filtering through fresh spring leaves with accurate dappled lighting on the brick buildings and bicycles. The bicycles show practical wear, specific brands/models, and natural rust/chain details, while the ornate lamppost has authentic metal texture and perspective. Building windows reflect realistic sky and interior variations without repetition. The canal railing and cobblestones follow natural urban wear patterns typical of European city photography.");
  RealDescriptions.put("Image 4", "This portrait is a genuine photograph evident from the subtle skin texture, natural eye reflections, and realistic hair strands with flyaways and natural movement. The lighting creates soft, believable skin tones and gentle shadows that follow facial contours authentically. The fabric of her top shows natural folds, stitching details, and color variations from real textile. Background bokeh is organic and matches shallow depth of field used in professional child portraiture, with no telltale AI artifacts in facial features or proportions.");
  RealDescriptions.put("Image 5", "This is a real street photograph because of the complex interplay of natural daylight and man-made signs/lanterns with accurate shadows and reflections. The paper lanterns have natural creases, varying translucency, and authentic Japanese calligraphy without AI hallucination errors. Wires, air conditioning units, and potted plants show realistic urban clutter and weathering specific to Tokyo side streets. The composition includes natural perspective distortion and environmental details like the no-entry sign that ground it in reality.");
  RealDescriptions.put("Image 6", "The photo is authentic due to the bright sun creating realistic lens flare and strong directional shadows across the cobblestones and building facades. The houses display natural material variations in brick, paint, and roof tiles with organic aging patterns. The cargo bike and flowers show believable placement and texture, while the person in the background adds natural human scale. The tree leaves and sky clouds follow realistic lighting physics common in travel photography of historic European towns.");
  RealDescriptions.put("Image 7", "This bustling market scene is real because of the intricate metalwork on lanterns with genuine patina, reflections, and varying light transmission through cutouts. The mirrors create complex, multi-layered reflections of the actual environment and photographer that would be extremely difficult for AI to maintain consistently. Brass and copper items show natural variations in polish and oxidation, while the dense arrangement of goods captures authentic marketplace chaos without artificial symmetry. Lighting and depth feel documentary-style with proper exposure handling.");
  RealDescriptions.put("Image 8", "");
  RealDescriptions.put("Image 9", "");
  RealDescriptions.put("Image 10", "This is a genuine wildlife-style photograph shown by the cat's natural fur texture, individual whisker details, and realistic eye reflections with accurate pupil shape. The rocky foreground and foliage have organic randomness in placement and lighting that matches natural outdoor environments. The animal's pose and gaze direction create believable interaction with its surroundings, with soft natural bokeh in the background. Subtle environmental details like leaf variations and ground debris avoid the repetitive patterns often seen in AI animal generations.");
}
void draw() {

  switch(currentState) {
  case COVER:
    cover();
    break;
  case GENNEWQUESTION:
    int coin = floor(random(0, 2));
    if (coin == 1) {
      picture = RealImages.remove(floor(random(0, RealImages.size())));
      secretanswer = "real";
    }
    if (coin == 0) {
      picture = AIImages.remove(floor(random(0, AIImages.size())));

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
void mousePressed() {
  if (mouseButton == LEFT) {
    mouseDown = true;
  }
}
void mouseReleased() {
  if (mouseButton == LEFT) {
    mouseDown = false;
  }
}
void cover() {
  textSize(100);
  textAlign(CENTER, CENTER);
  text("BOT or NOT", 500, 200);
  begin.update();
}
void question() {
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
  image(picture, 500-(0.5*newWidth), 50, newWidth, newHeight);
  ai.update();
  real.update();
}
void checkanswer() {
  background(255);
  if (userAnswer.equals(secretanswer)) {
    score++;
    total++;
    currentState = AppStates.ANSWER;
  } else {
    total++;
    currentState = AppStates.ANSWER;
  }
}
void answer() {
  if (userAnswer.equals(secretanswer)) {
    background(0, 255, 0);
    text(""+score, 500, 350);
    next.update();
  } else {
    background(255, 0, 0);
    text(""+score, 500, 350);
    next.update();
  }
}
void grade() {
  background(255);
}
