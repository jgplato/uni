set xlabel "$s/s_0$"
set ylabel "$U/U_0$"
set key off

set termoption dash
set style line 1 lt 1
set style line 2 lt 1
set style line 3 lt 2

set terminal epslatex size 27cm,18cm
set output "plot-2.tex"

set fit errorvariables

V_0 = 4.497

A(x) = m*x
fit A(x) "messwerte-4.txt" using ($1/10):($2/V_0) via m
A_err_p(x) = (m+m_err)*x
A_err_n(x) = (m-m_err)*x

B(x) = x/(1+x*(1-x)*993.0/179.7)


plot "messwerte-4.txt" using ($1/10):($2/V_0):($3/V_0) w yerrorbars ls 1, \
     "messwerte-5.txt" using ($1/10):($2/V_0):($3/V_0) w yerrorbars ls 1, \
     A(x) ls 2, A_err_p(x) ls 3, A_err_n(x) ls 3, \
     B(x)
