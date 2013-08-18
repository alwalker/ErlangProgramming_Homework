-module(examples).
-export([evenguard/1, evenif/1, evencase/1, evenlist/1]).

evenguard(Int) when Int rem 2 == 0 -> true;
evenguard(Int) when Int rem 2 == 1 -> false.

evenif(Int) ->
	if 
		Int rem 2 == 0 -> true;
		Int rem 2 == 1 -> false
	end.

evencase(Int) ->
	case Int rem 2 of
		1 -> false;
		0 -> true
	end.

evenlist([]) -> [];
evenlist([Head|Tail]) when Head rem 2 == 0 -> [Head | evenlist(Tail)];
evenlist([_|Tail]) -> evenlist(Tail).
