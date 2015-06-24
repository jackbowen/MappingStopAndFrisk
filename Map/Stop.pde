class Stop
{
  int sex; //sex of the person stopped
  int age; //age of person stopped
  //int date; //date of stop
  char race; // race/ethnicity
  boolean arrest; //were they arrested? y/n
  float lat; //location of stop
  float lon; //location of stop
  
  Stop(int sex, int age, char race, boolean arrest, float lat, float lon)
  {  
    this.sex = sex;
    this.age = age;
    //this.date = date;
    this.race = race;
    this.arrest = arrest;
    this.lat = lat;
    this.lon = lon;  
  }
}
