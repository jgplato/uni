set xlabel "$t$ [ms]"
set ylabel "$U_C/U_0$"
#set logscale x
set key box

set termoption dash
set style line 1 lt 1
set style line 2 lt 2
set style line 3 lt 3

set terminal epslatex size 27cm,18cm
set output "plot-3.tex"

set fit errorvariables

#A(x) = m*x
#fit A(x) "messwerte-1.txt" using 1:($2/54.7) via m
#A_err_p(x) = (m+m_err)*x
#A_err_n(x) = (m-m_err)*x

plot "messwerte-1.txt" using ($1*0.2):($2/30):($3/30) w errorbars ls 1 title "Aufladung", \
     "messwerte-2.txt" using ($1*0.2):($2/30):($3/30) w errorbars ls 2 title "Entladung"
