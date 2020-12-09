int potentiometer1 = A0;  //declares pin for the first potentiometer
int potentiometer2 = A1;  //declares pin for the second potentiometer
int pushButton1 = 11;  //declares pin for the first button
int pushButton2 = 12; //declares pin for the second button
int pushButton3 = 13; //declares pin for the third button

void setup() {
  Serial.begin(9600);   // initialize serial communication at 9600 bits per second
  pinMode(potentiometer1,INPUT);  //pin for first potentiometer
  pinMode(potentiometer2,INPUT);  //pin for second potentiometer
  pinMode(pushButton1,INPUT);
  pinMode(pushButton2,INPUT);
  pinMode(pushButton3,INPUT);
}
  
void loop() {

  int Pvalue1 = analogRead(potentiometer1); //reads the value of the first potentiometer
  int Pvalue2 = analogRead(potentiometer2); //reads the value of the second potentiometer

  int mappedValue1 = map(Pvalue1, 0, 1023, 0, 255); //maps the above values, ranging from 0-1023 to 0-255
  int mappedValue2 = map(Pvalue2, 0, 1023, 0, 255);

  //Prints the above values into the serial to send to processing
  Serial.print(mappedValue1);
  Serial.print(",");
  Serial.print(mappedValue2);   // display on the serial moniter the valus of each of the button in a format that will allow it to be made sliced and stored in a array for processing
  Serial.print(",");
  Serial.print(digitalRead(pushButton1));
  Serial.print(",");
  Serial.print(digitalRead(pushButton2));
  Serial.print(",");
  Serial.println(digitalRead(pushButton3));

  /*Buttons:
   * 1. Clear Drawing Space
   * 2. Select Random color
   * 3. Take Screenshot
   */
}
