function [t, y] = RungeKutta4(a, b, y0, N, f)
  t = linspace(a, b, N+1)';
  h = (b - a) / N;
  y = zeros(N+1, 1);
  y(1) = y0;
  for i = 1:N
    z1 = h * f(t(i), y(i));
    z2 = h * f(t(i) + 0.5 * h, y(i) + 0.5 * z1);
    z3 = h * f(t(i) + 0.5 * h, y(i) + 0.5 * z2);
    z4 = h * f(t(i) + h, y(i) + z3);
    y(i+1) = y(i) + (z1 + 2 * z2 + 2 * z3 + z4) / 6;
  endfor
end
