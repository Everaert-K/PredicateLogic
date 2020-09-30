book(1, 'the art of Prolog', 400).
book(23, 'the mistery of strawberries', 42).

person(statler).
person(waldorf).

owns(waldorf,23).

author(statler,1).
author(waldorf,23).

hate(statler,1).
hate(waldorf,1).

brochure(Isbn) :-
	book(Isbn,_,Pages),
	Pages < 100.

isbn(Title, Isbn) :-
	book(Isbn, Title, _).

% retrieve the names of books that are hated by their author
hatedByAuthor(Title) :-
	book(Isbn,Title,_),
	hate(Hater,Isbn),
	author(Hater, Isbn).

% retrieve the names of the books together with their author, Make Prolog print for each result a line like this: the book booktitle is written by author name
overview() :-
	author(Author, Isbn),
	book(Isbn, Title, _),
	string_concat(Title,' is written by ', String1),
	string_concat(String1, Author, Final),
	write(Final).

% Write a predicate proud_author/1 which succeeds for all people that own at least one of the books they have written.
proud_author(Author) :-
	author(Author, Isbn),
	owns(Author, Isbn).


% Create a knowledge base which translates your current (book) KB to your native language. 
% Or other language than English. 
% That is, in Irish, for example, 'book' is 'leabhar' and your task is to automate the translation of your current KB to ... eg., Irish. 
% You should not manually rewrite every fact with the different name! 
% You should also not translate the actual book titles etc., instead you should be able to query your KB in your native language

vertaling('the art of Prolog', 'de kunst van Prolog').
vertaling('the mistery of strawberries', 'Het mysterie van aardbeien').

boek(Isbn, Title, Pages) :-
	vertaling(Engels, Title),
	book(Isbn, Engels, Pages).