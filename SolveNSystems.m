function [trace_inv] = SolveNSystems(A)
n = size(A, 1);
trace_inv = 0;
for i = 1:n
    u = zeros(n, 1);u(i) = 1;
    x = A \ u;
    trace_inv = trace_inv + x(i);
end
end