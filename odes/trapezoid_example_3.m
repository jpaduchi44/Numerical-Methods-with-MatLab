clear
clc

a = 0;
b = 1;
y0 = 1;
f = @(t, y) sin(y) + exp(t) .* (log(t+1) + (t+2) ./ (t+1)) - sin(exp(t) .* (log(t+1) + 1));
df = @(t, y) cos(y);
y_exact = @(t) exp(t) .* (log(t+1) + 1);
K_FP = 7;

N1 = 10;
[t1, y1] = Trapezoid_FP(a, b, y0, N1, K_FP, f);
y_ex1 = y_exact(t1);
err1 = max(abs(y_ex1 - y1));
N2 = 100;
[t2, y2] = Trapezoid_FP(a, b, y0, N2, K_FP, f);
y_ex2 = y_exact(t2);
err2 = max(abs(y_ex2 - y2));
p = log(err1/err2) / log(N2/N1);
plot(t1, y_ex1, t1, y1, '*');
