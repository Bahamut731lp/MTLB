clear;
close all;
clc;

% Úloha 1
% Vytvoření náhodných rozměrů v definovaném rozmezí
delka = nahodnyRozmer();
sirka = nahodnyRozmer();
hloubka = nahodnyRozmer();

% Vytvoření trojrozměrného pole
C = randn(delka ,sirka, hloubka);

% Úloha 2
akumulator = 0;

for i = 1:numel(C)
    akumulator = akumulator + C(i);
end

prumerFor = akumulator / numel(C);
prumerSum = sum(C, "all") / numel(C);

% Úloha 3
% Odstranění hloubky (3. dimenze) matice C
C1 = squeeze(C(1,:,:));
% Odečtení průměrů řádků
A = C1 - mean(C1,2)

% Úloha 4
% Goniometrická funkce pro prvky
goniometric = @(x) sin(x).^2.*cos(x);
fprintf('Goniometrická funkce: %f\n', goniometric(5));

% Logování formátovaných výsledků
fprintf('Součet všech prvků: %f\n', akumulator);
fprintf('Průměr z for-loopu: %f\n', prumerFor);
fprintf('Průměr z sum funkce: %f\n', prumerSum);

function [rozmer] = nahodnyRozmer
    minimum = 10;
    maximum = 40;
    %minimum + (maximum-minimum) vytvoří celek (40)
    %rand vrací hodnotu mezi 0 a 1 - použiju to tedy jako koeficient a
    %dostanu náhodné procento z celku.
    rozmer = round(minimum + (maximum-minimum) .* rand(), 0);
end