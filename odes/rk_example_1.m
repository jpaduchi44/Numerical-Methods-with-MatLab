clear
clc
% ODE parameters
a = 0;
b = 1;
y0 = 1;
N = 10;
y_exact = @(t) exp(t);
f = @(t, y) y;
% Approximation and Plots
[t, y] =RungeKutta4(a, b, y0, N, f);
y_ex = y_exact(t);

subplot(1,2,1)
plot(t, y_ex, t, y, '.r');
title("RK4 Approximations")
subplot(1,2,2)
plot(t, y_ex-y, 'r');
title("Errors")
