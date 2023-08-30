/* Khalid Kofiro p4_family */
/* facts */

/* related */

male(mohamed).

male(ahmed).

male(ali).

male(hamza).

male(yusuf).

male(abdi).

male(omar).

/* unrelated */ 

male(john).

male(alex).

male(david).

male(mark).

male(sam).

male(ted).

/* related */

female(mariam).

female(fatima).

female(sahra).

female(aisha).

female(hafsa).

female(zainab).

/* unrelated */ 

female(emily).

female(sophie).

female(lucy).

female(jill).

female(lila).

/* related */ 

parent(mohamed, ahmed).

parent(mariam, ahmed).

parent(ahmed, sahra).

parent(ahmed, hamza).

parent(fatima, sahra).

parent(fatima, hamza).

parent(sahra, yusuf).

parent(sahra, hafsa).

parent(ali, yusuf).

parent(ali, hafsa).

parent(hamza, abdi).

parent(hamza, zainab).

parent(hamza, omar).

parent(aisha, abdi).

parent(aisha, zainab).

parent(aisha, omar).

/* unrelated */ 

parent(john, alex).

parent(john, sophie).

parent(john, ted).

parent(john, lila).

parent(emily, alex).

parent(emily, sophie).

parent(alex, lucy).

parent(alex, david).

parent(jill, lucy).

parent(jill, david).

parent(sophie, sam).

parent(mark, sam).

born(mohamed, 1938).

born(mariam, 1940).

born(ahmed, 1959).

born(fatima, 1960).

born(sahra, 1982).

born(ali, 1979).

born(hamza, 1980).

born(aisha, 1983).

born(yusuf, 2001).

born(hafsa, 2003).

born(abdi, 2002).

born(omar, 2015).

born(zainab, 2010).

/* unrelated */ 

born(john, 1950).

born(emily, 1952).

born(alex, 1970).

born(jill, 2003).

born(david, 1999).

born(lucy, 2000).

born(sophie, 1975).

born(mark, 1970).

born(sam, 2008).

born(ted, 2010).

born(lila, 2020).


/* rules */  


/*  To be a mother X must be female and the parent of Y, added X cannot = Y to avoid comparing itself */
mother(X, Y) :- female(X), parent(X,Y), X \= Y.


/* To be a father X must be male and the parent of Y */
father(X, Y) :- male(X), parent(X,Y), X \= Y.

/* To be married X and Y must both be parents of Z */
married(X, Y) :- parent(X, Z), parent(Y, Z), X \= Y.

/* X and Y must have the same two parents but be different people */
sibling1(X, Y) :- parent(A, X), parent(B, X), parent(A, Y), parent(B, Y), X \= Y.

/* sibling2 is for later use when adding cousin relations */
sibling2(X, Y) :- parent(A, X), parent(B, X), parent(A, Y), parent(B, Y), X \= Y.

/* To be a brother X must be male, have the same two parents as Y, but be different people */
brother(X, Y) :- male(X), parent(A, X), parent(B, X), parent(A, Y), parent(B, Y), X \= Y.


/* To be a sister X must be female, have the same two parents as Y, but be different people */
sister(X, Y) :- female(X), parent(A, X), parent(B, X), parent(A, Y), parent(B, Y), X \= Y.

/* To be an Uncle X must be male and a sibling of Y's parent */
uncle(X, Y) :- male(X), parent(Z, Y), ( sibling1(X, Z) ; sibling2(X, Z) ), X \= Y.

/* To be an aunt X must be female and a sibling of Y's parent */
aunt(X, Y) :- female(X), parent(Z, Y), ( sibling1(X,Z) ; sibling2(X, Z) ), X \= Y.

/* To be cousins X and Y must have different parents but those parents are siblings */
cousin(X, Y) :- parent(A, X), parent(B, Y), ( sibling1(A, B) ; sibling2(A, B) ), X \= Y.

/* To be a grandparent X must be a parent of Y's parent and be at least 30 years older than the grandchild.
   The grandchild's child considers them to be a distant ancestor not their grandparent.*/
   
grandparent(X, Y) :- parent(Z, Y), parent(X, Z), born(X, YearX), born(Y, YearY), (YearY - YearX) >= 30.


/* To be a grandfather X must be a male and a parent of Y's parent, and be at least 30 years older than Y */
grandfather(X, Y) :- male(X), parent(Z, Y), parent(X, Z), born(X, YearX), born(Y, YearY), YearX =< YearY - 30.


/* To be a grandmother X must be female and a parent of Y's parent, and at least 30 years older than Y */
grandmother(X, Y) :- female(X), parent(Z, Y), parent(X, Z), born(X, YearX), born(Y, YearY), YearX =< YearY - 30.


/* To be an ancestor X must be the parent of Y's grandparent and be at least 30 years older 
   than the grandchild's child */

ancestor(X, Y) :- parent(X, Z), grandparent(Z, Y), born(X, YearX), born(Y, YearY), (YearY- YearX) >= 30.

/* To be related one must be either a brother, sister, cousin, aunt, uncle, parent, grandparent, ancestor, or married */
related(X, Y) :- (brother(X,Y); sister(X,Y); cousin(X,Y); aunt(X,Y); uncle(X,Y); parent(X,Y); grandparent(X,Y); ancestor(X,Y); married(X,Y)).

/* Rule to help count the amount of nieces/nephews older than their aunts and uncles */
older_aunt_or_uncle(X) :- (uncle(X, Y) ; aunt(X, Y)), born(X, XP), born(Y, YC), YC < XP.  