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
f = @ (t, y) [y(2); -g / l * sin(y(1))];
angularVelocity = @(t, theta, omega) omega;
angularAcceleration = @(t, theta, omega) -g / l * sin(theta);
% Approximate Solution
[t, solution] = RungeKutta4_sys(t0, tf, [theta0, omega0], N, f);
theta = solution(:,1);
omega = solution(:,2);
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
