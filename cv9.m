clear;
close all;
clc;

funkce = @(x) (sin(x)./x) + exp(-(x-4).^2);
interval = -10:0.01:10;
plot(interval, funkce(interval));

fprintf("minimum 1: %f\n", fminbnd(funkce, 2, 4));
fprintf("minimum 2: %f\n", fminbnd(funkce, 4, 6));

funkce = @(x) (x.^4./4)-(41.*x.^3./6)+(209.*x.^2./4)-135.*x;
interval = -50:0.01:50;
plot(interval, funkce(interval));
fprintf("g. minimum: %f\n", fminbnd(funkce, -50, 50));

funkce = @(x) 100*(x(2) - x(1)^2)^2 + (1 - x(1))^2;
x0 = [-2:2,-2:2];
x = fminsearch(funkce, x0);

funkce = [-5 -2 -6];
levaStrana = [1 -1 1; 3 2 4; 3 2 0; -1 0 0; 0 -1 0; 0 0 -1];
pravaStrana = [20; 42; 30; 0; 0; 0];
x = linprog(funkce,levaStrana,pravaStrana)

syms x1 x2 x3;
levaStrana = [1 -1 1; 1 2 -6];
pravaStrana = [-1 5];

H = double(hessian(4*x1^2 + 2*x2^2 + 3*x3^2 + 2*x1*x2 - 3*x2*x3 - x1));
f = [-1 0 0];

quadprog(H, f, levaStrana, pravaStrana, [], [], [0 0 0]);