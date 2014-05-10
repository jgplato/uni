set fit errorvariables
f(x) = a - exp(-b*x)
fit f(x) "./data/messung7.dat" u 1:2 via a,b


#a = 0.3 # Initial value for v_G => guessed from diagram
#b = 3.1 # Initial value for delta/m => plain guess for best fit

t_0 = 0.43 # What we guess for the start time

set xlabel "t [s]"
set ylabel "$v-v_G$ [m/s]"
set key off

set label 1 sprintf("fit $f(x) = a - \\exp(-bx)$\n$a=%1.5f \\pm %1.5f$\n$b = %1.5f \\pm %1.5f$",a,a_err,b,b_err) at 2,-0.15

plot "./data/messung7.dat" using ($1 - t_0):($2 - a), f(x+t_0) - a
