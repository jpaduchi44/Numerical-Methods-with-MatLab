clear
clc

t0 = 0;
tf = 20;
N = 2000;

sigma = 10;
rho = 36;
b = 8/3;

f = @(t, x) [sigma * (x(2) - x(1));
             -x(1) * x(3) + rho * x(1) - x(2);
             x(1) * x(2) - b * x(3)];

init1 = [1; 1; 1];
[t, solution1] = RungeKutta4_sys(t0, tf, init1, N, f);
init2 = [1.1; 1; 1];
[t, solution2] = RungeKutta4_sys(t0, tf, init2, N, f);

plot3(solution1(:,1),solution1(:,2),solution1(:,3));
hold on;
plot3(solution2(:,1),solution2(:,2),solution2(:,3));
plot3(solution1(end,1),solution1(end,2),solution1(end,3), 'o');
plot3(solution2(end,1),solution2(end,2),solution2(end,3), 'o');
