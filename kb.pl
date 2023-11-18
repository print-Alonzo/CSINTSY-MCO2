% Facts
male(john).
male(bob).
male(mike).
female(lisa).
female(susan).
female(emily).

parent(john, bob).
parent(john, lisa).
parent(susan, emily).
parent(bob, mike).
parent(bob, ann).


% Rules for Father and Mother
father(X, Y) :- male(X), parent(X, Y).
mother(X, Y) :- female(X), parent(X, Y).

% Rules for Brother and Sister
sibling(X, Y) :- parent(Z, X), parent(Z, Y), X \= Y.
brother(X, Y) :- male(X), sibling(X, Y).
sister(X, Y) :- female(X), sibling(X, Y).

% Rules for child
child(X, Y) :- parent(Y, X).

% Rules for grandfather and grandmother
grandparent(X, Y) :- parent(X, Z), parent(Z, Y).
grandfather(X, Y) :- male(X), grandparent(X, Y).
grandmother(X, Y) :- female(X), grandparent(X, Y).

% Rules for uncle and aunt
uncle(X, Y) :- male(X), sibling(X, Z), parent(Z, Y).
aunt(X, Y) :- female(X), sibling(X, Z), parent(Z, Y).