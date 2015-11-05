set xlabel "Energie [keV]"
set ylabel "Absorptionsstärke"
set key off

set termoption dash
set style line 1 lt 1
set style line 2 lt 1
set style line 3 lt 2

set terminal epslatex size 27cm,18cm
set output "plot-7.tex"

set label 1 "Kritische Absorption (Aufgabe 7)" at graph 0.07, graph 0.9

plot "data-7.txt" using 1:2:3 w errorbars ls 1

