clear
clc
% ODE parameters
a = 0;
b = 1;
y0 = 1;
N = [50, 100, 200, 500, 1000]; % Array with number of intervals
y_exact = @(t) cos(2 * pi * t);
f = @(t, y) y .^ 2 + (sin(2 * pi * t) - 2 * pi) * sin(2 * pi * t) -1;

subplot(1,2,1)
hold on
for i = 1:length(N)
  [t, y] = ImprovedEuler(a, b, y0, N(i), f);
  y_ex = y_exact(t);
  err(i) = max(abs(y_ex - y)); % max error for every N
  plot(t, y_ex-y, '--'); % plot error for every approximation point
end
%plot(t, y_ex);
hold off
title("Errors");

% Rate/Order of Convergence
pLength = length(N) - 1;
p = zeros(pLength, 1);

for i = 1:pLength
  p(i) = log(err(i)/err(i+1)) / log(N(i+1)/N(i));
end
subplot(1,2,2)
plot(1:pLength, p, 1:pLength, 2*ones(pLength, 1));
title("Experimental Convergence Order");
