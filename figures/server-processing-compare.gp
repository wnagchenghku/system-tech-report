set terminal postscript eps enhanced "NimbusSanL-Regu, 24" fontfile "/usr/share/texlive/texmf-dist/fonts/type1/urw/helvetic/uhvr8a.pfb"

set border 3

set style data histogram
set style histogram rowstack gap 1

set xtics nomirror
set ytics nomirror

set ylabel "Consensus latency (us)" offset 2.2,0
set xtics font ",14"
#set xrange[-0.75:14]
set yrange [0:120]

set xlabel "Number of concurrent connections" offset 0,-0.5

set style fill solid border -1
set boxwidth 0.75

set key autotitle columnheader
#set key outside below center
#set key left top
set termoption enhanced
set style histogram rowstacked title offset 0,0.5

plot newhistogram "{/*0.7 DARE (update-heavy)}" lt 1, \
'throughput-compare2.dat' u 3:xtic(1) fs pattern 2 notitle, '' u 2 fs pattern 4, \
newhistogram "{/*0.7 DARE (read-heavy)}" lt 1, \
'throughput-compare2.dat' u 5:xtic(1) fs pattern 2, '' u 4 fs pattern 4 notitle, \
newhistogram "{/*0.7 APUS}" lt 1, \
'throughput-compare2.dat' u 7:xtic(1) fs pattern 2 notitle, '' u 6 fs pattern 4 notitle
