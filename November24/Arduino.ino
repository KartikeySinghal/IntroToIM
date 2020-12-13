int green_button = 2; //declaration of the pins of all  inputs
int red_button = 3;
int yellow_button = 4;            
int blue_button = 5;
int potentiometer = A0;

void setup()
{
  Serial.begin(9600);   
  pinMode(green_button, INPUT);
  pinMode(red_button, INPUT);           
  pinMode(yellow_button, INPUT);            
  pinMode(blue_button, INPUT);
  pinMode(potentiometer,INPUT);
}

void loop() {
  Serial.print(digitalRead(green_button));
  Serial.print(",");
  Serial.print(digitalRead(red_button));         // display on the serial moniter the valus of each of the button in a format that will allow it to be made sliced and stored in a array for processing
  Serial.print(",");
  Serial.print(digitalRead(yellow_button));
  Serial.print(",");
  Serial.print(digitalRead(blue_button));
  Serial.print(",");
  Serial.println(analogRead(potentiometer));  //last character is printed with ln to distiinguish between new inputs and old inputs
}
