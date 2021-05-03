#!/bin/bash
IN_DIR="$1"
TSTAMP=$(date +%Y%m%d-%H%M%S)
CMDFILE=species_list.${TSTAMP}.txt
CATFILE=proteome.${TSTAMP}.fa

namedfiles=$(find $IN_DIR -name '*.addspeciesname.fa')

for FILE in $namedfiles

do

	echo "FILE: $FILE"
	basename=$(basename $FILE .addspeciesname.fa)
	echo "BASENAME: $basename"
	dirname=$(dirname $FILE)
	echo "DIR: $dirname"
	species=$(echo $basename | cut -f1 -d"_")
	echo "SPECIES: $species"
			
		cat $FILE >> $CATFILE 
		
	echo "$species" >> $CMDFILE
	
done 

mv $CATFILE $1