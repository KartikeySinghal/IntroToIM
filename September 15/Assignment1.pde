void setup() {                           // Used to set the size of canvas and call the main Face function

  size(500, 500);
  Face();
  
}

void Face() {                           //Draws the ellipse for the face and calls the functions for other face components

  fill(198, 136, 99);
  ellipse(height/2, width/2, 200, 230);
  Ears();
  noStroke();
  Mouth();
  Nose();
  Eyelid();
  Eye();
  Eyelashes();
  
}

void Eyelid() {                        //Draws the lower 'eyelids' using arcs

  fill(255);
  arc(200, 200, 50, 50, radians(20), radians(155)); //Eyelid1
  arc(300, 200, 50, 50, radians(20), radians(155)); //Eyelid2 
   
}

void Eyelashes() {                    //Draws the upper 'eyelids' using arcs

  fill(0);
  arc(203, 224, 80, 50, radians(215), radians(315), OPEN); //Eyelash1
  arc(303, 224, 80, 50, radians(215), radians(315), OPEN); //Eyelash2
  scale(-1, 1);
  
}

void Eye() {                         //Draws the eyeballs using circles

  fill(0);
  circle(200, 210, 10); //Eye1
  circle(300, 210, 10); //Eye2
  
}

void Nose() {                       //Draws the nose using a triangle

  fill(176, 108, 73);
  triangle(225, 275, 248, 230, 271, 275);
  
}

void Mouth() {                     //Draws the upperlip using a line and lower lip using an arc

  line(215, 336, 280, 336);//Upperlip
  fill(255);
  arc(250, 323, 80, 50, radians(35), radians(145), OPEN); //lowerlip
  
}

void Ears() {                     //Draws both ears using a combination of 2 arcs

  arc(160, 240, 60, 70, radians(90), radians(270),OPEN);//LeftEar
  arc(160, 240, 20, 30, radians(90), radians(270),OPEN);//LeftEar
  arc(342, 240, 60, 70, radians(270), radians(450),OPEN);//RightEar
  arc(342, 240, 20, 30, radians(270), radians(450),OPEN);//RightEar 
  
}
