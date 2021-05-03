#!/bin/bash
basename=$(basename $1 .txt)
echo "BASENAME: $basename"
directory=$(dirname $1)
echo "DIRECTORY: $directory"
outputfile="${directory}/${basename}.clean.txt"
echo "OUTPUT_FILE: $outputfile"
cut -d "/" -f 1 $1 > $outputfile
sed -i " s/^/>/g" $outputfile 
echo "done, clean sequence names saved to $outputfile" 
