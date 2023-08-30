# Project 4: Prolog Family Tree
## Khalid Kofiro

This repository contains two Prolog files that define a family tree and provide a way to query relationships between family members.

# Familyfacts.pl Summary

* familyfacts.pl defines a set of facts and rules about a family tree. The facts begin with the gender of each family member and the parent-child relationships between them. The rules use these facts to define relationships such as siblings, cousins, uncles, aunts, grandparents, and ancestors. The code provides a way to query the family relationships using predicates such as mother, father, married, sibling1, sibling2, brother, sister, uncle, cousin, aunt, grandparent, grandfather, grandmother, and ancestor.

# Familyquery.pl Summary

* familyquery.pl loads the file familyfacts.pl using the consult predicate. It then defines several predicates that query the relationships between the family members based on the facts and rules defined in the file. The queries test to see if the relationships are correct by asking right and wrong questions to determine if it is functioning.

## Related Family Relationships based on Facts/Rules

* Mohamed and Mariam are married and their son is Ahmed. They are the grandparents of Hamza and Sahra and the ancestors of their kids.
* Ahmed is married to Fatima and they are the parents of Sahra and Hamza. They are the grandparents of Hamza and Sahra's kids.
* Hamza is married to Aisha and they have 3 kids named Abdi, Omar, and Zainab. Hamza is Sahra's brother which makes him the uncle to Sahra's kids.
* Sahra is married to Ali and they have 2 kids named Yusuf and Hafsa. She is the aunt of Hamza's kids.
Abdi Omar and Zainab are siblings, and are the cousins of Yusuf and Hafsa, who are also siblings.


## Unrelated Family Relationships based on Facts/Rules

* John and Emily are married and their children are Alex, Sophie, Ted and Lila. They are the grandparents of David, Lucy and Sam.
* Alex is married to Jill and they have 2 kids named David and Lucy.
* Sophie is married to Mark and have 1 child named Sam.
* Ted and Lila were born later on, and have no children and are younger than their nieces and nephews, * David, Lucy and Sam.
** Note: Jill is "born" after her children to test the younger_than_child() query.

# Running the code

* To run the code, you need to have SWI-Prolog installed on your machine. You can download it from the official website. 

* Once you have installed SWI-Prolog, you can start it and load the familyquery.pl file using the following command:

```pl
consult('familyquery.pl').

After loading the file, you can query the family relationships using the provided predicates.

For example, to check if two people are related or not you query: 

?- not_related(john, david).

The output should be:

true, john IS related to david
true.

```

Thank you for checking out my code!
