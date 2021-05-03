#!/bin/bash
#Author: Chandler
#Title: auto_hmmsearch_hmmscan.sh
#04/12/2021

#Feed a directory with fasta files to be hmmsearched and hmmscanned, with the hmm file. 

IN_DIR="$1"
HMM_FILE="$2"

NUMCORES=3

fastafiles=$(find $IN_DIR -name '*fa')

for FILE in $fastafiles

do

    echo "FILE: $FILE"
    basename=$(basename $FILE .fa)
    echo "BASENAME: $basename"
    dirname=$(dirname $FILE)
    echo "DIR: $dirname"
	hmmsearch --domtblout ${dirname}/${basename}.hmmsearch.out $HMM_FILE $FILE
	echo "hmmsearch done, saved to ${dirname}/${basename}.hmmsearch.out"
	hmmscan --domtblout ${dirname}/${basename}.hmmscan.out ~/pmb200b/Pfam-A.hmm $FILE 
	echo "hmmscan done, saved to ${dirname}/${basename}.hmmscan.out"

done
