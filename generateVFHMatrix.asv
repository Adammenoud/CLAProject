%Peut-etre faux?!?!
function Hk = generateVFHMatrix(k)
    % Base case for the recursion
    H1 = [-4 1 1 1 1; 
          1 -2 0 0 0; 
          1 0 -2 0 0; 
          1 0 0 -2 0; 
          1 0 0 0 -2];
    
    if k == 1
        Hk = H1;
        return;
    end

    % Recursive call for the (k-1)th stage matrix
    Hk_1 = generateVFHMatrix(k-1);
    nk_1 = size(Hk_1, 1);
    
    % Calculate positions for interaction matrices
    P1_1 = 3; P2_1 = 2; P3_1 = 5; P4_1 = 4;

    P1 = calculateP(P1_1,k);
    P2 = calculateP(P2_1,k);
    P3 = calculateP(P3_1,k);
    P4 = calculateP(P4_1,k);
    
    % Create interaction matrices
    V1 = sparse(nk_1, nk_1); V1(P1, P2) = 1;
    V2 = sparse(nk_1, nk_1); V2(P2, P1) = 1;
    V3 = sparse(nk_1, nk_1); V3(P3, P4) = 1;
    V4 = sparse(nk_1, nk_1); V4(P4, P3) = 1;

    % Construct Hk matrix
    Hk = sparse(5*nk_1, 5*nk_1);
    Hk(1:nk_1, 1:nk_1) = Hk_1;
    Hk(nk_1+1:2*nk_1, nk_1+1:2*nk_1) = Hk_1;
    Hk(2*nk_1+1:3*nk_1, 2*nk_1+1:3*nk_1) = Hk_1;
    Hk(3*nk_1+1:4*nk_1, 3*nk_1+1:4*nk_1) = Hk_1;
    Hk(4*nk_1+1:5*nk_1, 4*nk_1+1:5*nk_1) = Hk_1;

    % Insert interaction blocks
    Hk(1:nk_1, nk_1+1:2*nk_1) = V1;
    Hk(nk_1+1:2*nk_1, 1:nk_1) = V1';
    
    Hk(1:nk_1, 2*nk_1+1:3*nk_1) = V2;
    Hk(2*nk_1+1:3*nk_1, 1:nk_1) = V2';
    
    Hk(1:nk_1, 3*nk_1+1:4*nk_1) = V3;
    Hk(3*nk_1+1:4*nk_1, 1:nk_1) = V3';
    
    Hk(1:nk_1, 4*nk_1+1:5*nk_1) = V4;
    Hk(4*nk_1+1:5*nk_1, 1:nk_1) = V4';
end



function P = calculateP(P_init,k)

if k-1==1
    P = P_init;
elseif k-1>1

    P = 5^(k-2)*(P_init-1) + calculateP(P_init,k-1);

else

    P=-1;

end

end
