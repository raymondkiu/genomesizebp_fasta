#!/bin/bash
#usage: ./genomesize.sh FASTAFILE
#FASTAFILE is the assembly file in fasta format
#This will give a final output named 'FASTAFILE-genomesize', with all intermediate files cleared

contigs=$1


awk '!/^>/ { printf "%s", $0; n = "\n" } /^>/ { print n $0; n = "" } END { printf "%s", n }' $contigs > single
cat single | awk 'NR%2==0' | awk '{print length($1)}' > sum
awk '{ sum += $1 } END { print sum }' sum > $contigs-genomesize

rm single
rm sum

exit 0;
