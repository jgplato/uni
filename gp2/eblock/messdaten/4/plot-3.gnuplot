set xlabel "$U_{CE}$ [V]"
set ylabel "$I_{C}$ [mA]"
#set logscale y
set key box

set termoption dash
set style line 1 lt 1
set style line 2 lt 2
set style line 3 lt 3
set style line 4 lt 4

set terminal epslatex size 27cm,18cm
set output "plot-3.tex"

plot "messung-1.txt" using 1:3:4 w yerrorbars ls 1 title "Ausgang, $I_B = 34+-1$  uA", \
     "messung-3.txt" using 3:1:2 w yerrorbars ls 2 title "Ausgang, $I_B = 60+-1$  uA", \
     "messung-4.txt" using 3:1:2 w yerrorbars ls 3 title "Ausgang, $I_B = 90+-1$  uA", \
     "messung-5.txt" using 3:1:2 w yerrorbars ls 4 title "Ausgang, $I_B = 120+-1$ uA"
