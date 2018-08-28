#!/usr/bin/python

# This program minifies the data into only what the Processing program needs to
# run. Processing, specifically Processing running on my old laptop, doesn't
# handle large files super well so this helps things run a little more smoothly.

# TODO: anything to import shapely.geometry?
from shapely.geometry import Polygon
import sys, os, stateplane


# This is where we will grab the raw data from
rawPath = "RawData"

# This is where we will create the files with the trimmed data
trimmedPath = "Map/data"

for rawFileName in os.listdir(rawPath):
   print(rawFileName)
   rawFile = open(rawPath + "/" + rawFileName, 'r', encoding='latin-1')

   # This reads the first line of the file which contains the description for
   # what each column in the CSV means.
   columns = rawFile.readline().split(",")

   # We only want to select a few different pieces of info for our 
   # visualization. 
   sexColumn = ageColumn = dateColumn = raceColumn = arstColumn = latColumn = lonColumn = -1
   for i in range(0, len(columns)):
      if columns[i] == "sex":
         sexColumn = i
      if columns[i] == "age":
         ageColumn = i
      if columns[i] == "datestop":
         dateColumn = i
      if columns[i] == "race":
         raceColumn = i
      if columns[i] == "arstmade":
         arstColumn = i
      if columns[i] == "ycoord":
         latColumn = i
      if columns[i] == "xcoord":
         lonColumn = i

   trimmedFile = open(trimmedPath + "/" + rawFileName, 'w')
   lines = rawFile.readlines()
   for line in lines:
      columns = line.split(",");
      sex = columns[sexColumn]
      age = columns[ageColumn]
      date = columns[dateColumn]
      race = columns[raceColumn]
      arst = columns[arstColumn]
      latString = columns[latColumn].strip()
      lonString = columns[lonColumn].strip()

      # Convert the xcoord and ycoord given by the NYPD into traditional lat and lon coordinates
      if len(latString) > 5 and len(lonString) > 5:
         lat = float(latString) * .3048
         lon = float(lonString) * .3048
         latlon = stateplane.to_latlon(lon, lat, epsg="32118")
         trimmedFile.write(sex+","+age+","+date+","+race+","+arst+","+str(latlon[0])+","+str(latlon[1])+"\n")
   trimmedFile.close()
   rawFile.close()

