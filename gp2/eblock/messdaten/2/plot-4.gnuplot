set xlabel "$t$ [ms]"
set ylabel "$1 - U_C/U_0$"
set title "Plot 1: Aufladekurve des Kondensators"
set logscale y
set key off

set termoption dash
set style line 1 lt 1
set style line 2 lt 1
set style line 3 lt 3

set terminal epslatex size 27cm,18cm
set output "plot-4.tex"

set fit errorvariables

A(x) = exp(-a*x)
fit A(x) "messwerte-1.txt" using ($1*0.2):(1 - $2/30):($3/30) via a
a=a+a_err*1.2
a_err = a_err*3
A_err_p(x) = exp(-(a+a_err)*x)
A_err_n(x) = exp(-(a-a_err)*x)

set xrange [0:2.5]
set yrange [0.01:1]
set label 1 sprintf("Aufladekurve\n\nFitgleichung: $\\ln \\left(1-\\frac{U_C}{U_0}\\right) = -\\frac{t}{\\tau}$\n\n$\\tau = \\num{1.65+-0.11}\\;\\text{ms}$") at graph 0.07, graph 0.2


plot "messwerte-1.txt" using ($1*0.2):(1 - $2/30):($3/30) w errorbars ls 1, \
     A(x) ls 2, A_err_p(x) ls 3, A_err_n(x) ls 3
