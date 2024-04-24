%A=[1 2 3; 3 0 3; 4 5 6];
%u=[1 0 0]';
n=100;
A=generateSPDmatrix(n);
%A=diag(rand(1,n));
%A=eye(n);
u=zeros(n,1);u(4)=1;

f = @(x) 1./x;

[L,U]=Algorithm1(A,u,f);


% What is the output?! how L=U in the paper?!?!


re=u'*(A^-1)*u;

fprintf('L = %f, U = %f, Real value = %f\n', L, U, re);



