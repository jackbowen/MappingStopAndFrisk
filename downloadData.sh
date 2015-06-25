#! /bin/bash

YEARS=(03 04 05 06 07 08 09 10 11 12 13 14)
for i in ${YEARS[*]}; do
    wget --show-progress -O RawData/20$i.csv.zip "http://www.nyc.gov/html/nypd/downloads/zip/analysis_and_planning/20"$i"_sqf_csv.zip"
done

cd RawData
find . -name '*.zip' -exec unzip {} \;
rm *.zip
cd ..
./formatData.py
