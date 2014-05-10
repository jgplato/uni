set fit errorvariables
f(x) = a + exp(-b*x-c)

fit f(x) "./data/messung8.dat" u 1:2 via a,b,c

set xlabel "$t$ [s]"
set ylabel "$v$ [m/s]"
set key off

set label 1 sprintf("Messung 8\n\nfit $f(x) = a - \\exp(-bx-c)$\n$a=%1.5f \\pm %1.5f$\n$b = %1.5f \\pm %1.5f$\n$c = %1.5f \\pm %1.5f$",a,a_err,b,b_err,c,c_err) at 2,0.8

set terminal epslatex size 27cm,18cm
set output "plot-messung8.tex"

plot "./data/messung8.dat" using 1:2, f(x)


