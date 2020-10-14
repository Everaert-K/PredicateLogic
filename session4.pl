
% retrieving first element of a list
first(-1,[]) :-
	write("Don't provide an empty list").

first(Head, [Head|_]).

% retrieving first element of a list
last(-1,[]) :-
	write("Don't provide an empty list").

last(X,[X]) :- !.	

last(X, [_|Tail]) :-
	last(X, Tail).

% Removing in a list one element equal to T
conc([], L, L).

conc([X | L1], L2, [X | L3]) :-
	conc(L1,L2,L3).

remove(_,[],[]).

remove(T, [T|Tail], Tail):- !.

remove(T, [Head|Tail], Newlist) :-
	remove(T,Tail,List),
	conc([Head],List,Newlist).
	
% Removing in a list all elements equal to T
remove2(_,[],[]).

remove2(T, [T|Tail], List) :-
	remove2(T,Tail,List),!.

remove2(T, [Head|Tail], Newlist) :-
	remove2(T,Tail,List),
	conc([Head],List,Newlist).

% Removing in a list of numbers all elements smaller than or equal to N
smaller(_,[],[]).

smaller(N, [Head|Tail], List) :-
	Head =< N, % => 
	smaller(N,Tail,List),!.

smaller(N, [Head|Tail], Newlist) :-
	smaller(N,Tail,List),
	conc([Head],List,Newlist).

% Switching the first two elements of a list: switch_first_two(List, NewList). 
% For example a call to switch_first_two([a,b,c,d,e,f], L) should return L = [b,a,c,d,e,f]
switch_first_two([],[]).

switch_first_two([X],[X]).

switch_first_two([X,Y|Z],[Y,X|Z]).

% Switching every pair of elements in a list: switch_every_two(List, NewList).
% For example a call to switch_every_two([a,b,c,d,e,f,g], L) should return L = [b,a,d,c,f,e,g] 
switch_every_two([],[]).

switch_every_two([X],[X]).

switch_every_two([X,Y|Z],[Y,X|Rest]) :-
	switch_every_two(Z,Rest).

% Ex 2: sorting a list

% Write a predicate that switches the first pair of numbers in a list for which the first number is larger that the second:
% switch_unsorted(NumberList, NewNumberList). 
% For example, ?- switch_unsorted([1,2,4,7,6,9,8], L). returns L = [1,2,4,6,7,9,8]. If there is no unsorted pair then no numbers should be switched. 
switch_unsorted([],[]).
switch_unsorted([X],[X]).

switch_unsorted([X,Y|Z],[Y,X|Z]) :-
	Y =< X, !. % > 

switch_unsorted([Head|Tail],Tail3) :-
	switch_unsorted(Tail, Tail2),
	conc([Head],Tail2, Tail3).

% Write a predicate that applies ten times the predicate switch_unsorted/2. The result of the first call is used as input for the second call etc...: 
% ten_times(NumberList0, NumberList10

ten_times([],[]).

ten_times([X],[X]).

ten_times(NumberList0, NumberList10) :-
	ten_times_util(NumberList0,NumberList10,0), !.

ten_times_util(L,L,10) :- !.

ten_times_util(CurrentList, NextList, N) :-
	N < 10,
	N2 is N + 1,
	switch_unsorted(CurrentList,Interlist),
	ten_times_util(Interlist,NextList,N2).

% Write a predicate that succeeds only when the argument is a sorted list: is_sorted(NumberList)
is_sorted([]).
is_sorted([_]).

is_sorted([X,Y|Z]) :-
	X =< Y, %>
	conc([Y],Z,L),
	is_sorted(L),!.

% Write a predicate sort/2 that applies the predicate switch_unsorted/2 on a list until that list is sorted. 
sort2([],[]).
sort2([X],[X]).

sort2(List,List) :-
	is_sorted(List).

sort2(List, Sorted) :-
	switch_unsorted(List, Beter),
	sort(Beter, Sorted).

% Given a list of lists, example [[a,b,c], [d,e,f]], write a predicate that flattens the list: 
% make one list with all the elements. For the example this should return [a,b,c,d,e,f]
flatten([],[]).

flatten([Head|Tail],List) :-
	flatten(Tail,Tail2),
	conc(Head,Tail2,List).

% write predicate to transpose a matrix
% make again

% EX 4: sets
% returns an empty set, or check if the set is empty empty_set(Set)
% when the argument is instantiated.
empty_set([_|_]).

% add_to_set(Element, Set, NewSet) adds an element to a set
add_to_set(Element,Set,NewSet) :-
	conc([Element],Set,NewSet).

% member_of_set(Element, Set) is true if the element is a member
member_of_set(_, []) :-
	fail,!.

member_of_set(Element, [Head|Tail]) :-
	Element == Head, !
	;
	member_of_set(Element,Tail).

% delete_from_set(Element, Set, NewSet)
% delete the element from the set if it occurs, otherwise
% the new set is unchanged
delete_from_set(Element, Set, NewSet) :-
	member_of_set(Element,Set),
	add_to_set(Element,NewSet,Set).

delete_from_set(Element,Set,Set) :-
	not(member_of_set(Element,Set)).
	



















