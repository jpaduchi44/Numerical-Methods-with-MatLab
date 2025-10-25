clear
clc

a = 0;
b = 2;
y0 = -1;
y_exact = @(t) exp(t) - t .^ 2 - 3 * t - 2;
f = @(t, y) y + t .^ 2 + t - 1;
% Approximations
N1 = 10;
[t1, y1] = GeneralRungeKutta4(a, b, y0, N1, f);
y_ex1 = y_exact(t1);
plot(t1, y_ex1, 'b', t1, y1, 'r*');
err1 = max(abs(y_ex1 - y1));
N2 = 100;
[t2, y2] = GeneralRungeKutta4(a, b, y0, N2, f);
y_ex2 = y_exact(t2);
err2 = max(abs(y_ex2 - y2));
p = log(err1/err2) / log(N2/N1);
