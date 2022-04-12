clear;
close all;
clc;

A = randn(10, 20)
B = round(A)

COLUMNS = size(B,2);

for i = 1:COLUMNS
    for j = 1:COLUMNS-1
        x = B(:,j); %První sloupec
        y = B(:,j+1);  %Druhej sloupec
        
        mask = x ~= y; %~= - Not equal to => Dá to jedničku tam, kde se sloupce nerovnají
        index = find(mask, 1, 'first') %Najde první jedničku - první index, kde se sloupce nerovnají
        
        if B(index, j) < B(index, j+1) %Pokud je hodnota v prvním sloupci menší než ta v druhém
            temp = B(:, j);
            B(:, j) = B(:, j+1);
            B(:, j+1) = temp; %Dojde k prohození
        end
    end
end

B