%A=[1 2 3; 3 0 3; 4 5 6];
%u=[1 0 0]';
n=100;
A=generateSPDmatrix(n);
%A=diag(rand(1,n));
%A=eye(n);
u=zeros(n,1);u(1)=1;

f = @(x) 1./x;


p=0.05;
%function [Ip,Lp,Up] = Algo2(A,f,p)
n=size(A,1);
m=30;
I=zeros(1,m);L=zeros(1,m);U=zeros(1,m);Lp=zeros(1,m);Up=zeros(1,m);
Lmin=Inf;
Umax=-Inf;
Z=2*binornd(1, 0.5, n, m)-1;

for j=1:m

    [l,u]=Algorithm1(A,Z(:,j),f);
    L(j)=l;U(j)=u;
    if j>1
        I(j)=(sum(L+U))/(2*j);
    else
        I(j)=(L(j)+U(j))/2;
    end

    Lmin=min(Lmin,L(j));
    Umax=max(Umax,U(j));
    
    eta=sqrt(-0.5*j*(Umax-Lmin)^2*(log(1-p)/2));

    Lp(j)=(sum(L)-eta)/j;
    Up(j)=(sum(U)+eta)/j;

end





re=sum(diag(A^-1));

fprintf('I_p = %f, Lp = %f, Up = %f, Real value = %f\n', I(m), Lp(m), Up(m), re);



