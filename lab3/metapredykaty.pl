dziecko(tomek,5).
dziecko(basia,7).
dziecko(jas,8).
dziecko(ania,5).
dziecko(paweł,7).

% Testowanie polecenia member
L=[a,b,c,d],findall(X,member(X,L),W).

% Asercja i retragcja
main :- L=[1,2,3,4,5,6,7,8,9],
	member(X,L),
	member(Y,L),
	Z is X+Y,
	assert(tabliczka(X,Y,Z)),
	fail,true.

% Wyciaganie wybranej liczby Fib
?-dynamic(fib/2).
fib(1,1).
fib(2,1).
fib(N,F) :-
	N1 is N-1,
	N2 is N-2,
	fib(N1,F1),
	fib(N2,F2),
	F is F1+F2,
	asserta(fib(N,F)).