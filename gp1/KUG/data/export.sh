#!/bin/bash
# Convert CSV to single files
for i in A B C O
do
   cat plot.csv | grep $i | sed 's/\tO//' > plot/$i.dat
done
