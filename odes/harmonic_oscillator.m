clear
clc
% Parameters of Harmonic Oscillator
t0 = 0;
tf = 8;
theta0 = 2.9;
omega0 = 0;
N = 100;
h = (tf - t0) / N;
g = 9.8;
l = 1;
% Derivatives of angle THETA and angular velocity OMEGA as functions of TIME, THETA and OMEGA
angularVelocity = @(t, theta, omega) omega;
angularAcceleration = @(t, theta, omega) -g / l * sin(theta);
% Approximate Solution
[t, theta, omega] = RK4_1d(t0, tf, theta0, omega0, N, angularVelocity, angularAcceleration);
% Cartesian Coordinates
x = l * sin(theta);
y = l * -cos(theta);

subplot(2,2,1);
plot(t, theta);
xlabel("Time (sec)");
ylabel("Angle Theta");
subplot(2,2,2);
plot(t, omega);
xlabel("Time (sec)");
ylabel("Angular Velocity");
subplot(2,2,3);
%plot(x,y);
%fanimator(@plot,x,y,"ko",MarkerFaceColor="k",AnimationRange=[t0, tf]);
%comet(x,y);

for i = 1:N+1
  plot(x(i),y(i), 'ko');
  axis([-1.1 1.1 -1.1 1.1]);
  hold on;
  plot([0, x(i)], [0, y(i)]);
  text(0, 0.5, num2str(t(i)));
  hold off;
  pause(h/4);
endfor
