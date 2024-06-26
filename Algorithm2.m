function [Ip,Lp,Up,itmin,itmax] = Algorithm2(A,f,m,p,tol,maxiter)

n=size(A,1);
Ip=zeros(1,m);L=zeros(1,m);U=zeros(1,m);Lp=zeros(1,m);Up=zeros(1,m);
Lmin=Inf;
Umax=-Inf;
Z=2*binornd(1, 0.5, n, m)-1;
itmin=Inf;itmax=-Inf;
for j=1:m

    [L(j),U(j),it]=Algorithm1(A,Z(:,j),f,tol,maxiter);
    
    if it<itmin
        itmin=it;
    end
    if it>itmax
        itmax=it;
    end

    Ip(j)=(sum(L+U))/(2*j);

    Lmin=min(Lmin,L(j));
    Umax=max(Umax,U(j));
    
    eta=sqrt(-0.5*j*(Umax-Lmin)^2*(log(1-p)/2));

    Lp(j)=(sum(L)-eta)/j;
    Up(j)=(sum(U)+eta)/j;

end

%Lp=Lp(m);
%Up=Up(m);
%Ip=Ip(m);

