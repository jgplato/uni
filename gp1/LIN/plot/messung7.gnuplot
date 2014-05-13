v = 0.30
v_err = 0.03

b = -2.94
b_err_plus = 2.20
b_err_minus = 0.85

f(x) = v - exp(b*x)
g(x) = v - exp((b+b_err_plus)*x)
h(x) = v - exp((b-b_err_minus)*x)

set xlabel "$t$ [s]"
set ylabel "$v_G - v$ [m/s]"
set key off

set label 1 sprintf("Messung 7\n\nfit $f(x) = a - \\exp(-bx)$\n$a=%1.2f \\pm %1.2f$\n$b = %1.2f +%1.2f-%1.2f$",v,v_err,b,b_err_plus,b_err_minus) at 1,1e-6

#set terminal epslatex size 27cm,18cm
#set output "plot-messung7.tex"

set termoption dash
set style line 1 lt 1
set style line 2 lt 2

set logscale y

plot "./data/messung7.dat" using 1:(v-$2), v-f(x) ls 1, v-g(x) ls 2, v-h(x) ls 2


