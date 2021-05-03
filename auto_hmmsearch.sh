#!/bin/bash
IN_DIR="$1"
OUT_DIR="$2"
DB="$3"


hmms=$(find $IN_DIR -name '*.hmm')

for FILE in $hmms

do

	echo "HMM: $FILE"
	basename=$(basename $FILE .hmm)
	echo "BASENAME: $basename"
	
			hmmsearch -A $OUT_DIR$basename.hmmalign.sth $FILE $3
			esl-reformat -o $OUT_DIR$basename.hmmalign.fa afa $OUT_DIR$basename.hmmalign.sth 
done 