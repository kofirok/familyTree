:- consult('familyfactsrules.pl').

who_parent() :- parent( X, Y), write('Parent: '), write(X), write( ' Child: '), write( Y).
mohamed_ahmed_father() :- parent(mohamed, ahmed). 
mariam_sahra_grandma() :- grandmother(mariam, sahra).
ahmed_fatima_married():- married(ahmed, fatima).
zainab_omar_brother() :- brother(zainab, omar).
fatima_omar_uncle() :- uncle(fatima, omar).
zainab_hafsa_cousin() :- cousin(zainab, hafsa).

/* checks if two people are not related */
not_related(X, Y) :- (   related(X, Y)  ->  format('true, ~w IS related to ~w', [X, Y]) ;   format('false, ~w is NOT related to ~w', [X, Y])).

/* finds all parent-child pairs where the parent had a child at or before the age of 19 */
teen_parent() :- parent(X, Y), born(X, YearX), born(Y, YearY), AgeDiff is (YearY - YearX), AgeDiff < 20, write('Parent: '), write(X), write( ' Child: '), write( Y), write(' Age: '), write(AgeDiff).

/* finds all parent-child pairs where the child was born before the parent
   ** made jill younger than her children to test this query */
younger_than_child() :- parent(P, C), born(P, BP), born(C, BC), BC < BP, write('Parent: '), write(P), write(' '), write(BP), write( ' Child: '), write(C), write(' '), write(BC).

/* counts all people who are 18 years or older as of 2023 */
count_adults(C) :-  findall(X, (born(X, Year), (2023 - Year) >= 18), L), length(L, C), write(C), write(' adults. ').

/* counts all aunt nephew-niece or uncle nephew-niece pairs where the aunt or uncle is younger than their nephew or niece 
  ** aunt lila, and uncle ted were born after their nephew david */
count_older_aunt_or_uncle(C) :- setof(X, older_aunt_or_uncle(X), L), length(L, C), write(C), write(' Aunts/Uncles are younger than their Nieces/Nephews. ').