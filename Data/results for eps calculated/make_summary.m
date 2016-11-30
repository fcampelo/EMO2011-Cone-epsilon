%% IMPORTANT: There is a folder-specific line in the HV metric section.
%% Make sure to check that before running this routine!

%% Gamma
cd gd
load Rdeb52
Deb52.gamma.nsga=s1;
Deb52.gamma.epsi=s2;
Deb52.gamma.cone=s3;

load Rpol
Pol.gamma.nsga=s1;
Pol.gamma.epsi=s2;
Pol.gamma.cone=s3;

load Rzdt1
Zdt1.gamma.nsga=s1;
Zdt1.gamma.epsi=s2;
Zdt1.gamma.cone=s3;

load Rzdt6
Zdt6.gamma.nsga=s1;
Zdt6.gamma.epsi=s2;
Zdt6.gamma.cone=s3;

load Rdtlz2
Dtlz2.gamma.nsga=s1;
Dtlz2.gamma.epsi=s2;
Dtlz2.gamma.cone=s3;

%% Delta
cd ../spread
load Rdeb52
Deb52.delta.nsga=deltaA;
Deb52.delta.epsi=deltaB;
Deb52.delta.cone=deltaC;

load Rpol
Pol.delta.nsga=deltaA;
Pol.delta.epsi=deltaB;
Pol.delta.cone=deltaC;

load Rzdt1
Zdt1.delta.nsga=deltaA;
Zdt1.delta.epsi=deltaB;
Zdt1.delta.cone=deltaC;

load Rzdt6
Zdt6.delta.nsga=deltaA;
Zdt6.delta.epsi=deltaB;
Zdt6.delta.cone=deltaC;

load Rdtlz2
Dtlz2.delta.nsga=deltaA;
Dtlz2.delta.epsi=deltaB;
Dtlz2.delta.cone=deltaC;


%% Hv
cd ..
cd ..
cd('HV for the real Pareto fronts')
load hv_deb52
Deb52.hv.realHV = s;
load hv_dtlz2
Dtlz2.hv.realHV = s;
load hv_pol
Pol.hv.realHV = s;
load hv_zdt1
Zdt1.hv.realHV = s;
load hv_zdt6
Zdt6.hv.realHV = s;

cd ..
cd('results for eps calculated/hv')
load Rdeb52
Deb52.hv.nsga=s3/Deb52.hv.realHV;
Deb52.hv.epsi=s2/Deb52.hv.realHV;
Deb52.hv.cone=s1/Deb52.hv.realHV;

load Rpol
Pol.hv.nsga=s3/Pol.hv.realHV;
Pol.hv.epsi=s2/Pol.hv.realHV;
Pol.hv.cone=s1/Pol.hv.realHV;

load Rzdt1
Zdt1.hv.nsga=s3/Zdt1.hv.realHV;
Zdt1.hv.epsi=s2/Zdt1.hv.realHV;
Zdt1.hv.cone=s1/Zdt1.hv.realHV;

load Rzdt6
Zdt6.hv.nsga=s3/Zdt6.hv.realHV;
Zdt6.hv.epsi=s2/Zdt6.hv.realHV;
Zdt6.hv.cone=s1/Zdt6.hv.realHV;

load Rdtlz2
Dtlz2.hv.nsga=s3/Dtlz2.hv.realHV;
Dtlz2.hv.epsi=s2/Dtlz2.hv.realHV;
Dtlz2.hv.cone=s1/Dtlz2.hv.realHV;


%% CS
cd ../cs
load Rdeb52
Deb52.cs.CxN = CS(:,2);
Deb52.cs.NxC = CS(:,5);
Deb52.cs.ExN = CS(:,4);
Deb52.cs.NxE = CS(:,6);
Deb52.cs.CxE = CS(:,1);
Deb52.cs.ExC = CS(:,3);

load RPol
Pol.cs.CxN = CS(:,2);
Pol.cs.NxC = CS(:,5);
Pol.cs.ExN = CS(:,4);
Pol.cs.NxE = CS(:,6);
Pol.cs.CxE = CS(:,1);
Pol.cs.ExC = CS(:,3);

load Rzdt1
Zdt1.cs.CxN = CS(:,2);
Zdt1.cs.NxC = CS(:,5);
Zdt1.cs.ExN = CS(:,4);
Zdt1.cs.NxE = CS(:,6);
Zdt1.cs.CxE = CS(:,1);
Zdt1.cs.ExC = CS(:,3);

load Rzdt6
Zdt6.cs.CxN = CS(:,2);
Zdt6.cs.NxC = CS(:,5);
Zdt6.cs.ExN = CS(:,4);
Zdt6.cs.NxE = CS(:,6);
Zdt6.cs.CxE = CS(:,1);
Zdt6.cs.ExC = CS(:,3);

load Rdtlz2
Dtlz2.cs.CxN = CS(:,2);
Dtlz2.cs.NxC = CS(:,5);
Dtlz2.cs.ExN = CS(:,4);
Dtlz2.cs.NxE = CS(:,6);
Dtlz2.cs.CxE = CS(:,1);
Dtlz2.cs.ExC = CS(:,3);


cd ..
%% Wilcoxon Rank-sum test

Deb52.gamma.Ranksum.CxN = ranksum(Deb52.gamma.cone,Deb52.gamma.nsga);
Deb52.gamma.Ranksum.CxE = ranksum(Deb52.gamma.cone,Deb52.gamma.epsi);
Deb52.gamma.Ranksum.ExN = ranksum(Deb52.gamma.epsi,Deb52.gamma.nsga);
Deb52.hv.Ranksum.CxN = ranksum(Deb52.hv.cone,Deb52.hv.nsga);
Deb52.hv.Ranksum.CxE = ranksum(Deb52.hv.cone,Deb52.hv.epsi);
Deb52.hv.Ranksum.ExN = ranksum(Deb52.hv.epsi,Deb52.hv.nsga);
Deb52.delta.Ranksum.CxN = ranksum(Deb52.delta.cone,Deb52.delta.nsga);
Deb52.delta.Ranksum.CxE = ranksum(Deb52.delta.cone,Deb52.delta.epsi);
Deb52.delta.Ranksum.ExN = ranksum(Deb52.delta.epsi,Deb52.delta.nsga);
Deb52.cs.Ranksum.CxN = ranksum(Deb52.cs.CxN,Deb52.cs.NxC);
Deb52.cs.Ranksum.CxE = ranksum(Deb52.cs.CxE,Deb52.cs.ExC);
Deb52.cs.Ranksum.ExN = ranksum(Deb52.cs.ExN,Deb52.cs.NxE);



Dtlz2.gamma.Ranksum.CxN = ranksum(Dtlz2.gamma.cone,Dtlz2.gamma.nsga);
Dtlz2.gamma.Ranksum.CxE = ranksum(Dtlz2.gamma.cone,Dtlz2.gamma.epsi);
Dtlz2.gamma.Ranksum.ExN = ranksum(Dtlz2.gamma.epsi,Dtlz2.gamma.nsga);
Dtlz2.hv.Ranksum.CxN = ranksum(Dtlz2.hv.cone,Dtlz2.hv.nsga);
Dtlz2.hv.Ranksum.CxE = ranksum(Dtlz2.hv.cone,Dtlz2.hv.epsi);
Dtlz2.hv.Ranksum.ExN = ranksum(Dtlz2.hv.epsi,Dtlz2.hv.nsga);
Dtlz2.delta.Ranksum.CxN = ranksum(Dtlz2.delta.cone,Dtlz2.delta.nsga);
Dtlz2.delta.Ranksum.CxE = ranksum(Dtlz2.delta.cone,Dtlz2.delta.epsi);
Dtlz2.delta.Ranksum.ExN = ranksum(Dtlz2.delta.epsi,Dtlz2.delta.nsga);
Dtlz2.cs.Ranksum.CxN = ranksum(Dtlz2.cs.CxN,Dtlz2.cs.NxC);
Dtlz2.cs.Ranksum.CxE = ranksum(Dtlz2.cs.CxE,Dtlz2.cs.ExC);
Dtlz2.cs.Ranksum.ExN = ranksum(Dtlz2.cs.ExN,Dtlz2.cs.NxE);


Pol.gamma.Ranksum.CxN = ranksum(Pol.gamma.cone,Pol.gamma.nsga);
Pol.gamma.Ranksum.CxE = ranksum(Pol.gamma.cone,Pol.gamma.epsi);
Pol.gamma.Ranksum.ExN = ranksum(Pol.gamma.epsi,Pol.gamma.nsga);
Pol.hv.Ranksum.CxN = ranksum(Pol.hv.cone,Pol.hv.nsga);
Pol.hv.Ranksum.CxE = ranksum(Pol.hv.cone,Pol.hv.epsi);
Pol.hv.Ranksum.ExN = ranksum(Pol.hv.epsi,Pol.hv.nsga);
Pol.delta.Ranksum.CxN = ranksum(Pol.delta.cone,Pol.delta.nsga);
Pol.delta.Ranksum.CxE = ranksum(Pol.delta.cone,Pol.delta.epsi);
Pol.delta.Ranksum.ExN = ranksum(Pol.delta.epsi,Pol.delta.nsga);
Pol.cs.Ranksum.CxN = ranksum(Pol.cs.CxN,Pol.cs.NxC);
Pol.cs.Ranksum.CxE = ranksum(Pol.cs.CxE,Pol.cs.ExC);
Pol.cs.Ranksum.ExN = ranksum(Pol.cs.ExN,Pol.cs.NxE);


Zdt1.gamma.Ranksum.CxN = ranksum(Zdt1.gamma.cone,Zdt1.gamma.nsga);
Zdt1.gamma.Ranksum.CxE = ranksum(Zdt1.gamma.cone,Zdt1.gamma.epsi);
Zdt1.gamma.Ranksum.ExN = ranksum(Zdt1.gamma.epsi,Zdt1.gamma.nsga);
Zdt1.hv.Ranksum.CxN = ranksum(Zdt1.hv.cone,Zdt1.hv.nsga);
Zdt1.hv.Ranksum.CxE = ranksum(Zdt1.hv.cone,Zdt1.hv.epsi);
Zdt1.hv.Ranksum.ExN = ranksum(Zdt1.hv.epsi,Zdt1.hv.nsga);
Zdt1.delta.Ranksum.CxN = ranksum(Zdt1.delta.cone,Zdt1.delta.nsga);
Zdt1.delta.Ranksum.CxE = ranksum(Zdt1.delta.cone,Zdt1.delta.epsi);
Zdt1.delta.Ranksum.ExN = ranksum(Zdt1.delta.epsi,Zdt1.delta.nsga);
Zdt1.cs.Ranksum.CxN = ranksum(Zdt1.cs.CxN,Zdt1.cs.NxC);
Zdt1.cs.Ranksum.CxE = ranksum(Zdt1.cs.CxE,Zdt1.cs.ExC);
Zdt1.cs.Ranksum.ExN = ranksum(Zdt1.cs.ExN,Zdt1.cs.NxE);


Zdt6.gamma.Ranksum.CxN = ranksum(Zdt6.gamma.cone,Zdt6.gamma.nsga);
Zdt6.gamma.Ranksum.CxE = ranksum(Zdt6.gamma.cone,Zdt6.gamma.epsi);
Zdt6.gamma.Ranksum.ExN = ranksum(Zdt6.gamma.epsi,Zdt6.gamma.nsga);
Zdt6.hv.Ranksum.CxN = ranksum(Zdt6.hv.cone,Zdt6.hv.nsga);
Zdt6.hv.Ranksum.CxE = ranksum(Zdt6.hv.cone,Zdt6.hv.epsi);
Zdt6.hv.Ranksum.ExN = ranksum(Zdt6.hv.epsi,Zdt6.hv.nsga);
Zdt6.delta.Ranksum.CxN = ranksum(Zdt6.delta.cone,Zdt6.delta.nsga);
Zdt6.delta.Ranksum.CxE = ranksum(Zdt6.delta.cone,Zdt6.delta.epsi);
Zdt6.delta.Ranksum.ExN = ranksum(Zdt6.delta.epsi,Zdt6.delta.nsga);
Zdt6.cs.Ranksum.CxN = ranksum(Zdt6.cs.CxN,Zdt6.cs.NxC);
Zdt6.cs.Ranksum.CxE = ranksum(Zdt6.cs.CxE,Zdt6.cs.ExC);
Zdt6.cs.Ranksum.ExN = ranksum(Zdt6.cs.ExN,Zdt6.cs.NxE);


%% Hodges-Lehman estimator


Deb52.gamma.HL.CxN = hle(Deb52.gamma.cone,Deb52.gamma.nsga);
Deb52.gamma.HL.CxE = hle(Deb52.gamma.cone,Deb52.gamma.epsi);
Deb52.gamma.HL.ExN = hle(Deb52.gamma.epsi,Deb52.gamma.nsga);
Deb52.hv.HL.CxN = hle(Deb52.hv.cone,Deb52.hv.nsga);
Deb52.hv.HL.CxE = hle(Deb52.hv.cone,Deb52.hv.epsi);
Deb52.hv.HL.ExN = hle(Deb52.hv.epsi,Deb52.hv.nsga);
Deb52.delta.HL.CxN = hle(Deb52.delta.cone,Deb52.delta.nsga);
Deb52.delta.HL.CxE = hle(Deb52.delta.cone,Deb52.delta.epsi);
Deb52.delta.HL.ExN = hle(Deb52.delta.epsi,Deb52.delta.nsga);
Deb52.cs.HL.CxN = hle(Deb52.cs.CxN,Deb52.cs.NxC);
Deb52.cs.HL.CxE = hle(Deb52.cs.CxE,Deb52.cs.ExC);
Deb52.cs.HL.ExN = hle(Deb52.cs.ExN,Deb52.cs.NxE);


Dtlz2.gamma.HL.CxN = hle(Dtlz2.gamma.cone,Dtlz2.gamma.nsga);
Dtlz2.gamma.HL.CxE = hle(Dtlz2.gamma.cone,Dtlz2.gamma.epsi);
Dtlz2.gamma.HL.ExN = hle(Dtlz2.gamma.epsi,Dtlz2.gamma.nsga);
Dtlz2.hv.HL.CxN = hle(Dtlz2.hv.cone,Dtlz2.hv.nsga);
Dtlz2.hv.HL.CxE = hle(Dtlz2.hv.cone,Dtlz2.hv.epsi);
Dtlz2.hv.HL.ExN = hle(Dtlz2.hv.epsi,Dtlz2.hv.nsga);
Dtlz2.delta.HL.CxN = hle(Dtlz2.delta.cone,Dtlz2.delta.nsga);
Dtlz2.delta.HL.CxE = hle(Dtlz2.delta.cone,Dtlz2.delta.epsi);
Dtlz2.delta.HL.ExN = hle(Dtlz2.delta.epsi,Dtlz2.delta.nsga);
Dtlz2.cs.HL.CxN = hle(Dtlz2.cs.CxN,Dtlz2.cs.NxC);
Dtlz2.cs.HL.CxE = hle(Dtlz2.cs.CxE,Dtlz2.cs.ExC);
Dtlz2.cs.HL.ExN = hle(Dtlz2.cs.ExN,Dtlz2.cs.NxE);


Pol.gamma.HL.CxN = hle(Pol.gamma.cone,Pol.gamma.nsga);
Pol.gamma.HL.CxE = hle(Pol.gamma.cone,Pol.gamma.epsi);
Pol.gamma.HL.ExN = hle(Pol.gamma.epsi,Pol.gamma.nsga);
Pol.hv.HL.CxN = hle(Pol.hv.cone,Pol.hv.nsga);
Pol.hv.HL.CxE = hle(Pol.hv.cone,Pol.hv.epsi);
Pol.hv.HL.ExN = hle(Pol.hv.epsi,Pol.hv.nsga);
Pol.delta.HL.CxN = hle(Pol.delta.cone,Pol.delta.nsga);
Pol.delta.HL.CxE = hle(Pol.delta.cone,Pol.delta.epsi);
Pol.delta.HL.ExN = hle(Pol.delta.epsi,Pol.delta.nsga);
Pol.cs.HL.CxN = hle(Pol.cs.CxN,Pol.cs.NxC);
Pol.cs.HL.CxE = hle(Pol.cs.CxE,Pol.cs.ExC);
Pol.cs.HL.ExN = hle(Pol.cs.ExN,Pol.cs.NxE);


Zdt1.gamma.HL.CxN = hle(Zdt1.gamma.cone,Zdt1.gamma.nsga);
Zdt1.gamma.HL.CxE = hle(Zdt1.gamma.cone,Zdt1.gamma.epsi);
Zdt1.gamma.HL.ExN = hle(Zdt1.gamma.epsi,Zdt1.gamma.nsga);
Zdt1.hv.HL.CxN = hle(Zdt1.hv.cone,Zdt1.hv.nsga);
Zdt1.hv.HL.CxE = hle(Zdt1.hv.cone,Zdt1.hv.epsi);
Zdt1.hv.HL.ExN = hle(Zdt1.hv.epsi,Zdt1.hv.nsga);
Zdt1.delta.HL.CxN = hle(Zdt1.delta.cone,Zdt1.delta.nsga);
Zdt1.delta.HL.CxE = hle(Zdt1.delta.cone,Zdt1.delta.epsi);
Zdt1.delta.HL.ExN = hle(Zdt1.delta.epsi,Zdt1.delta.nsga);
Zdt1.cs.HL.CxN = hle(Zdt1.cs.CxN,Zdt1.cs.NxC);
Zdt1.cs.HL.CxE = hle(Zdt1.cs.CxE,Zdt1.cs.ExC);
Zdt1.cs.HL.ExN = hle(Zdt1.cs.ExN,Zdt1.cs.NxE);

Zdt6.gamma.HL.CxN = hle(Zdt6.gamma.cone,Zdt6.gamma.nsga);
Zdt6.gamma.HL.CxE = hle(Zdt6.gamma.cone,Zdt6.gamma.epsi);
Zdt6.gamma.HL.ExN = hle(Zdt6.gamma.epsi,Zdt6.gamma.nsga);
Zdt6.hv.HL.CxN = hle(Zdt6.hv.cone,Zdt6.hv.nsga);
Zdt6.hv.HL.CxE = hle(Zdt6.hv.cone,Zdt6.hv.epsi);
Zdt6.hv.HL.ExN = hle(Zdt6.hv.epsi,Zdt6.hv.nsga);
Zdt6.delta.HL.CxN = hle(Zdt6.delta.cone,Zdt6.delta.nsga);
Zdt6.delta.HL.CxE = hle(Zdt6.delta.cone,Zdt6.delta.epsi);
Zdt6.delta.HL.ExN = hle(Zdt6.delta.epsi,Zdt6.delta.nsga);
Zdt6.cs.HL.CxN = hle(Zdt6.cs.CxN,Zdt6.cs.NxC);
Zdt6.cs.HL.CxE = hle(Zdt6.cs.CxE,Zdt6.cs.ExC);
Zdt6.cs.HL.ExN = hle(Zdt6.cs.ExN,Zdt6.cs.NxE);

save results_summary Deb52 Pol Zdt1 Zdt6 Dtlz2