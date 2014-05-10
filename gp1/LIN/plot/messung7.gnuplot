t_0 = 0.50 # What we guess for the start time

set fit errorvariables
f(x) = a - exp(-b*x)

fit f(x) "./data/messung7.dat" u 1:2 via a,b

set xlabel "$t$ [s]"
set ylabel "$v$ [m/s]"
set key off

set label 1 sprintf("fit $f(x) = a - \\exp(-bx)$\n$a=%1.5f \\pm %1.5f$\n$b = %1.5f \\pm %1.5f$",a,a_err,b,b_err) at 2,0.15

plot "./data/messung7.dat" using 1:2, f(x)
