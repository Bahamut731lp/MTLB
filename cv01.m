clear;
close all;
clc;

a = 1:50
b = zeros(0,10);

for i = 1:0.2:10
    b(end + 1) = i
end

A = zeros(3,3);
A(:) = 1 % Matice plná jedniček

B = zeros(3,3) % Nulová matice
D = eye(3, 3) % Jednotková matice

M = [A B D] % Matice 3*9

C = [1 -1 1; 1 -1 0; -1 0 1]

B1 = inv(C)

C .* B1 % Vynásobení po prvcích
C * B1 % Maticové násobení

disp('Transponování zde:')
transpose(M) * C % Maticové násobení M a C

C(:,2) = rand(3,1) % Náhodné prvky v druhém sloupci matice C
C(1, :) = [4 7 5] % Přepsání prvního řádku C s vlastními hodnotami
C1 = C(1, [end - 1 , end]) % Vypsání prvků v prvního řádku a posledních 2 sloupců

% Prvky matice, které jsou větší nebo rovny nule se přepíší na jedničku
for i = 1:numel(C)
    if (C(i) >= 0)
        C(i) = 1;
    else
        C(i) = rand();
    end
end

C
disp("Konec programu")
