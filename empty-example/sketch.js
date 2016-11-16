
// VARS

var count = 0;
var up = true;
var pointCount = 450;
var freqX = 1;
var freqY = 2;
var phi = 90;
var angle;
var x, y, z;
var factorX, factorY;
var doDrawAnimation = false;
var margin = 25;

// SETUP
function setup() {
  createCanvas(1280, 960);
  background(0);
  frameRate(15);
  smooth();
}

// DRAW
function draw() {

    background(0);
    noFill();

    stroke(255-count);
    strokeWeight(0.5);

    if(frameCount % 1 == 0) {
      freqX ++;
      freqY ++;
      phi ++;
    }

    // Curves
    push();
      translate(width/2, height/2);
      factorX = width/2 - margin;
      factorY = height/2 - margin;
      beginShape();
        for (var i = 0; i <= pointCount; i++){
          angle = map(i, 0,pointCount, 0,TWO_PI);
          x = sin(angle*freqX + radians(phi));
          y = sin(angle*freqY);
          x = x * factorX;
          y = y * factorY;
          z = 0-frameCount;
          vertex(x, y);
        }
      endShape();
    pop();

    // Text
    if(up == true) {
      count ++;
      if(count >= 255) {
        up = false;
      }
    }
    if(up == false) {
      count--;
      if(count <= 0) {
        up = true;
      }
    }
    var fontSize = 192;
    textFont("Arial", fontSize);
    fill(count);
    var line1 = "PROCESSING";
    var twidth = textWidth(line1);
    text(line1, (width-twidth)/2, (height/2) - (fontSize/2));
    var line2 = "VANCOUVER";
    text(line2, (width-twidth)/2, (height/2) + (fontSize/2));

}
