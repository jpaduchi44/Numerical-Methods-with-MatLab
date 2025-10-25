function [t, y] = GeneralRungeKutta4(t0, tf, initCond, N, f)
  t = linspace(t0, tf, N+1)';
  h = (tf - t0) / N;
  numEq = length(initCond);
  y = zeros(N+1, numEq);
  for n = 1:numEq
    y(1,n) = initCond(n);
  endfor

  for i = 1:N

    k1 = h * f(t(i), y(i,:));
    k2 = h * f(t(i) + 0.5 * h, y(i,:) + 0.5 * k1);
    k3 = h * f(t(i) + 0.5 * h, y(i,:) + 0.5 * k2);
    k4 = h * f(t(i) + h, y(i,:) + k3);
    for n = 1:numEq
      y(i+1, n) = y(i, n) + (k1(n) + 2 * k2(n) + 2 * k3(n) + k4(n)) / 6;
    endfor
  endfor
end
