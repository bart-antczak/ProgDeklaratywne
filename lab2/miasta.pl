next(świnoujście,kołobrzeg,118).
next(świnoujście, szczecin,106).
next(kołobrzeg,ustka,117).
next(ustka, gdańsk,136).
next(gdańsk,toruń,170).
next(gdańsk,olsztyn,136).
next(olsztyn,toruń, 176).
next(olsztyn,białystok,238).
next(szczecin,bydgoszcz,257).
next(szczecin, gorzów-wlkp,111).
next(bydgoszcz,toruń,45).
next(bydgoszcz,poznań,142).
next(poznań,toruń,161).
next(gorzów-wlkp,poznań,170).
next(gorzów-wlkp,zielona-góra,119).
next(zielona-góra,poznań,155).
next(zielona-góra,wrocław,156).
next(toruń,warszawa,210).
next(toruń,łódź,179).
next(białystok, warszawa,199).
next(białystok,lublin,252).
next(poznań,łódź,202).
next(warszawa,radom,102).
next(warszawa,łódź,128).
next(radom,lublin,116).
next(radom,kielce,77).
next(wrocław,łódź,219).
next(łódź,radom,136).
next(łódź,częstochowa, 124).
next(częstochowa,kielce,132).
next(częstochowa,katowice,73).
next(katowice,kraków,80).
next(kielce,kraków, 115).
next(kielce,rzeszów,163).
next(lublin,kielce,176).
next(lublin,rzeszów,168).
next(kraków,rzeszów,176).

% Pytanie: Jakie są połączenia miedzy Świnoujściem a Rzeszowem?

polaczenie(X,Y,_) :-    next(X,Y,_).

% Połączenie do kolejnego miasta

polaczenie(X,Z,_) :-    next(X,Y,_),
                        next(Y,Z,_).
posrednie(X,Y,R) :-
	next(X,Y,_),
	R=X.

posrednie(X,Y,R) :-
	next(X,Z,_),
	posrednie(Z,Y,R).

pierwszy([X|_],X).

% Ostatnie miasto przed miastem docelowym

zjazd(X,Y,OUT) :-   next(X,Y,_), OUT=X.
zjazd(X,Y,OUT) :-   next(X,Z,_),
                    zjazd(Z,Y,OP),
                    OUT=OP.

% Wyznaczanie trasy między miastami za pomocą rekurencji i listy prologowej

trasa(X,Y,[X|Y]) :- next(X,Y,_).

trasa(X,Y,[X|Q]) :- next(X,Z,_),
                    trasa(Z,Y,Q).

% Sprawdzenie ostatniego miasta

ostatni([X|Y],S) :- [X|Y]=[Q],
                    S=Q.

ostatni([_|Y],S) :- ostatni(Y,Z),
                    S=Z.

% Sprawdzenie przedostatniego

przedostatni([X,_],X).

przedostatni([_|Y],S) :- przedostatni(Y,S).

kopia([],[]) :- [] = [].

kopia([H|T],WYNIK) :-
	kopia(T,KT),
	WYNIK = [H|KT].


% KONKATENACJA - concat = conc = append(swi_prolog)

odwroc([],[]) :- [] = [].

odwroc([H|T], REWERS) :-
	odwroc(T,KT),
	append(KT,[H],REWERS).

% Dekompozycja listy za pomoca append

srodek([X],[Y]) :- [X] = [Y].

srodek([_|T], S) :-
        append(SRODEK,[_],T),
	srodek(SRODEK,S).

palindrom([H|T]) :-
	append(SRODEK,[X],T),
	H=X,
	palindrom([SRODEK]).
