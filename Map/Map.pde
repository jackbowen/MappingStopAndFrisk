// This program maps the Stop and Frisk data stored in the
// data directory of this program. Once it creates and saves
// an image to that same folder, it automatically exits. 

// Change this to any year with a corresponding csv file. At
// the time of writing this, this includes 2003-2016. Make
// sure to follow the yyyy year format.
String year = "2016";

//This image serves as the background
PImage mapBackground;

ArrayList<Stop> data = new ArrayList<Stop>();

// The opacity of the points is set so low to better
// visualize the density of stops in certain areas.
//float alpha = 13;
float alpha = 127;

int asianPacIslander; //blue
int black; //red
int amIndianAlaskan; //yellow
int blackHispanic; //green
int whiteHispanic; //cyan
int white; //magenta
int unknown;
int other; //white

void setup()
{
  // The size is set to the same as the background map.
  // It has a little room to crop it to an A2 at 300 dpi.
  //size(7020, 4950); 
  //mapBackground = loadImage("BigMap.jpg");
  
  size(13312, 13312);
  mapBackground = loadImage("biggerMap.jpg");
  image(mapBackground, 0, 0);
  //noStroke();
  strokeWeight(1.5);

  // Load the csv into an ArrayList 
  loadData();

  // Draw a dot for each stop
  mapPoints();
  
  // Save file and exit the program
  saveFile();
}

void draw()
{
}

void loadData()
{
  String[] lines = loadStrings(year + ".csv");
  for (String line : lines) {
    String[] pieces = split(line, ',');
    //int sex = int(pieces[0]); 
    //int age = int(pieces[1]);
    //int date = 0;//convertToDay(pieces[2]);
    char race = pieces[3].charAt(0);
    //boolean arrest = boolean(pieces[4]);
    float lat = float(pieces[5]);
    float lon = float(pieces[6]);
    //Stop temp = new Stop(sex, age, race, arrest, lat, lon);
    Stop temp = new Stop(race, lat, lon);
    data.add(temp);
  }
}

void mapPoints()
{
  //float yes = 0;
  //float no = 0;
  for (int i = 0; i < data.size(); i++)
  {
    //println(i);

    Stop temp = data.get(i);
    int strokeColor = 0;

    switch(temp.race)
    {
      //asian/pacific islander
      case 'A':
        fill(0, 0, 255, alpha); //TODO: delete?
        stroke(0, 0, 255, alpha); //TODO: delete?
        strokeColor = #0000FF;
        break;

      //black
      case 'B':
        fill(255, 0, 0, alpha);
        stroke(255, 0, 0, alpha);
        strokeColor = #FF0000;
        break;

      //american indian/alaskan
      case 'I':
        fill(255, 255, 0, alpha);
        stroke(255, 255, 0, alpha);
        strokeColor = #FFFF00;
        break;

      //black hispanic
      case 'P':
        fill(0, 255, 0, alpha);
        stroke(0, 255, 0, alpha);
        strokeColor = #00FF00;
        break;  

      //white hispanic
      case 'Q':
        fill(0, 255, 255, alpha);
        stroke(0, 255, 255, alpha);
        strokeColor = #00FFFF;
        break;

      //white
      case 'W':
        fill(255, 0, 255, alpha);
        stroke(255, 0, 255, alpha);
        strokeColor = #FF00FF;
        break;

      //other
      case 'Z':
        fill(0, alpha);
        stroke(0, alpha);
        strokeColor = #000000;
        break;
    }

    //adjust the lat and lon to align with the background map dimensions
    //float xPos = map(temp.lon, -74.557171, -73.352108, 0.0, 7020.0);
    //float yPos = map(temp.lat, 40.424082, 41.067445, 4950.0, 0.0);
    
    //adjust the lat and lon to align with the background map dimensions
    //float xPos = map(temp.lon, -74.311519, -73.744805, 0.0, 13312.0);
    float xPos = map(temp.lon, -74.311519, -73.7405, 0.0, 13312.0);
    float yPos = map(temp.lat, 40.480643, 40.913703, 13312.0, 0.0);

    //ellipse(xPos, yPos, 25, 25);
    markStop(xPos, yPos, strokeColor);
  }
  
  println("done");
}


void markStop(float x, float y, int strokeColor) {
  pushMatrix();
  translate(x,y);
  
  if (strokeColor == #0000FF) rotate(0); 
  else if (strokeColor == #FF0000) rotate(PI / 12); 
  else if (strokeColor == #FFFF00) rotate(PI / 6); 
  else if (strokeColor == #00FF00) rotate(PI / 4); 
  else if (strokeColor == #00FFFF) rotate(PI / 3); 
  else if (strokeColor == #FF00FF) rotate(5 * PI / 12); 
  else if (strokeColor == #000000) rotate(PI / 2); 
  
  int xLen = 3;
  stroke(strokeColor, 255); 
  line(-xLen, 0, xLen, 0);
  line(0, xLen, 0, -xLen);
  
  xLen = 15;
  stroke(strokeColor, 20); 
  line(-xLen, 0, xLen, 0);
  line(0, xLen, 0, -xLen);
  
  xLen = 30;
  stroke(strokeColor, 10); 
  line(-xLen, 0, xLen, 0);
  line(0, xLen, 0, -xLen);
  
  xLen = 45;
  stroke(strokeColor, 5); 
  line(-xLen, 0, xLen, 0);
  line(0, xLen, 0, -xLen);
  
  xLen = 60;
  stroke(strokeColor, 2); 
  line(-xLen, 0, xLen, 0);
  line(0, xLen, 0, -xLen);
  
  xLen = 75;
  stroke(strokeColor, 1); 
  line(-xLen, 0, xLen, 0);
  line(0, xLen, 0, -xLen);
  /*
  // Draw an x
  int xLen = 3;
  stroke(strokeColor, 255); 
  line(x - xLen, y - xLen, x + xLen, y + xLen);
  line(x - xLen, y + xLen, x + xLen, y - xLen);
  
  xLen = 15;
  stroke(strokeColor, 20); 
  line(x - xLen, y - xLen, x + xLen, y + xLen);
  line(x - xLen, y + xLen, x + xLen, y - xLen);
  
  xLen = 30;
  stroke(strokeColor, 10); 
  line(x - xLen, y - xLen, x + xLen, y + xLen);
  line(x - xLen, y + xLen, x + xLen, y - xLen);
  
  xLen = 45;
  stroke(strokeColor, 5); 
  line(x - xLen, y - xLen, x + xLen, y + xLen);
  line(x - xLen, y + xLen, x + xLen, y - xLen);
  
  xLen = 60;
  stroke(strokeColor, 2); 
  line(x - xLen, y - xLen, x + xLen, y + xLen);
  line(x - xLen, y + xLen, x + xLen, y - xLen);
  
  xLen = 75;
  stroke(strokeColor, 1); 
  line(x - xLen, y - xLen, x + xLen, y + xLen);
  line(x - xLen, y + xLen, x + xLen, y - xLen);
  */
  
  popMatrix();
}

void saveFile() {
  saveFrame(year + ".jpg");
  exit();
}
