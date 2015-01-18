set xlabel "$f$ [Hz]"
set logscale x
set ylabel "$U_R/U_0$"
set key box

set termoption dash
set style line 1 lt 1
set style line 2 lt 2
set style line 3 lt 3

set terminal epslatex size 27cm,18cm
set output "plot-2.tex"

set fit errorvariables

#A(x) = m*x
#fit A(x) "messwerte-1.txt" using 1:($2/54.7) via m
#A_err_p(x) = (m+m_err)*x
#A_err_n(x) = (m-m_err)*x

plot "messwerte-3.txt" using 1:($5/$3) ls 1 title "Hochpass", \
     "messwerte-4.txt" using 1:($5/$3) ls 2 title "Tiefbass", \
     "messwerte-5.txt" using 1:($5/$3) ls 3 title "Bandpass"
