tol=1e-4;
maxiter=200;

Ex1=false;
Ex2=false;

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
re=u'*inv(A)*u;
t_inv=toc;
fprintf('Linear heat flow matrix i = %d :\n',i(k))
fprintf('Inverse Method = %e, L = %e, U = %e,  Number of Iterations = %d, Time Algorithm = %f, Time Inverse Method = %f, U-L = %e\n', re, L, U, nbrIter, t_Algo, t_inv,U-L);
end
end



%Test Example 2
if Ex2
% Parameters
k = [4 5]; 

i=[1 100 301 625;
    1 100 2000 3125];

for p=1:size(i,1)
    A = generateVFHMatrix(k(p));
n = size(A,1); 
for q=1:size(i,2)

u=zeros(n,1);u(i(p,q))=1;

f = @(x) 1./x;
tic;
[L,U,nbrIter]=Algorithm1(A,u,f,tol,maxiter);
t_Algo=toc;

tic;
re=u'*inv(A)*u;
t_inv=toc;
fprintf('Vicsek fractal Hamiltonian (VFH) matrix n = %d, i = %d :\n',n,i(p,q))
fprintf('Inverse Method = %e, L = %e, U = %e,  Number of Iterations = %d, Time Algorithm = %f, Time Inverse Method = %f, U-L = %e\n', re, L, U, nbrIter, t_Algo, t_inv,U-L);
end
end
end

