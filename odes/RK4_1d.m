function [t, y] = RK4_1d(a, b, y0, ydot0, N, f1, f2)
  t = linspace(a, b, N+1);
  h = (b - a) / N;
  y = zeros(N+1, 1);
  ydot = zeros(N+1, 1);
  y(1) = y0;
  ydot(1) = ydot0;
  for i = 1:N
    k11 = h * f1(t(i), y(i), ydot(i));
    k21 = h * f2(t(i), y(i), ydot(i));
    k12 = h * f1(t(i) + 0.5 * h, y(i) + 0.5 * k11, ydot(i) + 0.5 * k21);
    k22 = h * f2(t(i) + 0.5 * h, y(i) + 0.5 * k11, ydot(i) + 0.5 * k21);
    k13 = h * f1(t(i) + 0.5 * h, y(i) + 0.5 * k12, ydot(i) + 0.5 * k22);
    k23 = h * f2(t(i) + 0.5 * h, y(i) + 0.5 * k12, ydot(i) + 0.5 * k22);
    k14 = h * f1(t(i) + h, y(i) + k13, ydot(i) + k23);
    k24 = h * f2(t(i) + h, y(i) + k13, ydot(i) + k23);
    y(i+1) = y(i) + (k11 + 2 * k12 + 2 * k13 + k14) / 6;
    ydot(i+1) = ydot(i) + (k21 + 2 * k22 + 2 * k23 + k24) / 6;
  endfor
end
