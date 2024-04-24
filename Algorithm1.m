function [L, U] = Algorithm1(A,u,f)
tol=1e-9;
maxiter=10;
x=zeros(size(u,1),maxiter);

alpha=zeros(1,maxiter);
gamma=zeros(1,maxiter);
IA=zeros(1,maxiter);
IB=zeros(1,maxiter);
x(:,2)=u/norm(u);

a = eigs(A,1);
b = eigs(A,1,'smallestabs');

for j=(3:maxiter+1)
   % 1-3 and 9
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

   % 4
    T = diag(alpha(3:j))+ diag(gamma(3:j-1),1)+diag(gamma(3:j-1),-1);
    ej=zeros(j-2,1);ej(end)=1;


warning('off', 'MATLAB:nearlySingularMatrix');

    delta = (T-a*eye(j-2,j-2))\(gamma(j)^2*ej);    
    phi = delta(j-2);
    TtildeA = [T gamma(j)*ej ; gamma(j)*ej' phi ];

    delta = (T-b*eye(j-2,j-2))\(gamma(j)^2*ej);    
    phi = delta(j-2);    
    TtildeB = [T gamma(j)*ej ; gamma(j)*ej' phi ];

warning('on', 'MATLAB:nearlySingularMatrix');

   % 5
    [V, D] = eig(TtildeA);
    theta=diag(D);
    omega=V(1,:); 
   
   % 6 
    IA(j) = sum(omega.^2*f(theta));
    
   % 7 is this what is meant by repeat?
    [V, D] = eig(TtildeB);
    theta=diag(D);
    omega=V(1,:); 
   
    IB(j) = sum(omega.^2*f(theta));

   % 8
   U=norm(u)^2*IA(j);
   L=norm(u)^2*IB(j);

   if(abs(U-L)<tol && j>3)
        break
   end

end

end