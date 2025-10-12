clear
clc
a = 0;
b = 1;
y0 = 1;
N1 = 50;
N2 = 100;
y_exact = @(t) exp(t);
f = @(t, y) y;

[t1, y1] =ExplicitEuler(a, b, y0, N1, f);
[t2, y2] =ExplicitEuler(a, b, y0, N2, f);
y_ex1 = y_exact(t1);
y_ex2 = y_exact(t2);

err1 = max(abs(y_ex1-y1));
err2 = max(abs(y_ex2-y2));
p = log(err1 / err2) / log(N2 / N1);

subplot(1,2,1)
plot(t2, y_ex2, t1, y1, '.r', t2, y2, '.g');
title("Euler Approximations")
subplot(1,2,2)
plot(t1, y_ex1-y1, 'r', t2, y_ex2-y2, 'g');
title("Errors")
