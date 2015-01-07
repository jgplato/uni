set xlabel "$U$ [V]"
set ylabel "$I$ [normalisiert]"
set key off

set termoption dash
set style line 1 lt 1
set style line 2 lt 1
set style line 3 lt 2

set terminal epslatex size 27cm,18cm
set output "plot-1.tex"

set fit errorvariables

A(x) = m*x
fit A(x) "messwerte-1.txt" using 1:($2/54.7) via m
A_err_p(x) = (m+m_err)*x
A_err_n(x) = (m-m_err)*x


plot "messwerte-1.txt" using 1:($2/54.7):($3/54.7) w yerrorbars ls 1, \
     "messwerte-2.txt" using 1:($2/3490):($3/3490) w yerrorbars ls 1, \
     "messwerte-3.txt" using 1:($2/230):($3/230) w yerrorbars ls 1, \
     A(x) ls 2, A_err_p(x) ls 3, A_err_n(x) ls 3
