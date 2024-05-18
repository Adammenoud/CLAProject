function [trace_inv] = nAlgo1(A,f,tol,maxiter)

n = size(A, 1);
trace_inv = 0;
for i = 1:n
    u = zeros(n, 1);u(i) = 1;
    [L, U, ~] = Algorithm1(A,u,f,tol,maxiter);
    trace_inv = trace_inv + (L+U)/2;
end

end