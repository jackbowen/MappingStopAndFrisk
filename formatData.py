#!/usr/bin/python

import sys, os, stateplane

rawPath = "RawData"
trimmedPath = "Map/data"

for rawFileName in os.listdir(rawPath):
   print rawFileName
   rawFile = open(rawPath + "/" + rawFileName, 'r')
   columns = rawFile.readline().split(",")
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
   for line in rawFile:
      columns = line.split(",");
      sex = columns[sexColumn]
      age = columns[ageColumn]
      date = columns[dateColumn]
      race = columns[raceColumn]
      arst = columns[arstColumn]
      latString = columns[latColumn].strip()
      lonString = columns[lonColumn].strip()
      if len(latString) > 5 and len(lonString) > 5:
         lat = float(latString) * .3048
         lon = float(lonString) * .3048
         latlon = stateplane.to_latlon(lon, lat, epsg="32118")
         trimmedFile.write(sex+","+age+","+date+","+race+","+arst+","+str(latlon[0])+","+str(latlon[1])+"\n")
   trimmedFile.close()
   rawFile.close()

