%A=[1 2 3; 3 0 3; 4 5 6];
%u=[1 0 0]';
%n=4;
%A=generateSPDmatrix(n);
%A=hilb(n);
%A=diag(rand(1,n));
%A=eye(n);
%n=1000;
%A=randn(n);
%A=A'*A;

A = generateLinearHeatFlowMatrix();

f = @(x) 1./x;
tol=1e-9;
maxiter=10;
m=30;
p=0.05;
tic
[Ip,Lp,Up] = Algorithm2(A,f,m,p,tol,maxiter);
toc

interval= Lp<Ip && Ip<Up;
tic
re=trace(inv(A));
toc
fprintf('Ip = %f, Lp = %f, Up = %f, Real value = %f, is in interval = %s, error = %f\n', Ip, Lp, Up, re, mat2str(interval),abs(Ip-re));


