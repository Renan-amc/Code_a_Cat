/*

 
 - Body Width --- default 800
 - Glasses Size --- default 90
 - Leg Width --- default 65
 
 CAN BE CHANGED.
 ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ 
 */

boolean badassCat = true;
int bodyWidth = 800;
int legWidth = 105;
int glassesSize = 90;


void setup() {
  noLoop();
  size(1500, 1000);
}

void draw() {
  background(255);

  int groundHeight = 800;
  int bodyHeight = 300;
  int bodyStartX = (width-bodyWidth)/2 - 100;
  int bodyStartY = groundHeight - bodyHeight;

  int bodyMiddleY = bodyStartY + bodyHeight/2;

  int bodyEndX = bodyStartX + bodyWidth;

  int longestlegWidth = 400;

  int pawSize = 25;

  int headHigherThanBody = 200;
  int headSize = 300;
  int headStartX = bodyStartX - headSize/4;
  int headStartY = (groundHeight - bodyHeight) - headHigherThanBody;

  int headTiltX = 10;
  int headMiddleX = headStartX + headSize/2 - headTiltX;

  float glassesGapRatio = 1.4;
  int glassesY = headStartY + 100;

  int noseSize = 15;

  int whiskerWidth = 35;
  int whiskerHeadMiddleDistance = 70;

  int whiskerStartY = headStartY + 190;
  int whiskerYGap = 18;

  int mouthWidthX = 20;
  int mouthHeightY = 20;
  int mouthStartY = whiskerStartY + whiskerYGap * 2;
  int mouthEndY = mouthStartY + mouthHeightY;

  // --------------------- TAIL ---------------------

  strokeWeight(30);
  noFill();
  bezier(bodyEndX, bodyMiddleY, bodyEndX + 180, bodyMiddleY + 80, bodyEndX + 150, bodyMiddleY - 400, bodyEndX + 250, bodyMiddleY - 260);
  strokeWeight(5);
  // --------------------- BODY ---------------------
  fill(255);
  rect(bodyStartX, groundHeight - bodyHeight, bodyWidth, bodyHeight, 700); // Main Body

  rect(bodyStartX - 20, groundHeight - legWidth, 180, legWidth, legWidth); // Leftest Leg
  rect(bodyStartX + bodyWidth - 150, groundHeight - legWidth, 350, legWidth, legWidth); // Rightest Leg
  rect(bodyStartX + 260, bodyStartY - 20, legWidth, 180, legWidth); // Middle ARM
  rect(bodyStartX + bodyWidth - 80, bodyStartY - longestlegWidth + 100, legWidth, longestlegWidth, legWidth); // Longest Leg

  // PAW
  fill(0);
  int pawCenterX = bodyStartX + bodyWidth - 80 + legWidth/2;
  ellipse(pawCenterX, bodyStartY - longestlegWidth + 148, pawSize, pawSize); // BIG PAWLL
  ellipse(pawCenterX - 18, bodyStartY - longestlegWidth + 124, pawSize/2.5, pawSize/2.5); //SMALL PAWLL LEFT
  ellipse(pawCenterX, bodyStartY - longestlegWidth + 114, pawSize/2.5, pawSize/2.5); // SMALL PAWLL MIDDLE
  ellipse(pawCenterX + 18, bodyStartY - longestlegWidth + 124, pawSize/2.5, pawSize/2.5); // SMALL PAWLL RIGHT

  // --------------------- EARS ---------------------
  fill(0);
  triangle(headStartX, headStartY - 70, headStartX, headStartY + 70, headStartX + 120, headStartY + 50); // Left Ear
  triangle(headStartX + headSize, headStartY - 70, headStartX + headSize, headStartY + 70, headStartX + headSize - 150, headStartY + 50);


  // --------------------- BIG FACE ---------------------
  fill(255);
  rect(headStartX, (groundHeight - bodyHeight) - headHigherThanBody, headSize, headSize, 90); // Head

  fill(0);
  int eyeMiddleX = headMiddleX - 10;
  ellipse(eyeMiddleX - glassesSize/glassesGapRatio, glassesY, glassesSize, glassesSize); // Left Eye
  ellipse(eyeMiddleX + glassesSize/glassesGapRatio, glassesY, glassesSize, glassesSize); // Right Eye
  line(eyeMiddleX - glassesSize/glassesGapRatio, glassesY - 10, eyeMiddleX + glassesSize/glassesGapRatio, glassesY - 10); //Glasses nose bridge

  // --------------------- NOSE ---------------------
  fill(255);
  stroke(0);
  line(headMiddleX, whiskerStartY - 15, headMiddleX, whiskerStartY + whiskerYGap * 2);
  ellipse(headMiddleX, whiskerStartY - 15, noseSize, noseSize);

  // --------------------- MOUTHH ---------------------
  if(badassCat){
    
    line(headMiddleX, mouthStartY, headMiddleX - mouthWidthX - 10, mouthEndY); // MOUTH LEFT LINE
    line(headMiddleX, mouthStartY, headMiddleX + mouthWidthX + 10, mouthEndY); // MOUTH RIGHT LINE
  }else{
    line(headMiddleX, mouthStartY, headMiddleX - mouthWidthX - 10, mouthEndY - 40); // MOUTH LEFT LINE
    line(headMiddleX, mouthStartY, headMiddleX + mouthWidthX + 10, mouthEndY - 40); // MOUTH RIGHT LINE
  }
  
 

  // --------------------- WHISKERS ---------------------
  for (int i = 0; i < 3; i++) {
    line(headMiddleX - whiskerWidth - whiskerHeadMiddleDistance, whiskerStartY + i * whiskerYGap, headMiddleX - whiskerHeadMiddleDistance, whiskerStartY + i * whiskerYGap);  // Left Whiskers
  }

  for (int i = 0; i < 3; i++) {
    line(headMiddleX + whiskerWidth + whiskerHeadMiddleDistance, whiskerStartY + i * whiskerYGap, headMiddleX + whiskerHeadMiddleDistance, whiskerStartY + i * whiskerYGap);  // Left Whiskers
  }
}
