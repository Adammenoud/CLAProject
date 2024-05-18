LHF = generateLinearHeatFlowMatrix(30,0.2);

cond(full(LHF))



k = 4;
Hk = generateVFHMatrix(k);

cond(full(Hk))



n = 30;
P = generatePoissonMatrix(n);

cond(full(P))



nx = 12;
ny = 12;
W = generateWathenMatrix(nx, ny);

cond(full(W))



n = 200;
L = generateLehmerMatrix(n);

cond(L)



n = 300;
alpha = 1;
P = generatePeiMatrix(n, alpha);

cond(P)