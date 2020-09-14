void setup() {
  size(500, 500);
  Face();
}

void Face() {
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

void Eyelid() {
  fill(255);
  arc(200, 200, 50, 50, radians(20), radians(155)); //Eyelid1
  arc(300, 200, 50, 50, radians(20), radians(155)); //Eyelid2
}

void Eyelashes() {
  fill(0);
  arc(203, 224, 80, 50, radians(215), radians(315), OPEN); //Eyelash1
  arc(303, 224, 80, 50, radians(215), radians(315), OPEN); //Eyelash2
  scale(-1, 1);
}

void Eye() {
  fill(0);
  circle(200, 210, 10); //Eye1
  circle(300, 210, 10); //Eye2
}

void Nose() {
  fill(176, 108, 73);
  triangle(225, 275, 248, 230, 271, 275);
}

void Mouth() {
  line(215, 336, 280, 336);//Upperlip
  fill(255);
  arc(250, 323, 80, 50, radians(35), radians(145), OPEN); //lowerlip
}

void Ears() {
  arc(160, 240, 60, 70, radians(90), radians(270),OPEN);//LeftEar
  arc(160, 240, 20, 30, radians(90), radians(270),OPEN);//LeftEar
  arc(342, 240, 60, 70, radians(270), radians(450),OPEN);//RightEar
  arc(342, 240, 20, 30, radians(270), radians(450),OPEN);//RightEar
}
