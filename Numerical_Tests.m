tol=1e-4;
maxiter=20;

Ex1=false;
Ex2=true;

%Test Example 1
if Ex1
% Parameters
k = 30; % Number of intervals in one dimension
v = 0.2; % Example value for v, which is Delta t / h^2
n = k^2; 
A = generateLinearHeatFlowMatrix(k,v);

i=[1 22 32];

for k=1:length(i)

u=zeros(n,1);u(i(k))=1;

f = @(x) 1./x;
tic;
[L,U,nbrIter]=Algorithm1(A,u,f,tol,maxiter);
t_Algo=toc;

tic;
re=u'*(A^-1)*u;
t_inv=toc;
fprintf('Linear heat flow matrix i = %d :\n',i(k))
fprintf('Inverse Method = %e, L = %e, U = %e,  Number of Iterations = %d, Time Algorithm = %f, Time Inverse Method = %f, U-L = %e\n', re, L, U, nbrIter, t_Algo, t_inv,U-L);
end
end



%Test Example 2
if Ex2
% Parameters
k = 4; 
A = generateVFHMatrix(k);
n = size(A,1); 

i=[1 100 301 625];

for k=1:length(i)

u=zeros(n,1);u(i(k))=1;

f = @(x) 1./x;
tic;
[L,U,nbrIter]=Algorithm1(A,u,f,tol,maxiter);
t_Algo=toc;



tic;
re=u'*(A^-1)*u;
t_inv=toc;
fprintf('Vicsek fractal Hamiltonian (VFH) matrix i = %d :\n',i(k))
fprintf('Inverse Method = %e, L = %e, U = %e,  Number of Iterations = %d, Time Algorithm = %f, Time Inverse Method = %f, U-L = %e\n', re, L, U, nbrIter, t_Algo, t_inv,U-L);
end
end

