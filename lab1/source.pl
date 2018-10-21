% Deklaracja zmiennych

kobieta(maria).
kobieta(ewa).
kobieta(agata).
kobieta(anna).
kobieta(joanna).
kobieta(agnieszka).
kobieta(beata).
kobieta(iwona).

mezczyzna(piotr).
mezczyzna(adam).
mezczyzna(robert).
mezczyzna(marek).
mezczyzna(jan).
mezczyzna(krzysztof).
mezczyzna(radek).
mezczyzna(darek).
mezczyzna(tomek).
mezczyzna(jacek).

% Deklaracja relacji

rodzic(maria, agata).
rodzic(maria, marek).
rodzic(maria, jan).
rodzic(piotr, agata).
rodzic(piotr, marek).
rodzic(piotr, jan).

rodzic(ewa, anna).
rodzic(ewa, joanna).
rodzic(ewa, krzysztof).
rodzic(adam, anna).
rodzic(adam, joanna).
rodzic(adam, krzysztof).

rodzic(robert, radek).
rodzic(robert, beata).
rodzic(agata, radek).
rodzic(agata, beata).

rodzic(jan, darek).
rodzic(jan, tomek).
rodzic(anna, darek).
rodzic(anna, tomek).

rodzic(krzysztof, jacek).
rodzic(krzysztof, iwona).
rodzic(agnieszka, jacek).
rodzic(agnieszka, iwona).

% REGUŁY
% forma reprezentacji wiedzy
% ARNOŚĆ - liczba parametrów w regule (X, Y)
% Relacje pokrewieństwa

matka(X, Y) :-  kobieta(X),
                rodzic(X, Y).

ojciec(X, Y) :- mezczyzna(X),
                rodzic(X, Y).

rodzenstwo(X, Y) :- rodzic(Z, X),
                    rodzic(Z, Y),
                    X \= Y.

siostra(X, Y) :- kobieta(X),
                 rodzic(Z, X),
                 rodzic(Z, Y),
                 X \= Y.

brat(X, Y) :-   mezczyzna(X),
                rodzic(Z, X),
                rodzic(Z, Y),
                X \= Y.

babcia(X, Y) :- kobieta(X),
                rodzic(X, Z),
                rodzic(Z, Y).

dziadek(X, Y) :- mezczyzna(X),
                 rodzic(X, Z),
                 rodzic(Z, Y).

wuj(X, Y) :- mezczyzna(X),
             siostra(Z, X),
             rodzic(Z, Y).

stryj(X, Y) :- mezczyzna(X),
               brat(Z, X),
               rodzic(Z, Y).

kuzyn(X, Y) :- mezczyzna(X),
               rodzic(X, Z),
               rodzic(Y, F),
               rodzenstwo(Z, F),
               X \= Y.

% RELACJE
% POWINOWACTWA

malzenstwo(maria, piotr).
malzenstwo(ewa, adam).
malzenstwo(robert, agata).
malzenstwo(jan, anna).
malzenstwo(krzysztof, agnieszka).

% Dysjunskcja reguł

zona(X, Y) :- kobieta(X),
              malzenstwo(X, Y).

zona(X, Y) :- kobieta(X),
              malzenstwo(Y, X).

maz(X, Y) :- mezczyzna(X),
           malzenstwo(X, Y).

maz(X, Y) :- mezczyzna(X),
           malzenstwo(Y, X).

szwagier(X, Y) :- zona(Z, Y),
                  brat(X, Z).

szwagier(X, Y) :- maz(Z, Y),
                  siostra(X, Z).