function [t, y] = Trapezoid_FP(a, b, y0, N, K_FP, f)
  t = linspace(a, b, N+1)';
  h = (b - a) / N;
  y = zeros(N+1, 1);
  y(1) = y0;
  for i = 1:N
    y(i+1) = FixedPoint(t(i), t(i+1), h, y(i), K_FP, f);
  endfor
end
