set xlabel "$1/T$ [1/K]"
set ylabel "$t$ [s]"
set key off

set termoption dash
set style line 1 lt 1
set style line 2 lt 1
set style line 3 lt 2

set terminal epslatex size 27cm,18cm
set output "plot.tex"

set fit errorvariables

A(x) = a_1*exp(a_2*x)
fit A(x) "./data/plot/A.dat"  using 1:3 via a_1,a_2
a_2_err_up   = 12
a_2_err_down = 10
A_up(x)   = a_1*exp((a_2+a_2_err_up)*x)
A_down(x) = a_1*exp((a_2-a_2_err_down)*x)

B(x) = b_1*exp(b_2*x)
fit B(x) "./data/plot/B.dat"  using 1:3 via b_1,b_2
b_2_err_up   = 9
b_2_err_down = 11
B_up(x)   = b_1*exp((b_2+b_2_err_up)*x)
B_down(x) = b_1*exp((b_2-b_2_err_down)*x)

O(x) = o_1*exp(o_2*x)
fit O(x) "./data/plot/O.dat"  using 1:3 via o_1,o_2
o_2_err_up   = 10
o_2_err_down = 16
O_up(x)   = o_1*exp((o_2+o_2_err_up)*x)
O_down(x) = o_1*exp((o_2-o_2_err_down)*x)

C(x) = c_1*exp(c_2*x)
fit C(x) "./data/plot/C.dat"  using 1:3 via c_1,c_2
c_2_err_up   = 12
c_2_err_down = 17
C_up(x)   = c_1*exp((c_2+c_2_err_up)*x)
C_down(x) = c_1*exp((c_2-c_2_err_down)*x)


set logscale y

set label 1 "Fitgleichung: $y = a e^{b x}$" at 0.00351,13

set label 2 sprintf("$R_A$: $a=\\num{%1.2e}, b=\\num{%4.0f+-%2.0f}$", a_1, a_2, a_2_err_up)   at 0.00348,88 rotate by 18 center
set label 3 sprintf("$R_0$: $a=\\num{%1.2e}, b=\\num{%4.0f+-%2.0f}$", b_1, b_2, b_2_err_down) at 0.00348,38 rotate by 18 center
set label 4 sprintf("$R_B$: $a=\\num{%1.2e}, b=\\num{%4.0f+-%2.0f}$", o_1, o_2, o_2_err_down) at 0.00348,24 rotate by 17 center
set label 5 sprintf("$R_C$: $a=\\num{%1.2e}, b=\\num{%4.0f+-%2.0f}$", c_1, c_2, c_2_err_down) at 0.00348,15 rotate by 16 center



set xrange [0.0034:0.00354]
set yrange [8:150]
target_temp = 273.15 + 20
set arrow from (1/target_temp),graph(0,0) to (1/target_temp),graph(1,1) nohead
set label 6 "$T = 20\\,^{\\circ}\\mathrm{C}$" at 1/target_temp+1.5e-6,100 rotate by 90 left

set label  7 sprintf("$t_A = \\SI{%2.1f+-%1.1f}{s}$", A(1/target_temp), A(1/target_temp)-A_down(1/target_temp)) at 0.003413,46.0 rotate by 18 left
set label  8 sprintf("$t_B = \\SI{%2.2f+-%1.2f}{s}$", B(1/target_temp), B_up(1/target_temp)-B(1/target_temp))   at 0.003413,20.0 rotate by 18 left
set label  9 sprintf("$t_0 = \\SI{%2.2f+-%1.2f}{s}$", O(1/target_temp), O_up(1/target_temp)-O(1/target_temp))   at 0.003413,13.0 rotate by 17 left
set label 10 sprintf("$t_C = \\SI{%2.2f+-%1.2f}{s}$", C(1/target_temp), C_up(1/target_temp)-C(1/target_temp))   at 0.003413,8.70 rotate by 16 left

plot "./data/plot/A.dat" using 1:3:2:4 w xyerrorbars ls 1, A(x) ls 2, A_up(x) ls 3, A_down(x) ls 3, \
     "./data/plot/B.dat" using 1:3:2:4 w xyerrorbars ls 1, B(x) ls 2, B_up(x) ls 3, B_down(x) ls 3, \
     "./data/plot/C.dat" using 1:3:2:4 w xyerrorbars ls 1, C(x) ls 2, C_up(x) ls 3, C_down(x) ls 3, \
     "./data/plot/O.dat" using 1:3:2:4 w xyerrorbars ls 1, O(x) ls 2, O_up(x) ls 3, O_down(x) ls 3
