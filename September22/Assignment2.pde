void setup() {
  size(500, 500);
  frameRate(1);  //limits the fps to 1 to give it a "clock" like feel
}

void draw() {
  int time = second();  // refreshes the time variable each frame with an updated value of seconds

  background(random(100, 250), random(100, 250), random(100, 250)); //refreshes the background each second with a new pastel colour

  text("Clock: " + time, 10, 15);  // displays the number of seconds on the actual sketch

  drawRectangle(time, 25); // calls the function to draw the actual rectangles
}

void drawRectangle(int numberOfRectangles, int lengthOfTail) {

  for (int i = 0; i<numberOfRectangles; i++) {  //for loop to regulate the number of triangles to be printed each frame, in this case trhe number is the value of seconds on the system clock

    //Randomizes the position of the initial rectangles - the limits were chosen so as to prevent the rectangles from going out of the screen
    float xCoord = random(100, width-100);
    float yCoord = random(100, height-100);

    //Randomizes the size of the initial rectangles
    float xSize = random(10, 100);
    float ySize = random(10, 100);

    //counter for the number of times the below for-loop runs - used to limit the number of "tail" rectangles printed to the user-specified lengthOfTail variable
    int count = 0;

    //This loop prints the "tail" of the initial rectangles printed by the above piece of code
    for (float a = yCoord; count<lengthOfTail; a++) { // a is initialized with the y coordinate of the main rectangle to enable the other rectangles to follow the main rectangle

      count ++;  //incrementer for the count variable above

      if (count == 0) {
        fill(random(100, 250), random(100, 250), random(100, 250));
      } else {
        fill(255);
      }

      // strokeWeight(random(1, 2)); // switches between 2 stroke weights for variablity so that the "tail" looks more interesting

      rect(xCoord, a, xSize, ySize); //draws the actual rectangle

      xCoord -=2; // shifts the next rectangle by 2 units
    }
  }
}
