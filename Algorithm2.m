function [Ip,Lp,Up] = Algorithm2(A,f,m)
p=0.05;
n=size(A,1);
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

Lp=Lp(m);
Up=Up(m);
Ip=I(m);

