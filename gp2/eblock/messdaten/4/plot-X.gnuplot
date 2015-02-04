set xlabel "$U_{CE}$ [V]"
set ylabel "$I_{C}$ [mA]"
#set logscale y
set key off

set title "Plot 5: Ausgangskennlinie für verschiedene $I_B$"
set termoption dash
set style line 1 lt 1
set style line 2 lt 2
set style line 3 lt 3
set style line 4 lt 4

set fit errorvariables
A1(x)     = u1+r1*x
fit A1(x) "messung-2a.txt" using 3:1:2 via u1, r1
u1_err = u1_err*2.5
r1_err = r1_err*2.5
A1_err_p(x) = u1+u1_err+(r1-r1_err)*x
A1_err_n(x) = u1-u1_err+(r1+r1_err)*x

A2(x)     = u2+r2*x
fit A2(x) "messung-3a.txt" using 3:1:2 via u2, r2
u2_err = u2_err*2.5
r2_err = r2_err*2.5
A2_err_p(x) = u2+u2_err+(r2-r2_err)*x
A2_err_n(x) = u2-u2_err+(r2+r2_err)*x

A3(x)     = u3+r3*x
fit A3(x) "messung-4a.txt" using 3:1:2 via u3, r3
u3_err = u3_err*2.5
r3_err = r3_err*2.5
A3_err_p(x) = u3+u3_err+(r3-r3_err)*x
A3_err_n(x) = u3-u3_err+(r3+r3_err)*x

A4(x)     = u4+r4*x
fit A4(x) "messung-5a.txt" using 3:1:2 via u4, r4
u4_err = u4_err*2.5
r4_err = r4_err*2.5
A4_err_p(x) = u4+u4_err+(r4-r4_err)*x
A4_err_n(x) = u4-u4_err+(r4+r4_err)*x

end = 12.2
set label 1 "$\\num{34+-1}\\;\\mu\\text{A}$" at end, A1(end) rotate by 2 left
set label 2 "$\\num{60+-1}\\;\\mu\\text{A}$" at end, A2(end) rotate by 4 left
set label 3 "$\\num{90+-1}\\;\\mu\\text{A}$" at end, A3(end) rotate by 6 left
set label 4 "$\\num{120+-1}\\;\\mu\\text{A}$" at end, A4(end) rotate by 8 left

mid = 5
set label 5 sprintf("$1/R = \\num{%1.4f+-%1.4f}\\;\\text{mA/V}$", r1, r1_err) at mid, A1(mid)+0.6 rotate by 2 center
set label 6 sprintf("$1/R = \\num{%1.3f+-%1.3f}\\;\\text{mA/V}$", r2, r2_err) at mid, A2(mid)+0.6 rotate by 4 center
set label 7 sprintf("$1/R = \\num{%1.3f+-%1.3f}\\;\\text{mA/V}$", r3, r3_err) at mid, A3(mid)+0.7 rotate by 6 center
set label 8 sprintf("$1/R = \\num{%1.3f+-%1.3f}\\;\\text{mA/V}$", r4, r4_err) at mid, A4(mid)+0.6 rotate by 8 center

set label 9 "Fit jeweils gegen $I_C(U_{CE}) = I_0 + (1/R) U_{CE}$" at graph 0.6, graph 0.9

set terminal epslatex size 27cm,18cm
set output "plot-X.tex"

plot "messung-2.txt" using 3:1:2 w yerrorbars ls 1 title "$I_B = 34+-1$  uA", \
     "messung-3.txt" using 3:1:2 w yerrorbars ls 2 title "$I_B = 60+-1$  uA", \
     "messung-4.txt" using 3:1:2 w yerrorbars ls 3 title "$I_B = 90+-1$  uA", \
     "messung-5.txt" using 3:1:2 w yerrorbars ls 4 title "$I_B = 120+-1$ uA", \
     A1(x) ls 1 notitle, A1_err_p(x) ls 2 notitle, A1_err_n(x) ls 2 notitle, \
     A2(x) ls 1 notitle, A2_err_p(x) ls 2 notitle, A2_err_n(x) ls 2 notitle, \
     A3(x) ls 1 notitle, A3_err_p(x) ls 2 notitle, A3_err_n(x) ls 2 notitle, \
     A4(x) ls 1 notitle, A4_err_p(x) ls 2 notitle, A4_err_n(x) ls 2 notitle
