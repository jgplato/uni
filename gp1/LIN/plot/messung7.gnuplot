set fit errorvariables
f(x) = a - exp(-b*x)

fit f(x) "./data/messung7.dat" u 1:2 via a,b

set xlabel "$t$ [s]"
set ylabel "$v$ [m/s]"
set key off

set label 1 sprintf("Messung 7\n\nfit $f(x) = a - \\exp(-bx)$\n$a=%1.5f \\pm %1.5f$\n$b = %1.5f \\pm %1.5f$",a,a_err,b,b_err) at 2,0.15

set terminal epslatex size 27cm,18cm
set output "plot-messung7.tex"

plot "./data/messung7.dat" using 1:2, f(x)


