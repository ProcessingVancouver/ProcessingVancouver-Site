// Mode
int drawMode = 1;

// Font
PFont font1, font2, font3;
int count = 0;
int fontSize1 = 192;
int fontSize2 = 32;
int fontSize3 = 16;
boolean up = true;
color textColor = color(255);
color linkColor = color(209, 109, 9);

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

// Date 
String date = "";

void setup() {
  size(1280, 960);
  background(0);
  smooth();
  font1 = createFont("Arial", fontSize1);
  font2 = createFont("Helvetica", fontSize2);
  font3 = createFont("HelveticaNeue-BoldItalic", fontSize3);
  frameRate(30);
  
  findDate();
}



void draw() {
  if(drawMode == 1) {
  
    // Curve
    frameRate(15);
    noFill();
    background(0);
    stroke(255-count);
    strokeWeight(1.5);
    
    if(frameCount % 1 == 0) {
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
          angle = map(i, 0,pointCount, 0,TWO_PI);
          x = sin(angle*freqX + radians(phi));
          y = sin(angle*freqY);
          x = x * factorX;
          y = y * factorY;
          z = 0-frameCount;
          vertex(x, y);
        }
      endShape();
    popMatrix();
    
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
    textFont(font1);
    fill(count);
    String line1 = "PROCESSING";
    float twidth = textWidth(line1);
    text(line1, (width-twidth)/2, (height/2) -(fontSize1/2));
    String line2 = "VANCOUVER";
    text(line2, (width-twidth)/2, (height/2) +fontSize1/2);  
  
  }
  else if(drawMode == 2) {
    background(0);
    
    fill(255);
    textFont(font2);
  
    text("Processing Vancouver is part of the global Processing Cities network.", 40, 40);
    text("It occurs on the last Tuesday of the month at VIVO Media Arts Centre.", 40, 80);
    text("VIVO is located at 1965 Main Street, Vancouver, BC, Canada.", 40, 120);
    text("The next event will be on " + date + ", 7 - 10 pm, 2012.", 40, 160);
    text("", 40, 200);
    text("The event is open to creative coders, generative designers, media artists...", 40, 240);
    text("or anyone that is interested in learning about or discussing these fields.", 40, 280);
    text("If you work in Processing (or oF, Pure Data, VVVV, Touch Designer, etc.),", 40, 320);
    text("and are interested in presenting your work, please contact us (info at this domain)", 40, 360);
    text("", 40, 400);
    text("More Info:", 40, 440);
    text("", 40, 480);
    fill(linkColor);
    text("Processing", 40, 520); // 500 - 540
    text("Processing JS", 40, 560); // 540 - 580
    text("", 40, 600);
    text("Processing Vancouver", 40, 640); // 620 - 660
    text("@P5Van", 40, 680); // 660 - 700
    text("Processing Cities", 40, 720); // 700 - 740
    text("", 40, 760);
    text("VIVO Media Arts Centre", 40, 800); // 780 - 820
    text("", 40, 840);
    textFont(font3);
    fill(textColor);
    text("(and yes, this site was coded entirely with Processing :-) )", 40, 880);
    
  }
  
  
} //

void findDate() {
  
  String tempDate[] = loadStrings("dates.txt");

  if(month() == 1) {
    if( day() <= 29) {
      date = tempDate[0]; 
    }
    else {
      date = tempDate[1]; 
    }
  }
  
  else if(month() == 2) {
    if( day() <= 26) {
      date = tempDate[1]; 
    }
    else {
      date = tempDate[2]; 
    }
  }
  
  else if(month() == 3) {
    if( day() <= 26) {
      date = tempDate[2]; 
    }
    else {
      date = tempDate[3]; 
    }
  }
  
  else if(month() == 4) {
    if( day() <= 30) {
      date = tempDate[3]; 
    }
    else {
      date = tempDate[4]; 
    }
  }  
  
  else if(month() == 5) {
    if( day() <= 28) {
      date = tempDate[4]; 
    }
    else {
      date = tempDate[5]; 
    }
  }

  else if(month() == 6) {
    if( day() <= 25) {
      date = tempDate[5];
    } 
    else {
      date = tempDate[6]; 
    }
  }
  
  else if(month() == 7) {
    if( day() <= 30) {
      date = tempDate[6];
    } 
    else {
      date = tempDate[7]; 
    }
  }

  else if(month() == 8) {
    if( day() <= 27) {
      date = tempDate[7];
    } 
    else {
      date = tempDate[8]; 
    }
  }
  
  else if(month() == 9) {
    if( day() <= 24) {
      date = tempDate[8];
    } 
    else {
      date = tempDate[9]; 
    }
  }
  
  else if(month() == 10) {
    if( day() <= 29) {
      date = tempDate[9];
    } 
    else {
      date = tempDate[10]; 
    }
  }
  
  else if(month() == 11) {
    if( day() <= 26) {
      date = tempDate[10];
    } 
    else {
      date = tempDate[11]; 
    }
  }  

  else if(month() == 12) {
    if( day() <= 31) {
      date = tempDate[11];
    } 
    else {
      date = tempDate[11]; 
    }
  } 
  
} // 


void mousePressed() {
  
  if(drawMode == 1) {
    link("http://www.processingvancouver.ca/blog"); 
    //background(0);
    //drawMode = 2; 
  }
  
  else if(drawMode == 2) {
    if(mouseX < width/2) {
      if(mouseY > 500 && mouseY < 540) {
        link("http://www.processing.org", "_new"); 
      }
      else if(mouseY > 540 && mouseY < 580) {
        link("http://www.processingjs.org", "_new"); 
      }
      else if(mouseY > 620 && mouseY < 660) {
        link("mailto:info@processingvancouver.ca", "_new"); 
      }
      else if(mouseY > 660 && mouseY < 700) {
        link("https://twitter.com/#!/P5Van", "_new"); 
      }
      else if(mouseY > 700 && mouseY < 740) {
        link("http://www.processingcities.org", "_new"); 
      }
      else if(mouseY > 780 && mouseY < 820) {
        link("http://www.vivomediaarts.com", "_new"); 
      }    
    } 
  }
  
}

