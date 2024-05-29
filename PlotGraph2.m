function PlotGraph2(tol, t_Algo2, t_direct, t_nsystems, t_nalgo1, nameofmatrix)
figure
colors=lines(4);
plot(tol,t_Algo2,Color=colors(1,:),LineWidth=1.5)
hold on
plot(tol,t_direct*ones(1,length(tol)),Color=colors(2,:),LineWidth=1.5)
plot(tol,t_nsystems*ones(1,length(tol)),Color=colors(3,:),LineWidth=1.5)
plot(tol,t_nalgo1,Color=colors(4,:),LineWidth=1.5)

grid on
xlabel('Tolerance');
ylabel('Execution Time');
legend('Algorithm 2', 'trace(inv(A))', 'Solve n systems', 'Algorithm 1 n times');

title(nameofmatrix);
end