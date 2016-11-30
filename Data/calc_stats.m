%load results_summary

%% Wilcoxon Rank-sum test

Deb52.gamma.Ranksum.CxN = ranksum(Deb52.gamma.cone,Deb52.gamma.nsga)
Deb52.gamma.Ranksum.CxE = ranksum(Deb52.gamma.cone,Deb52.gamma.epsi)
Deb52.gamma.Ranksum.ExN = ranksum(Deb52.gamma.epsi,Deb52.gamma.nsga)
Deb52.hv.Ranksum.CxN = ranksum(Deb52.hv.cone,Deb52.hv.nsga)
Deb52.hv.Ranksum.CxE = ranksum(Deb52.hv.cone,Deb52.hv.epsi)
Deb52.hv.Ranksum.ExN = ranksum(Deb52.hv.epsi,Deb52.hv.nsga)
Deb52.delta.Ranksum.CxN = ranksum(Deb52.delta.cone,Deb52.delta.nsga)
Deb52.delta.Ranksum.CxE = ranksum(Deb52.delta.cone,Deb52.delta.epsi)
Deb52.delta.Ranksum.ExN = ranksum(Deb52.delta.epsi,Deb52.delta.nsga)


Dtlz2.gamma.Ranksum.CxN = ranksum(Dtlz2.gamma.cone,Dtlz2.gamma.nsga)
Dtlz2.gamma.Ranksum.CxE = ranksum(Dtlz2.gamma.cone,Dtlz2.gamma.epsi)
Dtlz2.gamma.Ranksum.ExN = ranksum(Dtlz2.gamma.epsi,Dtlz2.gamma.nsga)
Dtlz2.hv.Ranksum.CxN = ranksum(Dtlz2.hv.cone,Dtlz2.hv.nsga)
Dtlz2.hv.Ranksum.CxE = ranksum(Dtlz2.hv.cone,Dtlz2.hv.epsi)
Dtlz2.hv.Ranksum.ExN = ranksum(Dtlz2.hv.epsi,Dtlz2.hv.nsga)
Dtlz2.delta.Ranksum.CxN = ranksum(Dtlz2.delta.cone,Dtlz2.delta.nsga)
Dtlz2.delta.Ranksum.CxE = ranksum(Dtlz2.delta.cone,Dtlz2.delta.epsi)
Dtlz2.delta.Ranksum.ExN = ranksum(Dtlz2.delta.epsi,Dtlz2.delta.nsga)


Pol.gamma.Ranksum.CxN = ranksum(Pol.gamma.cone,Pol.gamma.nsga)
Pol.gamma.Ranksum.CxE = ranksum(Pol.gamma.cone,Pol.gamma.epsi)
Pol.gamma.Ranksum.ExN = ranksum(Pol.gamma.epsi,Pol.gamma.nsga)
Pol.hv.Ranksum.CxN = ranksum(Pol.hv.cone,Pol.hv.nsga)
Pol.hv.Ranksum.CxE = ranksum(Pol.hv.cone,Pol.hv.epsi)
Pol.hv.Ranksum.ExN = ranksum(Pol.hv.epsi,Pol.hv.nsga)
Pol.delta.Ranksum.CxN = ranksum(Pol.delta.cone,Pol.delta.nsga)
Pol.delta.Ranksum.CxE = ranksum(Pol.delta.cone,Pol.delta.epsi)
Pol.delta.Ranksum.ExN = ranksum(Pol.delta.epsi,Pol.delta.nsga)


Zdt1.gamma.Ranksum.CxN = ranksum(Zdt1.gamma.cone,Zdt1.gamma.nsga)
Zdt1.gamma.Ranksum.CxE = ranksum(Zdt1.gamma.cone,Zdt1.gamma.epsi)
Zdt1.gamma.Ranksum.ExN = ranksum(Zdt1.gamma.epsi,Zdt1.gamma.nsga)
Zdt1.hv.Ranksum.CxN = ranksum(Zdt1.hv.cone,Zdt1.hv.nsga)
Zdt1.hv.Ranksum.CxE = ranksum(Zdt1.hv.cone,Zdt1.hv.epsi)
Zdt1.hv.Ranksum.ExN = ranksum(Zdt1.hv.epsi,Zdt1.hv.nsga)
Zdt1.delta.Ranksum.CxN = ranksum(Zdt1.delta.cone,Zdt1.delta.nsga)
Zdt1.delta.Ranksum.CxE = ranksum(Zdt1.delta.cone,Zdt1.delta.epsi)
Zdt1.delta.Ranksum.ExN = ranksum(Zdt1.delta.epsi,Zdt1.delta.nsga)


Zdt6.gamma.Ranksum.CxN = ranksum(Zdt6.gamma.cone,Zdt6.gamma.nsga)
Zdt6.gamma.Ranksum.CxE = ranksum(Zdt6.gamma.cone,Zdt6.gamma.epsi)
Zdt6.gamma.Ranksum.ExN = ranksum(Zdt6.gamma.epsi,Zdt6.gamma.nsga)
Zdt6.hv.Ranksum.CxN = ranksum(Zdt6.hv.cone,Zdt6.hv.nsga)
Zdt6.hv.Ranksum.CxE = ranksum(Zdt6.hv.cone,Zdt6.hv.epsi)
Zdt6.hv.Ranksum.ExN = ranksum(Zdt6.hv.epsi,Zdt6.hv.nsga)
Zdt6.delta.Ranksum.CxN = ranksum(Zdt6.delta.cone,Zdt6.delta.nsga)
Zdt6.delta.Ranksum.CxE = ranksum(Zdt6.delta.cone,Zdt6.delta.epsi)
Zdt6.delta.Ranksum.ExN = ranksum(Zdt6.delta.epsi,Zdt6.delta.nsga)


%% Hodges-Lehman estimator


Deb52.gamma.HL.CxN = hle(Deb52.gamma.cone,Deb52.gamma.nsga)
Deb52.gamma.HL.CxE = hle(Deb52.gamma.cone,Deb52.gamma.epsi)
Deb52.gamma.HL.ExN = hle(Deb52.gamma.epsi,Deb52.gamma.nsga)
Deb52.hv.HL.CxN = hle(Deb52.hv.cone,Deb52.hv.nsga)
Deb52.hv.HL.CxE = hle(Deb52.hv.cone,Deb52.hv.epsi)
Deb52.hv.HL.ExN = hle(Deb52.hv.epsi,Deb52.hv.nsga)
Deb52.delta.HL.CxN = hle(Deb52.delta.cone,Deb52.delta.nsga)
Deb52.delta.HL.CxE = hle(Deb52.delta.cone,Deb52.delta.epsi)
Deb52.delta.HL.ExN = hle(Deb52.delta.epsi,Deb52.delta.nsga)


Dtlz2.gamma.HL.CxN = hle(Dtlz2.gamma.cone,Dtlz2.gamma.nsga)
Dtlz2.gamma.HL.CxE = hle(Dtlz2.gamma.cone,Dtlz2.gamma.epsi)
Dtlz2.gamma.HL.ExN = hle(Dtlz2.gamma.epsi,Dtlz2.gamma.nsga)
Dtlz2.hv.HL.CxN = hle(Dtlz2.hv.cone,Dtlz2.hv.nsga)
Dtlz2.hv.HL.CxE = hle(Dtlz2.hv.cone,Dtlz2.hv.epsi)
Dtlz2.hv.HL.ExN = hle(Dtlz2.hv.epsi,Dtlz2.hv.nsga)
Dtlz2.delta.HL.CxN = hle(Dtlz2.delta.cone,Dtlz2.delta.nsga)
Dtlz2.delta.HL.CxE = hle(Dtlz2.delta.cone,Dtlz2.delta.epsi)
Dtlz2.delta.HL.ExN = hle(Dtlz2.delta.epsi,Dtlz2.delta.nsga)


Pol.gamma.HL.CxN = hle(Pol.gamma.cone,Pol.gamma.nsga)
Pol.gamma.HL.CxE = hle(Pol.gamma.cone,Pol.gamma.epsi)
Pol.gamma.HL.ExN = hle(Pol.gamma.epsi,Pol.gamma.nsga)
Pol.hv.HL.CxN = hle(Pol.hv.cone,Pol.hv.nsga)
Pol.hv.HL.CxE = hle(Pol.hv.cone,Pol.hv.epsi)
Pol.hv.HL.ExN = hle(Pol.hv.epsi,Pol.hv.nsga)
Pol.delta.HL.CxN = hle(Pol.delta.cone,Pol.delta.nsga)
Pol.delta.HL.CxE = hle(Pol.delta.cone,Pol.delta.epsi)
Pol.delta.HL.ExN = hle(Pol.delta.epsi,Pol.delta.nsga)


Zdt1.gamma.HL.CxN = hle(Zdt1.gamma.cone,Zdt1.gamma.nsga)
Zdt1.gamma.HL.CxE = hle(Zdt1.gamma.cone,Zdt1.gamma.epsi)
Zdt1.gamma.HL.ExN = hle(Zdt1.gamma.epsi,Zdt1.gamma.nsga)
Zdt1.hv.HL.CxN = hle(Zdt1.hv.cone,Zdt1.hv.nsga)
Zdt1.hv.HL.CxE = hle(Zdt1.hv.cone,Zdt1.hv.epsi)
Zdt1.hv.HL.ExN = hle(Zdt1.hv.epsi,Zdt1.hv.nsga)
Zdt1.delta.HL.CxN = hle(Zdt1.delta.cone,Zdt1.delta.nsga)
Zdt1.delta.HL.CxE = hle(Zdt1.delta.cone,Zdt1.delta.epsi)
Zdt1.delta.HL.ExN = hle(Zdt1.delta.epsi,Zdt1.delta.nsga)


Zdt6.gamma.HL.CxN = hle(Zdt6.gamma.cone,Zdt6.gamma.nsga)
Zdt6.gamma.HL.CxE = hle(Zdt6.gamma.cone,Zdt6.gamma.epsi)
Zdt6.gamma.HL.ExN = hle(Zdt6.gamma.epsi,Zdt6.gamma.nsga)
Zdt6.hv.HL.CxN = hle(Zdt6.hv.cone,Zdt6.hv.nsga)
Zdt6.hv.HL.CxE = hle(Zdt6.hv.cone,Zdt6.hv.epsi)
Zdt6.hv.HL.ExN = hle(Zdt6.hv.epsi,Zdt6.hv.nsga)
Zdt6.delta.HL.CxN = hle(Zdt6.delta.cone,Zdt6.delta.nsga)
Zdt6.delta.HL.CxE = hle(Zdt6.delta.cone,Zdt6.delta.epsi)
Zdt6.delta.HL.ExN = hle(Zdt6.delta.epsi,Zdt6.delta.nsga)