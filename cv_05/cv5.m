clear;
close all;
clc;

% Úloha 1
figure("Name", "Úloha 1");
set(gcf,'units','normalized','outerposition',[0 0.5 .5 .5])
[hex_x,hex_y] = ngon(6, 2);
plot(hex_x, hex_y);
axis square;

% Úloha 3
figure("Name", "Úloha 3a");
set(gcf,'units','normalized','outerposition',[0 0 .5 .5])

x = -5:0.05:5;

% Úloha 3a
hold on;
plot(f(x));
plot(f(x,1));
plot(f(x,2));
xlabel("Osa X"), ylabel("Osa Y"), title("Grafy funkcí", "f(x), f(x, 1), f(x, 2)");
hold off;

% Úloha 3b
figure("Name", "Úloha 3b");
set(gcf,'units','normalized','outerposition',[0.5 0 .5 .5])

%Vytvoření grafu pro první průběh funkce
osa1 = subplot(3, 1, 1);
plot(f(x), 'Color', [1, 0, 0]);
xlabel("Osa X"), ylabel("Osa Y"), title("Graf funkce f(x)",  "Tady je nějaký podtitulek");

%Vytvoření grafu pro druhý průběh funkce
osa2 = subplot(3, 1, 2);
plot(f(x,1), 'Color', [0, 1, 0])
xlabel("Osa X"), ylabel("Osa Y"), title("Graf funkce f(x, 1)", "Tady je nějaký podtitulek");

%Vytvoření grafu pro třetí průběh funkce
osa3 = subplot(3, 1, 3);
plot(f(x,2), 'Color', [0, 0, 1])
xlabel("Osa X"), ylabel("Osa Y"), title("Graf funkce f(x, 2)", "Tady je nějaký podtitulek");

linkaxes([osa1, osa2, osa3],'x');


fig = figure("Name", "Úloha 4");
set(gcf,'units','normalized','outerposition',[0.5 0.5 .5 .5])

x = -5:0.1:5;
y = -6:0.2:6;

[X, Y] = meshgrid(x, y);


surf(x, y, f(X, Y));

% Úloha 2 - Pomocná funkce
function [vysledek] = f(x,y)
    %Ošetření chybějícího parametru y
    if nargin == 1
        y = 0;
    end

%     % Pokud je y pole, tak se srovnají délky
%     % "Pokud počet prvků (numel) není roven 1"
%     if (numel(y)~=1)
%         % Srovnání délek vektorů
%         % Zjištění, který vektor je kratší
%         shortestLength = min(numel(x), numel(y));
%     
%         % Řídící vektor je vždycky x
%         temp = zeros(1, numel(x));
%         % Pokud by prvky v y chyběly, zduplikuje se poslední prvek z x
%         temp = temp + x(end);
%         % Srovnání délky vektoru y s vektorem x
%         % Pokud je prvků málo, přidají se nuly
%         % Pokud jich je zase moc, odseknou se
%         temp(1:shortestLength) = y(1:shortestLength);
%         y = temp;
%     end

    % Výpočet
    vysledek = x .* exp(-x.^2-y.^2)+tanh(x.*y);
end

% Úloha 1 - Pomocná funkce
function [x,y] = ngon(strany, velikost)
    t = (1/(strany*2):1/strany:1)'*2*pi;
    x = sin(t);
    y = cos(t);
    x = velikost*[x; x(1)];
    y = velikost*[y; y(1)];
end