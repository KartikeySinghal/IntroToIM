//To Do List:
//Place the ship at the centre   -> done
//Work on generating asteroids   -> done
//Figure out collision           -> done
//Add scoring system
//Add system control loop
//Start and end screen
//Documentation

float xTrans, yTrans, zTrans;

int W = 3200;
int H = 1400;
int scls = 20;
int rows = H/scls;
int cols = W/scls;

float moving = 0;

float[][] terrain;

void setup() {        
  //fullScreen(P3D);
  size(1200, 1000, P3D);
  xTrans = width/2;
  yTrans = height/2;
  zTrans = 0;
  //rows = W /scls;
  //cols = H/scls;
  terrain = new float[cols][rows];
  astroid.drawAstroid();


  //frameRate(2);
  //print(width/2,height/2);
}

void draw() {

  background(0);
  gameStart();
  //astroid.drawAstroid();
  //astroid.collision();
}



class Astroid {

  float x, y, r;

  Astroid(float size) {
    x = 0;
    y = 0;
    r = size;
    randomCord();
  }

  void randomCord() {
    x = int(random(-400, width/2-100));
    y = int(random(-400, height/2-100));
  }

  void drawAstroid() {
    //print(x, y);
    fill(57, 255, 20);
    circle(x, y, r);
    //collision();
  }

  void collision() {
    //print("called" + "astroid : " + x + " " + y+ "ship : " + myShip.x + " " + myShip.y + "\r\n");

    if (dist(astroid.x, astroid.y, myShip.x, myShip.y)<30) {
      print("collision");
      randomCord();
      drawAstroid();
    }
  }
}

class SpaceShip {

  float x, y, z, Yspeed, Xspeed;

  SpaceShip(float xCoord, float yCoord, float zCoord, float XSpeed, float YSpeed) {
    x = xCoord;
    y = yCoord;
    z = zCoord; 
    Yspeed = YSpeed;
    Xspeed = XSpeed;
    //print(xCoord,yCoord);
  }

  void DrawShip () {
    strokeWeight(4);
    stroke(255);
    fill(250, 38, 160);
    beginShape(QUAD_STRIP);
    vertex(x-30, y, z);
    vertex(x-15, y-15, z);
    vertex(x-15, y+15, z);                                      
    vertex(x, y-15, z);                         
    vertex(x, y+15, z);
    vertex(x+15, y-15, z);
    vertex(x+15, y+15, z);
    vertex(x+30, y, z);
    endShape();

    //print(x,y);
  }

  void MoveShip() {
    //3print("Key is " + key, x, y);
    if (key == 'A'||key == 'a') {
      x-=Xspeed;
      if (x-Xspeed<=-500) {
        key = 'D';
      }
    }
    if (key == 'D'||key == 'd') {
      x+=Xspeed;
      if (x+Xspeed>=width/2-50) {
        key = 'A';
      }
    }
    if (key == 'W'||key == 'w') {
      y-=Yspeed;
      if (y-Yspeed<=-500) {
        key = 'S';
      }
    }
    if (key == 'S'||key == 's') {
      y+=Yspeed;
      if (y+Yspeed>=height/2-50) {
        key = 'W';
      }
    }
  }
}

class Landscape {

  int row, col, scl;

  Landscape(int Row, int Col, int Scl) {
    col=Col;
    row=Row;
    scl=Scl;
  }

  void drawScape() {
    for (int y = 0; y<rows-1; y++) {
      beginShape(TRIANGLE_STRIP);
      for (int x = 0; x<cols; x++) {
        stroke(255);
        strokeWeight(1);
        noFill();
        vertex(x*scl, y*scl, terrain[x][y]);
        vertex(x*scl, (y+1)*scl, terrain[x][y+1]);
        //rect(x*scl, y*scl, scl, scl);
      }
      endShape();
    }
  }
}

SpaceShip myShip = new SpaceShip(0, 0, 0, 5, 5);
Landscape myScape = new Landscape(rows, cols, scls);
Astroid astroid = new Astroid(30);

void gameStart() {
  moving -=0.07;

  float yoff = moving;
  for (int y = 0; y<rows; y++) {
    float xoff = 0;
    for (int x = 0; x<cols; x++) {
      terrain[x][y] = map(noise(xoff, yoff), 0, 1, -170, 170);
      xoff+=0.1;
    }
    yoff+=0.1;
  }

  pushMatrix();
  translate(xTrans, yTrans, zTrans);
  // print(width,height);
  astroid.drawAstroid();
  astroid.collision();
  myShip.DrawShip();
  popMatrix();
  //noLoop();

  pushMatrix();
  translate(width/2, height/2+250);
  rotateX(PI/3);
  translate(-W/2, -H/2);

  myScape.drawScape();
  popMatrix();

  myShip.MoveShip();
}
