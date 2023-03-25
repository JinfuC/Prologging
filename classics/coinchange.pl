% given bag coins to choose from (with infinite supply)
% and an amount, this program will find 
% different combination of coins that will sum up to the given amount.


coin_change_wrapper(CoinBag,Total,Solution):-
	findall(Combination,coin_change(CoinBag,Total,Combination,[]),AllSolutions),
	remove_permutations(AllSolutions,Solution,[]).

coin_change(_,Total,Solution,Solution):-
	sum_list(Solution,Total).

coin_change(CoinBag,Total,Solution,Combination):-
	member(Coin,CoinBag),
	sum_list([Coin|Combination],TotalChange),
	TotalChange =< Total,
	coin_change(CoinBag,Total,Solution,[Coin|Combination]).

remove_permutations([],UniqueSolutions,UniqueSolutions).
remove_permutations([H|T],UniqueSolutions,Acc):-
	findall(X,(member(X,Acc),permutation(H,X)),Duplicates),
	length(Duplicates,0),
	remove_permutations(T,UniqueSolutions,[H|Acc]).

remove_permutations([H|T],UniqueSolutions,Acc):-
	findall(X,(member(X,Acc),permutation(H,X)),Duplicates),
	\+length(Duplicates,0),
	remove_permutations(T,UniqueSolutions,Acc).
  
