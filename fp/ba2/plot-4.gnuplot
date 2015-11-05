set xlabel "Absorberdicke [mm]"
set ylabel "Zählrate"
set key off

set logscale y

set termoption dash
set style line 1 lt 1
set style line 2 lt 1
set style line 3 lt 2

set terminal epslatex size 27cm,18cm
set output "plot-4.tex"

set xrange [-0.1:22]

set fit errorvariables

mu=0.0001
I0=25000
I(x) = I0*exp(-mu*x)
fit I(x) "data-4.txt" using 1:2:3 via I0, mu
I_err_n(x) = I0*exp(-(mu-mu_err)*x)
I_err_p(x) = I0*exp(-(mu+mu_err)*x)

set label 1 sprintf("Bestimmung des Absorptionskoeffizienten von Aluminium\n\nFitgleichung: $I(x) = I_0 \\exp \\left( - \\mu x \\right)$\n\n$I_0 = \\num{%1.6f+-%1.6f}$\n$\\mu = \\num{%1.6f+-%1.6f}$", I0, I0_err, mu, mu_err) at graph 0.07, graph 0.93

plot "data-4.txt" using 1:2:3 w yerrorbars ls 1, I(x) ls 2, I_err_p(x) ls 3, I_err_n(x) ls 3
