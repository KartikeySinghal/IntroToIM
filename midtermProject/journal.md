# Journal for the Midterm Project

### Idea: 
For the midterm project, I intent to recreate the astroid destroyer game. It will have a ship, flying over an endlessley genereated terrain, and controled by the users' keyboard inputs(W,S,A,D). The game appearance of astroid/ther movement speed of the ship will increase linearly with time making it more difficullt as time by. I might add 2-3 lives for the user at a cost for points

### Objective:
Destroy as many astroids as possible without dying

### Inspiration:

![](asteroids.jpg)

#### 24th October:
Since I was working on the project before making the journal, I added the progress I made so far. It inlcudes an infinite terrain generated using perlin noise and a ship. Both of these were made using beginShape-endShape. I also implemented the movement of the ship using W,S,A,D keys


#### 25th October:
I added  a syte loop to start the program and call all other functions. I also made the astroid class which generates "astroids" which are simply circles at a random position. It also has a collision function which calculates the distance between the astroid's position and the ship's position. If the distance is less than 30 pixels(the astroid is a circle of size 30), it detects the collsion and generates a new astroid. It will eventually also increment the score.


#### 26th October:
Today I made the start and end screen, comprising of the original Asteroid game Logo. I also added keybinds to the system loop so that the user can navigate the game and restart it without having to end or restart the entire programme. Today was interesting since it helped me to think about the nexting of various classes and their functions while calling everything from thr main system loop.
