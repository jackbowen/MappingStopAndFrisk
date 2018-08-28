#!/bin/bash

# this script downloads all the currently available Stop and Frisk data, inflates it, and places it in the
# proper directory for Processing to view.

# double check to make sure wget is installed. this is the program we will use to download the data
command -v wget >/dev/null 2>&1 || { echo >&2 "I require wget but it's not installed. Aborting."; exit 1; }

# 2003-2014 are published as zip files
PREFIX="http://www.nyc.gov/html/nypd/downloads/zip/analysis_and_planning/20"
SUFFIX="_sqf_csv.zip"
for i in `seq 03 14`;
  do
    if [ "$i" -lt "10" ]; then
      wget $PREFIX\0$i$SUFFIX
      unzip 200$i$SUFFIX
    else 
      wget $PREFIX$i$SUFFIX 
      unzip 20$i$SUFFIX
    fi
  done    

# clean up and move data into the right spot for the Processing sketch
rm *.zip

# 2015+ are published as just csv files
wget http://www1.nyc.gov/assets/nypd/downloads/excel/analysis_and_planning/stop-question-frisk/sqf-2015.csv
mv sqf-2015.csv 2015.csv
wget http://www1.nyc.gov/assets/nypd/downloads/excel/analysis_and_planning/stop-question-frisk/sqf-2016.csv
mv sqf-2016.csv 2016.csv

DIRECTORY="RawData"
if [ ! -d "$DIRECTORY" ]; then
  mkdir $DIRECTORY
fi
mv *.csv $DIRECTORY