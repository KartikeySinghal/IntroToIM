// Serial library to communicate with arduino
import processing.serial.*;

Serial myPort;  // The serial port

// Stores the incoming data from potentiometers and the 3 buttons
float inValue1 = 0;
float inValue2 = 0;
int button1 = 0;
int button2 =0;
int button3 = 0;


// used to keep track of old line positions
float lastX = 0;
float lastY = 0;

void setup() {
  size(displayWidth, displayHeight);
  // Lists all the available serial ports
  printArray(Serial.list());

  // Opens the port in use by arduino and specifies the communication rate
  myPort = new Serial(this, Serial.list()[2], 9600);
  myPort.bufferUntil('\n');   //waits until the new line character to take a new input

  //attributes of the drawing space
  background(0);
  stroke(255);  
  strokeWeight(5);
}

void draw() {
  
  buttonFunctions(); //calls the button functuionality

  // map these values so they are scaled to the sketch
  float x = map(inValue1, 0, 255, 0, width);
  float y = map(inValue2, 0, 255, 0, height);

  // draws a lien with the incomming coordinates and the past coordinates
  line(x, y, lastX, lastY);

  // reset the lastX and lastY to original value
  lastX = x;
  lastY = y;
}

//Function to read the incoming values from arduino
void serialEvent(Serial myPort) 
{
  String inString = myPort.readStringUntil('\n');

  if (inString != null) {
    inString = trim(inString);                                // taking the input values from arduino as a string and slicing them and putting them in strings as indivdual variables for each button
    float[] arduino_input = float(split(inString, ","));
    if (arduino_input.length >= 5) {
      //stores the incoming values from the array into their corresponding variables
      inValue1 = arduino_input[0];
      inValue2 = arduino_input[1];
      button1 = (int)arduino_input[2]; //I used a float type array and converted it to int and not the other way around since this way its more accurate for the float values
      button2 = (int)arduino_input[3];
      button3 = (int)arduino_input[4];
    }
  }
}

//Function to assign functionality to the buttons
void buttonFunctions() {
  if (button3 == 1) {   //Clears the drawing space
    background(0);
    stroke(0);
  }
  if (button2 == 1) {   //saves a screenshot and gives it a name based on frame count
    saveFrame();
  }
  if (button1 == 1) {   //changes the stroke color to a new, random color
    stroke(random(0, 255), random(0, 255), random(0, 255));
  }
}
