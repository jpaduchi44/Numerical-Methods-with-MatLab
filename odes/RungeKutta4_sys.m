function [t, y] = RungeKutta4_sys(t0, tf, initCond, N, f)
  t = linspace(t0, tf, N+1)';
  h = (tf - t0) / N;
  numEq = length(initCond);
  y = zeros(N+1, numEq);
  for n = 1:numEq
    y(1,n) = initCond(n);
  endfor

  for i = 1:N
    % f is a coloumn vector
    %k are row vectors
    k1 = h * f(t(i), y(i,:))';
    k2 = h * f(t(i) + 0.5 * h, y(i,:) + 0.5 * k1)';
    k3 = h * f(t(i) + 0.5 * h, y(i,:) + 0.5 * k2)';
    k4 = h * f(t(i) + h, y(i,:) + k3)';

    y(i+1, :) = y(i, :) + (k1 + 2 * k2 + 2 * k3 + k4) / 6;
  endfor
end
