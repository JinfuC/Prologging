% Assumed representation of solution:
% [3,1,4,2] the index denotes the row that the queen is on
% the number denotes the column that the queen is on
% in this representation the queens are positioned on (1,3) (2,1) (3,4) (4,2)

nqueens(N,L):-
	numlist(1,N,StartingPositions),
	permutation(StartingPositions,L),
	constraints(L).

constraints([]).
constraints([H|T]):-
	diagonal_check(H,T,1),
	constraints(T).

diagonal_check(_,[],_).
diagonal_check(ColQueen,[H|T],ColNb):-
	abs(H-ColQueen) =\= ColNb,
	NextCol is ColNb + 1,
	diagonal_check(ColQueen,T,NextCol).
