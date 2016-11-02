#!/bin/bash
set -e -x
FILENAME="$1"
#Replace = with "),
sed -i 's/=/"),"/g' $PWD/$FILENAME 
#Add Characters to the begining of each line
sed -i 's/^/(NULL,(select concept_id from concept where short_name = "/' $PWD/$FILENAME
# Add Characters at the end of each line
sed -i 's/$/", "en", 1, 4, NOW(), "FULLY_SPECIFIED", 0, NULL, NULL, NULL, UUID()),/g' $PWD/$FILENAME
sed -i "1i INSERT INTO concept_name VALUES"  $PWD/$FILENAME
sed -i '$s/D()),/D());/g' $PWD/$FILENAME
