set xlabel "$1/T$ [1/K]"
set ylabel "$t$ [s]"
set key off



#set termoption dash
#set style line 1 lt 1
#set style line 2 lt 2

#set logscale y

#set terminal epslatex size 27cm,18cm
#set output "plot.tex"

set fit errorvariables

A(x) = a_1*exp(a_2*x)
fit A(x) "./data/plot/A.dat"  using 1:3 via a_1,a_2

B(x) = b_1*exp(b_2*x)
fit B(x) "./data/plot/B.dat"  using 1:3 via b_1,b_2

C(x) = c_1*exp(c_2*x)
fit C(x) "./data/plot/C.dat"  using 1:3 via c_1,c_2

O(x) = o_1*exp(o_2*x)
fit O(x) "./data/plot/O.dat"  using 1:3 via o_1,o_2

set logscale y

set label 1 "Gleichung: $t(1/T) = a \\cdot \\exp b \cdot 1/T$" at 0.00342,800

set label 2 sprintf("$R_A: a=%1.5e \\pm %1.5e, b=%1.5e \\pm %1.5e$", a_1, a_1_err, a_2, a_2_err) at 0.00348,84 rotate by 11 center
set label 3 sprintf("$R_0: a=%1.5e \\pm %1.5e, b=%1.5e \\pm %1.5e$", b_1, b_1_err, b_2, b_2_err) at 0.00348,37 rotate by 11 center
set label 4 sprintf("$R_B: a=%1.5e \\pm %1.5e, b=%1.5e \\pm %1.5e$", o_1, o_1_err, o_2, o_2_err) at 0.00348,24 rotate by 11 center
set label 5 sprintf("$R_C: a=%1.5e \\pm %1.5e, b=%1.5e \\pm %1.5e$", c_1, c_1_err, c_2, c_2_err) at 0.00348,15 rotate by 11 center

plot "./data/plot/A.dat" using 1:3:2:4 w xyerrorbars, A(x), \
     "./data/plot/B.dat" using 1:3:2:4 w xyerrorbars, B(x), \
     "./data/plot/C.dat" using 1:3:2:4 w xyerrorbars, C(x), \
     "./data/plot/O.dat" using 1:3:2:4 w xyerrorbars, O(x)
