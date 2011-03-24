#!/usr/bin/bash

# This file is intended to convert the benachmarking data 
# gathered from sopaUI to a CSV file that is easily editible 
# by Excel
FILE=complete.csv

rm $FILE; 

LOCALPATH=$(pwd);

for file in $(find $LOCALPATH -name DMS-WS-soapui-project.csv | sort -k9.5n -t/ ); do 
echo "Processing $file..."

    testName=$(echo $file | awk -F/ '{ print $9;}');
    echo $testName >> $FILE;

    # echo $file >> complete.csv; 
    cat $file >> $FILE; 
    echo >> $FILE; 
done; 

dos2unix $FILE; 
# Change field separator from comma to semicolon
sed -i 's/,/;/g' $FILE; 

# Change decimal separator from dot to comma
sed -i 's/\./,/g' $FILE; 

# Remvoe lines with disabled tests
sed -i '/^.*disabled.*$/d' $FILE;

unix2dos $FILE

