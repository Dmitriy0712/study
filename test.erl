% Программа считывает последовательность чисел с консоли пока не будет введена -1,
% затем сортирует их "быстрой" сортировкой и выводит
-module(test). 
-export([main/0]). 

main() ->
	Arr = input([]),
	io:fwrite(output(sort(Arr), "") ++ "~n").

part([Cur | Rem], N, Bigger, Smaller) ->
	[NewBigger, NewSmaller] =  part(Rem, N, Bigger, Smaller),
	if
		Cur >= N ->
			[[Cur | NewBigger] , NewSmaller];
		true ->
			[NewBigger, [Cur | NewSmaller]]
	end;
part([], _N, Bigger, Smaller) ->
	[Bigger, Smaller].

sort([First | Arr]) ->
	[Bigger, Smaller] = part(Arr, First, [], []),
	sort(Smaller) ++ [First] ++ sort(Bigger);
sort([]) -> [].

input(Prev) ->
	{ok, [N]} = io:fread("", "~d"),
	if
		N == -1 ->
			Prev;
		true ->
			input(Prev ++ [N])
	end.

output([Next | Arr], Str) ->
	integer_to_list(Next) ++ " " ++ output(Arr, Str);
output([], _) -> "".