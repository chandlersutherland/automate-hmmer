#!/bin/bash
#Author: Chandler
#Title: auto_align.sh
#04/12/2021

#Feed a directory with fasta files to be aligned 

IN_DIR="$1"

NUMCORES=3

fastafiles=$(find $IN_DIR -name '*.sequences.fa')

for FILE in $fastafiles

do
    echo "FILE: $FILE"
    basename=$(basename $FILE .sequences.fa)
    echo "BASENAME: $basename"
    dirname=$(dirname $FILE)
    echo "DIR: $dirname"
	prank -o=${dirname}/${basename}.prank.fa -d=$FILE 
	echo "alignment done, saved to ${dirname}/${basename}.prank.fa"
done
