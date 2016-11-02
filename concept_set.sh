#!/bin/bash
set -e -x
FILENAME="$1"
#Add Characters to the begining of each line
sed -i 's/^/(NULL,(select concept_id from concept where short_name = "/' $PWD/$FILENAME
# Add Characters at the end of each line
sed -i 's/$/"),1842,NULL,1,NOW(),UUID()),/g' $PWD/$FILENAME
sed -i "1i INSERT INTO concept_set VALUES"  $PWD/$FILENAME
sed -i '$s/D()),/D());/g' $PWD/$FILENAME
