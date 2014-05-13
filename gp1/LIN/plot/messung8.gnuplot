v = 0.26
v_err = 0.02

b = 2.61
b_err_plus = 0.36
b_err_minus = 0.87

f(x) = v + exp(-b*x-c)

set fit errorvariables
fit f(x) "./data/messung8.dat" u 1:2 via c

g(x) = v + exp(-(b-b_err_minus)*x-c)
h(x) = v + exp(-(b+b_err_plus)*x-c)

set xlabel "$t$ [s]"
set ylabel "$v_G + v$ [m/s]"
set key off

set label 1 sprintf("Messung 8\n\nfit $f(x) = a - \\exp(-bx-c)$\n$a=%1.2f \\pm %1.2f$\n$b = %1.2f + %1.2f - %1.2f \n$c = %1.3f \\pm %1.3f$",v,v_err,b,b_err_plus,b_err_minus,c,c_err) at 0.7,0.01

set termoption dash
set style line 1 lt 1
set style line 2 lt 2

set logscale y

set terminal epslatex size 27cm,18cm
set output "plot-messung8.tex"

plot "./data/messung8.dat" using 1:($2 - v), f(x) - v ls 1, g(x) - v ls 2, h(x) - v ls 2


