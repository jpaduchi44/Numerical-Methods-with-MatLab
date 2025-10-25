clear
clc

a = 0;
b = 1;
y0 = 1;
f = @(t, y) y;
df = @(t, y) 1;
y_exact = @(t) exp(t);
K_NR = 7;

N1 = 50;
[t1, y1] = Trapezoid_NR(a, b, y0, N1, K_NR, f, df);
y_ex1 = y_exact(t1);
err1 = max(abs(y_ex1 - y1));
N2 = 100;
[t2, y2] = Trapezoid_NR(a, b, y0, N2, K_NR, f, df);
y_ex2 = y_exact(t2);
err2 = max(abs(y_ex2 - y2));
p = log(err1/err2) / log(N2/N1);
plot(t1, y_ex1, t1, y1, '.');
