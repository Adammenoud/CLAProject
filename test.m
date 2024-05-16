k=4;

    P1_1 = 3; P2_1 = 2; P3_1 = 5; P4_1 = 4;

    P3 = calculateP(P3_1,k);


function P = calculateP(P_init,k)

if k-1==1
    P = P_init;
elseif k-1>1

    P = 5^(k-2)*(P_init-1) + calculateP(P_init,k-1);

else

    P=-1;

end

end