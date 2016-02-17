
int[] colorsMax = {50,100,80,180};
int[] colors = {255,255,255,255};
int start;
int counter = 0; //this is to manage 4 corners

int corner1end = 10;
int corner2end = 13;
int corner3end = 28;
int corner4end = 33;

int direction = 1;

Timer hello;

void setup() {
 size(1280,800); 
 start = millis();
}

void draw() {
  
  background(255);
  stroke(255);
  
  for(int y = 0; y < height/50; y++) {
    for(int i = 0; i < width/50; i++) {
       drawTriangle((100*i) + 50, (100*y), 50);
       drawTriangle((100*i) - 100, (100*y) - 50, 50);
    }
  }
  
  fill(0);
  int timer = millis()-start;
  text(timer, 20, 20);
  
  if(timer > 300) {
     println(counter); 
     start = millis();
     
     if(direction > 0) {
         if(counter < corner1end) {
           colors[0] = colors[0] - 5; 
         } else if(counter < corner2end) {
           colors[1] = colors[1] - 5;
         } else if(counter < corner3end) {
           colors[2] = colors[2] - 5;
         } else if(counter < corner4end) {
           colors[3] = colors[3] - 5;
           direction = -1;
         }
     } else {
       
         if(counter > corner3end) {
           colors[3] = colors[3] + 5;
         } else if(counter > corner2end) {
           colors[2] = colors[2] + 5;
         } else if(counter > corner1end) {
           colors[1] = colors[1] + 5;
         } else if(counter > 0) {
           colors[0] = colors[0] + 5; 
           direction = 1;
         }
     }
     
     counter += direction;
     
  
  }
}


void drawTriangle(int x,int y,int twidth) {
    fill(colors[0]);
    triangle(x, y, x - twidth, y + twidth, x, y+twidth);
    fill(colors[1]);
    triangle(x, y, x + twidth, y + twidth, x, y+twidth);
    fill(colors[2]);
    triangle(x - twidth, y + twidth, x, y+(2 *twidth), x, y+twidth);
    fill(colors[3]);
    triangle(x, y + twidth, x,  y + (2 *twidth), x + twidth, y + twidth);
}

void keyPressed() {
  if (key == '1') {
     colors[0] = colors[0] - 5; 
  }
  if (key == '2') {
     colors[1] = colors[1] - 5; 
  }
  if (key == '3') {
     colors[2] = colors[2] - 5; 
  }
  if (key == '4') {
     colors[3] = colors[3] - 5; 
  }
  
  if(key == 'r') {
    colors = new int[] {255,255,255,255};
  }
}
