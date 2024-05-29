function PlotGraph(m,Ip,Lp,Up,re,nameofmatrix)

% Create an x-axis for plotting
x = 1:m;

% Create the plot
figure;
hold on;

% Plot Ip as a solid line with '+' markers
plot(x, Ip, '-+','LineWidth', 2);

% Plot Lp as a dashed line
plot(x, Lp, '--', 'LineWidth', 2);

% Plot Up as a dashed line
plot(x, Up, '--', 'LineWidth', 2);

% Plot re as a solid horizontal line
yline(re, 'r', 'LineWidth', 2);

% Add labels and legend
xlabel('Number of Samples');
ylabel('Trace');
legend('Estimation', 'Lower Bound', 'Upper Bound', '"Exact" Value');
title(nameofmatrix);

hold off;
saveas(gcf, fullfile('Plots', [nameofmatrix '_MC.png']), 'png');

end