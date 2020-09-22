
parent(tom, bob).
parent(pam, bob).
parent(tom, liz).
parent(bob, ann).
parent(bob, pat).
parent(pat, jim).

% this will give a warning if genders not grouped together but that does not matter
female(pam).
female(liz).
female(pat).
female(ann).
male(tom).
male(bob).
male(jim).

grandparent(X, Y) :-
	parent(X, Z),
	parent(Z, Y).

commonparent(X, Y, Z) :-
	parent(Z, X),
	parent(Z, Y).

mother(X, Y) :-
	parent(X,Y),
	female(X).

sister(X, Y) :-
	commonparent(X, Y, _), % you dont really need to know who this parent is
	female(X),
	X \= Y. % you cant be your own sister

brother(X, Y) :-
	commonparent(X, Y, _),
	male(X),
	X \= Y.

aunt(X, Y) :-
	parent(Z, Y),
	sister(X, Z).

uncle(X, Y) :-
	parent(Z, Y),
	brother(X, Z).

ancestor(X, Z) :-
	parent(X, Z).
ancestor(X, Z) :-
	parent(X, Y),
	ancestor(Y, Z).














