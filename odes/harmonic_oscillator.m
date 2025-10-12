clear
clc
% Parameters of Harmonic Oscillator
t0 = 0;
tf = 6;
theta0 = 2.0;
omega0 = 1;
N = 1000;
g = 9.8;
l = 1;
% Derivatives of angle THETA and angular velocity OMEGA as functions of TIME, THETA and OMEGA
angularVelocity = @(t, theta, omega) omega;
angularAcceleration = @(t, theta, omega) -g / l * sin(theta);
% Solution and Plot
[t, theta] = RK4_1d(t0, tf, theta0, omega0, N, angularVelocity, angularAcceleration);
plot(t, theta);
