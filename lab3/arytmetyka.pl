% Kopiowanie listy
kopia([],[]).
kopia([H|T],New) :- kopia(T, T1),
                    append([H],T1,New).

% Odwracanie listy
odwracaj([],Z,Z).
odwracaj([H|T],Z,Acc) :- odwracaj(T,Z,[H|Acc]).

% Dekompozycja listy
dokompo([],[],[]).
dokompo(X,Y,[H|T]) :-   dekompo([H],[T],[H|T]),
                        append(H,T, []),
                        X=[_|_],
                        Y=[_|_].

% Wyznaczanie srodka listy
ostatni(L,K) :- append(_,[K],L).
usunostatni(L,NL) :- append(NL,[_],L).
nakoniec(X,L,NL) :- append(L,[X],NL).

srodek([X], X).
srodek([H|T],X) :- srodek([H|T1], T1),
                   append(T1,X).

% Dzieloenie list na połówki
polowki([], L, P).
polowki(List, Left, Right) :-   append(Left, Right, List),
                                length(Left, N),
                                length(Right, N).

% Długość
dlugosc([],0).
dlugosc([_|T],N) :- dlugosc(T,N1),
                    N is N1+1.

% Sumuje elementy listy
sumuj([X],X). %warunek graniczny
sumuj([H|T],N) :-
	sumuj(T,N1),
	N is N1+H.

% Sprawdza czy lista jest posortowana
rosnaca([_]).
rosnaca([H,N1|T]) :-
        H < N1,
	rosnaca([N1|T]).


% Sprawdzanie czy lista jest ciagiem arytmentycznym
arytmetyczny([_,_]).
arytmetyczny([H,H2,H3|T]) :-
	H-H2 =:= H2-H3,
	arytmetyczny([H2,H3|T]).

% Wyznaczanie liczb parzystych i nieparzystych
pnp([],[],[]).
pnp([H|T],[H|T1],T2) :-
                            mod(H,2) =:= 0,
                            pnp(T,T1,T2).
pnp([H|T],T1,[H|T2]) :-
                            mod(H,2) =\= 0,
                            pnp(T,T1,T2).

% Wyznaczanie największego elementu
maks([X],X).
maks([H|T], WYNIK) :-
                maks(T, Z),
                (H > Z -> WYNIK = H ; WYNIK = Z).

% Dodawanie elementu do posortowanej listy
doposort([],X,[X]).
doposort([H|T],X,WYNIK) :-
	X > H,
	doposort(T,X,T1),
	WYNIK = [H|T1].
doposort([H|T],X,WYNIK) :-
	X =< H,
	WYNIK = [X,H|T].