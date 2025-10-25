function sol = FixedPoint(told, tnew, h, yold, K_FP, f)
  x0 = yold;
  for k = 2:K_FP
    ynew = x0 + 0.5 * h * (f(told, x0) + f(tnew, yold));
    yold = ynew;
  endfor
  sol = ynew;
end
