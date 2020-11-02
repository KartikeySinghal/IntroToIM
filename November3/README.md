# Assignment 7 - BACACA Road
## Using at least three momentary switches (often called buttons), and at least three LEDs, create a puzzle that can be solved by pressing the buttons. Each switch must not simply turn on a corresponding LED.Using at least three momentary switches (often called buttons), and at least three LEDs, create a puzzle that can be solved by pressing the buttons. Each switch must not simply turn on a corresponding LED.


For Assignment 7, my puzzel is named Bacaca Road, named after a road in the Philipenes. It has 4 LEDs and 3 buttons. The player is supposed to press the 3 buttons in a specific order to win. If the buttons are pressed in the correct order, all the leds flash to indicate a win. If not, the red led blinks to indicate a loss. To restart, the reset on the arduino board can be used. 

Schematic:

![](schematic.jpg)

Video:

![](WinCase.gif)

It was difficult to figure out how to track userinputs in particular order and the compare it with the correct order. I tried to make an array of correct order and then compare it with the array of user input. But for some reason it didn't work the way I wanted to. So I ended up making a integer, "buttonSum" that the button value is added to. So for example if my first button is in pin 10 and if the user pressed it once, the "buttonSum" would be updated to 10.
