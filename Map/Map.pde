// This program maps the Stop and Frisk data stored in the
// data directory of this program. Once it creates and saves
// an image to that same folder, it automatically exits. 

// Change this to any year with a corresponding csv file. At
// the time of writing this, this includes 2003-2016. Make
// sure to follow the yyyy year format.
String year = "2015";

//This image serves as the background
PImage mapBackground;

ArrayList<Stop> data = new ArrayList<Stop>();

// The opacity of the points is set so low to better
// visualize the density of stops in certain areas.
float alpha = 13;

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
  size(7020, 4950); 
  mapBackground = loadImage("BigMap.jpg");
  image(mapBackground, 0, 0);
  noStroke();

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
    int sex = int(pieces[0]); 
    int age = int(pieces[1]);
    //int date = 0;//convertToDay(pieces[2]);
    char race = pieces[3].charAt(0);
    boolean arrest = boolean(pieces[4]);
    float lat = float(pieces[5]);
    float lon = float(pieces[6]);
    Stop temp = new Stop(sex, age, race, arrest, lat, lon);
    data.add(temp);
  }
}

void mapPoints()
{
  float yes = 0;
  float no = 0;
  for (int i = 0; i < data.size(); i++)
  {
    //println(i);

    Stop temp = data.get(i);

    switch(temp.race)
    {
      //asian/pacific islander
      case 'A':
        fill(0, 0, 255, alpha);
        break;

      //black
      case 'B':
        fill(255, 0, 0, alpha);
        break;

      //american indian/alaskan
      case 'I':
        fill(255, 255, 0, alpha);
        break;

      //black hispanic
      case 'P':
        fill(0, 255, 0, alpha);
        break;  

      //white hispanic
      case 'Q':
        fill(0, 255, 255, alpha);
        break;

      //white
      case 'W':
        fill(255, 0, 255, alpha);
        break;

      //other
      case 'Z':
        fill(0, alpha);
        break;
    }

    //adjust the lat and lon to align with the background map dimensions
    float xPos = map(temp.lon, -74.557171, -73.352108, 0.0, 7020.0);
    float yPos = map(temp.lat, 40.424082, 41.067445, 4950.0, 0.0);

    ellipse(xPos, yPos, 5, 5);
  }
  println("done");
}

void saveFile() {
  saveFrame(year + ".jpg");
  exit();
}
