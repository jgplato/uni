set datafile separator ","

FIT_LIMIT=1e-5

set xlabel "$1/R$ [1/kpc]"
set ylabel "$M$ [$M_\\odot$]"
set key off
set samples 500

set termoption dash
set style line 1 lt 1
set style line 2 lt 1
set style line 3 lt 2

set terminal epslatex size 27cm,18cm
set output "plot-data-9.tex"

set fit errorvariables

A(x) = a/x
fit A(x) "plotdata-9.txt" using (1/$3):6 via a

set label 1 sprintf("\\textbf{Masse der Galaxis}\n\nFitgleichung: $M(R) = \\frac{a}{R}$\n\n$a = 2{,}146\\pm0{,}037 \\cdot 10^{10}$", a, a_err) at graph 0.6, graph 0.6

plot "plotdata-9.txt" using (1/$3):6 ls 1, A(x) ls 2

