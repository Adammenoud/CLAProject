
tol=1e-4;
maxiter=200;

Ex1=true;
Ex2=true;
Ex3=true;

%Test Example 1
if Ex1
% Parameters
k = 30; % Number of intervals in one dimension
v = 0.2; % Example value for v, which is Delta t / h^2
n = k^2; 
A = generateLinearHeatFlowMatrix(k,v);

i=[1 22 32];
fprintf('Table 1\n')
fprintf('Linear heat flow matrix: n = %d\n',n)
fprintf(' i , "Exact" Value , Iter , Lower bound L , Upper bound U , U - L\n')
for k=1:length(i)

u=zeros(n,1);u(i(k))=1;

f = @(x) 1./x;
tic;
[L,U,nbrIter]=Algorithm1(A,u,f,tol,maxiter);
t_Algo=toc;

tic;
re=u'*inv(A)*u;
t_inv=toc;
fprintf('$%d$ & $%e$ & $%d$ & $%e$ & $%e$ & $%e$\n',i(k),re,nbrIter,L,U,U-L)
%fprintf('Inverse Method = %e, L = %e, U = %e,  Number of Iterations = %d, Time Algorithm = %f, Time Inverse Method = %f, U-L = %e\n', re, L, U, nbrIter, t_Algo, t_inv,U-L);
end


i=[2 20 200 200 889];
j=[1 21 181 700 895];
fprintf('Table 2\n')
fprintf('Linear heat flow matrix: n = %d\n',n)
fprintf(' i , j , "Exact" Value , Iter , Lower bound L , Upper bound U , U - L\n')
for k=1:length(i)

u=zeros(n,1);u(i(k))=1;
v=zeros(n,1);v(j(k))=1;

y = u + v;
z = u - v;

f = @(x) 1./x;
tic;
[Lz,Uz,nbrIterz]=Algorithm1(A,z,f,tol,maxiter);
[Ly,Uy,nbrItery]=Algorithm1(A,y,f,tol,maxiter);
t_Algo=toc;
L=1/4*(Ly-Lz);
U=1/4*(Uy-Uz);
tic;
re=u'*inv(A)*v;
t_inv=toc;

nbrItermin=min(nbrItery,nbrIterz);
nbrItermax=max(nbrItery,nbrIterz);

fprintf('$%d$ & $%d$ & $%e$ & $%d - %d$ & $%e$ & $%e$ & $%e$\n',i(k),j(k),re,nbrItermin,nbrItermax,L,U,U-L)
%fprintf('Inverse Method = %e, L = %e, U = %e,  Number of Iterations = %d, Time Algorithm = %f, Time Inverse Method = %f, U-L = %e\n', re, L, U, nbrIter, t_Algo, t_inv,U-L);
end




end



%Test Example 2
if Ex2
% Parameters
k = [4 5]; 

i=[1 100 301 625;
    1 100 2000 3125];
fprintf('Table 3\n')

for p=1:size(i,1)
    A = generateNegVFHMatrix(k(p));
n = size(A,1); 
fprintf('Vicsek fractal Hamiltonian matrix: n = %d\n',n)
fprintf(' i , "Exact" Value , Iter , Lower bound L , Upper bound U , U - L\n')
%fprintf(' i , Iter , Lower bound L , Upper bound U , U - L, "Exact" Value\n')
for q=1:size(i,2)

u=zeros(n,1);u(i(p,q))=1;

f = @(x) 1./x;
tic;
[L,U,nbrIter]=Algorithm1(A,u,f,tol,maxiter);
t_Algo=toc;

tic;
re=u'*inv(A)*u;
t_inv=toc;

fprintf('$%d$ & $%e$ & $%d$ & $%e$ & $%e$ & $%e$\n',i(p,q),re,nbrIter,L,U,U-L)
%fprintf('$%d$ & $%d$ & $%e$ & $%e$ & $%e$ & $%e$\n',i(p,q),nbrIter,L,U,U-L,re)


%fprintf('Vicsek fractal Hamiltonian (VFH) matrix n = %d, i = %d :\n',n,i(p,q))
%fprintf('Inverse Method = %e, L = %e, U = %e,  Number of Iterations = %d, Time Algorithm = %f, Time Inverse Method = %f, U-L = %e\n', re, L, U, nbrIter, t_Algo, t_inv,U-L);
end
end
end




%Test Example 3
if Ex3
% Parameters
k=30;
n=k^2;
A = generatePoissonMatrix(k);
c=cond(A);




i=[2 1 10 41 58 450 550 600 650];
j=[1 900 90 42 59 449 750 602 750];
fprintf('Table 4\n')
fprintf('Poisson matrix,: n = %d, cond(A) = %f\n',n,c)
fprintf(' i , j , "Exact" Value , Iter , Lower bound L , Upper bound U , U - L\n')
for k=1:length(i)

u=zeros(n,1);u(i(k))=1;
v=zeros(n,1);v(j(k))=1;

y = u + v;
z = u - v;

f = @(x) 1./x;
tic;
[Lz,Uz,nbrIterz]=Algorithm1(A,z,f,tol,maxiter);
[Ly,Uy,nbrItery]=Algorithm1(A,y,f,tol,maxiter);
t_Algo=toc;
L=1/4*(Ly-Lz);
U=1/4*(Uy-Uz);
tic;
re=u'*inv(A)*v;
t_inv=toc;

nbrItermin=min(nbrItery,nbrIterz);
nbrItermax=max(nbrItery,nbrIterz);

fprintf('$%d$ & $%d$ & $%e$ & $%d - %d$ & $%e$ & $%e$ & $%e$\n',i(k),j(k),re,nbrItermin,nbrItermax,L,U,U-L)
%fprintf('Inverse Method = %e, L = %e, U = %e,  Number of Iterations = %d, Time Algorithm = %f, Time Inverse Method = %f, U-L = %e\n', re, L, U, nbrIter, t_Algo, t_inv,U-L);
end




end





