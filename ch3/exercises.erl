-module(exercises).
-export([sum/1, sum/2, create/1, reverse_create/1, print/1]).

sum(N) when N == 0 -> N;
sum(N) -> N + sum(N-1).

sum(N, M) when N > M -> throw ({'ERROR', "Invalid Args"});
sum(N, M) when N == M -> N;
sum(N, M) -> N + sum(N+1, M).

reverse_create(N) when N == 0 -> [];
reverse_create(N) -> [N | reverse_create(N-1)].

create(N) ->
	X = reverse_create(N),
	lists:reverse(X).

print(N) -> 
	print(1, N).

print(M, N) when N < M -> 0;
print(M, N) -> 
	io:format("Number:~p~n", [M]),
	print(M+1, N).
