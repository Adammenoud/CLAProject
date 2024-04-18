A=[1 2 3; 3 0 3; 4 5 6];
u=[1 0 0]';
f = @(x) 1./x;

%function [L, U] = Algo1(A,u,f)
maxiter=100;
x=zeros(size(u,1),maxiter);

alpha=zeros(1,maxiter);
gamma=zeros(1,maxiter);
I=zeros(1,maxiter);
x(:,2)=u/norm(u);

for j=(3:maxiter+1)
    alpha(j)=x(:,j-1)'*A*x(:,j-1);
    rj=A*x(:,j-1)-alpha(j)*x(:,j-1)-gamma(j-1)*x(:,j-2);
    gamma(j)=norm(rj);
    x(:,j) = rj/gamma(j);


   % T = sparse(j-2,j-2);
   % T = spdiags(alpha(3:j),0,T);    
   % if j>3
   % T = spdiags(gamma(3:j-1),1,T);
   % T = spdiags(gamma(3:j-1),-1,T);
   % end

    T = diag(alpha(3:j))+ diag(gamma(3:j-1),1)+diag(gamma(3:j-1),-1);
    ej=zeros(j-2,1);ej(end)=1;


    %choose a or b ????
    a = 1;

    delta = (T-a*eye(j-2,j-2))\(gamma(j)^2*ej);    
    phi=delta(j-2);
    Ttilde = [T gamma(j)*ej ; gamma(j)*ej' phi ];
 

    [V, D] = eig(Ttilde);
    theta=diag(D);

    omega=V(1,:); %correct?
    
    I(j) = sum(omega.^2*f(theta));
    

end

I(end)




