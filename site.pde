// Font
PFont mFont;
int count = 0;
int mFontSize = 192;
boolean up = true;

// Curve
int pointCount = 450;
int freqX = 1;
int freqY = 2;
float phi = 90;
float angle;
float x, y, z;
float factorX, factorY;
boolean doDrawAnimation = false;
int margin = 25;

void setup() 
{
  size(1280, 960);
  background(0);
  smooth();
  mFont = createFont("Arial", mFontSize);
  frameRate(30);
}

void draw() 
{
    // Curve
    frameRate(15);
    noFill();
    background(0);
    stroke(255-count);
    strokeWeight(1.5);

    if(frameCount % 1 == 0) 
    {
      freqX ++;
      freqY ++;
      phi ++;
    }

    pushMatrix();
      translate(width/2, height/2);
      factorX = width/2 - margin;
      factorY = height/2 - margin;
      beginShape();
        for (int i = 0; i <= pointCount; i++){
          angle = map(i, 0,pointCount, 0, TWO_PI);
          x = sin(angle * freqX + radians(phi));
          y = sin(angle * freqY);
          x = x * factorX;
          y = y * factorY;
          z = 0 - frameCount;
          vertex(x, y);
        }
      endShape();
    popMatrix();

    // Text
    if(up == true) 
    {
      count ++;
      if(count >= 255) 
      {
        up = false;
      }
    }
    if(up == false) 
    {
      count--;
      if(count <= 0) 
      {
        up = true;
      }
    }
    
    textFont(mFont);
    fill(count);
    String line1 = "PROCESSING";
    float twidth = textWidth(line1);
    text(line1, (width-twidth)/2, (height/2) -(mFontSize / 2));
    String line2 = "VANCOUVER";
    text(line2, (width-twidth)/2, (height/2) + mFontSize / 2);

}

void mousePressed() 
{
  link("info.html");
}