int potentiometer = A1; //declares communication pin for the potentiometer
int buzzer = 6;         //declares pin for the buzzer
int RedPin1 = 9;        //declares pin for the first red LED
int RedPin2 = 10;       //declares pin for the second red LED
int RedPin3 = 11;       //declares pin for the third red LED
int button = 4;         //declares pin for the button
int prevButtonState = 0; //initializes the by default previous button state as 0/OFF

void setup() {
  // put your setup code here, to run once:
  pinMode(RedPin1, OUTPUT);   //pin for the first red LED
  pinMode(RedPin2, OUTPUT);   //pin for the second red LED
  pinMode(RedPin3, OUTPUT);   //pin for the third red LED
  pinMode(button, INPUT);     //pin for the button
  Serial.begin(9600);   // initialize serial communication at 9600 bits per second

}

void loop() {
  // put your main code here, to run repeatedly:
  potentiometer = analogRead(A1); //takes the analog reading of the potentiometer

  // prints the above value(for debugging)
  Serial.print("  Potentiometer value:");
  Serial.println(potentiometer);

  //checks if the button is pressed and was in O/OFF state before that, it plays a tone
  if (digitalRead(button) == HIGH && prevButtonState == 0) {

    tone(buzzer, potentiometer); //tone based on the analog value of the ptentiometer
    delay(500);  //delay added to not read multiple button presses
    prevButtonState = 1; //sets the button state as 1/ON
  }

  //checks if the button is pressed and was in 1/ON state before that, it stops the tone
  if (digitalRead(button) == HIGH && prevButtonState == 1) {

    noTone(buzzer);
    delay(500);   //delay added to not read multiple button presses
    prevButtonState = 0;  //sets the button state as 0/OFF

  }

  // the below 3 variables are used to controll the brightness of the 3 LEDs by mapping their values(0,255) to the analog readings of the potentiometer(0-1023, divided into 3 parts)
  int lightBrightness1 = map(potentiometer, 0, 340, 0, 255);
  int lightBrightness2 = map(potentiometer, 341, 681, 0, 255);
  int lightBrightness3 = map(potentiometer, 682, 1023, 0, 255);

  //the below 3 if statements regulate the lighting of 3 LEDs based on the analog readings of the potentiometer and the above 3 integers
  if (potentiometer < 341) {
    digitalWrite(RedPin2, LOW);
    digitalWrite(RedPin3, LOW);
    analogWrite(RedPin1,  lightBrightness1);
  }
  if (potentiometer >= 341 && potentiometer < 682) {
    digitalWrite(RedPin1, HIGH);
    digitalWrite(RedPin3, LOW);
    analogWrite(RedPin2, lightBrightness2);
  }
  if (potentiometer >= 682 && potentiometer < 1024) {
    digitalWrite(RedPin1, HIGH);
    digitalWrite(RedPin2, HIGH);
    analogWrite(RedPin3, lightBrightness3);
  }
}
