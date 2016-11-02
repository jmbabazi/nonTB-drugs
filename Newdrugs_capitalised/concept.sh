#!/bin/bash
set -e -x
FILENAME="$1"
sed -i "1i INSERT INTO concept VALUES"  $PWD/$FILENAME
#Add Characters to the begining of each line
sed -i 's/^/(NULL,0,"/' $PWD/$FILENAME
sed -i 's/$/",NULL,NULL,4,3,0,4,now(),NULL,4,now(),NULL,NULL,NULL,uuid()),/g' $PWD/$FILENAME
sed -i '$s/D()),/D());/g' $PWD/$FILENAME
#sed -i "s/$/', 'ru', 0, 1, NOW(), 'SHORT', 0, NULL, NULL, NULL, UUID()), /g" $PWD/$FILENAME
#sed -i "s/=/'), '/g" $PWD/$FILENAME
#replace ~ with = for less or equal / greater or equal
#sed -ri 's/~/= /g' $PWD/$FILENAME
#sed -i "s/ui.i18n.Concept.name./(NULL, (select concept_id from concept where uuid = '/g" $PWD/$FILENAME
#sed -i "1i INSERT INTO concept_name VALUES"  $PWD/$FILENAME
#replace , with ; on the last line
#sed -i '$s/D()),/D());/g' $PWD/$FILENAME
