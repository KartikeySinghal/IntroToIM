//Pokemon Types: Grass, Fire, Water,Bug,Normal,Poison,Fairy,Fighting,Psychic, Rock,Electric,Ghost,Ice,Dark,Steel,Ground,Dragon,Misc.

Table Pokemon; //initializes the table which will contain the required data
String poke;
String myString = "";  //initializes the global string used for taking the user input

void drawHPCircle() {  //function for loading the data and drawing the circles based on the HP(Health Points) of each Pokemon based on their type, as specified by the user
  Pokemon = loadTable("Pokemon.csv", "header");  //loads the csv file, the header tag specifies that the csv file has its first row as a header with the categories

  for (TableRow row : Pokemon.rows()) {  //loops through the data file

    String Type = row.getString("Type 1"); //stores the type of the pokemon as a string
    //println("called");

    if (Type.equals(myString) == true) {  //gets the data for the user-specified type of pokemon by comparing the user-string with type-string for pokemon data
      //println("success");

      //println(row.getString("Type 1"));
      int size = int(row.getString("HP"));  //stores the HP of Pokemon as a integer
      //println(size);
      
      float xCord = random(30, width-30);
      float yCord = random(30, height-30);

      circle(xCord, yCord, size); // makes the circle with the above random coordinates and the size as the HP of the Pokemon
    } 
  }
}


void initialize() {  //Code for printing the start screen of the programme
  background(0);
  
  PImage img;
  img = loadImage("PokemonLogo.png");  //loads the Pokemon Logo as the image
  
  fill(247, 208, 44);
  textSize(30);
  image(img,width/2-200,height/2-450);
  text("Welcome to the Pokedex HP Visitualization!!",width/2-310,height/2-200);
  text("Please press enter and type a category from the below list: ",width/2-410,height/2-150);
  text("Note: Enter the word in no caps. Type exit to exit ",width/2-350,height/2-100);
  text("Normal",width/2-150,height/2-50);
  text("Fire",width/2-150,height/2-20);
  text("Water",width/2-150,height/2+10);
  text("Electric",width/2-150,height/2+40);
  text("Grass",width/2-150,height/2+70);
  text("Ice",width/2-150,height/2+100);
  text("Fighting",width/2-150,height/2+130);
  text("Poison",width/2-150,height/2+160);
  text("Ground",width/2-150,height/2+190);
  text("Flying",width/2-150,height/2+220);
  text("Psychic",width/2-150,height/2+250);
  text("Bug",width/2-150,height/2+280);
  text("Rock",width/2-150,height/2+310);
  text("Ghost",width/2-150,height/2+340);
  text("Dragon",width/2-150,height/2+370);
  text("Dark",width/2-150,height/2+400);
  text("Steel",width/2-150,height/2+430);
  text("Fairy",width/2-150,height/2+460);
  
}

void setup() {
  
  size(1000, 1000);
  myString = "";
  initialize();
  
}

void draw() {
  
  fill(255);
  textSize(60);
  text(myString, width/2-60, height/2); //initializes the place where the user-input is "displayed"
  
}

void keyPressed() {  // uses the keypressed function to take the user-input
  
  if (key == ENTER) {  // if the enter key is pressed it calls the functions to choose the corresponding type of pokemon and draw the circles
    
    background(0);
    chooseType();
    drawHPCircle();
    myString = "";
    
  } 
  
  else {
    
    myString += key; //appends each key entered to the myString and passes the whole string when the user presses ENTER
    
  }
}

void chooseType() {  //class for converting a lowercase entered word into the data-friendly form (example dog to Dog) and also decides the colour of the circles based on the type selected

  println(myString + ".");

  if (myString.equals("fire") == true) {
    myString = "Fire";
    fill(238, 129, 48);
  }

  if (myString.equals("water")== true) {
    myString = "Water";
    fill(99, 144, 240);
  }

  if (myString.equals("grass")== true) {
    myString = "Grass";
    fill(122, 199, 76);
  }

  if (myString.equals("ghost")== true) {
    myString = "Ghost";
    fill(115, 87, 151);
  }

  if (myString.equals("bug")== true) {
    myString = "Bug";
    fill(166, 185, 26);
  }

  if (myString.equals("normal")== true) {
    myString = "Normal";
    fill(168, 167, 122);
  }

  if (myString.equals("poison")== true) {
    myString = "Poison";
    fill(163, 62, 161);
  }

  if (myString.equals("fairy")== true) {
    myString = "Fairy";
    fill(214, 133, 173);
  }

  if (myString.equals("psychic")== true) {
    myString = "Psychic";
    fill(249, 85, 135);
  }

  if (myString.equals("rock")== true) {
    myString = "Rock";
    fill(182, 161, 54);
  }

  if (myString.equals("electric")== true) {
    myString = "Electric";
    fill(247, 208, 44);
  }
  
  if (myString.equals("ice")== true) {
    myString = "Ice";
    fill(150, 217, 214);
  }
  
  if (myString.equals("dark")== true) {
    myString = "Dark";
    fill(112, 87, 70);
  }
  
  if (myString.equals("steel")== true) {
    myString = "Steel";
    fill(183, 183, 206);
  }
  
  if (myString.equals("ground")== true) {
    myString = "Ground";
    fill(226, 191, 101);
  }
  
  if (myString.equals("dragon")== true) {
    myString = "Dragon";
    fill(111, 53, 252);
  }
  
  if (myString.equals("fighting")== true) {
    myString = "Fighting";
    fill(194, 46, 40);
  }
  
  if (myString.equals("flying")== true) {
    myString = "Flying";
    fill(169, 143, 243);
  } 
  
  if(myString.equals("exit")== true) {
    exit();
  }
  else {
    //background(0);
    text("Error: Pokemon type not found", width/2-80, height/2);
    background(0);
  }
}
