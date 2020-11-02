const int pushButton = 11;  //declares pin for the first button
const int pushButton2 = 12; //declares pin for the second button
const int pushButton3 = 13; //declares pin for the third button
int correctOrd[] = {12, 11, 13, 11, 13, 11}; //213131
int buttonSum = 0;  //tracks the sum of the value of pins of the button pressed
int counter = 0; //vriable to track the number of buttons pressed

void setup() {
  
  Serial.begin(9600);  // initialize serial communication at 9600 bits per second
  pinMode(7, OUTPUT);   //pin for blue led
  pinMode(8, OUTPUT);   //pin for yellow led
  pinMode(9, OUTPUT);   //pin for green led
  pinMode(10, OUTPUT);  //pin for red led
  pinMode(pushButton, INPUT);   //pin for 1st(yellow) button
  pinMode(pushButton2, INPUT);  //pin for 2nd(green) button
  pinMode(pushButton3, INPUT);  //pin for 3rd(red) button
}

void loop() {

  //checks the first button if its pressed
  if (digitalRead(pushButton) == HIGH) {
    counter++;
    buttonSum += pushButton;
    //digitalWrite(pushButton, LOW);
    delay(500);
  }

  //checks the second button if its pressed
  if (digitalRead(pushButton2) == HIGH) {
    counter++;
    buttonSum += pushButton2;
    //digitalWrite(pushButton2, LOW);
    delay(500);
  }

  //checks the third button if its pressed
  if (digitalRead(pushButton3) == HIGH) {
    counter++;
    buttonSum += pushButton3;
    //digitalWrite(pushButton3, LOW);
    delay(500);
  }

  //If hit in order, the buttonSum will be equal to 71 and the number of buttons pressed will be 6 - So all LEDs falsh to indicate success
  if (buttonSum == 71 & counter == 6) {
    digitalWrite(7, HIGH);
    digitalWrite(8, HIGH);
    digitalWrite(9, HIGH);
    digitalWrite(10, HIGH);
  }
  //if buttonSu rises above 71, the user has lost and a red led flashes
  else if (buttonSum > 71) {
    digitalWrite(10, HIGH);
    delay(30);
    digitalWrite(10, LOW);
    delay(30);

  }
  //ifnumber of buttons pressed rises above 6,the user has lost and a red led flashes
  else if (counter > 6) {
    digitalWrite(10, HIGH);
    delay(30);
    digitalWrite(10, LOW);
    delay(30);

  }
  else { //prints the sum of buttons and counter of buttons for debugging
    Serial.println(buttonSum);
    Serial.println(counter);
  }

  delay(1);
}
