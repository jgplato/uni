set xlabel "$I_B$ [uA]"
set ylabel "$U_{BE}$ [V]"
#set logscale y
set key box
set title "Plot 7: Eingangskennlinie"

set termoption dash
set style line 1 lt 1
set style line 2 lt 2
set style line 3 lt 3
set style line 4 lt 4

set terminal epslatex size 27cm,18cm
set output "plot-4.tex"

plot "messung-7.txt" using 1:3:4 w yerrorbars ls 1 title "Eingangskennlinie, $U_{CE} = 12$ V"
