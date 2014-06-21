set datafile separator ","

FIT_LIMIT=1e-5

set xlabel "$t$ [s]"
set ylabel "$A$ [cm]"
set key off
set samples 500

set termoption dash
set style line 1 lt 1
set style line 2 lt 1
set style line 3 lt 2

set terminal epslatex size 27cm,18cm
set output "plot-daempfung.tex"

set logscale y

set fit errorvariables

A(x) = a0*exp(-delta*x)
fit A(x) "daempfung.csv" using 1:3:4 via a0, delta
delta_err = 0.003025033991
A_err_p(x) = a0*exp(-(delta+delta_err)*x)
A_err_n(x) = a0*exp(-(delta-delta_err)*x)

set label 1 sprintf("\\textbf{Dämpfungskurve}\n\nFitgleichung: $A(t) = A_0 e^{- \\delta t}$\n\n$A_0 = \\num{%1.6f+-%1.6f}$\n$\\delta = \\num{%1.6f+-%1.6f}$", a0, a0_err, delta, delta_err) at graph 0.10, graph 0.25

plot "daempfung.csv" using 1:3:2:4 w xyerrorbars ls 1, A(x) ls 2, A_err_p(x) ls 3, A_err_n(x) ls 3

