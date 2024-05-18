f = @(x) 1./x;
tol=1e-4;
maxiter=100;
m=50;
p=0.95;

for i=1:4

    if i==1
        A = generatePoissonMatrix(30);
        nameofmatrix='Poisson Matrix';
    elseif i==2
        A = generateVFHMatrix(4);
        nameofmatrix='VHF Matrix';
    elseif i==3
        A = generateWathenMatrix(12, 12);
        nameofmatrix='Wathen Matrix';
    elseif i==4
        A = generateLehmerMatrix(200);
        nameofmatrix='Lehmer Matrix';
    end


tic;
[Ip,Lp,Up] = Algorithm2(A,f,m,p,tol,maxiter);
t_Algo2=toc;

%interval= Lp(end)<Ip(end) && Ip(end)<Up(end);

tic;
re=trace(inv(A));
t_direct=toc;

tic;
[~] = SolveNSystems(A);
t_nsystems=toc;

tic;
[~] =nAlgo1(A,f,tol,maxiter);
t_nalgo1=toc;

disp(['For the ' nameofmatrix ' : '])
fprintf('Algorithm 2 : %f, Trace of Inverse : %f, Solving n Systems : %f, Using Algorithm 1 n times : %f\n',t_Algo2,t_direct,t_nsystems,t_nalgo1)


PlotGraph(m,Ip,Lp,Up,re,nameofmatrix)
end