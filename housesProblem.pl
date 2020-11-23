% four families (A,B,C,D) and four houses (1,2,3,4)
% C lives in a house with a higher number than the house in which D lives
% D lives next to A, in a house with a lower number
% There is at least one house between the houses of D and B
% C does not live in the house with number 3
% B does not live in the house with number 1
% Which familie lives in which house?

del(X, [X|Tail], Tail).

del(X, [Y|Tail], [Y | Tail1]):-
	del(X,Tail,Tail1).

insert(X,List,BiggerList):-
	del(X,BiggerList,List).

% generate permutations
permutation([], []).

permutation([X|L],P) :-
	permutation(L, L1),
	insert(X, L1, P).

conc([], L, L).

conc([X | L1], L2, [X | L3]) :-
	conc(L1,L2,L3).

last(Item,[Item]).

last(Item, [_|Rest]) :-
	last2(Item,Rest).

check_correctness(A,B,C,D) :-
	A > 0,
	A =< 4,
	B > 0,
	B =< 4,
	C > 0,
	C =< 4,
	D > 0,
	D =< 4,
	A =\= B,
	A =\= C,
	A =\= D,
	B =\= C,
	B =\= D,
	C =\= D,
	C > D,
	D is A-1,
	abs(D-B) >= 1,
	C =\= 3,
	B =\= 1.

assign([Nr1,Nr2,Nr3,Nr4],A,B,C,D):-
	A = Nr1,
	B = Nr2,
	C = Nr3,
	D = Nr4.

assignHouses(List,A,B,C,D):-
	permutation(List,Permutated),
	assign(Permutated,A,B,C,D),
	check_correctness(A,B,C,D).






