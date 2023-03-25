% given a number and a list,
% this program finds a pair within this list
% that adds up to this number.

find_all_pairs(Given,List,AllPairs):-
	findall(Pair,find_pair(Given,List,Pair),Pairs),
	remove_duplicates(Pairs,[],AllPairs).
	
remove_duplicates([],Acc,Acc).
remove_duplicates([[FirstElement,SecondElement]|T],Acc,AllPairs):-
	select([SecondElement,FirstElement],T,LeftOverTail),
	remove_duplicates(LeftOverTail,[[FirstElement,SecondElement]|Acc],AllPairs).

find_pair(Given,List,[FirstElement,SecondElement]):-
	select(FirstElement,List,LeftoverList),
	select(SecondElement,LeftoverList,_),
	FirstElement + SecondElement =:= Given.
  
