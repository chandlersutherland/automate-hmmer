#!/bin/bash

basename=$(basename $1 .fa)
specieslist=${basename}.speciescount.txt 
seqfile=${basename}.seqfile.txt

seqname=$(grep --line-buffered ">" $1)
echo "$seqname"
echo $seqname > $seqfile
cut -c-10 $seqfile | sort | uniq -c >> $specieslist
echo "done"