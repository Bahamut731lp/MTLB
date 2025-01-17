clear;
close all;
clc;

%% Deklarace 
syms x;
krok = 0.001;

%% První integrál
a = vpa(int(((2 + cos(x))^-1), x, 0, 2*pi), 6);

rozdeleni = 0:krok:(2*pi);
n = vpa(sum((2 + cos(rozdeleni + krok / 2)).^(-1)*krok), 6);

fprintf("%-24s: %s\n", "Analytický výsledek", a);
fprintf("%-24s: %s\n", "Numerický výsledek", n);
fprintf("\n");
%% Druhý integrál
a = vpa(int(x*atan(x), x, 0, sqrt(3)), 6);

rozdeleni = 0:krok:(sqrt(3));
n = vpa(sum((rozdeleni+krok/2).*atan(rozdeleni+krok/2).*krok), 6);

fprintf("%-24s: %s\n", "Analytický výsledek", a);
fprintf("%-24s: %s\n", "Numerický výsledek", n);
fprintf("\n");
%% Třetí integrál
a = vpa(int(sqrt(1-sin(2*x)), x, 0, 2*pi), 6);

rozdeleni = 0:krok:(2*pi);
n = vpa(sum(sqrt(1-sin(2.*(rozdeleni+krok/2))).*krok), 6);

fprintf("%-24s: %s\n", "Analytický výsledek", a);
fprintf("%-24s: %s\n", "Numerický výsledek", n);
fprintf("\n");
%% Čtvrtý integrál
a = vpa(int(exp(-x.^2), x, -10, 5),6);

rozdeleni = (-10):krok:(5);
n = vpa(sum(exp(-(rozdeleni+krok/2).^2).*krok), 6);

fprintf("%-24s: %s\n", "Analytický výsledek", a);
fprintf("%-24s: %s\n", "Numerický výsledek", n);
fprintf("\n");
%% Pátý integrál
a = vpa(int(exp(-x.^2), x, -inf, inf), 6);

rozdeleni = (-10000):krok:(10000);
n = vpa(sum(exp(-(rozdeleni+krok / 2).^2)*krok), 6);

fprintf("%-24s: %s\n", "Analytický výsledek", a);
fprintf("%-24s: %s\n", "Numerický výsledek", n);
fprintf("\n");

%%
fprintf("\n Úloha 2 \n");

%% První suma
rozdeleni = 1:10000;

a = vpa(symsum((((-1).^(x)) ./ (2.^(x - 1))), x, 1, inf), 6);
n = vpa(sum((-1).^(rozdeleni) .* (1 ./ 2.^(rozdeleni - 1))), 6);

fprintf("%-24s: %s\n", "Analytický výsledek", a);
fprintf("%-24s: %s\n", "Numerický výsledek", n);
fprintf("\n");

%% Druhá suma
a = vpa(symsum((1 ./ (x.*(x+1))), x, 1, inf), 6);
n = vpa(sum((1 ./ (rozdeleni .* (rozdeleni + 1)))), 6);

fprintf("%-24s: %s\n", "Analytický výsledek", a);
fprintf("%-24s: %s\n", "Numerický výsledek", n);
fprintf("\n");

%% Třetí suma
a = vpa(symsum(((-1).^x ./ x), x, 1, inf), 6);
n = vpa(sum((-1).^rozdeleni ./ rozdeleni), 6);

fprintf("%-24s: %s\n", "Analytický výsledek", a);
fprintf("%-24s: %s\n", "Numerický výsledek", n);
fprintf("\n");

%% Čtvrtá suma
rozdeleni = 1:50;

a = vpa(symsum(((2.*x - 1) ./ (2.^x)), x, 1, inf), 6);
n = vpa(sum(((2.*rozdeleni - 1) ./ (2.^rozdeleni))), 6);

fprintf("%-24s: %s\n", "Analytický výsledek", a);
fprintf("%-24s: %s\n", "Numerický výsledek", n);
fprintf("\n");

%% Úloha 3
syms a;
hold on;

B = [1 7 a; (a.^2) 3 (1-a); 0 5 6];
d = det(B);
prubeh = subs(d, a, -10:10);
plot(prubeh);

funkciHodnoty = sym2cell(prubeh);
funkciHodnoty = double(vertcat(funkciHodnoty{:}));

min = funkciHodnoty(islocalmin(funkciHodnoty));
max = funkciHodnoty(islocalmax(funkciHodnoty));

fprintf("%-24s: %f\n", "Minimum:", min);
fprintf("%-24s: %f\n", "Maximum:", max);
fprintf("\n");

B = [a 8 (-3*a); 1 (1-a).^2 a; 3 -1 4];
d = det(B);
prubeh = subs(d, a, -10:10);
plot(prubeh);

funkciHodnoty = sym2cell(prubeh);
funkciHodnoty = double(vertcat(funkciHodnoty{:}));

min = funkciHodnoty(islocalmin(funkciHodnoty));
max = funkciHodnoty(islocalmax(funkciHodnoty));

fprintf("%-24s: %f\n", "Minimum:", min);
fprintf("%-24s: %f\n", "Maximum:", max);
fprintf("\n");