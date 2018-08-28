# Mapping Stop and Frisk

A data visualization of every stop made under NYC's stop-and-frisk program from 2003-2016.

TODO: add gallery image here

## About Stop+Frisk

The stop-question-and-frisk program, or stop-and-frisk, is a practice of the New York City Police Department in which police officers stop and question a pedestrian, then frisk them for weapons and other contraband.[1] Opponents of this practice argue that it greenlights racial profiling, specifically targeting young Black and Latino males. This software creates a visualization of each stop carried out due to this policy. It is meant to help illuminate whether POC, specifically those in lower-income neighborhoods are disproportionately targeted in this program. A dot is placed in the location of each stop with its color based upon the race of the person being stopped.

These maps were originally designed for print for a New York audience so there are a few assumptions made concerning the target audience’s knowledge. It is assumed that the viewer is aware of the general wealth and ethnic makeup of major neighborhoods as well as which ones are heavily populated. If you’re not familiar with NYC, see [here](http://www.undertheraedar.com/2012/01/population-density-in-new-york-city.html) for a quick rundown of what each borough is called and how heavily populated it is. For a brief overview of the racial and ethnic makeup of the city see 
[here](https://furmancenter.org/files/sotc/The_Changing_Racial_and_Ethnic_Makeup_of_New_York_City_Neighborhoods_11.pdf). Take note of figure B on page 33, specifically the upper left map detailing what share of each neighborhood is made up of non-Hispanic whites. The stop-and-frisk maps generated with this software are essentially an inversion of this map. With this knowledge, we can begin to make some some inferences from the above maps. 

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. 

### Prerequisites
 
 '''
 wget
 Python 3.0
 stateplane - a module for python. "pip3 install --user stateplane" if you have pip3
 Processing 3.0
 '''

### Software Instructions

1. First you'll need to download all the relevant data. Navigate to the downloaded folder and:
'''
./downloadData.sh
'''

2. The download shell script you just ran will create a folder called "RawData" that will store a CSV file for each year of the program so far. Each of these files is going to be pretty big so we want to strip out everything we don't need, convert the location of the stop into GPS coordinates we can plot, and store our slimmed down CSVs in a directory our Processing sketch will be able to access.
'''
python3 formatDataCSV.py
'''

3. From the current directory, navigate to the Map folder and open up the Processing sketch titled Map.pde. Open up Processing's preferences and click the box that says "Increase maximum available memory to: " and set it to 2048MB. This is necessary because of how large the input files are (both the csv and canvas you are drawing on). This program can only create one visualization at a time so change the variable called year at the top of the file to whatever year you want. 

### Observations

We can begin in Manhattan by looking at Central Park, the rectangular void in the middle of the island. The predominantly white neighborhoods that lie east and west of the park show noticeably less activity than the neighborhoods to the north of them despite having roughly the same population density. North of the park lies Harlem, a historically black neighborhood, where we can see a much higher concentration of stops. Northwest of Harlem is Washington Heights with its mostly black-Hispanic population. Again, we see a disproportionate number of stops. In Queens we see a cluster of stops that occur in the majority Hispanic neighborhoods of Jackson Heights and Elmhurst. South of Broadway in Brooklyn shows an alarming number of stops despite being much less populated than most of Manhattan. 

These maps were originally made in 2012 near the height of this practice. The number of stops peaked in 2011 with 685,724 stops.[2] Since then, the number of stops has gone down each year due to public outcry and a 2013 ruling by a U.S. District Court judge saying that the practice, but not the law behind it, was unconstitutional.[3] These maps were made with data published by the NYPD [here](http://www1.nyc.gov/site/nypd/stats/reports-analysis/stopfrisk.page) and the data was interpreted via a codebook published by the New York Civil Liberties 
Union [here](https://www.nyclu.org/en/stop-and-frisk-data). 

### References

1. https://en.wikipedia.org/wiki/Stop-and-frisk_in_New_York_City
2. https://www.nyclu.org/en/stop-and-frisk-data
3. www.nysd.uscourts.gov/cases/show.php?db=special&id=317