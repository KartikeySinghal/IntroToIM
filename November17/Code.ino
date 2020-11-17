int firstNote = 0;    //integer for storing the frequency of the note corresponding to the first(green) button
int secondNote = 0;   //integer for storing the frequency of the note corresponding to the second(red) button
int thirdNote = 0;    //integer for storing the frequency of the note corresponding to the third(yellow) button
int firstKeyPin = 2;  //pin for the first(green) button
int secondKeyPin = 3; //pin for the second(red) button
int thirdKeyPin = 4;  //pin for the third(yellow) button
int buzzerPin = 10;   //pin for the buzzer

//the 3 arrays correspond to a set of 3 different set of notes(their frequencies)
int noteFreq1[] = {262, 294, 330}; //C,D,E
int noteFreq2[] = {349, 392, 440};//F,G,A
int noteFreq3[] = {494, 523, 587};//B,C,D

int notes[] = {firstNote, secondNote, thirdNote}; //array for the integer to store the notes for the 3 buttons

void setup() {
  //set the button pins as inputs

  pinMode(firstKeyPin, INPUT);
  pinMode(secondKeyPin, INPUT);
  pinMode(thirdKeyPin, INPUT);

  //set the buzzer pin as an output
  pinMode(buzzerPin, OUTPUT);
  Serial.begin(9600);
}

void loop() {
  
  int potentiometer = analogRead(A0); //integer to store the analog value of the potentiometer
  Serial.println(potentiometer);  //for debugging, print the above value

  //The below 3 if statements crrespond to the three ranges of the potentiomter(0-340,341-681,682-1023) 
  if (potentiometer < 341) {
    for (int i = 0; i < 3; i++ ) {  //sets the 3 notes of the button in relation to the value of the potentiometer by calling the appropriate array
      notes[i] = noteFreq1[i];
      playNote();
    }
  }

  if (potentiometer >= 341 && potentiometer < 682) {
    for (int i = 0; i < 3; i++ ) {
      notes[i] = noteFreq2[i];
      playNote();
    }
  }


  if (potentiometer >= 682 && potentiometer < 1024) {
    for (int i = 0; i < 3; i++ ) {
      notes[i] = noteFreq3[i];
      playNote();
    }
  }
}

//Function to assign the values of the notes to each button depending on the value of the potentiometer. Also checks for button press and plays the note when corresponding button is pressed
void playNote() {

  if (digitalRead(firstKeyPin) == HIGH) {      
    tone(buzzerPin, notes[0]);                     
    //Serial.println(digitalRead(firstKeyPin));
  }
  else if (digitalRead(secondKeyPin) == HIGH) { 
    tone(buzzerPin, notes[1]);                     
    //Serial.println(digitalRead(secondKeyPin));
  }
  else if (digitalRead(thirdKeyPin) == HIGH) { 
    tone(buzzerPin, notes[2]);                     
    //Serial.println(digitalRead(thirdKeyPin));
  }
  else {
    noTone(buzzerPin);                        //if no key is pressed turn the buzzer off
  }
}

//Table used to set note frequencies
/*
  note  frequency
  c     262 Hz
  d     294 Hz
  e     330 Hz
  f     349 Hz
  g     392 Hz
  a     440 Hz
  b     494 Hz
  C     523 Hz
  d     587 Hz
*/
