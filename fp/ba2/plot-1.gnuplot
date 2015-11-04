set xlabel "Energie [MeV]"
set ylabel "Kanalzahl"
set key off

set termoption dash
set style line 1 lt 1
set style line 2 lt 1
set style line 3 lt 2

set terminal epslatex size 27cm,18cm
set output "plot-1.tex"

set fit errorvariables

A(x) = m*x
fit A(x) "data-1.txt" using 1:2 via m
A_err1(x) = (m+m_err*3)*x
A_err2(x) = (m-m_err*3)*x

set label 1 sprintf("Lineare Regression gegen Photopeaks\nFitgleichung: $A(x) = m x$\n$m = \\num{%1.3f+-%1.3f}$\n", m, 3*m_err) at graph 0.07, graph 0.9

plot "data-1.txt" using 1:2:3 w yerrorbars ls 1, A(x) ls 2, A_err1(x) ls 3, A_err2(x) ls 3

