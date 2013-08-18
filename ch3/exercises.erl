-module(exercises).
-export([sum/1, sum/2]).

sum(N) when N == 0 -> N;
sum(N) -> N + sum(N-1).

sum(N, M) when N > M -> throw ({'ERROR', "Invalid Args"});
sum(N, M) when N == M -> N;
sum(N, M) -> N + sum(N+1, M).
