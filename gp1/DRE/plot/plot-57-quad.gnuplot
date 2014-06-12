set datafile separator ","

set xlabel "$t^2$ [$\\mathrm{s}^2$]"
set ylabel "$\\phi$ [rad]"
set key off

set termoption dash
set style line 1 lt 1
set style line 2 lt 1
set style line 3 lt 2

set terminal epslatex size 27cm,18cm
set output "plot-57-quad.tex"

set fit errorvariables

A(x) = m_1*x+b_1
fit A(x) "./data/clean-57.csv" using ($1*$1):3:4 via m_1,b_1
m_1_err = 0.0025
b_1_err = 0.4
A_err(x) = (m_1-m_1_err)*x+(b_1+b_1_err)

set label 1 sprintf("Messung 57\nFitgleichung: $y = mx+b$\n$m = \\num{%1.6f+-%1.6f}$\n$b= \\num{%1.3f+-%1.3f}$", m_1, m_1_err, b_1, b_1_err) at graph 0.07, graph 0.9

#plot "./data/clean-57.csv" using ($1*$1):2:3:4 w xyerrorbars ls 1, A(x) ls 2
plot "./data/clean-57.csv" using ($1*$1):3:4 w yerrorbars ls 1, A(x) ls 2, A_err(x) ls 3
