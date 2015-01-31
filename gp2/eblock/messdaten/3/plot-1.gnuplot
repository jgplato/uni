set xlabel "$U$ [V]"
set ylabel "$I$ [mA]"
#set logscale y
set key off

set termoption dash
set style line 1 lt 1
set style line 2 lt 2
set style line 3 lt 3

set terminal epslatex size 27cm,18cm
set output "plot-1.tex"
set title "Plot 3: Diodenkennlinie"

set fit errorvariables
a=1
m=1
A(x) = a*(exp(m*x) - 1)
#A(x) = a*exp(m*x)
fit A(x) "messung-1.txt" using 1:3 via a,m
B(x) = c+d*x
C(x) = e+f*x
fit B(x) "messung-1a.txt" using 1:3 via c,d
fit C(x) "messung-1b.txt" using 1:3 via e,f
D(x) = 1

set xrange [0:0.9]
set yrange [0:60]

set label 1 "Gestrichelte Linie: 1 mA" at graph 0.07, graph 0.04
set label 2 "Fit gegen Shockley-Gleichung\nLineare Regression durch letzte 5 Messwerte zur\nBestimmung der Schwellenspannung\n\nFitgleichung $I(U) = -I_0 + \\frac{U}{R_D}$" at graph 0.07, graph 0.9
set label 3 sprintf("$I_0 = \\num{%3.1f+-%3.1f}\\,\\text{mA}$",-c,(e-c)) at graph 0.07, graph 0.7
set label 4 sprintf("$1/R_D = \\num{%3.1f+-%3.1f} /k\\Omega$",d,(d-f)) at graph 0.07, graph 0.67

plot "messung-1.txt" using 1:3:4 w yerrorbars ls 1 title "Durchlass, Spannungsrichtig", \
     A(x) ls 1 title "Fit: Shockley-Gleichung", \
     B(x) ls 2 title "Fit: Durchlasspannung", \
     C(x) ls 3, D(x) ls 2
