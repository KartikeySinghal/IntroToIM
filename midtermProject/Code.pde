//To Do List:
//Place the ship at the centre   -> done
//Work on generating asteroids   -> done
//Figure out collision           -> done
//Add scoring system             -> done
//Add system control loop        -> done
//Add sound                      -> done
//Add astroid image              -> done
//Start and end screen           -> done
//Documentation                  -> done

import processing.sound.*;    //imports the processing library for sound
SoundFile song;              // creates a soundfile type variable

float xTrans, yTrans, zTrans; //used to translate the default axes to the center for P3D
int W = 3200;    //width for the grid used to draw the terrain
int H = 1400;    //height for the grid used to draw the terrain
int scls = 20;   //determines the size of each cell of the grid
int rows = H/scls;   //determines the number of rows relative to the size of each cell of the grid
int cols = W/scls;  //determines the number of coloumns relative to the size of each cell of the grid
int userScore = 0;  //initializes the user score
boolean playGame = false;  //sets the default state of the game as false -  this is eventually used to display the start and end screen
boolean startScreen = true;  //sets the default state of the start screen as true -  this is eventually used to display the start and end screen
float moving = 0;   //intializes the variable used to shift the grid eac second to replicate the effect of thr grid moving below the ship
float[][] terrain;  //declares the 2d array used to build the gri relative the number of rows and coloumns declared earlier
int endGameScore = 100;

void setup() {        
  fullScreen(P3D);  //sets the canvas size as the complete width adn height of the screen, also sets the work environemnt to 3d - this is used to rotate the 2d grid to give it a 3d effect
  //size(1200, 1000, P3D);
  xTrans = width/2;    //used to translate the default axes to the center for P3D
  yTrans = height/2;  //used to translate the default axes to the center for P3D
  zTrans = 0;        //used to translate the default axes to the center for P3D
  terrain = new float[cols][rows];  //intilizes the 2d array used to build the gri relative the number of rows and coloumns declared earlier
  astroid.drawAstroid();  //calls the raw astroid function for the first time -  this is done to display atleast 1 astroid as soon as the game starts
  song = new SoundFile(this, "Space.mp3");  //loads the required sound file - this serves as the soundtrack of the game
  song.play();  //plays the above sound file
}

void draw() {

  background(0);
  startScreen();  //calls the start screen function that eventually calls all the other functions and declares the various keybinds to navigate the game
}

//Astroid Class: Draws "asteroid" as circles at random locations and checks for their collison with the spaceship
class Astroid {

  float x, y, r;

  //Initalizer
  Astroid(float size) {
    x = 0;
    y = 0;
    r = size;
    randomCord();
  }

  void randomCord() {  //generates random coordinates for asteroids
    x = int(random(-400, width/2-100));
    y = int(random(-400, height/2-100));
  }

  void drawAstroid() {  //generates asteroids as circles uisng the above generated coordinates
    noStroke();
    fill(214, 129, 16);
    circle(x, y, r);
  }

  void collision() {
    //print("called" + "astroid : " + x + " " + y+ "ship : " + myShip.x + " " + myShip.y + "\r\n");
    //checks for collision between the astroid and the ship by using the dist function to calculate the distance between the asteroid coordiantes and the coordiantes for the middle of the ship - the default distance for collision 
    //has been set here as 30 pixels(radius of the asteroid)
    if (dist(astroid.x, astroid.y, myShip.x, myShip.y)<30) {
      randomCord();    //calls the random coordinate generator function
      drawAstroid();  //calls the function to draw the asteroids
      userScore++; //increments the user score after every successful collision
    }
  }
}

//Spaceship clas: Draws the spaceship using begin,end shape. Also regulates the keybinds for the movement of the ship
class SpaceShip {

  float x, y, z, Yspeed, Xspeed;

  //Initalizer
  SpaceShip(float xCoord, float yCoord, float zCoord, float XSpeed, float YSpeed) {
    x = xCoord;
    y = yCoord;
    z = zCoord; 
    Yspeed = YSpeed;
    Xspeed = XSpeed;
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
  }

  //The below function regulates the keybinds for the movement of the ship; it also changes the keystroketo BACKSPACE so it calls the endscreen function to end the game on collision with the screen boundaries
  void MoveShip() {

    if (key == 'A'||key == 'a') {
      x-=Xspeed;
      if (x-Xspeed<=-950) {
        key = BACKSPACE;
      }
    }
    if (key == 'D'||key == 'd') {
      x+=Xspeed;
      if (x+Xspeed>=width/2) {
        key = BACKSPACE;
      }
    }
    if (key == 'W'||key == 'w') {
      y-=Yspeed;
      if (y-Yspeed<=-550) {
        key = BACKSPACE;
      }
    }
    if (key == 'S'||key == 's') {
      y+=Yspeed;
      if (y+Yspeed>=height/2) {
        key = BACKSPACE;
      }
    }
  }

}

//Landscape class: Draws the moving terrain generated below the ship
class Landscape {

  int row, col, scl;

  //Initalizer
  Landscape(int Row, int Col, int Scl) {
    col=Col;
    row=Row;
    scl=Scl;
  }

  //it loops over the number of each row and coloumn as declared in setup and then draws a vertex at that postion to make a grid
  void drawScape() {
    for (int y = 0; y<rows-1; y++) {
      beginShape(TRIANGLE_STRIP);
      for (int x = 0; x<cols; x++) {
        stroke(255);
        strokeWeight(1);
        noFill();
        vertex(x*scl, y*scl, terrain[x][y]);
        vertex(x*scl, (y+1)*scl, terrain[x][y+1]);
      }
      endShape();
    }
  }
}

//Initializes instances of all the classes defined above
SpaceShip myShip = new SpaceShip(0, 0, 0, 5, 5);
Landscape myScape = new Landscape(rows, cols, scls);
Astroid astroid = new Astroid(30);

void gameStart() {


  moving -=0.07;  //moves the grid backward each frame to make it look that the spaceship is flying
  float yoff = moving; //this variable is used with the noise function below to regulate how much the vertices in y-axis are pulled up or down
  for (int y = 0; y<rows; y++) {  //loop through all the rows and coloumns of the grid generated above
    float xoff = 0;  //this variable is used with the noise function below to regulate how much the vertices in x-axis are pulled up or down
    for (int x = 0; x<cols; x++) {
      terrain[x][y] = map(noise(xoff, yoff), 0, 1, -170, 170); //each cell of the grid is offsetted by the value generated by the perlin noise function - the map function maps the deafult valuesd of 0 and 1 to -170 and 170 to generate the ups and downs in the terrain
      xoff+=0.1; //increments the x-offset to determine how large the difference between each instance of noise generation should be. Since this determines the relative pulling up of vertices, it eventually determines how smooth the terrain should be or how quicly it should change
    }
    yoff+=0.1;  //increments the x-offset to determine how large the difference between each instance of noise generation should be. Since this determines the relative pulling up of vertices, it eventually determines how smooth the terrain should be or how quicly it should change
  }

  pushMatrix(); //push and pop are used here to restrict the translations done to centre the asteroid and ship remain local to these two

  translate(xTrans, yTrans, zTrans);
  astroid.drawAstroid(); 
  astroid.collision();
  myShip.DrawShip();

  popMatrix();

  pushMatrix();  //push and pop are used here to restrict the translations done to centre thegrid remain local to it

  translate(width/2, height/2+250);
  rotateX(PI/3);
  translate(-W/2, -H/2);
  myScape.drawScape();

  popMatrix();

  myShip.MoveShip();

  //used to display the user score while the game is being played
  fill(255);
  textSize(20);
  text("Score: " + userScore, 0, 20);
}

//Draws the start screen of the game with all the instructions and the logo - it also declares the keybinds used to naviagte the game
void startScreen() {

  //loads the origianl logo for the asteroid game made by atari
  PImage img;
  img = loadImage("logo.png");

  //draws the start screen based on the default state of the game when it starts
  if (playGame == false & startScreen == true) {
    fill(255);
    textSize(30);
    image(img, width/2-258, height/2-450);
    text("Instructions: ", width/2-400, height/2-160);
    text("1. Move your ship using W,S,A,D", width/2-400, height/2-120);
    text("2. Collide with asteroids to destroy them - first to 100 wins!", width/2-400, height/2-80);
    text("3. Beware! for you loose if you collide with the screen walls", width/2-400, height/2-40);
    text("Press Enter to Start||Press Backspace to End", width/2-270, height/2+200);
  }

  //keybind to start the game
  if (key == ENTER ) {
    playGame = true;
    userScore = 0;
    myShip.x = 0;
    myShip.y = 0;
  }

  //starts the game if the other keybind is entered
  if (playGame==true) {
    gameStart();
  }

  //keybind to go to the end screen
  if (key == BACKSPACE) {
    playGame = false;
    startScreen = false;
    endScreen();
  }
  
  //if the user destroys 100 asteroid, they win the game and the keybind is set to BACKSPACE to end the game
  if(userScore == endGameScore) {
    key = BACKSPACE;
  }
}

//draws the end screen to display the user score and give the option to restart or exit the programme
void endScreen() {

  fill(255);
  textSize(30);

  //keybind to stop the programme and force exit
  if (key==ESC) {
    exit();
  }

  //keybind to restart the game from the end screen
  if (key == ENTER ) {
    playGame = true;
    userScore = 0;
  }
  
  //if the user destroys 100 asteroid, they win the game. The below message is thus displayed
  if (userScore == endGameScore) {
    text("Congratulations! you WON the game:)", width/2-250, height/2-50);
    text("Score:" + userScore, width/2-20, height/2);
    text("Press Enter to Start||Press Escape to Exit", width/2-258, height/2+100);
  } 
  
  //if the user crashes with the walls, they loose the game. The below message is thus displayed
  else {
    text("Awww you crashed :( Better luck next time!", width/2-280, height/2-50);
    text("Score:" + userScore, width/2-20, height/2);
    text("Press Enter to Start||Press Escape to Exit", width/2-258, height/2+100);
  }
}
