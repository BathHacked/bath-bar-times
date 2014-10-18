#! /bin/bash 
set -v
cd /vagrant

#Join files into one csv.
csvstack -g Friday,Monday,Saturday,Sunday,Tuesday datain/* > intermediate/1-stacked.csv
cd intermediate;

#Prune out empty lines.
csvgrep -c 2 -r .+ 1-stacked.csv > 2-stacked-noemptylines.csv

#Select only the columns we want to import, in the correct order.
csvcut -c 2,3,4,5,1,7 2-stacked-noemptylines.csv > 3-stacked-usefulcols.csv

#Rename the columns to be relevant.
echo "name,postcode,longitude,latitude,day,closingtime" > 4-stacked-usefulcols-goodcolnames.csv
tail --lines=+2 3-stacked-usefulcols.csv >> 4-stacked-usefulcols-goodcolnames.csv

#Add a unique ID column based on bar & day.
#extract the columns to separate files.
csvcut -c 5 4-stacked-usefulcols-goodcolnames.csv | tail --lines=+2 > 6-dayslist.csv
csvcut -c 1 4-stacked-usefulcols-goodcolnames.csv | tail --lines=+2 > 6-nameslist.csv
#Sluggify bar names
sed 's/[^A-Za-z0-9]//g' 6-nameslist.csv | tr '[:upper:]' '[:lower:]' > 7-slugslist.csv
#Augment slugs with days (because we want a composite key).
paste -d"-" 6-dayslist.csv 7-slugslist.csv > 8-idsslugslist.csv
#Hash each slug.
echo "id" > 9-idslist.csv
set +v
cat 8-idsslugslist.csv | while read line; do echo -n $line|md5sum; done | cut -d ' ' -f 1 >> 9-idslist.csv
set -v

#Finally join the ids column to the full csv of details.
csvjoin 9-idslist.csv 4-stacked-usefulcols-goodcolnames.csv > output.csv

cp output.csv ../output.csv