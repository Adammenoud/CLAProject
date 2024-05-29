function PlotGraph2(tol, t_Algo2, t_direct, t_nsystems, t_nalgo1, nameofmatrix)
figure
colors=lines(4);
loglog(tol,t_Algo2,Color=colors(1,:),LineWidth=1.5)
hold on
loglog(tol,t_direct*ones(1,length(tol)),Color=colors(2,:),LineWidth=1.5)
loglog(tol,t_nsystems*ones(1,length(tol)),Color=colors(3,:),LineWidth=1.5)
loglog(tol,t_nalgo1,Color=colors(4,:),LineWidth=1.5)

grid on
xlabel('Tolerance');
ylabel('Execution Time');
legend('Algorithm 2', 'trace(inv(A))', 'Solve n systems', 'Algorithm 1 n times');

title(nameofmatrix);
saveas(gcf, fullfile('Plots', [nameofmatrix '_Tol.png']), 'png');
end