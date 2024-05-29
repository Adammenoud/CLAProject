f = @(x) 1./x;
tol=10.^-(1:7);
maxiter=100;
m=50;
p=0.95;

for i=1:4

    if i==1
        A = generatePoissonMatrix(30);
        nameofmatrix='Poisson Matrix';
    elseif i==2
        A = generateNegVFHMatrix(4);
        nameofmatrix='VHF Matrix';
    elseif i==3
        A = generateWathenMatrix(12, 12);
        nameofmatrix='Wathen Matrix';
    elseif i==4
        A = generateLehmerMatrix(200);
        nameofmatrix='Lehmer Matrix';
    end

t_Algo2=zeros(length(tol));
t_nalgo1=zeros(length(tol));
for j=1:length(tol)
tic;
[~,~,~,~,~] = Algorithm2(A,f,m,p,tol(j),maxiter);
t_Algo2(j)=toc;
tic;
[~] =nAlgo1(A,f,tol(j),maxiter);
t_nalgo1(j)=toc;
end

%interval= Lp(end)<Ip(end) && Ip(end)<Up(end);

tic;
re=trace(inv(A));
t_direct=toc;

tic;
[~] = SolveNSystems(A);
t_nsystems=toc;


PlotGraph2(tol, t_Algo2, t_direct, t_nsystems, t_nalgo1, nameofmatrix)

end