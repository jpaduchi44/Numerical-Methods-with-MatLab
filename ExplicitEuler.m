function [t, y] = ExplicitEuler(a, b, y0, N, f)
  t = linspace(a, b, N+1)';
  h = (b - a) / N;
  y = zeros(N+1, 1);
  y(1) = y0;
  for i = 1:N
    y(i+1) = y(i) + h * f(t(i), y(i));
  endfor
end
