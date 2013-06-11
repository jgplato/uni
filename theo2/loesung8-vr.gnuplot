set xrange [0:5]
set yrange [-25:25]
L=1
m=1
k=1
a=1
V(x) = -2*k/x * exp(-x/a)
E(x) = L**2/(2*m*x**2)

EV(x) = V(x) + E(x)
plot EV(x) title "V'(r)", V(x) title "V(r)", E(x) title "E_L(r)"
