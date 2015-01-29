set xlabel "$I_B$ [uA]"
set ylabel "$I_C$ [mA]"
#set logscale y
set key box

set termoption dash
set style line 1 lt 1
set style line 2 lt 2
set style line 3 lt 3

set terminal epslatex size 27cm,18cm
set output "plot-1.tex"

plot "messung-1.txt" using 1:3:4 w yerrorbars ls 1 title "Übertragungskennlinie $U_{CE} = 12$V"
