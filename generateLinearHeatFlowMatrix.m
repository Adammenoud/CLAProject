function LHF = generateLinearHeatFlowMatrix()
% Parameters
k = 30; % Number of intervals in one dimension
n = k^2; % Total size of the matrix A
v = 0.2; % Example value for v, which is Delta t / h^2

% Constructing the tridiagonal matrix D
e = ones(k, 1);
D = spdiags([-v*e, (1 + 4*v)*e, -v*e], -1:1, k, k);

% Constructing the diagonal matrix C
C = -v * speye(k);

% Constructing the block tridiagonal matrix A
LHF = sparse(n, n);

% Fill the block tridiagonal matrix A
for i = 1:k
    for j = 1:k
        row = (i-1)*k + 1;
        col = (j-1)*k + 1;
        if i == j
            LHF(row:row+k-1, col:col+k-1) = D;
        elseif abs(i - j) == 1
            LHF(row:row+k-1, col:col+k-1) = C;
        end
    end
end

end