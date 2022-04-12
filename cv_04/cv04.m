clc; clear all; close all; echo off;

key = 'python3';
text = 'AHOJJAJSEMTVUJSUPERPOMOCNIK';

keyNums = double(key); %Převede znaky na čísla
[c, sortIndex] = sort(keyNums); %Seřadí čísla písmenek vzestupně

keySorted = 1:numel(sortIndex); %Vytvoří pole o velikosti pole písmenek (konkrétně o velikost pole indexů, které ukazují ze starého pole na nové pole - je to to samé)
keySorted(sortIndex) = keySorted; %Basically to převrátí sorting arrangement

M = strread(text,'%6s') %Rozdělí text po 6 znacích
M = pad(M) %Každou buňku zarovná tak, aby měla stejnou délku
M = cell2mat(M) %Převede cell array na char array pro jednodušší indexování

cipher = M(:, sortIndex); %Přehození sloupců podle šifry
reshape(cipher, 1, []) %Převedení na jeden řádek - náše výsledná, zašifrovaná zpráva.