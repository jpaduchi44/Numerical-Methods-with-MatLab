function [t, y] = Trapezoid_NR(a, b, y0, N, K_NR, f, df)
  t = linspace(a, b, N+1)';
  h = (b - a) / N;
  y = zeros(N+1, 1);
  y(1) = y0;
  for i = 1:N
    y(i+1) = NewtonRaphson(t(i), t(i+1), h, y(i), K_NR, f, df);
  endfor
end
