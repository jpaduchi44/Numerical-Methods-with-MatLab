function sol = NewtonRaphson(told, tnew, h, yold, K_NR, f, df)
  x0 = yold;
  for k = 2:K_NR
    ynew = yold - (yold - x0 - 0.5 * h * (f(told, x0) + f(tnew, yold))) / (1 - 0.5 * h * df(tnew, yold));
    yold = ynew;
  endfor
  sol = ynew;
end
