FIT_LIMIT = 1e-10
set datafile separator ","

set xlabel "$t$ [s]"
set ylabel "$\\phi$ [rad]"
set key off

set termoption dash
set style line 1 lt 1
set style line 2 lt 1
set style line 3 lt 2

set terminal epslatex size 27cm,18cm
set output "plot-__NUM__-exp.tex"

set fit errorvariables

A(x) = x*(exp(-k*x) - 1)
fit A(x) "./data/clean-__NUM__.csv" using 1:3:4 via k
A_err_n(x) = x*(exp(-(k+k_err)*x) - 1)
A_err_p(x) = x*(exp(-(k-k_err)*x) - 1)

set label 1 sprintf("Messung __NUM__\nFitgleichung: $\\phi(t) = t(e^{-kt} - 1)$\n$k = \\num{%1.6f+-%1.6f}$", k, k_err) at graph 0.07, graph 0.9

plot "./data/clean-__NUM__.csv" using 1:3:4 w yerrorbars ls 1, A(x) ls 2, A_err_n(x) ls 3, A_err_p(x) ls 3
