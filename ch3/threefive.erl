-module(threefive).
-export([filter/2, reverse/1]).

filter(Int, Ints) -> 
	Result = filter(Int, Ints, []),
	reverse(Result).
filter(_, [], Filtered) -> Filtered;
filter(Int, [Head | Tail], Filtered) when Head =< Int -> filter(Int, Tail, [Head | Filtered]);
filter(Int, [_ | Tail], Filtered) -> filter(Int, Tail, Filtered).   

reverse(List) -> reverse(List, []).
reverse([], NewList) -> NewList;
reverse([Head | Tail], NewList) -> reverse(Tail, [Head | NewList]).

