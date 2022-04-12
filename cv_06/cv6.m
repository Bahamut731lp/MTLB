clear;
close all;
clc;

syms test;
f = @(x) atan((x+1)./(x-1));
g = @(y) y ./ sqrt(y.^2.-1);
h = @(z) z.^z;

limit(atan((test+1)./(test-1)), test, -inf)

fplot(f);
axis square;