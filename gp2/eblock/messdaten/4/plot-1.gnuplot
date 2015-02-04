set xlabel "$I_B$ [$\\mu$A]"
set ylabel "$I_C$ [mA]"
set title "Plot 4: Übertragungskennlinie $U_{CE} = 12$V"
#set logscale y
set key off

set termoption dash
set style line 1 lt 1
set style line 2 lt 1
set style line 3 lt 3

set fit errorvariables
A(x)     = i+b*x
fit A(x) "messung-1.txt" using 1:3:4 via i,b
i_err = i_err*2.5
b_err = b_err*2.5
A_err_p(x) = i+i_err+(b-b_err)*x
A_err_n(x) = i-i_err+(b+b_err)*x


set terminal epslatex size 27cm,18cm
set output "plot-1.tex"

set label 1 sprintf("Lineare Regression gegen $I_B(I_C) = I_0 + (1/B) I_C$\n$I_0 = \\num{%3.1f+-%3.1f}\\;\\text{mA}$\n$1/B = \\num{%3.4f+-%3.4f}\\;\\mu\\text{A/mA}$",i,i_err,b,b_err) at graph 0.07, graph 0.7

plot "messung-1.txt" using 1:3:4 w yerrorbars ls 1 title "Übertragungskennlinie $U_{CE} = 12$V", \
     A(x) ls 2 notitle, A_err_p(x) ls 3 notitle, A_err_n(x) ls 3 notitle

