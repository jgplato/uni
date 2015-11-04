set xlabel "Energie [MeV]"
set ylabel "Ereignisse"
set key off

set xrange [0:1.4]


set terminal epslatex size 27cm,18cm
set output "plot-3.tex"

set label 1 "Langzeitspektrum Co-60 (Aufgabe 6)" at graph 0.4, graph 0.9

set label 2 "Photopeak bei 1{,}33 MeV" at 1.33, 2000 rotate by -90 right
set label 3 "Photopeak bei 1{,}17 MeV" at 1.17, 2500 rotate by -90 right
set label 4 "Compton-Kante der 1{,}33 MeV Linie bei 1{,}11 MeV" at 1.11, 800 rotate by -90 right
set label 5 "Compton-Kante der 1{,}17 MeV Linie bei 963 keV" at 0.963, 1300 rotate by -90 right
set label 6 "Backscatter-Linien bei ca. 220 keV (siehe Text)" at 0.22, 2800 rotate by -90 right
set label 7 "Röntgenfluoreszenz bei 75 und 86 keV" at 0.11, 3300 rotate by -90 right

plot "data-3.txt" using ($1/4597.0):2 with boxes
