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

A(x) = A*(exp(-B*x)-1) + C*x
fit A(x) "./data/clean-__NUM__.csv" using 1:3:4 via A,B,C
A_err_n(x) = (A+0.3)*(exp(-(B)*x)-1) + (C)*x
A_err_p(x) = (A-0.3)*(exp(-(B)*x)-1) + (C)*x

# Output fitting params to file
set print "exp-fitting.csv" append
print sprintf("__NUM__;%1.9f;%1.9f;%1.9f;%1.9f;%1.9f;%1.9f", A, A_err, B, B_err, C, C_err)

set label 1 sprintf("Messung __NUM__\nFitgleichung: $\\phi(t) = A(e^{-Bt} -1) + Ct$\n$A = \\num{%1.6f+-%1.6f}$\n$B = \\num{%1.6f+-%1.6f}$\n$C = \\num{%1.6f+-%1.6f}$", A, A_err, B, B_err, C, C_err) at graph 0.07, graph 0.9

plot "./data/clean-__NUM__.csv" using 1:3:4 w yerrorbars ls 1, A(x) ls 2, A_err_n(x) ls 3, A_err_p(x) ls 3

