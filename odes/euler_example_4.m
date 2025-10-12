clear
clc
% ODE parameters
a = 0;
b = 2;
y0 = -1;
N = 40;
y_exact = @(t) exp(t) - t .^ 2 - 3 * t - 2;
f = @(t, y) y + t .^ 2 + t - 1;
% Approximations
[t, y1] = ExplicitEuler(a, b, y0, N, f);
[t, y2] = ImprovedEuler(a, b, y0, N, f);
[t, y3] = ModifiedEuler(a, b, y0, N, f);
y_ex = y_exact(t);

subplot(1,2,1)
plot(t, y_ex, 'b', t, y1, '--r', t, y2, '--g', t, y3, '--y');
title("Approximations");
subplot(1,2,2)
plot(t, abs(y_ex-y1), '--r', t, abs(y_ex-y2), '--g', t, abs(y_ex-y3), '--y');
title("Erors");
