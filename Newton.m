%x0 - nulový bod
%f - funkce
%eps - přesnost
%maxiter - maximální počet iterací, kdyby přesnost eps nebyla ještě dosažena
%delta - okolí pro derivaci
function [x] = Newton(x0, f, eps, maxiter, delta)
    x(1) = x0;
    for i = 1:maxiter
        %Pokud je funkční hodnota nula, tak to ani nemá smysl odhadovat.
        if (f(x(i)) == 0)
            break
        end

        %Syntax sugar.
        funkcniHodnota = f(x(i));
        derivace = (f(x(i) + delta) - f(x(i))) / delta;

        %Další iterace
        x(i + 1) = x(i) - (funkcniHodnota / derivace);

        %Zjištění, jestli jsme dosáhli požadované přesnosti
        if (abs(x(i+1) - x(i)) < eps)
            break;
        end
    end

    x = x(end);
end