-module(threefive).
-export([filter/2, reverse/1]).

filter(Int, Ints) -> leq_filter(Int, Ints, []).

reverse(List) -> reverse(List, []).

reverse([], NewList) -> NewList;
reverse([Head | Tail], NewList) -> reverse(Tail, [Head | NewList]).

leq_filter(_, [], Filtered) -> Filtered;
leq_filter(Int, [Head | Tail], Filtered) when Head =< Int -> leq_filter(Int, Tail, [Head | Filtered]);
leq_filter(Int, [_ | Tail], Filtered) -> leq_filter(Int, Tail, Filtered). 
