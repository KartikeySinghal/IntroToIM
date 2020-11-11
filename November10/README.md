# Assignment 8
## Get information from at least one analog sensor and at least one digital sensor (switch), and use this information to control at least two LEDs, one in a digital fashion and the other in an analog fashion, in some creative way

For Assignment 8, I wanted to experiment with sound. So I used a buzzer in combination with a potentiometer, a button and 3 LEDs. I take the reading of the potentiometer and pass that under the "tone" function to the the buzzer to produce a tone relative to the reading of the potentiometer. But the sound is only produced when the button is pressed, thus acting like a toogle switch where the sound is produced until you press the button again. The 3 LEDs, by a combination of digital and analog write represent a sort of bar graph where the reading of the potentiometer regulates the brightness and the number of LEDs being lit up. 


Schematic:

![](schematic.jpg)

Video:

[![Watch the video]()](https://youtu.be/tEZSeaMUdNY)

It was fun to figure out how to use the buzzer and to test what kind of sounds it could produce. I experimented with directly connecting the potentiometer to the buzzer but that way I couldn't take the readings of the potentiometer(required for the LEDs). So then I experimented with the 2 different resistors and found how the amount of resistance was affecting the max volume of the buzzer. I ended up using the 330 ohm resistor since that suited my usecase the best. It was also fun to think about how to spread out the readings of the potentiometer over 3 LEDs and to incorporate both analog and digital write. For this I split the range of potentiometer(0-1023) and split it into 3 intervals. So if, for example, the reading is 340(first range is 0-340), the first LED lights up at full brightness. But if the reading is 341, in addition to the first LED being lit up at all full brightness, the second LED lights up at its lowest brightness.
