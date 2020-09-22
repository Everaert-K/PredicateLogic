% lists
% membership
member(X, [X | _]).

member(X, [_ | Tail]) :-
	member(X, Tail).

% concatenation
conc([], L, L).

conc([X | L1], L2, [X | L3]) :-
	conc(L1,L2,L3).

% adding an item
add(X, L, [X|L]).

% deleting an item
del(X, [X|Tail], Tail).

del(X, [Y|Tail],[Y|Tail1]) :-
	del(X, Tail, Tail1).

% check if sublist
sublist(S,L) :-
	conc(_,L2,L), % sublist is not allowed to be equal to the original list
	conc(S,_,L2).

% generate permutations
permutation([], []).

permutation([X|L],P) :-
	permutation(L, L1),
	insert(X, L1, P).

% -------------------------------------------------
deletelast3(L1,L2) :-
	conc(L2,[_,_,_],L1).

deletefirst3(L1,L2) :-
	conc([_,_,_],L2,L1).

deletefirst3andlast3(L1,L2) :-
	deletelast3(L1,Z),
	deletefirst3(Z,L2).
% -------------------------------------------------
% Item has to be last element of list
% last1 can use conc

%last1(Item,List) :-
%	conc(_,[Item],List).

% no conc
last2(Item,[Item]).

last2(Item, [_|Rest]) :-
	last2(Item,Rest).
% -------------------------------------------------
% Exercice 3.3: determine if lenght of a list is even or odd
evenlength([]).

evenlength([_|Rest]) :-
	oddlength(Rest).

oddlength([_|Rest]) :- 
	evenlength(Rest).
% -------------------------------------------------
% Execice 3.4: reverse a list

reverse([],[]).

reverse([Head|L1],ReversedList) :-
	reverse(L1,L2),
	conc(L2,[Head],ReversedList). % dont forget that Head has to be in a list

% -------------------------------------------------
% Exercice 3.4: check list for palindromes

palindrome(List) :-
	reverse(List, Reverse),
	List = Reverse.
% -------------------------------------------------
% Exercice 3.5: define shift(List1, List2) so that List2 is List1 shifted to the left
shift(List1, List2):-
	last2(LastItem,List1),
	conc(First,[_],List1),
	conc([LastItem], First, List2).
 
% finish Exercice 3.9

% -------------------------------------------------
% Exercice 3.10 define the predicate equal_length(L1,L2)

equal_length([],[]).

equal_length([_|L1],[_|L2]) :-
	equal_length(L1,L2).

% finish Exercice 3.11



