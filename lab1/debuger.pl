% Tryb śledzenia (Debuger)

ptak(X) :-  pokrycie(X, piora),
            latanie(X).

pokrycie(kura, piora).
pokrycie(wrobel, piora).
pokrycie(orzel, piora).

chodzenie(kura).
latanie(wrobel).
latanie(orzel).

% Wywołanie: trace, ptak(X)