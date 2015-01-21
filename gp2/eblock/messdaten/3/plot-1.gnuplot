set xlabel "$U$ [V]"
set ylabel "$I$ [mA]"
#set logscale y
set key box

set termoption dash
set style line 1 lt 1
set style line 2 lt 2
set style line 3 lt 3

set terminal epslatex size 27cm,18cm
set output "plot-1.tex"

set fit errorvariables
a=1
m=1
A(x) = a*(exp(m*x) - 1)
#A(x) = a*exp(m*x)
fit A(x) "messung-1.txt" using 1:3 via a,m
B(x) = c+d*x
fit B(x) "messung-1a.txt" using 1:3 via c,d

set xrange [0:0.9]
set yrange [0:60]

plot "messung-1.txt" using 1:3:4 w yerrorbars ls 1 title "Durchlass, Spannungsrichtig", \
     "messung-3.txt" using 1:3:4 w yerrorbars ls 2 title "Durchlass, Stromrichtig", \
     "messung-3.txt" using ($1/(1+$5/180)):3 ls 3 title "Durchlass, Stromrichtig, korrigiert", \
     A(x) ls 1 title "Shockley-Gleichung", \
     B(x) ls 2 title "Durchlasspannung"

#plot A(x) ls 1
