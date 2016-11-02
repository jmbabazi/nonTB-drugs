#!/bin/bash
set -e -x
FILENAME="$1"
#Replace = with "),
sed -i 's/=/"),"/g' $PWD/$FILENAME 
#Add Characters to the begining of each line
sed -i 's/^/(NULL,(select concept_id from concept where short_name = "/' $PWD/$FILENAME
# Add Characters at the end of each line
sed -i 's/$/",0,59,NULL,NULL,NULL,4,NOW(),0,4,NOW(),NULL,NULL,NULL,UUID(),NULL),/g' $PWD/$FILENAME
sed -i "1i INSERT INTO drug VALUES"  $PWD/$FILENAME
sed -i '$s/L),/L);/g' $PWD/$FILENAME
