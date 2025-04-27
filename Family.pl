% ---------------------------------
% Basic Family Facts
% ---------------------------------

% parent(Parent, Child)
parent(rahul, ananya).
parent(rahul, arjun).
parent(kavita, ananya).
parent(kavita, arjun).

parent(ananya, sneha).
parent(ananya, rohit).
parent(amit, sneha).
parent(amit, rohit).

parent(arjun, reema).
parent(arjun, dev).
parent(priya, reema).
parent(priya, dev).

parent(rohit, yash).
parent(megha, yash).

% Gender facts
male(rahul).
male(arjun).
male(amit).
male(rohit).
male(dev).
male(yash).

female(kavita).
female(ananya).
female(sneha).
female(priya).
female(reema).
female(megha).

% ----------------------------
% Derived Family Relationships
% ----------------------------

% child(Child, Parent)
child(C, P) :-
    parent(P, C).

% sibling(X, Y): X and Y share at least one parent and are not the same
sibling(X, Y) :-
    parent(P, X),
    parent(P, Y),
    X \= Y.

% grandparent(GP, GC): GP is a grandparent of GC
grandparent(GP, GC) :-
    parent(GP, P),
    parent(P, GC).

% cousin(X, Y): X and Y are cousins if their parents are siblings
cousin(X, Y) :-
    parent(P1, X),
    parent(P2, Y),
    sibling(P1, P2),
    X \= Y.

% descendant(Ancestor, Descendant)
descendant(X, Y) :-
    parent(X, Y).

descendant(X, Y) :-
    parent(X, Z),
    descendant(Z, Y).
