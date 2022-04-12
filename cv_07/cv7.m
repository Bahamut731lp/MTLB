clear;
close all;
clc;

% Úloha 1
fprintf("Úloha 1: %s\n", sym(((12/63) + (21/51))*(7/5)-(22/7)));

% Úloha 2
syms x y fn;
fn = log(abs(cos(x)))+y*x*exp(-x^2);
fprintf("Úloha 2: %s\n", fn);

% Úloha 3
g = subs(fn, x, 1/y);
fprintf("Úloha 3: %s\n", g)

% Úloha 4
fprintf("Úloha 4: %s\n", vpa(subs(g, y, 3), 100));

% Úloha 5

% FIX 5B
fprintf("Úloha 5a: %s\n", vpa(int(g, y, 1, 2), 6));
fprintf("Úloha 5b: %s\n", vpa(subs(g, y, 3/2), 6));

% Úloha 6
pretty(int(fn, x))

% Úloha 7
syms n k;

krok=0.0001;
rozdeleni=0:krok:(pi/2-krok);
% Numerický výpočet
vypocet = sum(sin(rozdeleni+krok/2).^10*krok);

%Analytický výpočet
suma = symsum(sin((2*k*pi)/3), 1, n);

fprintf('Úloha 7a: %s\n', suma);
fprintf('Úloha 7b: %f\n', vpa(vypocet, 40));

% Úloha 8
fprintf("Úloha 8: %s\n", limit(fn, sym(pi/2)));

% Úloha 9
fprintf("Úloha 9: %s\n", int(diff(fn, y), x, 0, inf));

% Úloha 10
[x,y,z] = solve(str2sym("x-3*y+a*z=1"), str2sym("2*x-6*y+9*z=5"), str2sym("-a*x+3*x=0"));
fprintf("Úloha 10a: x=%s, y=%s, z=%s\n", x, y, z);

syms a;
levaStrana = [1 -3 a; 2 -6 9; -a 3 0];
pravaStrana = [1 5 0]';

[V D] = eig(levaStrana);

fprintf("Úloha 10: Nemá řešení pro a = 4.5, a = 1\n");
fprintf("Úloha 10b: %s\n", charpoly(levaStrana));

% Úloha 11
syms x;
fprintf("Úloha 11: %s\n", expand(cos(3*x)-sin(3*x)));

% Úloha 12
syms x;
fprintf("Úloha 12a: %s\n", solve(exp(-x^2+4*x-9) == 1));
fprintf("Úloha 12b: %s\n", roots([-1 4 -9]));