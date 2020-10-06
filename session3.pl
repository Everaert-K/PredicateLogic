
listlength([],0).

listlength([_|Tail],Count):-
	listlength(Tail,PartialCount),
	Count is PartialCount + 1.

listsum([],0).

listsum([Head|Tail], Sum) :-
	listsum(Tail, Rest),
	Sum is Head + Rest.

listaverage1([],0).

listaverage1(List,Average) :-
	listsum(List,Sum),
	listlength(List,Length),
	Average is Sum / Length.

% a better solution would only traverse the list once
listaverage2([],0).

listaverage2(List,Average) :-
	listinfo(List,Sum,Length),
	Average is Sum / Length.

listinfo([],0,0).

listinfo([Head|Tail],Sum, Length) :-
	listinfo(Tail,Sum2,Length2),
	Sum is Head + Sum2,
	Length is Length2 + 1.


printlist([]).

printlist([Head|Tail]) :-
	write(Head), nl,
	printlist(Tail).


% LOA-game 
countdisk([], 0).

countdisk([n|Tail], Count) :-
	!, countdisk(Tail, Count).

countdisk([_|Tail], Count) :-
	countdisk(Tail,Count2),
	Count is Count2 + 1.

% Harmfull mixture predictor
reacts(vinegar,salt,25).
reacts(salt,water,3).
reacts('brown soap',water,10).
reacts('pili pili', milk,7).
reacts(tonic,bailey,8).

reaction(A,B,Risk) :-
	reacts(A,B,Risk).
reaction(A,B,Risk) :-
	reacts(B,A,Risk).
reaction(A,B,0).


riskcalculator([],0).

riskcalculator([Head|Tail],Risk) :-
	riskcalculator2(Head,Tail,R1),
	riskcalculator(Tail,R2),
	Risk is R1 + R2.

riskcalculator2(Head, [], 0).

riskcalculator2(E1, [E2|Tail], Risk) :-
	reaction(E1,E2,R1),
	riskcalculator2(E1,Tail,R2),
	Risk is R1 + R2.

	
avice([]) :-
	write("An empty mixture is never dangerous").

advice(List) :-
	riskcalculator(List,Risk),
	Risk > 21,
	write('Severe burning').

advice(List) :-
	write('Alright').






























